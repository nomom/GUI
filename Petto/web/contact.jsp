<%-- 
    Document   : contact
    Created on : Apr 11, 2024, 3:06:58 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page  import="model.userDA"%>
<%@ page  import="model.Users"%>
<%@ page  import="controller.defaultPrompter" %>
<!DOCTYPE html>

<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Petto - Contact Us</title>
        <link rel="icon" type="image/x-icon" href="image/homepage/petto_logo.png">
        <link rel="stylesheet" href="css/contact.css">
        <link rel="stylesheet" href="css/default.css">
    </head>

    <%
        defaultPrompter dP = new defaultPrompter();
        out.println(dP.headerReturn());
        
    %>
    


    <body>
        <div id="contact_body_main">
            
                <h1>contact us</h1>
                <form method="post" action= "">
                    <label>email</label><br/>
                    <input name="email" type="text"><br/>
                    <label>enquiry</label><br/>
                    <input name="enquiry" type="tet" size="40"><br/>
                    <input type="submit" value="Submit">
                </form>
               
        </div>
        
         <p id="contact_body_2">or  email us at  <a href="mailto:helppetto@gmail.com">helppetto@gmail.com</p>
         
        <div >
            
            <a href= https://www.instagram.com/>
          <img style="width: 50px; height: 50px; margin-left:60px;margin-top:10px"  src= "image/contact/insta.png" alt="Insta"></a>
          
           <a href= https://www.messenger.com/>
           <img style="width:50px; height: 50px;"  src= "image/contact/messenger.png" alt="Messsager"></a>
           
           <a href= https://www.whatsapp.com/>
          <img style="width: 50px; height: 50px;"  src= "image/contact/whatsapp.png" alt="WhatsApp"></a>

          
        </div>
        
        
        <div id="contact_pic">
            <img style="width: 150px; height: 150px;"  src= "image/homepage/cute_cat.png" alt="Cute Cat"></a>
        </div>
        <img>
    </body>


</html>


