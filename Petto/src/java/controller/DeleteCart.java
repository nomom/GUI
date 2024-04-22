/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.annotation.Resource;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.transaction.Status;
import javax.transaction.SystemException;
import javax.transaction.UserTransaction;
import model.Cart;
import model.CartService;
import model.Product;
import model.UserService;
import model.Users;

/**
 *
 * @author MAMBA
 */
@WebServlet(name = "DeleteCart", urlPatterns = {"/DeleteCart"})
public class DeleteCart extends HttpServlet {

    @PersistenceContext
    EntityManager em;
    @Resource
    UserTransaction utx;

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet DeleteCart</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet DeleteCart at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        HttpSession session = request.getSession();
        Users user = (Users) session.getAttribute("userDetails");
        Integer cartid = Integer.parseInt(request.getParameter("cartid"));
        Boolean isLogin = (Boolean) session.getAttribute("isLogin");

        // Ensure user is logged in and userDetails are valid
        if (user != null && isLogin != null && isLogin) {
            // Controller
            UserService uS = new UserService(em);
            CartService cS = new CartService(em);
            double totalPrice = 0;
            List<Double> priceList = new ArrayList<>();
            Cart cart = cS.findUserWithCartID(cartid);

            // Find the user by username
            Users resultUser = uS.findUserWithName(user.getUserName());

            //create a query for the statement to find productid and userid in the same databse 
            Query query = em.createQuery(" SELECT c FROM Cart c WHERE c.username = :username AND c.productid = :productid", Cart.class);
            query.setParameter("username", resultUser);
            query.setParameter("productid", cart.getProductid());
            List<Cart> list = query.getResultList();

            if (list.get(0).getProductquantity() > 1) {
                try {
                    list.get(0).removeProductquantity();
                    utx.begin();
                    em.merge(list.get(0));
                    utx.commit();
                    list = query.getResultList();
                    query = em.createQuery(" SELECT c FROM Cart c WHERE c.username = :username", Cart.class);
                    query.setParameter("username", resultUser);
                    List<Cart> viewCartList = query.getResultList();

                    for (Cart cartprice : viewCartList) {
                        int amountProduct = cartprice.getProductquantity();
                        double productPrice = cartprice.getProductid().getProductprice();
                        double subtotalProduct = amountProduct * productPrice;
                        priceList.add(subtotalProduct);
                    }

                    for (Double price : priceList) {
                        totalPrice += price;
                    }

                    session.setAttribute("priceList", priceList);
                    session.setAttribute("totalPrice", totalPrice);
                    session.setAttribute("cartList", list);
                    session.setAttribute("viewCartList", viewCartList);
                    session.setAttribute("cartIndividual", list.get(0));
                    session.setAttribute("deleteInCart", "<h4 style = \"text-align: center; color: black; font-family: LeagueSpartan;\">remove 1 from cart.</h4><br/>");
                    response.sendRedirect("cart.jsp");
                    return;
                } catch (Exception ex) {
                    session.setAttribute("deleteCartError", "<h4 style = \"text-align: center; color: red; font-family: LeagueSpartan;\">an error occurred.</h4><br/>");
                }
            } else {
                try {
                    list.get(0).removeProductquantity();
                    utx.begin();
                    query = em.createQuery(" SELECT c FROM Cart c WHERE c.username = :username AND c.productid = :productid", Cart.class);
                    query.setParameter("username", resultUser);
                    query.setParameter("productid", cart.getProductid());
                    List<Cart> carts = query.getResultList();
                    em.remove(carts.get(0));
                    utx.commit();
                    query = em.createQuery(" SELECT c FROM Cart c WHERE c.username = :username", Cart.class);
                    query.setParameter("username", resultUser);
                    List<Cart> viewCartList = query.getResultList();

                    for (Cart cartprice : viewCartList) {
                        int amountProduct = cartprice.getProductquantity();
                        double productPrice = cartprice.getProductid().getProductprice();
                        double subtotalProduct = amountProduct * productPrice;
                        priceList.add(subtotalProduct);
                    }

                    for (Double price : priceList) {
                        totalPrice += price;
                    }

                    session.setAttribute("viewCartList", viewCartList);
                    session.setAttribute("priceList", priceList);
                    session.setAttribute("totalPrice", totalPrice);
                    session.setAttribute("cartList", list);
                    session.setAttribute("cartIndividual", list.get(0));
                    session.setAttribute("deleteInCart", "<h4 style = \"text-align: center; color: black; font-family: LeagueSpartan;\">product successfully removed from cart.</h4><br/>");
                    response.sendRedirect("cart.jsp");
                    return;
                } catch (Exception ex) {
                    session.setAttribute("deleteInCart", "<h4 style = \"text-align: center; color: red; font-family: LeagueSpartan;\">an error occurred.</h4><br/>");
                    response.sendRedirect("cart.jsp");
                }
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        HttpSession session = request.getSession();

        Users user = (Users) session.getAttribute("userDetails");
        Product product = (Product) session.getAttribute("productIndividual");
        Boolean isLogin = (Boolean) session.getAttribute("isLogin");
        boolean determination = false;
        //Controller
        UserService uS = new UserService(em);
        CartService cS = new CartService(em);

        //check for the product id in the database
        Users resultUser = uS.findUserWithName(user.getUserName());

        if (isLogin) {
            //is log in

            //create a query for the statement to find productid and userid in the same databse 
            Query query = em.createQuery(" SELECT c FROM Cart c WHERE c.username = :username AND c.productid = :productid", Cart.class);
            query.setParameter("username", resultUser);
            query.setParameter("productid", product);
            List<Cart> list = query.getResultList();

            //if database has no entry for the users (in this, database has no productid and username entry)
            if (list.isEmpty()) {
                //just a regular redirecting if smth runs into here
                session.setAttribute("cartList", list);
                session.setAttribute("deleteCartError", "<h4 style = \"text-align: center; color: black; font-family: LeagueSpartan;\">nothing here.</h4><br/>");
                response.sendRedirect("product_individual.jsp");
            } else {
                //database has entry for the users
                if (list.get(0).getProductquantity() > 1) {
                    try {
                        list.get(0).removeProductquantity();
                        utx.begin();
                        em.merge(list.get(0));
                        utx.commit();
                        list = query.getResultList();
                        session.setAttribute("cartList", list);
                        session.setAttribute("cartIndividual", list.get(0));
                        session.setAttribute("deleteCartError", "<h4 style = \"text-align: center; color: black; font-family: LeagueSpartan;\">remove product from cart.</h4><br/>");
                        response.sendRedirect("product_individual.jsp");
                        return;
                    } catch (Exception ex) {
                        session.setAttribute("deleteCartError", "<h4 style = \"text-align: center; color: red; font-family: LeagueSpartan;\">an error occurred.</h4><br/>");
                    }
                } else {
                    try {
                        list.get(0).removeProductquantity();
                        utx.begin();
                        query = em.createQuery(" SELECT c FROM Cart c WHERE c.username = :username AND c.productid = :productid", Cart.class);
                        query.setParameter("username", resultUser);
                        query.setParameter("productid", product);
                        List<Cart> carts = query.getResultList();
                        em.remove(carts.get(0));
                        utx.commit();
                        session.setAttribute("cartList", list);
                        session.setAttribute("cartIndividual", list.get(0));
                        session.setAttribute("deleteCartError", "<h4 style = \"text-align: center; color: black; font-family: LeagueSpartan;\">remove product from cart.</h4><br/>");
                        response.sendRedirect("product_individual.jsp");
                        return;
                    } catch (Exception ex) {
                        session.setAttribute("deleteCartError", "<h4 style = \"text-align: center; color: red; font-family: LeagueSpartan;\">an error occurred.</h4><br/>");
                        response.sendRedirect("product_individual.jsp");
                    }
                }

            }
        } else {
            session.setAttribute("deleteCartError", "<h4 style = \"text-align: center; color: red; font-family: LeagueSpartan;\">please login first.</h4><br/>");
            response.sendRedirect("product_individual.jsp");
        }

        /**
         * Returns a short description of the servlet.
         *
         * @return a String containing servlet description
         */
    }
}
