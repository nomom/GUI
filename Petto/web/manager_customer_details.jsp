<%@ page  import="controller.defaultPrompter" %>
<%@page import="model.Users" %>

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

        Boolean isLogin = (Boolean) session.getAttribute("isLogin");
        if (isLogin != null && isLogin) {
            Users user = (Users) session.getAttribute("userDetails");
            out.println(dP.headerReturn(user));
        } else {
            out.println(dP.headerReturn());
        }

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
        <a href="manager_deleteID.html"><div class="underline">update</div></a>
    </body>

</html>

