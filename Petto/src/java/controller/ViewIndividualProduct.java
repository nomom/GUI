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
        ProductService uP = new ProductService(em);
        
        
        //Request parameters from fields
        String productname = request.getParameter("productname");
        String producturl = request.getParameter("producturl");
        String productprice = request.getParameter("productprice");
        String productdesc = request.getParameter("productdesc");

        //Set attribute
        session.setAttribute("productname", productname);
        session.setAttribute("producturl", producturl);
        session.setAttribute("productprice", productprice);
        session.setAttribute("productdesc", productdesc);

        //Refresh the users list
        List<Product> productList = uP.findAll();
        session.setAttribute("productList", productList);
        //Redirect to product_individual.jsp
        response.sendRedirect("product_individual.jsp");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
