<%@ page  import="controller.defaultPrompter" %>
<%@ page import = "controller.addProduct"%>
<%@page import="model.Users" %>
<%@page import="model.Product" %>
<%@page import="java.util.List"%>
<!DOCTYPE html>

<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Petto - Admin Panel</title>
        <link rel="icon" type="image/x-icon" href="image/homepage/petto_logo.png">
        <link rel="stylesheet" href="css/inventory.css">
        <link rel="stylesheet" href="css/default.css">
    </head>

    <%
        defaultPrompter dP = new defaultPrompter();

        List<Product> productList = (List) session.getAttribute("productList");
        String errorDeleteProduct = (String) session.getAttribute("errorDeleteProduct");
        String errorUpdateProduct = (String) session.getAttribute("errorUpdateProduct");

        Boolean isLogin = (Boolean) session.getAttribute("isLogin");
        if (isLogin != null && isLogin) {
            Users user = (Users) session.getAttribute("userDetails");
            out.println(dP.headerReturn(user));
        } else {
            out.println(dP.headerReturn());
        }

    %>

    <body>
        <div class="head"><h1>Inventory</h1></div>
        <div class="table">
            <table style="width: 100%">
                <tr>
                    <th>Item ID</th>
                    <th>Product Name</th>
                    <th>Price</th>
                    <th>Quantity</th> 
                    <th>Amount Sold</th> 
                </tr>
                <%if (productList != null) {%>
                <%for (Product product : productList) {%>
                <tr>
                    <td><%=product.getProductid()%></td>
                    <td><%=product.getProductname()%></td>
                    <td><%=product.getProductprice()%></td>
                    <td><%=product.getProductqty()%></td>
                    <td><%=product.getAmountsold()%></td>
                </tr>
                <%}%>
                <%}%>
            </table>
        </div>

        <!<!-- Delete Errors -->
        <%
            if (errorDeleteProduct != null) {
        %>
        <h1><%=errorDeleteProduct%></h1>
        <%}%>
        <%
            session.setAttribute("errorDeleteProduct", null);
        %>

        <!<!-- Update Errors -->
        <%
            if (errorUpdateProduct != null) {
        %>
        <h1><%=errorUpdateProduct%></h1>
        <%}%>
        <%
            session.setAttribute("errorUpdateProduct", null);
        %>

        <!-- Add Product -->
        <div class="head"><h1 style="text-align: center;">Add Product</h1></div>
        <div class="box">
            <p>Please enter the following</p>
            <form method="post" action="addProduct">
                <label for="PID">Product ID:</label>
                <input type="text" id="PID" name="PID" required><br><br>
                <label for="Pname">Product Name:</label>
                <input type="text" id="Pname" name="Pname" required><br><br>
                <label for="Pdesc">Product Description:</label>
                <input type="text" id="Pdesc" name="Pdesc"required><br><br>
                <label for="Pprice">Product Price:</label>
                <input type="text" id="Pprice" name="Pprice" required><br><br>
                <label for="Pqty">Product Quantity:</label>
                <input type="text" id="Pqty" name="Pqty" required><br><br>
                <label for="Purl">Product URL:</label>
                <input type="text" id="Purl" name="Purl" required><br><br>
                <label for="amountsold">Amount Sold:</label>
                <input type="text" id="amountsold" name="amountsold" required><br><br>
                <input type="submit" id="submit" name="submit" value="Add Product">
            </form>
        </div>

        <!-- Restock Product -->
        <div class="head"><h1 style="text-align: center;">Restock Product</h1></div>
        <div class="box">
            <p>Please enter the following</p>
            <form method="get" action="addProduct">
                <label for="PID">Product ID : </label>
                <input type="text" id="PID" name="PID"><br><br>
                <label for="Pqty">Product Quantity:</label>
                <input type="text" id="Pqty" name="Pqty" ><br><br>
                <input type="submit" id="submit" name="submit" value="click here">
            </form>
        </div>


        <!-- Delete Product -->
        <div class="head"><h1 style="text-align: center;">Delete Product</h1></div>
        <div class="box">
            <p>Please enter the following</p>
            <form method="post" action="DeleteProduct">
                <label for="PID">Product ID : </label>
                <input type="text" id="PID" name="PID"><br><br>
                <label for="submit">if you wish to delete the following :</label> 
                <input type="submit" id="submit" name="submit" value="click here">
            </form>
        </div>



        <!-- Update Product -->
        <div class="head"><h1 style="text-align: center;">Update Product</h1></div>
        <div class="box">
            <p>Please enter the following</p>
            <form method="post" action="UpdateProduct">
                <label for="PID">Product ID : </label>
                <input type="text" id="PID" name="PID"><br><br>
                <p>Details to changed</p>
                <label for="Pname">Product Name:</label>
                <input type="text" id="Pname" name="Pname" ><br><br>
                <label for="Pdesc">Product Description:</label>
                <input type="text" id="Pdesc" name="Pdesc"><br><br>
                <label for="Pprice">Product Price:</label>
                <input type="text" id="Pprice" name="Pprice" ><br><br>
                <label for="Pqty">Product Quantity:</label>
                <input type="text" id="Pqty" name="Pqty" ><br><br>
                <label for="Purl">Product URL:</label>
                <input type="text" id="Purl" name="Purl" ><br><br>
                <label for="amountsold">Amount Sold:</label>
                <input type="text" id="amountsold" name="amountsold" ><br><br>
                <label for="submit">if you wish to update the following :</label> 
                <input type="submit" id="submit" name="submit" value="click here">
            </form>
        </div>
    </body>

</html>

