/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
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
import javax.transaction.UserTransaction;
import model.*;

/**
 *
 * @author MAMBA
 */
@WebServlet(name = "AddCart", urlPatterns = {"/AddCart"})
public class AddCart extends HttpServlet {

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
            out.println("<title>Servlet AddCart</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddCart at " + request.getContextPath() + "</h1>");
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

        //Controller
        UserService uS = new UserService(em);
        CartService cS = new CartService(em);
        double totalPrice = 0;
        List<Double> priceList = new ArrayList<>();
        Cart cart = cS.findUserWithCartID(cartid);

        //if user doesn't login
        if (user == null) {
            response.sendRedirect("cart.jsp");
            return;
        }

        //check for the product id in the database
        Users resultUser = uS.findUserWithName(user.getUserName());

        if (isLogin) {
            //is log in

            //create a query for the statement lo
            Query query = em.createQuery(" SELECT c FROM Cart c WHERE c.username = :username AND c.productid = :productid", Cart.class);
            query.setParameter("username", resultUser);
            query.setParameter("productid", cart.getProductid());
            List<Cart> list = query.getResultList();

            //database has entry for the users
            try {
                //determine if it +1 , will bomb or not
                int amount = list.get(0).getProductquantity();

                if (amount + 1 > list.get(0).getProductid().getProductqty()) {
                    query = em.createQuery(" SELECT c FROM Cart c WHERE c.username = :username", Cart.class);
                    query.setParameter("username", resultUser);
                    List<Cart> viewCartList = query.getResultList();
                    session.setAttribute("cartList", list);
                    session.setAttribute("viewCartList", viewCartList);
                    session.setAttribute("errorInCart", "<h4 style = \"text-align: center; color: black; font-family: LeagueSpartan;\">maximum stock of this product.</h4>"
                            + "<h5 style = \"text-align: center; color: red; font-family: LeagueSpartan;\">do contact staff for restock.</h4><br/>");
                    response.sendRedirect("cart.jsp");
                    return;
                }

                //add amount
                list.get(0).addProductquantity();
                utx.begin();
                em.merge(list.get(0));
                utx.commit();

                query = em.createQuery(" SELECT c FROM Cart c WHERE c.username = :username", Cart.class);
                query.setParameter("username", resultUser);
                List<Cart> viewCartList = query.getResultList();

                for (Cart carts : viewCartList) {
                    int amountProduct = carts.getProductquantity();
                    double productPrice = carts.getProductid().getProductprice();
                    double subtotalProduct = amountProduct * productPrice;
                    priceList.add(subtotalProduct);
                }

                for (Double price : priceList) {
                    totalPrice += price;
                }

                //refresher for session
                session.setAttribute("cartList", list);
                session.setAttribute("priceList", priceList);
                session.setAttribute("totalPrice", totalPrice);
                session.setAttribute("viewCartList", viewCartList);
                session.setAttribute("cartIndividual", list.get(0));
                response.sendRedirect("cart.jsp");
                return;
            } catch (Exception ex) {
                session.setAttribute("addCartError", "<h4 style = \"text-align: center; color: red; font-family: LeagueSpartan;\">an error occurred.</h4><br/>");
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

        //Controller
        UserService uS = new UserService(em);
        CartService cS = new CartService(em);

        //if user doesn't login
        if (user == null) {
            session.setAttribute("addCartError", "<h4 style = \"text-align: center; color: red; font-family: LeagueSpartan;\">please login first.</h4><br/>");
            response.sendRedirect("product_individual.jsp");
            return;
        }

        //check for the product id in the database
        Users resultUser = uS.findUserWithName(user.getUserName());

        if (isLogin) {
            //is log in

            //create a query for the statement lo
            Query query = em.createQuery(" SELECT c FROM Cart c WHERE c.username = :username AND c.productid = :productid", Cart.class);
            query.setParameter("username", resultUser);
            query.setParameter("productid", product);
            List<Cart> list = query.getResultList();

            //if database has no entry for the users (in this, database has no productid and username entry)
            if (list.isEmpty()) {

                if (product.getProductqty() <= 0) {
                    query = em.createQuery(" SELECT c FROM Cart c WHERE c.username = :username", Cart.class);
                    query.setParameter("username", resultUser);
                    List<Cart> viewCartList = query.getResultList();
                    session.setAttribute("cartList", list);
                    session.setAttribute("addCartError", "<h4 style = \"text-align: center; color: black; font-family: LeagueSpartan;\">maximum stock of this product.</h4>"
                            + "<h5 style = \"text-align: center; color: red; font-family: LeagueSpartan;\">do contact staff for restock.</h4><br/>");
                    response.sendRedirect("product_individual.jsp");
                    return;
                }

                Cart cart = new Cart(1, product, resultUser);
                try {
                    utx.begin();
                    em.persist(cart);
                    utx.commit();
                    list = query.getResultList();
                    session.setAttribute("cartList", list);
                    session.setAttribute("cartIndividual", cart);
                    session.setAttribute("addCartError", "<h4 style = \"text-align: center; color: black; font-family: LeagueSpartan;\">product added into cart.</h4><br/>");
                    response.sendRedirect("product_individual.jsp");
                } catch (Exception ex) {
                    session.setAttribute("addCartError", "<h4 style = \"text-align: center; color: black; font-family: LeagueSpartan;\">an error occurred.</h4><br/>");
                }

            } else {

                //determine if it +1 , will bomb or not
                int amount = list.get(0).getProductquantity();
                if (amount + 1 > list.get(0).getProductid().getProductqty()) {
                    session.setAttribute("cartList", list);
                    session.setAttribute("addCartError", "<h4 style = \"text-align: center; color: black; font-family: LeagueSpartan;\">maximum stock of this product.</h4>"
                            + "<h5 style = \"text-align: center; color: red; font-family: LeagueSpartan;\">do contact staff for restock.</h4><br/>");
                    response.sendRedirect("product_individual.jsp");
                    return;
                }

                //database has entry for the users
                try {
                    list.get(0).addProductquantity();
                    utx.begin();
                    em.merge(list.get(0));
                    utx.commit();
                    list = query.getResultList();
                    session.setAttribute("cartList", list);
                    session.setAttribute("cartIndividual", list.get(0));
                    session.setAttribute("addCartError", "<h4 style = \"text-align: center; color: black; font-family: LeagueSpartan;\">product added into cart.</h4><br/>");
                    response.sendRedirect("product_individual.jsp");
                    return;
                } catch (Exception ex) {
                    session.setAttribute("addCartError", "<h4 style = \"text-align: center; color: red; font-family: LeagueSpartan;\">an error occurred.</h4><br/>");
                }

            }
        } else {
            session.setAttribute("addCartError", "<h4 style = \"text-align: center; color: red; font-family: LeagueSpartan;\">please login first.</h4><br/>");
            response.sendRedirect("product_individual.jsp");
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
