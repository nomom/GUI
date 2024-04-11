<%@ page  import="controller.defaultPrompter" %>
<!DOCTYPE html>

<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Petto - Signup</title>
        <link rel="icon" type="image/x-icon" href="image/homepage/petto_logo.png">
        <link rel="stylesheet" href="css/management.css">
        <link rel="stylesheet" href="css/default.css">
    </head>

    <%
        defaultPrompter dP = new defaultPrompter();
        out.println(dP.headerReturn());
    %>
        
    <body>
        <div class="main">
            <h1>Manager Panel</h1>
            <div class="text" id="text">                
                <p>1. View Customer Details</p>
                <a href="manager_customer_details.html"><div class="underline" id="main">click here</div></a>
                <p>2. Inventory</p>
                <a href="manager_inventory.html"><div class="underline">click here</div></a>
                <p>3. View Sales Record</p>
                <a href="manager_sales_record.html"><div class="underline">click here</div></a>
            </div>
        </div>
    </body>

</html>

