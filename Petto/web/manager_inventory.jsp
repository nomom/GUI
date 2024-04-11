<%@ page  import="controller.defaultPrompter" %>
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
        out.println(dP.headerReturn());
    %>
        
    <body>
        <div class="head"><h1>Inventory</h1></div>
        <div class="table">
            <table style="width: 100%">
                <tr>
                    <th>Item ID</th>
                    <th>Product Name</th>
                    <th>Status</th>
                    <th>Stock</th> 
                </tr>
                <tr>
                    <td>#PRO001</td>
                    <td>Tegridy Weed</td>
                    <td style="color: blue;">In stock</td>
                    <td>0</td>                  
                </tr>
            </table>
        </div>
        <div class="head"><h1 style="text-align: center;">Add Product</h1></div>
        <div class="box">
            <p>Please enter the following</p>
            <form action="#">
                <label for="PID">Product ID : </label>
                <input type="text" id="PID" name="PID"><br><br>
                <label for="Pname">Product Name : </label>
                <input type="text" id="Pname" name="Pname"><br><br>
                <label for="submit">if you wish to add the following :</label> 
                <input type="submit" id="submit" name="submit" value="click here">
            </form>
        </div>
        <div class="head"><h1 style="text-align: center;">Delete Product</h1></div>
        <div class="box">
            <p>Please enter the following</p>
            <form action="#">
                <label for="PID">Product ID : </label>
                <input type="text" id="PID" name="PID"><br><br>
                <label for="submit">if you wish to delete the following :</label> 
                <input type="submit" id="submit" name="submit" value="click here">
            </form>
        </div>
        <div class="head"><h1 style="text-align: center;">Add Product</h1></div>
        <div class="box">
            <p>Please enter the following</p>
            <form action="#">
                <label for="PID">Product ID : </label>
                <input type="text" id="PID" name="PID"><br><br>
                <label for="Pname">Product Quantity : </label>
                <input type="text" id="Pname" name="Pname"><br><br>
                <label for="submit">if you wish to delete the following :</label> 
                <input type="submit" id="submit" name="submit" value="click here">
            </form>
        </div>
    </body>

</html>

