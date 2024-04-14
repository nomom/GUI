<%-- 
    Document   : checkout_info
    Created on : Apr 11, 2024, 8:39:51 PM
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
        <title>Petto - Checkout_info</title>
        <link rel="stylesheet" href="css/checkout.css">
        <link rel="icon" type="image/x-icon" href="image/homepage/petto_logo.png">
       
      
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
            
            <div class="shipping" style="margin-right: 45px">

                    <h2>shipping information</h2>
                    
                    <form method="post" action= "" >
                       <label>Address :</label><br/>
                       <input name="address" type="text"><br/>
                       <label>First Name :</label><br/>
                       <input name="fist_name" type="text" size="20"><br/>
                        <label>Last Name :</label><br/>
                       <input name="last name" type="text" size="20"><br/>
                        <label>Phone number :</label><br/>
                       <input name="fist_name" type="text" size="20"><br/>
                       
                       <br/><br/><br/>
                       
                       <div  style="display:flex;margin-top:-5px;">
                            <input type="reset" value="Back" id="cancel-button" onclick="handleBack()"/>
                            <input type="submit" value="Next" id="next-button" />
                       </div>
                      
                        <script>
                      
                        function handleBack() {
                          window.location.href = "index.jsp";
                        }
                        </script>
                        
                   </form>


            </div>
            
            
            <div class="pages">
               
                <p > <span style="font-weight:bold">Information</span> > Shipping > Payment</p>

            </div>
            
            
        </div>
     
         <a href="checkout_shipping.jsp">Shipping</a>
         
         
    </body>


</html>



