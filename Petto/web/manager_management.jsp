<%@ page  import="controller.defaultPrompter" %>
<%@page import="model.Users" %>

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

        Boolean isLogin = (Boolean) session.getAttribute("isLogin");
        Users user = (Users) session.getAttribute("userDetails");
        if (isLogin != null && isLogin) {
            out.println(dP.headerReturn(user));
        } else {
            out.println(dP.headerReturn());
        }

    %>

    <body>
        <div class="main">
            <h1>Admin Panel</h1>
            <div class="text" id="text">   
                <!-- User Details -->
                <form method="post" action="ViewUser">
                    <p>1. View Customer Details</p>
                    <input type="submit" value="View">
                </form>
                <!-- Inventory Details -->
                <form method="post" action="ViewInventory">
                    <p>2. Inventory</p>
                    <input type="submit" value="View">
                </form>
                <!-- Sales Record -->
                <%if (user.getUserType().equals("MANAGER")) {%>
                <form method="post" action="ViewSalesRecord">
                    <p>3. View Sales Record</p>
                    <input type="submit" value="View">
                </form>
                <%}%>
            </div>
        </div>
    </body>

</html>

