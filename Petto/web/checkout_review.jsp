<%-- 
    Document   : checkout_review
    Created on : Apr 14, 2024, 12:56:03 PM
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
        <title>Petto - Checkout_review</title>
        <link rel="icon" type="image/x-icon" href="image/homepage/petto_logo.png">
        <link rel="stylesheet" href="css/checkout3.css">
      
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
                       <p id="shipping">RM3.00</p>
                     </div>

                    <hr>
                    
                    <div>
                        <h3>Total</h3>
                        <p id="total">RM72.69</p>
                    </div>

                </div>
                
                <br><br><br>
               
             
            </div>
            
            <div class="review">
                    
                <div>
                    <h3>Name :</h3>
                    <p id="review_name" name="review_name">Wong Shen Hui</p>
                    
                     <h3>Email :</h3>
                    <p id="review_email" name="review_email">southpark@gmail.com</p>
                    
                     <h3>Contact :</h3>
                    <p id="review_contact" name="review_contact">017-77777333</p>
                    
                    
                     <h3>Shipping Information :</h3>
                    <p id="review_shipping" name="review_shipping">77,Lorong Lembal Permai Tiga,</p>
                    
                    
                     <h3>Payment Information :</h3>
                    <p id="review_payment" name="review_payment">(Cash On Delivery)</p>
                    
                </div>
                
                
                <form method="post" action= "" >

                       <div  style="display:flex;margin-left: 120px">
                           <input type="reset" value="Back" id="cancel-button"  onclick="handleBack()">
                            <input type="submit" value="Next" id="next-button">
                       </div>
                       
                        <script>

                         function handleBack() {
                               window.location.href = "checkout_payment.jsp";
                         }
                         </script>
                </form>


            </div>
            
            
            <div class="pages">
               
                <p style="font-weight:bold"> Information > Shipping > Payment</p>

            </div>
            
            
             <a href="index.jsp">Back to home</a>
            
        </div>
        
       
        
    </body>


</html>






</html>





