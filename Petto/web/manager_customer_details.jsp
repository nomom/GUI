<%@ page  import="controller.defaultPrompter" %>
<%@page import="model.Users" %>
<%@page import="java.util.List"%>


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
        Users user = (Users) session.getAttribute("userDetails");
        Boolean isLogin = (Boolean) session.getAttribute("isLogin");
        if (isLogin != null && isLogin) {
            out.println(dP.headerReturn(user));
        } else {
            out.println(dP.headerReturn());
        }

        List<Users> userList = (List) session.getAttribute("userList");
    %>

    <body>
        <div class="head"><h1>Customer Details</h1></div>
        <div class="table">
            <div class="content">
                <table style="width: 100%;" >
                    <tr>
                        <th>Username</th>
                        <th>Password</th>
                        <th>Roles</th>
                    </tr>
                    <%if (userList != null) {%>
                    <%for (Users users : userList) {%>
                    <tr>
                        <td><%=users.getUserName()%></td>
                        <td><%=users.getPswd()%></td>
                        <td><%=users.getUserType()%></td>
                    </tr>
                    <%}%>
                    <%}%>
                </table>
            </div>
        </div>
        <div class="underline">
            <form method="post" action="ViewUser" >
                <input type="submit" value="List Users">
            </form>
        </div>
        <div class="underline">
            <form method="get" action="ViewUser" >
                <input type="submit" value="Manage User">
            </form>
        </div>
    </body>

</html>



