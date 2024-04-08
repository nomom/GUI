<%-- 
    Document   : signup
    Created on : Mar 31, 2024, 8:40:09 PM
    Author     : Acer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page  import="model.userDA"%>
<%@ page  import="model.User"%>
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

        <!--Default Header -->
    <header>
        <nav>
            <ul>
                <li><a href="homepage.html"><img style="width: 100px; height: 100px;"  src= "image/homepage/petto_logo.png" alt="Petto Logo"></a></li>
                <li><a href="about.html">about us </a></li>
                <li><a href="#">shop</a></li>
                <li><a href="sizeguide.html">size guide</a></li>
                <li><a href="TC.html">t&c</a></li>
                <li><a href="shipping.html">shipping & returns</a></li>
                <li><a href="login.jsp">login</a></li>
                <li><a href="signup.jsp">sign up</a></li>
                <li><a href="#"><img style="width: 20px; height: 20px;"  src= "image/homepage/shopping_cart.png" alt="Shopping Cart"></a></li>            </ul>   
        </nav>
    </header>
        
    <body>
        <div id="signup_header">
            <img style="width: 200px; height: 200px;"  src= "image/homepage/petto_logo.png" alt="Petto Logo"></a>
        </div>
        <div id="signup_body_main">
            <div id="signup_body_1">
                <h1>signup</h1>
                <%
                    Boolean validateExist = (Boolean) session.getAttribute("validate");
                    if (validateExist != null && validateExist) {
                %>
                <h2>Username already exists!</h2>
                <%
                    }
                %>
                <form method="post" action="validationSU">
                    <label>username</label><br/>
                    <input name="username" type="text"><br/>
                    <label>password</label><br/>
                    <input name="password" type="text"><br/>
                    <input type="submit" value="Register">
                </form>
                <h3>login <a style="color: blue;" id="signup_hover" href="login.jsp">here</a></h2>
            </div>
        </div>
        <div id="signup_pic">
            <img style="width: 150px; height: 150px;"  src= "image/homepage/cute_cat.png" alt="Cute Cat"></a>
        </div>
        <img>
    </body>

</html>

