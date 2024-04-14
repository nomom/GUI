<%@ page  import="controller.defaultPrompter" %>
<%@ page  import="model.Users"%>
<%@ page  import="model.Product"%>
<%@ page  import="controller.ViewInventory"%>
<%@ page  import="model.ProductService"%>
<%@ page  import="javax.persistence.EntityManager"%>
<%@ page  import="javax.persistence.PersistenceContext"%>
<%@page import="java.util.List"%>
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
        <div class="txthead" id="txthead">
            <h3 style="text-align: center;">shop</h3>
        </div>

        <div class="item_container" id="txtbody">
            <%if (productList != null) {%>
            <%for (Product product : productList) {%>
            <div class="item_box">
                <h4><%=product.getProductname()%></h4>
                <img src="<%=product.getProducturl()%>"><img/>
                <p>RM <%=product.getProductprice()%></p>
                <form method="post" action="validationSU">
                    <input type="submit" value="View">
                </form>
            </div>
            <%}%>
            <%}%>
        </div>
    </body>

    <%
        out.println(dP.footerReturn());
    %>
</html>