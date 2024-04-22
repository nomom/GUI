/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(name = "ViewIndividualProduct", urlPatterns = {"/ViewIndividualProduct"})
public class ViewIndividualProduct extends HttpServlet {

    @PersistenceContext
    EntityManager em;
    @Resource
    UserTransaction utx;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        HttpSession session = request.getSession();
        ProductService uP = new ProductService(em, utx);
        UserService uS = new UserService(em);
        int amount = 0;
        Cart cart = new Cart(0);

        //Request parameters from fields
        String productid = request.getParameter("productid");
        Product productIndividual = uP.findProductWithID(productid);

        //Get cart
        Users user = (Users) session.getAttribute("userDetails");
        Boolean isLogin = (Boolean) session.getAttribute("isLogin");

        //if user doesn't login
        if (user == null || isLogin == false || isLogin == null) {
            session.setAttribute("shopLoginError", "<h4 style = \"text-align: center; color: red; font-family: LeagueSpartan;\">please login first, before viewing the product.</h4>");
            response.sendRedirect("shop.jsp");
            return;
        }

        //if user is log in
        if (user != null) {
            Users resultUser = uS.findUserWithName(user.getUserName());
            Query query = em.createQuery("SELECT c FROM Cart c WHERE c.username = :username AND c.productid = :productid", Cart.class);
            query.setParameter("username", resultUser);
            query.setParameter("productid", productIndividual);
            List<Cart> list = query.getResultList();

            if (list.isEmpty()) {
                cart = cart;
            } else {
                cart = list.get(0);
            }
        }

        //Refresher
        List<Product> productList = uP.findAll();
        session.setAttribute("productList", productList);
        session.setAttribute("productIndividual", productIndividual);
        session.setAttribute("cartIndividual", cart);

        //Redirect to product_individual.jsp
        response.sendRedirect("product_individual.jsp");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
