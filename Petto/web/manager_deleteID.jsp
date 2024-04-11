<%@ page  import="controller.defaultPrompter" %>
<!DOCTYPE html>

<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Petto - Signup</title>
        <link rel="icon" type="image/x-icon" href="image/homepage/petto_logo.png">
        <link rel="stylesheet" href="css/management.css">
        <link rel="stylesheet" href="css/default.css">
    </head>

    <%
        defaultPrompter dP = new defaultPrompter();
        out.println(dP.headerReturn());
    %>
        
    <body>
        <div class="head"><h1>Customer Details</h1></div>
        <div class="table">
            <div class="content">
                <table style="width: 100%;" >
                    <tr>
                        <th>User ID</th>
                        <th>Username</th>
                        <th>Email</th>
                        <th>Time of Orders</th>
                        <th>Accumalated Purchase (RM)</th>
                    </tr>
                    <tr>
                        <td>segs</td>
                        <td>segssegssegssegssegssegssegssegssegssegs</td>
                        <td>segs</td>
                        <td>segs</td>
                        <td>segs</td>
                    </tr>
                </table>
            </div>
        </div>
        <div class="head"><h1 style="text-align: center;">Delete UserID</h1></div>
        <div class="box">
            <p>which UserID you wish to delete?</p>
            <form action="#">
                <label for="UID">User ID : </label>
                <input type="text" id="UID" name="UID"><br><br>
                <label for="submit">if you wish to delete the following :</label> 
                <input type="submit" id="submit" name="submit" value="click here">
            </form>
        </div>
        <div class="head"><h1 style="text-align: center;">Add UserID</h1></div>
        <div class="box">
            <p>which UserID you wish to delete?</p>
            <form action="#">
                <label for="UID">User ID : </label>
                <input type="text" id="UID" name="UID"><br><br>
                <label for="attmod">Which attributes to modify? (1-4) : </label>
                <input type="text" id="attmod" name="attmod"><br><br>
                <label for="newval">New value given to? : </label>
                <input type="text" id="newval" name="newval"><br><br>
                <label for="submit">if you wish to add the following :</label> 
                <input type="submit" id="submit" name="submit" value="click here">
            </form>
        </div>
        
    </body>

</html>

