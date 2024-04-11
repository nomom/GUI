/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.annotation.Resource;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.transaction.UserTransaction;
import model.Product;
import model.productService;

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

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        // Retrieving form parameters
        String pID = request.getParameter("PID");
        String pName = request.getParameter("Pname");
        String pDesc = request.getParameter("Pdesc");
        double pPrice = Double.parseDouble(request.getParameter("Pprice"));
        int pQty = Integer.parseInt(request.getParameter("Pqty"));
        String pURL = request.getParameter("Purl");
        
       Product product = new Product(pID, pName,pDesc, pPrice, pQty,pURL, 0);
       productService pService = new productService(em);
       

        // You can perform additional validation or database operations here
        // HTML response
        out.println("<!DOCTYPE html>");
        out.println("<html>");
        out.println("<head>");
        out.println("<title>Product Added</title>");
        out.println("</head>");
        out.println("<body>");
        out.println("<h1>Product Added</h1>");
        out.println("<p>Product ID: " + pID + "</p>");
        out.println("<p>Product Name: " + pName + "</p>");
        out.println("<p>Product Description: " + pDesc + "</p>");
        out.println("<p>Product Price: " + pPrice + "</p>");
        out.println("<p>Product Quantity: " + pQty + "</p>");
        out.println("<p>Product URL: " + pURL + "</p>");
        out.println("</body>");
        out.println("</html>");

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