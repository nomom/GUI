<!DOCTYPE html>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page  import="model.userDA"%>
<%@ page  import="model.User"%>
<%@ page  import="javax.servlet.http.HttpSession"%>


<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Petto - Login</title>
        <link rel="icon" type="image/x-icon" href="image/homepage/petto_logo.png">
        <link rel="stylesheet" type="text/css" href="css/login.css">
        <link rel="stylesheet" type="text/css" href="css/default.css">
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
        <div id="login_header">
            <img style="width: 200px; height: 200px;"  src="image/homepage/petto_logo.png" alt="Petto Logo"></a>
        </div>
        <div id="login_body_main">
            <div id="login_body_1">
                <h1>login</h1>
                <%
                    Boolean passwordInvalid = (Boolean) request.getAttribute("passwordInvalid");
                    Boolean usernameInvalid = (Boolean) request.getAttribute("usernameInvalid");
                    
                    

                    if (passwordInvalid != null && passwordInvalid) {
                %>
                <h2>Password Incorrect!</h2>
                <%
                    }
                    if (usernameInvalid != null && usernameInvalid) {
                %>
                <h2>Username Not Found!</h2>
                <%
                    }
                %>

                <form method="post" action="validationLG">
                    <label>username</label><br/>
                    <input name="username" type="text"><br/>
                    <label>password</label><br/>
                    <input name="password" type="text"><br/>
                    <input type="submit" value="Login">
                </form>
                <h3>register <a style="color: blue;" id="signup_hover" href="signup.jsp" alt="Cute Cat">here</a></h2>
            </div>
        </div>
        <div id="login_pic">
            <img style="width: 140px; height: 140px;"  src= "image/homepage/cute_cat.png" alt="Cute Cat"></a>
        </div>
        <img>
    </body>

</html>
