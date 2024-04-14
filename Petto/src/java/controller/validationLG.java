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
        httpSession.removeAttribute("usernameInvalid");
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
            Users user = new Users(name, password);
            UserService userService = new UserService(em);
            
            boolean determination = userService.findUsername(user.getUserName());
            Users userDetails = userService.findUserWithName(user.getUserName());
            
            HttpSession httpSession = request.getSession();

            if (determination) {
                //Username and Password is True
                if (userService.validatePassword(user, userDetails)) {
                    httpSession.setAttribute("userDetails", userDetails);
                    httpSession.setAttribute("isLogin", true);
                    httpSession.removeAttribute("usernameInvalid");
                    request.removeAttribute("passwordInvalid");
                    response.sendRedirect("index.jsp");
                    //Username is True but Password False
                } else {
                    request.setAttribute("passwordInvalid", true);
                    httpSession.setAttribute("isLogin", false);
                    httpSession.removeAttribute("usernameInvalid");

                    request.getRequestDispatcher("login.jsp").forward(request, response);
                }
                //Username is false
            } else {
                request.setAttribute("usernameInvalid", true);
                httpSession.setAttribute("isLogin", false);
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
            out.close();
        }

    }

}
