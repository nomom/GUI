<%-- 
    Document   : checkout_info
    Created on : Apr 11, 2024, 8:39:51 PM
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
        <title>Petto - checkout</title>
        <link rel="stylesheet" href="css/checkoutinfo.css">
        <link rel="stylesheet" href="css/default.css">
        <link rel="icon" type="image/x-icon" href="image/homepage/petto_logo.png">
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
        <p><b>Information</b> > Shipping > Payment > Review</p>
        <form>
            <input type="button" value="back" id="back-button">
        </form>
    </header>

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
                        <p id="product_amount" style="font-family: 'LeagueSpartanBold'">x<%=cart.getProductquantity()%> (RM <%=priceList.get(index)%>)</p>
                        <%index = index + 1;%>
                    </div>
                </div>
            </div>
            <%}%>
        </div>

        <div id="cart_middle">
            <p style="font-size:10px; text-align:center;">please make sure all items in cart are correct. we cannot cancel or modify orders once they are placed  orders process within 5-7 business days. you will receive an email with tracking information after your order ships</p>
        </div>

        <div id="cart_submit">
            <div id="address_form">
                <form method="post" action="CheckOutShipping">
                    <h3>shipping information</h3>
                    <hr>
                    <h4 style="margin: 0px">address</h4>
                    <input type="text" id="address" name="address" required>
                    <h4 style="margin: 10px 0px 0px 0px">phone number</h4>
                    <input type="text" id="phone" name="phone" required>
                    <h4 style="margin: 10px 0px 0px 0px">billing nickname</h4>
                    <input type="text" id="nickname" name="nickname" required>
                    <br/>
                    <label for="shipping"><h4 style="margin: 10px 0px 0px 0px">choose shipping value:</h4></label>
                    <select name="shipping" id="shipping">
                        <option value="J&T">J&T Express (RM 25)</option>
                        <option value="GDEX">GD Express (RM 30)</option>
                    </select> </br>
                    <input type="submit" value="next" id="next-button">
                </form>
            </div>
            <div class="push"></div>
            <div id="subtotal">
                <hr>
                <p style="font-family: 'LeagueSpartanBold'">subtotal: RM <%=totalPrice%></p>
                <hr>
                <p style="font-family: 'LeagueSpartanBold'">total: RM <%=totalPrice%></p>
            </div>
        </div>
    </body>

    <script>
        // Get a reference to the button element
        const backButton = document.getElementById('back-button');

        // Add a click event listener to the button
        backButton.addEventListener('click', function () {
            // Redirect to cart.jsp when the button is clicked
            window.location.href = 'cart.jsp';
        });
    </script>


</html>



