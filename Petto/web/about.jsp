<%@ page  import="controller.defaultPrompter" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Petto - T&C</title>
        <link rel="icon" type="image/x-icon" href="image/homepage/petto_logo.png">
        <link rel="stylesheet" href="css/about.css">
        <link rel="stylesheet" href="css/default.css">
    </head>

    <%
        defaultPrompter dP = new defaultPrompter();
        out.println(dP.headerReturn());
    %>

    <body>
        <div id="head" class="txthead">behind the pet</div> <!--top text -->
        <div id="thomasshelby"><img src="image/homepage/swag_dog.jpg"></div> 
        <div id="txt" class="txtbody">
            <!--thomas shelby quote--><p style="text-align: center;">Doggy Shelby once quote ?It can be difficult to find beautiful pet accessories. Petto is born out of a passion of bridging this gap - bringing you curated, bespoke, luxury pet accessories from all over the world, right here to Malaysia. Discover your Petto?s very own select store, including limited releases with local artisans. You've never seen anything quite like us. ?</p>
        </div>
    </body>


    <%
        out.println(dP.footerReturn());
    %>

</html>