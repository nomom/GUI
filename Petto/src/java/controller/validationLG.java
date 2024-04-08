package controller;

import model.User;
import model.userDA;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "validationLG", urlPatterns = {"/validationLG"})
public class validationLG extends HttpServlet {

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        Integer validateExistLG = 0;
        Integer validatePasswordLG = 0;

        String name = request.getParameter("username");
        String password = request.getParameter("password");

        //Check wheter there's empty input or not
        if (name.length() == 0) {
            out.print("<link rel=\"stylesheet\" href=\"css/default.css\">"
                    + "<h2 style = \"text-align: center; color: red; font-family: LeagueSpartan;\">Username Needed!</h2>");
        } else if (password.length() == 0) {
            out.print("<link rel=\"stylesheet\" href=\"css/default.css\">"
                    + "<h2 style = \"text-align: center; color: red; font-family: LeagueSpartan;\">Password Needed!</h2>");
        } else if (password.length() == 0 && name.length() == 0) {
            out.print("<link rel=\"stylesheet\" href=\"css/default.css\">"
                    + "<h2 style = \"text-align: center; color: red; font-family: LeagueSpartan;\">Password Needed!</h2><br/>"
                    + "<br/><h2 style = \"text-align: center; color: red; font-family: LeagueSpartan;\">Password Needed!</h2>");
            //if no empty space \/
        } else {
            //Create user objects
            User user = new User(name, password, false);
            userDA userda = new userDA();

            //Check whether the username is in the database or not.
            boolean determination = userda.getUserName(user);

            HttpSession httpSession = request.getSession();

            // Store Programme object to the session
            httpSession.setAttribute("user", user);

            // To check whether the username exists
            if (determination) {
                // Validate the password
                if (userda.validatePassword(user)) {
                    httpSession.setAttribute("userDetails", user);
                    response.sendRedirect("index.html");
                } else {
                    request.setAttribute("passwordInvalid", true);
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
