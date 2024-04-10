package controller;

import model.userDA;
import java.io.IOException;
import java.io.PrintWriter;
import javax.annotation.Resource;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.transaction.UserTransaction;
import model.Users;

@WebServlet(name = "validationLG", urlPatterns = {"/validationLG"})
public class validationLG extends HttpServlet {


    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        HttpSession httpSession = request.getSession();

        String name = request.getParameter("username");
        String password = request.getParameter("password");

        //Check wheter there's empty input or not
        if (password.length() == 0 && name.length() == 0) {
            out.print("<link rel=\"stylesheet\" href=\"css/default.css\">"
                    + "<h2 style = \"text-align: center; color: red; font-family: LeagueSpartan;\">Username and Password Needed!</h2><br/>"
                    + "<br/><p style = \"text-align: center\"><a href = \"login.jsp\" style = \"text-decoration: underline\">Go Back</a></p>");
        } else if (password.length() == 0) {
            out.print("<link rel=\"stylesheet\" href=\"css/default.css\">"
                    + "<h2 style = \"text-align: center; color: red; font-family: LeagueSpartan;\">Password Needed!</h2>"
                    + "<br/><p style = \"text-align: center\"><a href = \"login.jsp\" style = \"text-decoration: underline\">Go Back</a></p>");
        } else if (name.length() == 0) {
            out.print("<link rel=\"stylesheet\" href=\"css/default.css\">"
                    + "<h2 style = \"text-align: center; color: red; font-family: LeagueSpartan;\">Username Needed!</h2>"
                    + "<br/><p style = \"text-align: center\"><a href = \"login.jsp\" style = \"text-decoration: underline\">Go Back</a></p>");
        } else {
            //Create user objects
            Users user = new Users(name, password, false);
            // Store Programme object to the session
            httpSession.setAttribute("user", user);

            userDA userda = new userDA();

            //Check whether the username is in the database or not.
            boolean determination = userda.getUserName(user);

            // To check whether the username exists
            if (determination) {
                // Validate the password
                if (userda.validatePassword(user)) {
                    httpSession.setAttribute("userDetails", user);
                    response.sendRedirect("index.html");
                } else {
                    request.setAttribute("passwordInvalid", true);
                    httpSession.setAttribute("isLogin", true);
                    request.getRequestDispatcher("login.jsp").forward(request, response);
                }
            } else {
                request.setAttribute("usernameInvalid", true);
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
            out.close();
        }

    }

}

//if (determination) {
//    // Reset validation indicators
//    request.setAttribute("usernameInvalid", false);
//    request.setAttribute("passwordInvalid", false);
//
//    // Validate the password
//    if (userda.validatePassword(user)) {
//        // Password is correct, set user details in session and redirect to homepage
//        httpSession.setAttribute("userDetails", user);
//        response.sendRedirect("homepage.html");
//    } else {
//        // Incorrect password, set passwordInvalid indicator
//        request.setAttribute("passwordInvalid", true);
//        response.sendRedirect("login/login.jsp");
//    }
//} else {
//    // Invalid username, set usernameInvalid indicator
//    request.setAttribute("usernameInvalid", true);
//    response.sendRedirect("login/login.jsp");
//}
