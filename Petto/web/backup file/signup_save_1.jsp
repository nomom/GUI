<%-- 
    Document   : signup
    Created on : Mar 31, 2024, 8:40:09 PM
    Author     : Acer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page  import="model.Users"%>
<%@ page  import="controller.AddUser"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <div id="header_banner" >
            <p id="header_banner_p" style="background-color: #D9D9D9; width: 100%;  height: 100%; text-align:center;">free shipping malaysia-wide for orders RM 150 above</p>
        </div>
        <nav>
            <ul>
                <li><a href="homepage.html"><img style="width: 100px; height: 100px;"  src= "image/homepage/petto_logo.png" alt="Petto Logo"></a></li>
                <li><a href="about.html">about us </a></li>
                <li><a href="shop.html">shop</a></li>
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
                <%
                    AddUser test = new AddUser();
                    Users user = (Users) session.getAttribute("user");
                %>
                <%= user.getUserName()%>
                <%
                    test.signupUser(user);
                    session.removeAttribute("user");
                %>
                <h1>signup completed </h1> <br/><br/><br/>
                <form action="index.html">
                    <input id="signup_save_button" type="submit" value="to Petto!"/>
                </form>
            </div>
        </div>
        <div id="signup_pic">
            <img style="width: 150px; height: 150px;"  src= "image/homepage/cute_cat.png" alt="Cute Cat"></a>
        </div>
        <img>
    </body>

</html>

