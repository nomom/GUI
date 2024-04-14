<%-- 
    Document   : cehckout_shipping
    Created on : Apr 14, 2024, 12:56:46 AM
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
        <title>Petto - Checkout_shipping</title>
        <link rel="icon" type="image/x-icon" href="image/homepage/petto_logo.png">
        <link rel="stylesheet" href="css/checkout1.css">
      
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
            
            <div class="shipping">

                    <h2>shipping methods</h2>
                    
                    <form method="post" action= "" >
                        <div id="method1">
                            <label>
                                <input type="radio" name="method" value="1">GDex Epress(1-2 days) &nbsp;&nbsp;&nbsp;- &nbsp;&nbsp;&nbsp; RM10
                            </label><br/>
                        </div>
                        
                        <div id="method2">
                            <label>
                                <input type="radio" name="method" value="2">J&T(2-3 days) &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- &nbsp;&nbsp;&nbsp; RM5
                            </label><br/>
                        </div>
                       
                       
                       
                       <br/><br/><br/>
                       
                       <div  style="display:flex;margin-left: 120px">
                           <input type="reset" value="Back" id="cancel-button"  onclick="handleBack()">
                            <input type="submit" value="Next" id="next-button">
                       </div>
                       
                       <script>
                      
                        function handleBack() {
                                  window.location.href = "checkout_info.jsp";
                        }
                        </script>
                   </form>


            </div>
            
            
            <div class="pages">
               
                <p > Information ><span style="font-weight:bold"> Shipping </span> > Payment</p>

            </div>
            
            
        </div>
        
         <a href="checkout_payment.jsp">Payment</a>
        
    </body>


</html>



