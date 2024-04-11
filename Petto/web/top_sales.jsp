<%@ page  import="controller.defaultPrompter" %>
<%@ page  import="model.Users"%>
<!DOCTYPE html>

<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Petto - Signup</title>
        <link rel="icon" type="image/x-icon" href="image/homepage/petto_logo.png">
        <link rel="stylesheet" href="css/inventory.css">
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
        <div class="head"><h1>Top 10 Sales</h1></div>
        <div class="table">
            <table style="width: 100%">
                <tr>
                    <th>No</th>
                    <th>Item ID</th>
                    <th>Product Name</th>
                    <th>Stock</th> 
                </tr>
                <tr>
                    <td>1</td>
                    <td>#PRO001</td>
                    <td>Tegridy Weed</td>
                    <td>0</td>                  
                </tr>
            </table>
        </div>
        
    </body>

</html>

