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
        List<String> informationList = (List) session.getAttribute("informationList");
        Double totalPrice = (Double) session.getAttribute("totalPrice");

        //error msg
        String errorInCart = (String) session.getAttribute("errorInCart");
        String deleteInCart = (String) session.getAttribute("deleteInCart");
        int index = 0;
    %>

    <header>
        <p>Information >Shipping >  <b>Payment</b> > Review</p>
        <form method="get" action="CheckOutShipping">
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
                <form method="get" action="CheckOutPayment">
                    <h3>payment method</h3>
                    <hr>
                    <label for="payment"><h4 style="margin: 10px 0px 0px 0px">choose payment method:</h4></label>
                    <select name="payment" id="payment">
                        <option value="COD">COD</option>
                        <option value="CC">Credit Card</option>
                    </select> </br>
                    <div id="creditCard" style="display: none;">    
                        <h4 style="margin: 10px 0px 0px 0px">Card Number</h4>
                        <input type="text" id="cardnum" name="cardnum"  maxlength="16" pattern="[0-9]{16}">
                        <h4 style="margin: 10px 0px 0px 0px">Month</h4>
                        <input type="text" id="cardmonth" name="cardmonth">
                        <h4 style="margin: 10px 0px 0px 0px">Year</h4>
                        <input type="text" id="cardyear" name="cardyear">
                        <h4 style="margin: 10px 0px 0px 0px">CCV (3 or 4 digits usually found on signature strip)</h4>
                        <input type="text" id="ccv" name="ccv">
                    </div>
                    <input type="submit" value="next" id="next-button">
                </form>
            </div>
            <div class="push"></div>
            <div id="subtotal">
                <hr>
                <p style="font-family: 'LeagueSpartanBold'">subtotal: RM <%=totalPrice%></p>
                <p style="font-family: 'LeagueSpartanBold'">shipping: RM <%=Double.parseDouble(informationList.get(4))%></p>
                <hr>
                <%totalPrice = totalPrice + Double.parseDouble(informationList.get(4));%>
                <p style="font-family: 'LeagueSpartanBold'">total: RM <%=totalPrice%></p>
            </div>
        </div>
    </body>


    <script>
        // Get a reference to the button element
        const backButton = document.getElementById('back-button');

        backButton.addEventListener('click', function () {
            window.location.href = 'checkoutshipping.jsp';
        });
    </script>

    <script>
        const paymentSelect = document.getElementById('payment');
        const creditCardInput = document.getElementById('creditCard');

        paymentSelect.addEventListener('change', function () {
            if (paymentSelect.value === 'CC') {
                creditCardInput.style.display = 'block';
            } else {
                creditCardInput.style.display = 'none';
            }
        });
    </script>


</html>



