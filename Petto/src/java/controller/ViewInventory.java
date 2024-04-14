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
import model.UserService;
import model.*;

/**
 *
 * @author MAMBA
 */
@WebServlet(name = "ViewInventory", urlPatterns = {"/ViewInventory"})
public class ViewInventory extends HttpServlet {

    @PersistenceContext
    EntityManager em;
    @Resource
    UserTransaction utx;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        ProductService pS = new ProductService(em);
        List<Product> productList = pS.findAll();
        HttpSession session = request.getSession();
        session.setAttribute("productList", productList);
        response.sendRedirect("shop.jsp");
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        ProductService pS = new ProductService(em);
        List<Product> productList = pS.findAll();
        HttpSession session = request.getSession();
        session.setAttribute("productList", productList);
        response.sendRedirect("manager_inventory.jsp");
    }

}
