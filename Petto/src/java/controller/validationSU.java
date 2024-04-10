package controller;

import java.io.*;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.annotation.Resource;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import javax.transaction.UserTransaction;
import model.*;
import controller.*;

@WebServlet(urlPatterns = {"/validationSU"})
public class validationSU extends HttpServlet {

    @PersistenceContext
    EntityManager em;
    @Resource
    UserTransaction utx;

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        String name = request.getParameter("username");
        String password = request.getParameter("password");

        if (password.length() == 0 && name.length() == 0) {
            out.print("<link rel=\"stylesheet\" href=\"css/default.css\">"
                    + "<h2 style = \"text-align: center; color: red; font-family: LeagueSpartan;\">Username and Password Needed!</h2><br/>"
                    + "<br/><p style = \"text-align: center\"><a href = \"signup.jsp\" style = \"text-decoration: underline\">Go Back</a></p>");
        } else if (password.length() == 0) {
            out.print("<link rel=\"stylesheet\" href=\"css/default.css\">"
                    + "<h2 style = \"text-align: center; color: red; font-family: LeagueSpartan;\">Password Needed!</h2>"
                    + "<br/><p style = \"text-align: center\"><a href = \"signup.jsp\" style = \"text-decoration: underline\">Go Back</a></p>");
        } else if (name.length() == 0) {
            out.print("<link rel=\"stylesheet\" href=\"css/default.css\">"
                    + "<h2 style = \"text-align: center; color: red; font-family: LeagueSpartan;\">Username Needed!</h2>"
                    + "<br/><p style = \"text-align: center\"><a href = \"signup.jsp\" style = \"text-decoration: underline\">Go Back</a></p>");
        } else {
            //Create user objects
            Users user = new Users(name, password, false);
            UserService userService = new UserService(em, utx);
            boolean determination = userService.findUsername(user.getUserName());
            HttpSession httpSession = request.getSession();

            if (determination) {
                httpSession.setAttribute("validate", true);
                RequestDispatcher rd = request.getRequestDispatcher("/signup.jsp");
                rd.forward(request, response);
            } else {
                httpSession.setAttribute("validate", false);
                userService.addUser(user);
                httpSession.setAttribute("userDetails", user);
                response.sendRedirect("index.html");
            }

            out.close();
        }

    }

}
