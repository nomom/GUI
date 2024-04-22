<%@ page  import="controller.defaultPrompter" %>
<%@ page  import="model.Users"%>
<%@ page  import="model.Product"%>
<%@ page  import="controller.ViewInventory"%>
<%@ page  import="model.ProductService"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Petto - shop</title>
        <link rel="icon" type="image/x-icon" href="image/homepage/petto_logo.png">
        <link rel="stylesheet" href="css/shop.css">
        <link rel="stylesheet" href="css/default.css">
    </head>


    <%
        defaultPrompter dP = new defaultPrompter();
        List<Product> productList = (List) session.getAttribute("productList");
        String shopLoginError = (String) session.getAttribute("shopLoginError");
        Boolean isLogin = (Boolean) session.getAttribute("isLogin");
        if (isLogin != null && isLogin) {
            Users user = (Users) session.getAttribute("userDetails");
            out.println(dP.headerReturn(user));
        } else {
            out.println(dP.headerReturn());
        }

    %>

    <!<!-- Add Errors -->
    <%if (shopLoginError != null) {
    %>
    <h1><%=shopLoginError%></h1>
    <%}%>
    <%
        session.setAttribute("shopLoginError", null);
    %>


    <body>
        <div class="txthead" id="txthead">
            <h3 style="text-align: center;">shop</h3>
        </div>

        <div class="item_container" id="txtbody">
            <%if (productList != null) {%>
            <%for (Product product : productList) {%>
            <div class="item_box">
                <div><h4><%=product.getProductname()%></h4></div>
                <div id="image-container">
                    <img src="<%=product.getProducturl()%>"><img/>
                </div>
                <div><p>RM <%=product.getProductprice()%></p></div>
                <div>
                    <form method="post" action="ViewIndividualProduct">
                        <input type="hidden" value="<%=product.getProductid()%>" id="productid" name="productid">
                        <!-- <input type="hidden" value="<%=product.getProductname()%>" id="productname" name="productname">
                        <input type="hidden" value="<%=product.getProductdesc()%>" id="productdesc" name="productdesc">
                        <input type="hidden" value="<%=product.getProductprice()%>" id="productprice" name="productprice">
                        <input type="hidden" value="<%=product.getProductqty()%>" id="productqty" name="productqty">
                        <input type="hidden" value="<%=product.getProducturl()%>" id="producturl" name="producturl">
                        <input type="hidden" value="<%=product.getAmountsold()%>" id="amountsold" name="amountsold"> -->
                        <input type="submit" value="View">
                    </form>
                </div>
            </div>
            <%}%>
            <%}%>
        </div>
    </body>

    <%
        out.println(dP.footerReturn());
    %>
</html>