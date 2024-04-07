<%-- 
    Document   : signup
    Created on : Mar 31, 2024, 8:40:09 PM
    Author     : Acer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page  import="model.userDA"%>
<%@ page  import="model.User"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Petto - Signup</title>
        <link rel="icon" type="image/x-icon" href="<c:url value='/image/homepage/petto_logo.png'/>">
        <link rel="stylesheet" href="<c:url value='/css/signup.css'/>">
        <link rel="stylesheet" href="<c:url value='/css/default.css'/>">
    </head>

    <body>
        <div id="signup_header">
            <img style="width: 200px; height: 200px;"  src= "<c:url value='/image/homepage/petto_logo.png'/>" alt="Petto Logo"></a>
        </div>
        <div id="signup_body_main">
            <div id="signup_body_1">
                <h1>signup confirmation</h1>
                <%
                    User user = (User) session.getAttribute("user");
                    String name = user.getUserName();
                    String password = user.getPswd();
                %>
                <form method="post" action="<c:url value='/signup/signup_save.jsp'/>">
                    <label>username: <%= name%></label><br/>
                    <label>password: <%= password%></label><br/>
                    <input type="submit" value="Confirm">
                </form>
            </div>
        </div>
        <div id="signup_pic">
            <img style="width: 200px; height: 200px;"  src= "<c:url value='/image/homepage/cute_cat.png'/>" alt="Cute Cat"></a>
        </div>
        <img>
    </body>

</html>

