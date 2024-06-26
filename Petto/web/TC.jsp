<%@ page  import="controller.defaultPrompter" %>
<%@page import="model.Users" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Petto - T&C</title>
        <link rel="icon" type="image/x-icon" href="image/homepage/petto_logo.png">
        <link rel="stylesheet" href="css/t&c.css">
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
        <div id="middleline">
            <div id="upper_banner">
                <h3 style="text-align: center;">t&c</h3>
            </div>
        </div>    
        <div id="middle">
            <div id="lefttxt" class="txthead">
                The Details<br><br>
                <div class="txtbody">
                    This site is owned and <br> managed by petto. Please <br>read the following carefully<br> as it contains terms and <br>conditions that are part of <br>your agreement with petto in <br>the event that you proceed <br>with a purchase. The use of <br>this site is governed by the <br>terms and conditions set out <br>herein and by proceeding <br>with a purchase using this <br>site, you will be deemed to <br>accept these terms and <br>conditions. <br><br>Kindly check through your <br>shopping cart and ensure <br>that the item(s), size, <br>quantity, and color are <br>accurate prior to checking <br>out - as we will not be able <br>to change your orders once <br>it has been processed, in <br>order for us to send your <br>maohai order out as quick as <br>possible.
                </div>
            </div>  
            <div id="middletxt" class="txthead">
                Price<br><br>
                <div class="txtbody">
                    Prices <br>displayed <br>are in <br>Malaysia <br>Ringgit (RM) <br>and is <br>subject to <br>change without <br> notice.<br><br>
                </div>
                <div class="txthead">
                    Payment<br><br>
                    <div class="txtbody">
                        Payment for <br>orders can be <br>made by via cash, <br>credit & debit <br>cards from Visa <br>and Mastercard. <br>Goods will only <br>be dispatched <br>upon receipt of <br>full payment for <br>the cost of <br>purchase and <br>delivery charges.  
                    </div>
                </div>
            </div>
            <div id="righttxt" class="txthead">
                Product<br><br>
                <div class="txtbody">
                    Product colours may <br>differ mainly due to <br>colour calibration of <br>individual's computer, <br>and might appear brighter/<br>darker in <br>reality due to strong <br>studio lighting used.<br><br>
                    There might be a <br>difference of 0.1-3.0cm <br>between the actual <br>item(s) received as <br>compared to our given <br>measurements, due to<br> the way the <br>product has been <br>measured. This is not <br>considered as a defect.<br><br>
                    Custom made products - <br>especially handmade items <br>- are not 100% perfect. <br>It's the craftsmanship <br>that gives each product <br>it's unique character.
                    <div id="redtxt">All custom <br>made products are <br>strictly not returnable <br>or exchangeable, as it <br>was crafted especially <br>for your Petto.</div>
                    By purchasing a bespoke, <br>custom made product from <br>Petto, you'd agreed to <br>these terms & conditions.
                </div>
            </div>
        </div> 
        <br> 
        <div id="btmbox">
            <div>
                <p style="text-align: center;">Disclaimer</p>
                <p style="text-align: center;">Petto will make reasonable effort to ensure that shipping information, product price(s), product description(s) and other information on this site is correct. However, Petto cannot guarantee the accuracy of the information and makes no warranties or representations as to its accuracy.<br>
                    Petto will not be liable for any loss or damage of any kind arising from the use of this site, including without limitation, direct, indirect, incidental, punitive and consequential loss or damage.<br>                   ?
                    You agree to indemnify and hold Petto, its partners and employees, harmless from any loss, liability, claim or demand, costs or expenses of any kind, including attorney's fees and/or other fees or expenses, made by any third party due to or arising out of your use of this website and Petto products.<br>
                    Petto does not have control of and cannot guarantee that any content on third party links from this website will be safe from viruses, inaccurate information, or inflammatory material.<br>
                    Petto may withdraw items from sale and alter prices, products and or details of product specifications at its discretion and without notice. Petto reserves the right to change these terms & conditions at any time and without notice. All changes are effective upon posting on this website.</p>
            </div>
        </div>
        <hr id="ending_hr">
    </body>

    <%
        out.println(dP.footerReturn());
    %>

</html>