<%-- 
    Document   : checkout_payment
    Created on : Apr 14, 2024, 1:15:16 AM
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
        <title>Petto - Checkout_payment</title>
        <link rel="icon" type="image/x-icon" href="image/homepage/petto_logo.png">
        <link rel="stylesheet" href="css/checkout2.css">
      
    </head>

    


    <body>
       
        <a href="index.jsp"><img style="width: 100px; height: 60px;margin-top:17px;margin-left:37px"  src= "image/homepage/petto_logo2.jpg" alt="Petto Logo"></a>
        
        <h1 style="margin-left: 46px; font-weight: bold;">checkout</h1>
        
        <div class="checkout-display">
 
            <div class="product_box">
                <img src="image/homepage/test_dog_food.png" style="width: 150px ;float: left;margin-left: 70px;margin-right: 100px"><img/>
                <div class="product_details">

                    <h1 id="product_name">Pedigree Weed</h1>
                    <p id="product_price">RM200</p>
                    <p id="qty">X 1</p>
                </div>
                <br>
            </div>
            
             <div class="product_box">
                <img src="image/homepage/test_dog_food.png" style="width: 150px ;float: left;margin-left: 70px;margin-right: 100px"><img/>
                <div class="product_details">

                    <h1 id="product_name">Pedigree Weed</h1>
                    <p id="product_price">RM200</p>
                    <p id="qty">X 1</p>
                </div>
                <br>
            </div>
            
            
            

        
        </div>
            
        
        <hr>
        <div>
             <div class="checkout">
      
                <div>               
                    <hr>
                    <div>
                        <h3>Subtotal</h3>
                        <p id="subtotal">RM69.69</p>
                    </div>
                    
                     <div>
                        <h3>Shipping</h3>
                       <p id="subtotal">RM3.00</p>
                     </div>

                    <hr>
                    
                    <div>
                        <h3>Total</h3>
                        <p id="total">RM72.69</p>
                    </div>

                </div>
                
                <br><br><br>
               
             
            </div>
            
            <div class="payment">

                    <h2>payment methods</h2>
                    <form method="post" action= "">
                        
                        <div id="method1">
                            <label>
                                <input type="radio" name="method" value="1" id="debit">Debit/Credit Cards
                            </label><br/>
                        </div>
                        
                            <div id="dropdownContainer" style="display: none">
                              
                                <label>
                                    <input type="radio" name="card" value="1" id="visa">VISA&nbsp;&nbsp;   
                                </label>
                                
                                <input type="text"  placeholder="Card number" name="card_number" id="card_number" style="width: 323px;">
                                   
                                   <br>
                                <label>
                                    <input type="radio" name="card" value="1" id="master">Master
                                </label>

                                    <input type="text" placeholder="Month" name="month" id="month" style="width: 100px">
                                    <input type="text" placeholder="Year" name="year" id="year"  style="width: 100px">                            
                                    <input type="text" placeholder="CVV" name="cvv" id="cvv"  style="width: 100px">     
                            </div>
                        
                        
                        <div id="method2">
                            <label>
                                <input type="radio" name="method" value="2" id="cod">COD (Cash on Delivery
                            </label><br/>
                        </div>
                        
                        
                        
                        <script>
                            document.addEventListener('DOMContentLoaded', function() {
                                // Get the radio buttons and the dropdown container
                                const radio1 = document.getElementById('debit');
                                const dropdownContainer = document.getElementById('dropdownContainer');

                                // Add an event listener to the radio button
                                radio1.addEventListener('change', function() {
                                    if (radio1.checked) {
                                        // If radio1 is checked, show the dropdown
                                        dropdownContainer.style.display = 'block';
                                       
                                    }
                                });

                                // Add an event listener to the radio2 button to hide the dropdown
                                 const radio2 = document.getElementById('cod');
                                radio2.addEventListener('change', function() {
                                    if (radio2.checked) {
                                        // If radio2 is checked, hide the dropdown
                                        dropdownContainer.style.display = 'none';
                                    }
                                });
                            });
                         </script>
                         
                        

                        
                       <br/><br/><br/>
                       
                       <div  style="display:flex;margin-left: 120px">
                            <input type="reset" value="Back" id="cancel-button" onclick="handleBack()"/>
                            <input type="submit" value="Next" id="next-button"/>
                       </div>
                   </form>
                    
                    <script>
                      
                        function handleBack() {
                           window.location.href = "checkout_shipping.jsp";
                        }
                     </script>

            </div>
            
            
            <div class="pages">
               
                <p > Information > Shipping  > <span style="font-weight:bold"> Payment</span></p>

            </div>
            
            
        </div>
        
        
         <a href="checkout_review.jsp">Review</a>
         
        
    </body>


</html>




