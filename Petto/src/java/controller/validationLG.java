package controller;

import model.*;
import java.io.IOException;
import java.io.PrintWriter;
import javax.annotation.Resource;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.transaction.UserTransaction;

@WebServlet(name = "validationLG", urlPatterns = {"/validationLG"})
public class validationLG extends HttpServlet {

    @PersistenceContext
    EntityManager em;
    @Resource
    UserTransaction utx;

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

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
            Users user = new Users(name, password, false);
            UserService userService = new UserService(em);
            boolean determination = userService.findUsername(user.getUserName());
            HttpSession httpSession = request.getSession();
            if (determination) {
                // Validate the password
                if (userService.validatePassword(user)) {
                    httpSession.setAttribute("userDetails", user);
                    httpSession.setAttribute("isLogin", true);
                    response.sendRedirect("index.html");
                } else {
                    request.setAttribute("passwordInvalid", true);
                    httpSession.setAttribute("isLogin", false);
                    request.getRequestDispatcher("login.jsp").forward(request, response);
                }
            } else {
                request.setAttribute("usernameInvalid", true);
                httpSession.setAttribute("isLogin", false);
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
