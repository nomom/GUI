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
import model.Cart;
import model.CartService;
import model.Product;
import model.UserService;
import model.Users;

/**
 *
 * @author MAMBA
 */
@WebServlet(name = "ViewCart", urlPatterns = {"/ViewCart"})
public class ViewCart extends HttpServlet {

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
            out.println("<title>Servlet ViewCart</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ViewCart at " + request.getContextPath() + "</h1>");
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
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        HttpSession session = request.getSession();

        Users user = (Users) session.getAttribute("userDetails");
        Boolean isLogin = (Boolean) session.getAttribute("isLogin");

        //if user doesn't login
        if (user == null || isLogin == false || isLogin == null) {
            session.setAttribute("viewCartError", "<h4 style = \"text-align: center; color: red; font-family: LeagueSpartan;\">please login first, before viewing the cart.</h4>");
            response.sendRedirect("index.jsp");
            return;
        }

        // Controller
        UserService uS = new UserService(em);
        CartService cS = new CartService(em);

        //check for the product id in the database
        Users resultUser = uS.findUserWithName(user.getUserName());

        Query query = em.createQuery(" SELECT c FROM Cart c WHERE c.username = :username", Cart.class);
        query.setParameter("username", resultUser);
        List<Cart> list = query.getResultList();

        List<Double> priceList = new ArrayList<>();
        double totalPrice = 0;

        if (isLogin) {
            //is log in

            //if the user has no add any product yet
            if (list.isEmpty()) {
                session.setAttribute("viewCartError", "<h4 style = \"text-align: center; color: red; font-family: LeagueSpartan;\">u have not added any items yet.</h4>");
                response.sendRedirect("index.jsp");
                return;
            }

//check for current validity 
            for (Cart cart : list) {
                try {
                    utx.begin();
                    query = em.createQuery(" SELECT c FROM Cart c WHERE c.username = :username", Cart.class);
                    query.setParameter("username", resultUser);
                    list = query.getResultList();
                    for (Cart carts : list) {
                        if (carts.getProductquantity() > carts.getProductid().getProductqty()) {

                            em.remove(carts);
                            utx.commit();
                            session.setAttribute("errorInCart", "<h4 style = \"text-align: center; color: red; font-family: LeagueSpartan;\">the items you put in cart has been purchased, some of the items has been removed.</h4>");
                        }
                    }

                } catch (Exception ex) {

                }
            }
               
        

        query = em.createQuery(" SELECT c FROM Cart c WHERE c.username = :username", Cart.class);
        query.setParameter("username", resultUser);
        list = query.getResultList();

        for (Cart cart : list) {
            int amountProduct = cart.getProductquantity();
            double productPrice = cart.getProductid().getProductprice();
            double subtotalProduct = amountProduct * productPrice;
            priceList.add(subtotalProduct);
        }

        for (Double price : priceList) {
            totalPrice += price;
        }

        //refresh the session list and move to cart
        session.setAttribute("viewCartList", list);
        session.setAttribute("totalPrice", totalPrice);
        session.setAttribute("priceList", priceList);
        response.sendRedirect("cart.jsp");

    }

    
        else {
            //not log in
            session.setAttribute("viewCartError", "<h4 style = \"text-align: center; color: red; font-family: LeagueSpartan;\">please login first, before viewing the cart.</h4>");
        response.sendRedirect("index.jsp");
        return;
    }
}
}
