<%-- 
    Document   : signup
    Created on : Mar 31, 2024, 8:40:09 PM
    Author     : Acer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page  import="da.userDA"%>
<%@ page  import="javade.User"%>
<!DOCTYPE html>

<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Petto - Signup</title>
        <link rel="icon" type="image/x-icon" href="image/homepage/petto_logo.png">
        <link rel="stylesheet" href="css/signup.css">
        <link rel="stylesheet" href="css/default.css">
    </head>

    <body>
        <div id="signup_header">
            <img style="width: 200px; height: 200px;"  src= "image/homepage/petto_logo.png" alt="Petto Logo"></a>
        </div>
        <div id="signup_body_main">
            <div id="signup_body_1">
                <h1>signup</h1>
                <form method="post" action="">
                    <label>username</label><br/>
                    <input name="username" type="text"><br/>
                    <label>password</label><br/>
                    <input name="password" type="text"><br/>
                    <input type="submit" value="Register">
                    <%
                    User user = new User(request.getParameter("username"),request.getParameter("password"),false);
                    userDA userda= new userDA();
                    userda.signupUser(user);
                    
                    %>
                </form>
            </div>
        </div>
        <div id="signup_pic">
            <img style="width: 200px; height: 200px;"  src= "image/homepage/cute_cat.png" alt="Cute Cat"></a>
        </div>
        <img>
    </body>

</html>

