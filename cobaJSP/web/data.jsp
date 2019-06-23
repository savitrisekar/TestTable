<%-- 
    Document   : data
    Created on : Jun 21, 2019, 10:37:54 AM
    Author     : Sekar Ayu Safitri
--%>

<%@page import="models.Region"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <%
        List<Region> regions = (List<Region>) session.getAttribute("regions");
    %>
    <body>
        <h1>List Region</h1>
        <table border="1">
            <tr>
                <th>ID</th>
                <th>Name</th>
            </tr>
            <% for (Region region : regions) {%>
                <tr>
                    <td><%=region.getId()%></td>
                    <td><%=region.getName()%></td>
                </tr> 
                <% } %>
        </table>
    </body>
</html>
