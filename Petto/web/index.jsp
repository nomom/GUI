
<%@ page  import="controller.defaultPrompter" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Petto</title>
        <link rel="icon" type="image/x-icon" href="image/homepage/petto_logo.png">
        <link rel="stylesheet" href="css/homepage.css">
        <link rel="stylesheet" href="css/default.css">
    </head>

    <%
        defaultPrompter dP = new defaultPrompter();
        out.println(dP.headerReturn());
    %>
    
    <body>
        <div id="homepage_1">
            <div>
                <h1>Pampers, Play, <br/> Repeat: Where <br/> Tails and Happiness <br/> Meet!</h1>
                <p>click shop, checkout, payment and have a nice Petto!</p>
            </div>
            
            <div id="homepage_1_img">
                <img style="width: 250px; height: 350px;"  src= "image/homepage/dog.png" alt="Dogs">
            </div>
        </div>
        <div id="homepage_2">
            <div id="upper_banner">
                <h3>featured items</h3>
            </div>
            <div id="middle_hp2">
                <div class="hp2_items" id="items_1">
                    <img style="width: 300px; height: 300px;" src="image/homepage/whiskas_indoor.png">
                    <p style="text-align: center;">Whiskas Indoor Pet Food</p>
                </div>
                <div class="hp2_items" id="items_2">
                    <img style="width: 300px; height: 300px;" src="image/homepage/tomi_premium_food.png">
                    <p style="text-align: center;">Tomi Premium Food</p>
                </div>
                <div class="hp2_items" id="items_3">
                    <img style="width: 300px; height: 300px;" src="image/homepage/pet_collar.png">
                    <p style="text-align: center;   ">Petto Leather Collar</p>
                </div>
            </div>
            <div id="lower_banner">
                <a><img style="width: 100px; height: 50px;" src="image/homepage/shop_icon.png"></a>
            </div>
        </div>
        <hr id="ending_hr">
    </body>
    
    <%
        out.println(dP.footerReturn());
    %>
</html>
