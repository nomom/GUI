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
import model.Users;
import model.userDA;

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
            userDA userda = new userDA();

            //True or false here <3
            boolean determination = userda.getUserName(user);

            // Get a HttpSession or create one if it does not exist
            HttpSession httpSession = request.getSession();

            // Store Programme object to the session
            httpSession.setAttribute("user", user);

            //Validation to tukar to revert back or to confirmation page
            if (determination) {
                httpSession.setAttribute("validate", true);
                RequestDispatcher rd = request.getRequestDispatcher("/signup.jsp");
                rd.forward(request, response);
            } else {
                httpSession.setAttribute("validate", false);
                try {
                    utx.begin();
                    em.persist(user);
                    utx.commit();
                } catch (Exception ex) {

                }
                RequestDispatcher rd = request.getRequestDispatcher("/index.html");
                rd.forward(request, response);
            }

            out.close();
        }

    }

}
