<%@ page  import="controller.defaultPrompter" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Petto</title>
        <link rel="icon" type="image/x-icon" href="image/homepage/petto_logo.png">
        <link rel="stylesheet" href="css/shop.css">
        <link rel="stylesheet" href="css/default.css">
    </head>


    <%
        defaultPrompter dP = new defaultPrompter();
        out.println(dP.headerReturn());
    %>

    <body>
        <div class="txthead" id="txthead">
            <h3 style="text-align: center;">shop</h3>
        </div>

        <div class="item_container" id="txtbody">
            <div class="item_box">
                <h4>Pedigree Adult Series</h4>
                <img src="image/homepage/test_dog_food.png"><img/>
                <p>RM 200.00</p>
                <form method="post" action="validationSU">
                    <input type="submit" value="View">
                </form>
            </div>
            <div class="item_box">
                <h4>Pedigree Adult Series</h4>
                <img src="image/homepage/test_dog_food.png"><img/>
                <p>RM 200.00</p>
                <form method="post" action="validationSU">
                    <input type="submit" value="View">
                </form>
            </div>
        </div>
    </body>

    <%
        out.println(dP.footerReturn());
    %>
</html>