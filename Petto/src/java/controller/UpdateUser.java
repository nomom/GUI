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
import model.UserService;
import model.Users;

/**
 *
 * @author MAMBA
 */
@WebServlet(name = "UpdateUser", urlPatterns = {"/UpdateUser"})
public class UpdateUser extends HttpServlet {

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
        UserService uS = new UserService(em);

        //Declare user here
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String roles = request.getParameter("roles");
        Users user = new Users(username, password, roles);

        try {
            Users admin = (Users) session.getAttribute("userDetails");
            if (admin.getUserName().equals(username)) {
                session.setAttribute("errorUpdateUser", "<h2 style = \"text-align: center; color: red; font-family: LeagueSpartan;\">You can't update yourself!</h2><br/>");
            } else {
                utx.begin();
                em.merge(user);
                utx.commit();
                session.setAttribute("errorUpdateUser", "<h2 style = \"text-align: center; color: red; font-family: LeagueSpartan;\">User Updated!</h2><br/>");
            }
        } catch (Exception ex) {
            Logger.getLogger(DeleteUser.class.getName()).log(Level.SEVERE, null, ex);
            session.setAttribute("errorUpdateUser", "<h2 style = \"text-align: center; color: red; font-family: LeagueSpartan;\">There's an unexpected error!</h2><br/>");
        }
        //Refresh the users list
        List<Users> userList = uS.findAll();
        session.setAttribute("userList", userList);
        response.sendRedirect("manager_deleteID.jsp");
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
