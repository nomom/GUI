/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.annotation.Resource;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.transaction.UserTransaction;
import model.Product;
import model.ProductService;
import model.UserService;
import model.Users;

/**
 *
 * @author Acer
 */
@WebServlet(name = "addProduct", urlPatterns = {"/addProduct"})
public class addProduct extends HttpServlet {

    @PersistenceContext
    EntityManager em;
    @Resource
    UserTransaction utx;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        HttpSession session = request.getSession();
        ProductService uP = new ProductService(em, utx);

        Product product = uP.findProductWithID(request.getParameter("PID"));

        try {
            utx.begin();
            product.setProductqty(Integer.parseInt(request.getParameter("Pqty")));
            em.merge(product);
            utx.commit();
            session.setAttribute("errorAddProduct", "<h2 style = \"text-align: center; color: red; font-family: LeagueSpartan;\">product restock!</h2><br/>");
        } catch (Exception ex) {
            session.setAttribute("errorAddProduct", "<h2 style = \"text-align: center; color: red; font-family: LeagueSpartan;\">error!</h2><br/>");
        }

        //Refresh the users list
        List<Product> productList = uP.findAll();
        session.setAttribute("productList", productList);
        response.sendRedirect("manager_inventory.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        HttpSession session = request.getSession();
        ProductService uP = new ProductService(em, utx);

        //Add product
        String pID = request.getParameter("PID");
        String pName = request.getParameter("Pname");
        String pDesc = request.getParameter("Pdesc");
        double pPrice = Double.parseDouble(request.getParameter("Pprice"));
        int pQty = Integer.parseInt(request.getParameter("Pqty"));
        String pURL = request.getParameter("Purl");
        int amountSold = Integer.parseInt(request.getParameter("amountsold"));
        Product product = new Product(pID, pName, pDesc, pPrice, pQty, pURL, amountSold);

        //Add Product here
        try {
            if (uP.findpID(pID)) {
                session.setAttribute("errorAddProduct", "<h2 style = \"text-align: center; color: red; font-family: LeagueSpartan;\">Product Existed!</h2><br/>");
            } else {
                uP.addProduct(product);
                session.setAttribute("errorAddProduct", "<h2 style = \"text-align: center; color: red; font-family: LeagueSpartan;\">Done Add Product!</h2><br/>");
            }
        } catch (Exception ex) {
            Logger.getLogger(DeleteUser.class.getName()).log(Level.SEVERE, null, ex);
        }

        //Refresh the users list
        List<Product> productList = uP.findAll();
        session.setAttribute("productList", productList);
        response.sendRedirect("manager_inventory.jsp");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
