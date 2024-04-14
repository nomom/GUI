<%-- 
    Document   : product_individual
    Created on : Apr 13, 2024, 8:05:41 PM
    Author     : User
--%>

<%@ page  import="controller.defaultPrompter" %>
<%@ page  import="model.Users"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <title>Petto_Shop_Info</title>
        <link rel="icon" type="image/x-icon" href="image/homepage/petto_logo.png">
        <link rel="stylesheet" href="css/shop_info.css">
        <link rel="stylesheet" href="css/default.css">
    </head>


    <%
        defaultPrompter dP = new defaultPrompter();

        Boolean isLogin = (Boolean) session.getAttribute("isLogin");
        if (isLogin != null && isLogin) {
            Users user = (Users) session.getAttribute("userDetails");
            out.println(dP.headerReturn(user));
        } else {
            out.println(dP.headerReturn());
        }

    %>

    <body>
        <div class="product_info">   
            <div class="mainimg">
              <img src ="image/homepage/test_dog_food.png"><img/>
            </div>
              <div class="product_details">
                  
                <h1 id="product_name">Pedigree Weed</h1>
                <p id="product_price">RM200</p>

                <form method="post" action="" id="addtocartButton">
                    <input type="submit" value="add to cart" style="padding: 12px; width: 300px;text-align: center"/>
                </form>
                
                <div class="product_descriptions">
                    <h3>the pedigree weed</h3>
                    <p>for adult dogs</p>
                     <p>for adult dogs</p>
                     <p>for adult dogs</p>
                      
                     <p>-18pounds</p>
                     <p>-18pounds</p>
                     <p>-18pounds</p>
                     <p>-18pounds</p>
                     
                </div>
              
              </div>
              
        </div>
        
       <h3 style="text-align: center;">petto favourites</h3>
        <div class="item_container" id="txtbody"> 
             <div class="item_box">      
                 <h4>Pedigree Adult Series</h4>
                 <a href="product_individual.jsp">
                     <img src="image/homepage/test_dog_food.png" style="width: 150px"><img/>
                 <a/>
                 <p>RM 200.00</p>
                <button onclick="navigateToPage();">View</button>
             </div>

             <div class="item_box">
                 
                 <h4>Pedigree Adult Series</h4>
                 <a href="product_individual.jsp">
                     <img src="image/homepage/test_dog_food.png" style="width: 150px"><img/>
                 <a/>
                 <p>RM 200.00</p>
                 <button onclick="navigateToPage();">View</button>
              </div>

            <div class="item_box">
                 <h4>Pedigree Adult Series</h4>
                 <a href="product_individual.jsp">
                      <img src="image/homepage/test_dog_food.png" style="width: 150px"><img/>
                 <a/>
                 <p>RM 200.00</p>
                 <button onclick="navigateToPage();">View</button>
              </div>
            
              <div class="item_box">
                 <h4>Pedigree Adult Series</h4>
                 <a href="product_individual.jsp">
                      <img src="image/homepage/test_dog_food.png" style="width: 150px"><img/>
                 <a/>
                 <p>RM 200.00</p>
                 <button onclick="navigateToPage();">View</button>
              </div>

            
              <div class="item_box">
                 <h4>Pedigree Adult Series</h4>
                 <a href="product_individual.jsp">
                      <img src="image/homepage/test_dog_food.png" style="width: 150px"><img/>
                 <a/>
                 <p>RM 200.00</p>
                 <button onclick="navigateToPage();">View</button>
              </div>
            
                 <script>
                 function navigateToPage() {
                     window.location.href = 'product_individual.jsp';
                 }
                 </script>

             </div>
                
    </body>

    <%
        out.println(dP.footerReturn());
    %>
</html>