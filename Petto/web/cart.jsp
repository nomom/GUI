<%-- 
    Document   : cart
    Created on : Apr 14, 2024, 2:40:37 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page  import="model.Users"%>
<%@ page  import="model.Product"%>
<%@ page  import="model.Cart"%>
<%@page import="javax.servlet.http.HttpSession"%>
<%@page import="java.util.List"%>
<%@ page  import="controller.defaultPrompter" %>
<!DOCTYPE html>

<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Petto - Cart</title>
        <link rel="icon" type="image/x-icon" href="image/homepage/petto_logo.png">
        <link rel="stylesheet" href="css/carts.css">
        <link rel="stylesheet" href="css/default.css">
    </head>

    <%
        List<Cart> viewCartList = (List) session.getAttribute("viewCartList");
        List<Double> priceList = (List) session.getAttribute("priceList");
        Double totalPrice = (Double) session.getAttribute("totalPrice");
        String errorInCart = (String) session.getAttribute("errorInCart");
        String deleteInCart = (String) session.getAttribute("deleteInCart");
        int index = 0;
    %>

    <header>
        <form>
            <input style="margin-left: 50px;" type="button" value="back" id="back-button">
        </form>
    </header>

    <!-- Add Errors -->
    <%
        if (errorInCart != null) {
    %>
    <h1><%=errorInCart%></h1>
    <%}%>
    <%
        session.setAttribute("errorInCart", null);
    %>

    <!-- Delete Errors -->
    <%
        if (deleteInCart != null) {
    %>
    <h1><%=deleteInCart%></h1>
    <%}%>
    <%
        session.setAttribute("deleteInCart", null);
    %>



    <body>
        <div id="cart_container">
            <%for (Cart cart : viewCartList) {%>
            <div id="cart_box">
                <img src=<%=cart.getProductid().getProducturl()%> />
                <div>
                    <h1 id="product_name" style="font-family: 'LeagueSpartanBold'"><%=cart.getProductid().getProductname()%></h1>
                    <p id="product_price" style="font-family: 'LeagueSpartanBold'">RM <%=cart.getProductid().getProductprice()%></p>
                </div>
                <div class="push"></div>
                <div id="rightest">   
                    <div id="button_div">
                        <form method="get" action="AddCart">
                            <input id="addButton" type="submit" value="+"/>
                            <input type="hidden" value="<%=cart.getCartid()%>" id="cartid" name="cartid">
                        </form>
                        <p id="product_amount" ">x<%=cart.getProductquantity()%> (RM <%=priceList.get(index)%>)</p>
                        <%index = index + 1;%>
                        <form method="get" action="DeleteCart">
                            <input id="removeButton" type="submit" value="-"/>
                            <input type="hidden" value="<%=cart.getCartid()%>" id="cartid" name="cartid">
                        </form>
                    </div>
                </div>
            </div>
            <%}%>
        </div>

        <div id="cart_middle">
            <p style="font-size:10px; text-align:center;">please make sure all items in cart are correct. we cannot cancel or modify orders once they are placed  orders process within 5-7 business days. you will receive an email with tracking information after your order ships</p>
        </div>

        <div id="cart_submit">
            <div id="subtotal">
                <p style="font-family: 'LeagueSpartanBold'">subtotal: RM <%=totalPrice%></p>
                <form action="CheckOutInfo" method="post">
                    <input type="submit" value="checkout" id="next-button">
                </form>
            </div>
        </div>
    </body>


    <script>
        // Get a reference to the button element
        const backButton = document.getElementById('back-button');

        // Add a click event listener to the button
        backButton.addEventListener('click', function () {
            // Redirect to cart.jsp when the button is clicked
            window.location.href = 'index.jsp';
        });
    </script>

</html>

