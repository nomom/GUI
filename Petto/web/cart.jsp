<%-- 
    Document   : cart
    Created on : Apr 14, 2024, 2:40:37 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page  import="model.userDA"%>
<%@ page  import="model.Users"%>
<%@ page  import="controller.defaultPrompter" %>
<!DOCTYPE html>

<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Petto - Cart</title>
        <link rel="icon" type="image/x-icon" href="image/homepage/petto_logo.png">
        <link rel="stylesheet" href="css/cart.css">
      
    </head>


    <body>
       
        <a href="index.jsp"><img style="width: 100px; height: 60px;margin-top:17px;margin-left:37px"  src= "image/homepage/petto_logo2.jpg" alt="Petto Logo"></a>
        
        <h1 style="margin-left: 46px; font-weight: bold;">your cart</h1>
        
        <div>
            <div class="cart-display">

                <div class="product_box">
                    <img src="image/homepage/test_dog_food.png" style="width: 150px ;float: left;margin-left: 70px;margin-right: 100px"><img/>
                        <div class="product_details">

                            <h1 id="product_name">Pedigree Weed</h1>
                            <p id="product_price">RM200</p>

                             <div class="quantity-container">
                                <!-- Decrease quantity button -->
                                <button class="quantity-button" id="decrease" onclick="changeQuantity(-1)">-</button>

                                <!-- Quantity display -->
                                <input type="text" class="quantity-field" id="quantity-display" value="1" readonly>

                                <!-- Increase quantity button -->
                                <button class="quantity-button" id="increase" onclick="changeQuantity(1)">+</button>
                            </div>
                        </div>

                    <script>
                            // JavaScript code
                            function changeQuantity(change) {
                                // Get the quantity display element
                                const quantityDisplay = document.getElementById('quantity-display');

                                // Get the current quantity and parse it as an integer
                                let quantity = parseInt(quantityDisplay.value);

                                // Calculate the new quantity
                                const newQuantity = quantity + change;

                                // Ensure the new quantity is at least 1
                                if (newQuantity >= 1) {
                                    // Update the quantity display with the new quantity
                                    quantityDisplay.value = newQuantity;
                                }
                            }
                        </script>
                </div>


                <br><br>

            </div>
        

            <div class="cart-confirm">

                <div>
                    <hr>
                    <h3>subtotal</h3>
                    <p id="subtotal_cart">RM200.00</p>
                </<div>
                    
                    
                <form method="post" action= "" >

                           <div  style="display:flex;margin-left: 120px">
                               <input type="reset" value="Back" id="cancel-button"  onclick="handleBack()">
                                <input type="submit" value="Checkout" id="next-button">
                           </div>

                            <script>

                             function handleBack() {
                                   window.location.href = "index.jsp";
                             }
                             </script>
                </form>


               
            </div>
            
        </div>
        
        
                <p style="bottom:0;font-size: 14px; text-align: center;margin-top: 200px">please make sure all items in cart are correct. we cannot cancel or modify orders once they are placed</p>
                <p style="bottom:0;font-size: 14px;text-align: center">orders process within 5-7 business days, you will receipt an email tracking information after you have placed the order</p>
                
                
                
                <a href="checkout_info.jsp">Checkout</a>
       
        
    
            
            
            
            
    </body>
    
</html>

