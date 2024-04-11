<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.userDA"%>
<%@page import="model.Users"%>
<%@page import="javax.servlet.http.HttpSession"%>
<%@page import="controller.defaultPrompter"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Petto - Login</title>
        <link rel="icon" type="image/x-icon" href="image/homepage/petto_logo.png">
        <link rel="stylesheet" type="text/css" href="css/login.css">
        <link rel="stylesheet" type="text/css" href="css/default.css">
    </head>
    <body>

        <%
            defaultPrompter dP = new defaultPrompter();
            out.println(dP.headerReturn());
            Boolean isLogin = (Boolean) session.getAttribute("isLogin");
            Users user = (Users) session.getAttribute("userDetails");
        %>

        <div id="login_header">
            <img style="width: 200px; height: 200px;" src="image/homepage/petto_logo.png" alt="Petto Logo">
        </div>

        <div id="login_body_main">
            <% if (isLogin != null && isLogin) {%>
            <div id="login_body_1">
                <h1 id="alrd_login">Already Logged In.</h1>
                <h3>Your username: "<%= user.getUserName()%>"</h3>
                <form id="alrd_login_form" action="validationLG" method="get">
                    <input type="submit" value="Logout Here">
                </form>
            </div>
            <% } else { %>
            <div id="login_body_1">
                <h1>Login</h1>
                <% Boolean passwordInvalid = (Boolean) request.getAttribute("passwordInvalid");
                    Boolean usernameInvalid = (Boolean) request.getAttribute("usernameInvalid");
                    if (passwordInvalid != null && passwordInvalid) { %>
                <h2>Password Incorrect!</h2>
                <% }
                    if (usernameInvalid != null && usernameInvalid) { %>
                <h2>Username Not Found!</h2>
                <% } %>

                <form method="post" action="validationLG">
                    <label>Username</label><br>
                    <input name="username" type="text"><br>
                    <label>Password</label><br>
                    <input name="password" type="password"><br>
                    <input type="submit" value="Login">
                </form>
                <h3>Register <a style="color: blue;" id="signup_hover" href="signup.jsp">here</a></h3>
            </div>
            <% } %>
        </div>

        <div id="login_pic">
            <img style="width: 140px; height: 140px;" src="image/homepage/cute_cat.png" alt="Cute Cat">
        </div>

        <%
            out.println(dP.footerReturn());
        %>

    </body>
</html>
