<%@ page  import="controller.defaultPrompter" %>
<!DOCTYPE html>

<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Petto - Signup</title>
        <link rel="icon" type="image/x-icon" href="image/homepage/petto_logo.png">
        <link rel="stylesheet" href="css/sales_record.css">
        <link rel="stylesheet" href="css/default.css">
    </head>

    <%
        defaultPrompter dP = new defaultPrompter();
        out.println(dP.headerReturn());
    %>
        
    <body>
        <div class="head"><h1>Sales Record</h1></div>
        <div class="dropdown">
            <form action="#">
                <label for="sort">Sort by : </label>
                <select name="sort" id="sort">
                    <option value="day">Day</option>
                    <option value="day">Month</option>
                    <option value="day">Year</option>
                </select>
            </form>
        </div>
        <div class="table">
            <table style="width: 100%">
                <tr>
                    <th>Tuesday</th>
                </tr>
                <tr>
                    <th>Product ID</th>
                    <th>Product</th>
                    <th>Quantity</th> 
                </tr>
                <tr>
                    <td>#PRO001</td>
                    <td>Tegridy Weed</td>
                    <td>1</td>                                    
                </tr>
            </table>
        </div>
        <div class="gen">
            <a href="top_sales.html"><h4 style="color: blue; text-align: center;">Generate</h4></a>
        </div>
        
    </body>

</html>

