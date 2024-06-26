<%-- 
    Document   : signup
    Created on : Mar 31, 2024, 8:40:09 PM
    Author     : Acer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page  import="model.userDA"%>
<%@ page  import="model.Users"%>
<%@ page  import="controller.defaultPrompter" %>
<!DOCTYPE html>

<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Petto - signup</title>
        <link rel="icon" type="image/x-icon" href="image/homepage/petto_logo.png">
        <link rel="stylesheet" href="css/signup.css">
        <link rel="stylesheet" href="css/default.css">
    </head>

    <%
        defaultPrompter dP = new defaultPrompter();
        Users user = (Users) session.getAttribute("userDetails");
        Boolean isLogin = (Boolean) session.getAttribute("isLogin");
        if (isLogin != null && isLogin) {
            out.println(dP.headerReturn(user));
        } else {
            out.println(dP.headerReturn());
        }

    %>

    <body>
        <div id="signup_header">
            <img style="width: 200px; height: 200px;"  src= "image/homepage/petto_logo.png" alt="Petto Logo"></a>
        </div>
        <div id="signup_body_main">
            <% if (isLogin != null && isLogin) {%>
            <div id="signup_body_1">
                <h1 id="alrd_login">already sign up and log in.</h1>
                <h3>your username: "<%= user.getUserName()%>"</h3>
                <form id="alrd_login_form" action="validationLG" method="get">
                    <input type="submit" value="logout">
                </form>
            </div>
            <% } else { %>
            <div id="signup_body_1">
                <h1>signup</h1>
                <%
                    Boolean validateExist = (Boolean) session.getAttribute("usernameInvalid");
                    if (validateExist != null && validateExist) {
                %>
                <h2>Username already exists!</h2>
                <%
                    }
                %>
                <form method="post" action= "validationSU">
                    <label>username</label><br/>
                    <input name="username" type="text"><br/>
                    <label>password</label><br/>
                    <input name="password" type="password"><br/>
                    <input type="submit" value="Register">
                </form>
                <h3>login <a style="color: blue;" id="signup_hover" href="login.jsp">here</a></h2>
            </div>
            <% } %>
        </div>

        <div id="signup_pic">
            <img style="width: 150px; height: 150px;"  src= "image/homepage/cute_cat.png" alt="Cute Cat"></a>
        </div>
        <img>
    </body>

    <%
        out.println(dP.footerReturn());
    %>
</html>

