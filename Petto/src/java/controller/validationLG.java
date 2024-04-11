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

    //Log Out Here
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession httpSession = request.getSession();
        httpSession.removeAttribute("userDetails");
        httpSession.setAttribute("isLogin", false);
        response.sendRedirect("index.jsp");
    }

    //Log In Here
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
            Users user = new Users(name, password, false);
            UserService userService = new UserService(em);
            boolean determination = userService.findUsername(user.getUserName());
            HttpSession httpSession = request.getSession();
            
            if (determination) {
                // Validate the password
                if (userService.validatePassword(user)) {
                    httpSession.setAttribute("userDetails", user);
                    httpSession.setAttribute("isLogin", true);
                    response.sendRedirect("index.jsp");
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
