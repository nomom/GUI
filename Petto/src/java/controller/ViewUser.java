package controller;

import model.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
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

@WebServlet(name = "ViewUser", urlPatterns = {"/ViewUser"})
public class ViewUser extends HttpServlet {

    @PersistenceContext
    EntityManager em;
    @Resource
    UserTransaction utx;

    //Log Out Here
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        UserService uS = new UserService(em);
        List<Users> userList = uS.findAll();
        HttpSession session = request.getSession();
        session.setAttribute("userList", userList);
        response.sendRedirect("manager_deleteID.jsp");
    }

    //Log In Here
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        UserService uS = new UserService(em);
        List<Users> userList = uS.findAll();
        HttpSession session = request.getSession();
        session.setAttribute("userList", userList);
        response.sendRedirect("manager_customer_details.jsp");
    }

}
