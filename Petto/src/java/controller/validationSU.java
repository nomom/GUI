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
        defaultPrompter dP = new defaultPrompter();

        //Check wheter there's empty input or not
        if (password.length() == 0 && name.length() == 0) {
            out.println(dP.noUandPs());
        } else if (password.length() == 0) {
            out.println(dP.noPassword());
        } else if (name.length() == 0) {
            out.println(dP.noUsername());
        } else {
            //Create user objects
            Users user = new Users(name, password);
            UserService userService = new UserService(em, utx);
            boolean determination = userService.findUsername(user.getUserName());
            HttpSession httpSession = request.getSession();
            
            
            //Username found in the database
            if (determination) {
                httpSession.setAttribute("usernameInvalid", true);
                httpSession.setAttribute("isLogin", false);
                RequestDispatcher rd = request.getRequestDispatcher("/signup.jsp");
                rd.forward(request, response);
                //User is not found in the database
            } else {
                userService.addUser(user);
                httpSession.removeAttribute("usernameInvalid");
                httpSession.setAttribute("isLogin", true);
                httpSession.setAttribute("userDetails", user);
                response.sendRedirect("index.jsp");
            }

            out.close();
        }

    }

}
