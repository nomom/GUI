<%@ page  import="controller.defaultPrompter" %>
<%@page import="model.Users" %>
<%@page import="java.util.List"%>
<!DOCTYPE html>

<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Petto - Admin Panel</title>
        <link rel="icon" type="image/x-icon" href="image/homepage/petto_logo.png">
        <link rel="stylesheet" href="css/management.css">
        <link rel="stylesheet" href="css/default.css">
    </head>

    <%
        defaultPrompter dP = new defaultPrompter();
        List<Users> userList = (List) session.getAttribute("userList");
        Users user = (Users) session.getAttribute("userDetails");
        String errorMsgDelete = (String) session.getAttribute("errorUserDelete");
        String errorAddUser = (String) session.getAttribute("errorAddUser");
        String errorUpdateUser = (String) session.getAttribute("errorUpdateUser");
        Boolean isLogin = (Boolean) session.getAttribute("isLogin");
        if (isLogin != null && isLogin) {
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

        <!<!-- Add Errors -->
        <%
            if (errorAddUser != null) {
        %>
        <h1><%=errorAddUser%></h1>
        <%}%>
        <%
            session.setAttribute("errorAddUser", null);
        %>

        <!<!-- Delete Errors -->
        <%
            if (errorMsgDelete != null) {
        %>
        <h1><%=errorMsgDelete%></h1>
        <%}%>
        <%
            session.setAttribute("errorUserDelete", null);
        %>

        <!<!-- Update Errors -->
        <%
            if (errorUpdateUser != null) {
        %>
        <h1><%=errorUpdateUser%></h1>
        <%}%>
        <%
            session.setAttribute("errorUpdateUser", null);
        %>


        <!-- Add User Here -->
        <div class="head"><h1 style="text-align: center;">Add User</h1></div>
        <div class="box">
            <p>Enter the details.</p>
            <form method="post" action="AddUser">
                <label for="username">username : </label>
                <input type="text" id="username" name="username" required><br><br>
                <label for="password">password : </label>
                <input type="text" id="password" name="password" required><br><br>
                <label for="roles">roles : </label>
                <select name="roles" id="roles" required>
                    <%if (user.getUserType().equals("MANAGER")) { %>
                    <option value="STAFF">Staff</option>
                    <% }%>
                    <option value="USER">User</option>
                </select><br/><br/>
                <label for="submit">if you wish to add the following :</label> 
                <input type="submit" id="submit" name="submit" value="click here">
            </form>
        </div>

        <!-- Update User Here -->
        <div class="head"><h1 style="text-align: center;">Update User</h1></div>
        <div class="box">
            <p>which username you wish to update?</p>
            <form method="post" action="UpdateUser">
                <label for="username"><b>username</b> : </label>
                <input type="text" id="username" name="username" required><br><br>
                <label for="password">new <b>password</b> : </label>
                <input type="text" id="password" name="password" required><br><br>
                <label for="roles">new <b>roles</b> : </label>
                <select name="roles" id="roles" required>
                    <%if (user.getUserType().equals("MANAGER")) { %>
                    <option value="STAFF">Staff</option>
                    <% }%>
                    <option value="USER">User</option>
                </select><br/><br/>
                <label for="submit">if you wish to delete the following :</label> 
                <input type="submit" id="submit" name="submit" value="click here">
            </form>
        </div>

        <!-- Delete User Here -->
        <div class="head"><h1 style="text-align: center;">Delete User</h1></div>
        <div class="box">
            <p>which username you wish to delete?</p>
            <form method="post" action="DeleteUser" >
                <label for="UID">User ID : </label>
                <input type="text" id="username" name="username" required><br><br>
                <label for="submit">if you wish to delete the following :</label> 
                <input type="submit" id="submit" name="submit" value="click here">
            </form>
        </div>

    </body>

</html>

