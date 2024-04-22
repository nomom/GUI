<%-- 
    Document   : customer_info
    Created on : Apr 14, 2024, 4:02:03 PM
    Author     : User
--%>


<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page  import="controller.defaultPrompter" %>
<%@ page import = "controller.addProduct"%>
<%@page import="model.Users" %>
<%@page import="model.Product" %>
<%@page import="model.Ordertable" %>
<%@page import="java.util.List"%>
<!DOCTYPE html>

<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Petto - Admin Panel</title>
        <link rel="icon" type="image/x-icon" href="image/homepage/petto_logo.png">
        <link rel="stylesheet" href="css/default.css">
        <link rel="stylesheet" href="css/customer_info.css">
        <link rel="stylesheet" href="css/sales.css">
    </head>

    <%
        defaultPrompter dP = new defaultPrompter();

        List<Ordertable> allOrderList = (List) session.getAttribute("allOrderList");
        Users user = (Users) session.getAttribute("userDetails");
        SimpleDateFormat dateFormat = new SimpleDateFormat("E, dd MMM yyyy z");

        Boolean isLogin = (Boolean) session.getAttribute("isLogin");
        if (isLogin != null && isLogin) {
            out.println(dP.headerReturn(user));
        } else {
            out.println(dP.headerReturn());
        }

    %>


    <body>
        <div id="informationdiv">
            <h1>sales record</h1>
            <h2>your username: <%=user.getUserName()%></h2>
            <h2>your roles: <%=user.getUserType()%></h2>
        </div>
        <div id="informationdiv">
            <form method="get" action="ViewSalesRecord">
                <input type="submit" value="Top 10 Order Sales"/>
            </form>
            <br/>   
            <form method="get" action="ViewSalesRecord">
                <input type="submit" value="Top 10 Product Sales"/>
            </form>
        </div>
        <div id="informationdiv">
            <h3 style=" margin-left: 150px; text-decoration: underline;">details below</h3>
        </div>
        <hr>
        <%for (Ordertable order : allOrderList) {%>
        <div style="margin-left: 150px;" id="cart_box">
            <img src=<%=order.getProductid().getProducturl()%> />
            <div>
                <p id="product_price" style="font-family: 'LeagueSpartanBold'">username: <%=order.getUsername().getUserName()%></p>
                <p id="product_price" style="font-family: 'LeagueSpartanBold'"><%=dateFormat.format(order.getDatepurchase())%></p>
                <h1 id="product_name" style="font-family: 'LeagueSpartanBold'"><%=order.getProductid().getProductname()%></h1>
                <h5 id="product_name" style="font-family: 'LeagueSpartanBold'"><%=order.getPaymentmethod()%></h1>
            </div>
            <div class="push"></div>
            <div id="rightest">   
                <p id="product_price" style="font-family: 'LeagueSpartanBold'">bought: <%=order.getUnitsold()%></p>
                <p id="product_price" style="font-family: 'LeagueSpartanBold'">unit price: RM<%=order.getProductid().getProductprice()%></p>
                <p id="product_price" style="font-family: 'LeagueSpartanBold'">total: RM<%=order.getPrice()%></p>
            </div>
        </div>
        <p id="address" style="text-align:center;"><%=order.getShipping()%></p>
        <hr>
        <%}%>
    </body>


</html>






