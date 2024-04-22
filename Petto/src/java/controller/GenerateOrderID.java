/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
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
@WebServlet(name = "GenerateOrderID", urlPatterns = {"/GenerateOrderID"})
public class GenerateOrderID extends HttpServlet {

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
            out.println("<title>Servlet GenerateOrderID</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet GenerateOrderID at " + request.getContextPath() + "</h1>");
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
        List<Cart> viewCartList = (List) session.getAttribute("viewCartList");
        List<Double> priceList = (List) session.getAttribute("priceList");
        List<String> informationList = (List) session.getAttribute("informationList");
        List<String> paymentList = (List) session.getAttribute("paymentList");
        Boolean isLogin = (Boolean) session.getAttribute("isLogin");
        int index = 0;

        UserService uS = new UserService(em);
        ProductService uP = new ProductService(em);
        Users resultUser = uS.findUser(user);

        if (isLogin) {
            for (Cart cart : viewCartList) {
                Ordertable order = new Ordertable(cart.getProductquantity(), priceList.get(index), new Date(), informationList.get(0), paymentList.get(0), cart.getProductid(), resultUser);
                index = index + 1;

                //add row to order table
                try {
                    utx.begin();
                    em.persist(order);
                    utx.commit();
                } catch (Exception ex) {

                }

                //delete cart row
                try {
                    //create a query for the statement lo
                    utx.begin();
                    Query query = em.createQuery(" SELECT c FROM Cart c WHERE c.username = :username AND c.productid = :productid", Cart.class);
                    query.setParameter("username", resultUser);
                    query.setParameter("productid", cart.getProductid());
                    List<Cart> list = query.getResultList();
                    em.remove(list.get(0));
                    utx.commit();
                } catch (Exception ex) {

                }

                //remove product quantity
                try {
                    utx.begin();
                    //create a query for the statement lo
                    Product product = cart.getProductid();
                    product.removeProductQuantity(cart.getProductquantity());

                    em.merge(product);
                    utx.commit();
                } catch (Exception ex) {

                }

                //add total product quantity
                try {
                    utx.begin();
                    //create a query for the statement lo
                    Product product = cart.getProductid();
                    product.addTotalProduct(cart.getProductquantity());
                    em.merge(product);
                    utx.commit();
                } catch (Exception ex) {

                }

            }

        }

        response.sendRedirect("index.jsp");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
