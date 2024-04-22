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
        List<String> paymentList = (List) session.getAttribute("paymentList");
        Double totalPrice = (Double) session.getAttribute("totalPrice");

        //error msg
        String errorInCart = (String) session.getAttribute("errorInCart");
        String deleteInCart = (String) session.getAttribute("deleteInCart");
        int index = 0;
    %>

    <header>
        <p>Information >Shipping > Payment > <b>Review</b></p>
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
                        <p id="product_amount" style="font-family: 'LeagueSpartanBold';">x<%=cart.getProductquantity()%> (RM <%=priceList.get(index)%>)</p>
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
                <form method="post" action="GenerateOrderID">
                    <div>
                        <h3>information review</h3>
                        <hr>
                        <h4 style="margin: 20px 0px 0px 0px; font-family: 'LeagueSpartanBold';">Address</h4>
                        <p><%=informationList.get(0)%></p>
                        <h4 style="margin: 20px 0px 0px 0px; font-family: 'LeagueSpartanBold';">Phone Number</h4>
                        <p><%=informationList.get(1)%></p>
                        <h4 style="margin: 20px 0px 0px 0px; font-family: 'LeagueSpartanBold';">Billing Name</h4>
                        <p><%=informationList.get(2)%></p>
                        <h4 style="margin: 20px 0px 0px 0px; font-family: 'LeagueSpartanBold';">Payment Method</h4>
                        <%if (paymentList.get(0).equals("Cash On Delivery")) {%>
                        <p><%=paymentList.get(0)%></p>
                        <%} else {%>
                        <p><%=paymentList.get(0)%></p>
                        <h4 style="margin: 20px 0px 0px 0px; font-family: 'LeagueSpartanBold';">Card Number</h4>
                        <p><%=paymentList.get(1)%></p>
                        <%}%>



                    </div>

                    <input type="submit" value="Confirm" id="next-button">
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
            window.location.href = 'checkoutpayment.jsp';
        });
    </script>


</html>



