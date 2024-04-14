<%-- 
    Document   : customer_info
    Created on : Apr 14, 2024, 4:02:03 PM
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
        <title>Petto - CustomerInformation</title>
        <link rel="icon" type="image/x-icon" href="image/homepage/petto_logo.png">
        <link rel="stylesheet" href="css/checkout3.css">
      
    </head>

    


    <body>
        
        <a href="index.jsp"><img style="width: 100px; height: 60px;margin-top:17px;float: right"  src= "image/homepage/petto_logo2.jpg" alt="Petto Logo"></a>
        
        <div class="profile">
            
              <img src="image/homepage/user_profile.png" style="width: 140px ;float: left;margin-left: 70px;margin-right: 100px"><img/>
              <h1 id="user_name">Lim Bird Birdd</h1>
              <h2 id="user_id">#UserID</h2>
            
            
        </div>
        
        
        <br><br>
        
        
        <h3>Purchase history</h3>
        <hr>
        <br><br>
        
        <div class="purchase_history">
            
            <div>
              
                <h3 id="address" style="text-align: center; font-weight:normal; font-size: 17px;margin-top: -10px">77, Lorong Lembah Permai Tiga, 11200 Tanjong Bugah</h3>
                 <p id="order_id" style="text-align: left">#ORD001</p>
                 <p id="date" style="text-align: right;margin-top: -28px;" >23 March 2024</p>
            </div>
            
            
            <div class="product_box" style=" margin-top: 50px;">
                <img src="image/homepage/test_dog_food.png" style="width: 150px ;float: left;margin-left: 70px;margin-right: 100px"><img/>
                <div class="product_details">

                    <h1 id="product_name">Pedigree Weed</h1>
                    <p id="product_price">RM200</p>
                    <p id="qty">X 1</p>
                </div>
                <br>
            </div>
            
           <div class="product_box" style=" margin-top: 50px;">
                <img src="image/homepage/test_dog_food.png" style="width: 150px ;float: left;margin-left: 70px;margin-right: 100px"><img/>
                <div class="product_details">

                    <h1 id="product_name">Pedigree Weed</h1>
                    <p id="product_price">RM200</p>
                    <p id="qty">X 1</p>
                </div>
                <br>
            </div>
            
            
            

        
        </div>
            
        
    
       
        
    </body>


</html>






