<%-- 
    Document   : product_individual
    Created on : Apr 13, 2024, 8:05:41 PM
    Author     : User
--%>

<%@ page  import="controller.defaultPrompter" %>
<%@ page  import="model.Users"%>
<%@ page  import="model.Product"%>
<%@ page  import="model.Cart"%>
<%@page import="javax.servlet.http.HttpSession"%>
<%@page import="java.util.List"%>
<jsp:useBean id="productIndividual" scope="session" class="model.Product" />
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Petto - product showcase </title>
        <link rel="icon" type="image/x-icon" href="image/homepage/petto_logo.png">
        <link rel="stylesheet" href="css/shop_info.css">
        <link rel="stylesheet" href="css/default.css">
    </head>


    <%
        defaultPrompter dP = new defaultPrompter();
        List<Product> productList = (List) session.getAttribute("productList");
        Boolean isLogin = (Boolean) session.getAttribute("isLogin");
        Cart cart = (Cart) session.getAttribute("cartIndividual");

        //show error msg
        String addCartError = (String) session.getAttribute("addCartError");
        String deleteCartError = (String) session.getAttribute("deleteCartError");

        //check got login or not
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
                <img src ="${productIndividual.producturl}"><img/>
            </div>
            <div class="product_details">
                <h1 id="product_name">${productIndividual.productname}</h1>
                <!-- Add Errors -->
                <%  if (addCartError != null) {
                %>
                <h1><%=addCartError%></h1>
                <%}%>
                <%
                    session.setAttribute("addCartError", null);
                %>

                <!<!-- Delete Errors -->
                <%  if (deleteCartError != null) {
                %>
                <h1><%=deleteCartError%></h1>
                <%}%>
                <%
                    session.setAttribute("deleteCartError", null);
                %>
                <p id="product_price">RM ${productIndividual.productprice}</p>
                <form method="post" action="AddCart">
                    <input id="addbutton" type="submit" value="add to cart" style="padding: 12px; width: 300px;text-align: center"/>
                </form>
                <%if (cart.getProductquantity() != 0) {%>
                <form method="post" action="DeleteCart">
                    <input id="removebutton" type="submit" value="remove cart" style="padding: 12px; width: 300px;text-align: center"/>

                </form>
                <%}%>
                <div>
                    <p id="amount" name="amount">Current Cart: <%=cart.getProductquantity()%></p>
                </div>
                <div>
                    <p id="amount" name="amount">Current Stock: ${productIndividual.getProductqty()}</p>
                </div>
                <div class="product_descriptions">
                    <p>${productIndividual.productdesc}</p>     
                </div>

            </div> 
        </div>

        <h3 style="text-align: center;">petto favourites</h3>
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
                        <input type="submit" value="View">
                    </form>
                </div>
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