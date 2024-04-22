<%@ page  import="controller.defaultPrompter" %>
<%@ page  import="model.Users"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Petto - Size Guide</title>
        <link rel="icon" type="image/x-icon" href="image/homepage/petto_logo.png">
        <link rel="stylesheet" href="css/sizeguide.css">
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
        <!--first section = COLLAR-->
        <div id="head" class="txthead">size guide</div>
        <div id="bodyhead" class="txthead">
            Collar
        </div>
        <div id="bodytxt" class="txtbody">
            <br>Every Petto is unique! Please follow our guide to ensure a good fit for your Petto. All measurements vary from one product to another - please refer to the measurements found on every individual product page.
         </div>   
        <div id="collar" class="txthead">
            <div id="collarimg1">
                <img src="image/homepage/sizeguideimg/1.png">
                <div class="txtbody">
                    <p style="width: 50%;">Measure around your Petto?s neck using a cloth measuring tape, positioned where its collar sits.</p> 
                </div>
            </div>
            <div id="collarimg2">
                <img src="image/homepage/sizeguideimg/2.png">
                <div class="txtbody">
                    <p style="width: 50%;">Add 2 fingers between the measuring tape and your Petto?s neck. This is the size you should purchase.</p>
                </div>
            </div>
        </div>     
        <!--second section = HARNESS -->
        <div id="bodyhead" class="txthead">
            Harness
        </div>
        <div id="bodytxt" class="txtbody">
            <br>It's important to get your Petto?s body girth, body length & neck girth right for a comfortable and unrestrained fit.
        </div> 
        <div id="collar" class="txthead">
            <div id="collarimg1">
                <img src="image/homepage/sizeguideimg/3.png">
                <div class="txtbody">
                    <div class="justtext">Body Girth :</div>
                    <p style="width: 50%;">Measure the widest part of your Petto?s ribcage.</p> 
                </div>
            </div>
            <div id="collarimg2">
                <img src="image/homepage/sizeguideimg/4.png">
                <div class="txtbody">
                    <div class="justtext">Body Length :</div> 
                    <p style="width: 50%;">Measure from the base of your Petto?s neck to the base of its tail.</p>
                </div>
            </div>
            <div id="collarimg3">
                <img src="image/homepage/sizeguideimg/5.png">
                <div class="txtbody">
                    <div class="justtext">Neck Girth :</div> 
                    <p style="width: 50%;">Measure the widest part of your Petto?s neck</p>
                </div>
            </div>
        </div>  
        <!--third section = PET BEDS / NESTS -->
        <div id="bodyhead" class="txthead">
            Pet Beds / Nest
        </div> 
        <div id="bodytxt" class="txtbody">
            <br>Match your Petto?s measurements with our pet bed measurements on each individual product pages. The guide below is meant to provide a general idea - remember your Petto will not merely stand or sit in its bed / nest - it will curl or elongate its body as well! Pick the correct size you think is coziest for your Petto. 
        </div> 
        <div id="collar" class="txthead">
            <div id="collarimg1">
                <img src="image/homepage/sizeguideimg/6.png">
                <div class="txtbody">
                    <p style="width: 50%;">Account for your Petto?s  height, and body length.</p> 
                </div>
            </div>
            <div id="collarimg2">
                <img src="image/homepage/sizeguideimg/7.png">
                <div class="txtbody"> 
                    <p style="width: 50%;">Account for your Petto?s diameter as it curls up.</p>
                </div>
            </div>
            <div id="collarimg3">
                <img src="image/homepage/sizeguideimg/8.png">
                <div class="txtbody"> 
                    <p style="width: 50%;">A happy Petto!</p>
                </div>
            </div>
        </div>  

    </body>
    
    <%
        out.println(dP.footerReturn());
    %>

</html>