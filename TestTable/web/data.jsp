<%-- 
    Document   : login
    Created on : Jun 21, 2019, 2:05:52 PM
    Author     : Sekar Ayu Safitri
--%>

<%@page import="java.util.List"%>
<%@page import="models.Region"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <!--initialized-->
    <%
        Region region = (Region) session.getAttribute("region");
        boolean isRegionNull = session.getAttribute("region") == null; //protection untuk memanggil jsp untuk redirect session
%>
    <!--end initialized-->
    <body>
        <div class="form-group">
            <label for="regionId">ID:</label>
            <input type="text" name="regionId" class="form-control" value="<%=(isRegionNull) ? "" : region.getId()%>" />
        </div>
        <div class="form-group">
            <label for="regionName">Name:</label>
            <input type="text" name="regionName" class="form-control" value="<%=(isRegionNull) ? "" : region.getName()%>" />
        </div>
    </body>
    <%
        //destroy session
        session.removeAttribute("region");
    %>
</html>

