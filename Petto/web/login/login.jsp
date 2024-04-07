<!DOCTYPE html>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page  import="model.userDA"%>
<%@ page  import="model.User"%>
<%@ page  import="javax.servlet.http.HttpSession"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 


<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Petto - Login</title>
        <link rel="icon" type="image/x-icon" href="<c:url value='/image/homepage/petto_logo.png'/>">
        <link rel="stylesheet" type="text/css" href="<c:url value='/css/login.css' />">
        <link rel="stylesheet" type="text/css" href="<c:url value='/css/default.css' />">
    </head>

    <body>
        <div id="login_header">
            <img style="width: 200px; height: 200px;"  src="<c:url value='/image/homepage/petto_logo.png'/>" alt="Petto Logo"></a>
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

                <form method="post" action="<c:url value='/validationLG'/>">
                    <label>username</label><br/>
                    <input name="username" type="text"><br/>
                    <label>password</label><br/>
                    <input name="password" type="text"><br/>
                    <input type="submit" value="Login">
                </form>
                <h3>register <a style="color: blue;" id="signup_hover" href="<c:url value='/index.jsp'/>" alt="Cute Cat">here</a></h2>
            </div>
        </div>
        <div id="login_pic">
            <img style="width: 200px; height: 200px;"  src="<c:url value='/image/homepage/cute_cat.png'/>" alt="Cute Cat"></a>
        </div>
        <img>
    </body>

</html>
