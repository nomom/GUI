<%-- 
    Document   : signup
    Created on : Mar 31, 2024, 8:40:09 PM
    Author     : Acer


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
                <%
                    userDA userda = new userDA();
                    User user = (User)session.getAttribute("user");
                    userda.signupUser(user);
                    //kemek I added this so when the user kukubird yang, click back to the signup_confirmation page and confirm again,
                    //give error so no duplication record
                    session.removeAttribute("user");
                %>
                <h1>signup completed </h1> <br/><br/><br/>
                    <form action="homepage.html">
                    <input id="signup_save_button" type="submit" value="to Petto!"/>
                </form>
            </div>
        </div>
        <div id="signup_pic">
            <img style="width: 200px; height: 200px;"  src= "image/homepage/cute_cat.png" alt="Cute Cat"></a>
        </div>
        <img>
    </body>

</html>

--%>