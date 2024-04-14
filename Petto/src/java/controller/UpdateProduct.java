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
import model.*;

/**
 *
 * @author MAMBA
 */
@WebServlet(name = "UpdateProduct", urlPatterns = {"/UpdateProduct"})
public class UpdateProduct extends HttpServlet {

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
        ProductService uP = new ProductService(em);

        //Declare product variable here
        String pID = request.getParameter("PID");
        String pName = request.getParameter("Pname");
        String pDesc = request.getParameter("Pdesc");
        double pPrice = Double.parseDouble(request.getParameter("Pprice"));
        int pQty = Integer.parseInt(request.getParameter("Pqty"));
        String pURL = request.getParameter("Purl");
        int amountSold = Integer.parseInt(request.getParameter("amountsold"));
        Product product = new Product(pID, pName, pDesc, pPrice, pQty, pURL, amountSold);

        try {
            if (uP.findpID(pID)) {
                utx.begin();
                em.merge(product);
                utx.commit();
                session.setAttribute("errorUpdateProduct", "<h2 style = \"text-align: center; color: red; font-family: LeagueSpartan;\">Product Details Updated!</h2><br/>");
            } else {
                session.setAttribute("errorUpdateProduct", "<h2 style = \"text-align: center; color: red; font-family: LeagueSpartan;\">Product ID not found!</h2><br/>");
            }
        } catch (Exception ex) {
            Logger.getLogger(DeleteUser.class.getName()).log(Level.SEVERE, null, ex);
            session.setAttribute("errorUpdateProduct", "<h2 style = \"text-align: center; color: red; font-family: LeagueSpartan;\">There's an unexpected error!</h2><br/>");
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
