<%-- 
    Document   : product_individual
    Created on : Apr 13, 2024, 8:05:41 PM
    Author     : User
--%>

<%@ page  import="controller.defaultPrompter" %>
<%@ page  import="model.Users"%>
<%@ page  import="model.Product"%>
<%@page import="java.util.List"%>
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
        String productname = (String) session.getAttribute("productname");
        String productprice = (String) session.getAttribute("productprice");
        String producturl = (String) session.getAttribute("producturl");
        String productdesc = (String) session.getAttribute("productdesc");
        List<Product> productList = (List) session.getAttribute("productList");

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
                <img src ="<%=producturl%>"><img/>
            </div>
            <div class="product_details">
                <h1 id="product_name"><%=productname%></h1>
                <p id="product_price">RM <%=productprice%></p>
                <form method="post" action="" id="AddCart">
                    <input type="submit" value="add to cart" style="padding: 12px; width: 300px;text-align: center"/>
                </form>
                <div class="product_descriptions">
                    <p><%=productdesc%></p>     
                </div>
            </div> 
        </div>

        <h3 style="text-align: center;">petto favourites</h3>
        <div class="item_container" id="txtbody"> 
            <%if (productList != null) {%>
            <%for (Product product : productList) {%>
            <div class="item_box">
                <h4><%=product.getProductname()%></h4>
                <img src="<%=product.getProducturl()%>"><img/>
                <p>RM <%=product.getProductprice()%></p>
                <form method="post" action="ViewIndividualProduct">
                    <input type="hidden" value="<%=product.getProductname()%>" id="productname" name="productname">
                    <input type="hidden" value="<%=product.getProducturl()%>" id="producturl" name="producturl">
                    <input type="hidden" value="<%=product.getProductprice()%>" id="productprice" name="productprice">
                    <input type="hidden" value="<%=product.getProductdesc()%>" id="productdesc" name="productdesc">
                    <input type="submit" value="View">
                </form>
            </div>
            <%}%>
            <%}%>

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