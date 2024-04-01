package javasignup;

import da.userDA;
import javade.User;
import java.io.*;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;

@WebServlet(urlPatterns = {"/validationSU"})
public class validationSU extends HttpServlet {

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        HttpSession session = request.getSession();

        userDA userda = new userDA();
        User user = (User) session.getAttribute("user");
        Boolean validationFactor = userda.getUserName(user);

        if (validationFactor) {
            out.print("Username existed!");
            RequestDispatcher rd = request.getRequestDispatcher("/signup.jsp");
            rd.forward(request, response);
        } else {
            RequestDispatcher rd = request.getRequestDispatcher("/signup_confirmation.jsp");
            rd.include(request, response);
        }
    }
}
