<%@ page  import="controller.defaultPrompter" %>
<%@ page  import="model.Users"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Petto - shipping</title>
        <link rel="icon" type="image/x-icon" href="image/homepage/petto_logo.png">
        <link rel="stylesheet" href="css/shipping.css">
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
        <div id="toptext" class="txtbody"><!--top text -->
            <p style="text-align: center;" >shipping policy</p>
        </div>
        <div id="head" class="txthead">Malaysia's Shipping Policy</div><!--text before paragraph-->
        <div id="txt" class="txtbody"><!--wall of text-->
            We ship Malaysia-wide!
            ?<br><br>
            We offer a flat rate postage of RM 10. Enjoy free shipping Malaysia-wide when your order reaches RM 150 & above! Complimentary in-store collection is also available upon check out.
?           ?<br><br>
            After placing your order, please allow our team 1 - 3 working days to pack and prep your parcel for dispatch. Your tracking number will be sent to you via email after your item has been sent out. You will receive your item in 2-3 working days!
??          <br><br>
            If you have an oversized parcel, Petto may dispatch it to you via Grab, depending on your location. Oversized parcels sent via mail will take around 7 working days to arrive.
?           ?<br><br>
            All reasonable efforts to deliver your order will be made by Petto. It is the customer's responsibility to ensure their parcel is received at the delivery address provided during checkout. Petto will not be responsible if the parcel is received by an unauthorised person.
??          <br><br>
            Additional charges for re-delivery will be applicable after unsuccessful delivery attempts, should the parcel be returned to us. We are not responsible for parcels lost or damaged in the process of delivery due to the courier's negligence, and no refunds will be provided.
        </div>
        <div id="head" class="txthead">Return Policy</div><!--2nd section of texts-->
        <div id="txt" class="txtbody">
            In cases where your selected Petto products are out of stock after we'd received your payment, we will provide a full refund to your specified bank account. You will be notified via email to provide us with your details for a smooth refund process.
?            <br><br>
            We do not provide refunds for missing parcels due to courier's negligence - however we will try our best in assisting you to trace your parcel.
        </div>

    </body>
    
    <%
        out.println(dP.footerReturn());
    %>
</html>