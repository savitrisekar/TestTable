<%-- 
    Document   : login
    Created on : Jun 21, 2019, 2:05:52 PM
    Author     : Sekar Ayu Safitri
--%>

<%@page import="models.Country"%>
<%@include file="header.jsp" %>
<%@page import="java.util.List"%>
<%@page import="models.Region"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <!--CDN BOOTSTRAP-->        
        <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
    </head>
    <!--initialized-->
    <%
        List<Region> regions = (List<Region>) session.getAttribute("regions");
        Region region = (Region) session.getAttribute("region");
        boolean isRegionNull = regions == null; //protection untuk memanggil jsp untuk redirect session
        if (isRegionNull) {
            response.sendRedirect("region"); //redirect
        }
    %>
    <!--end initialized-->
    <body>
        <div class="container">
            <div>
                <h2>Halaman Region</h2>
                <table class="table table-bordered">
                    <tr>
                        <th class="col-md-3">No</th>
                        <!--col-md-3 mengatur grid pada layar monitor komputer ukuran sedang. Bootstrap membagi halaman web menjadi 12-->
                        <th class="col-md-3">Id</th> 
                        <th class="col-md-3">Name</th>

                        <th  class="col-md-3" align="center">
                            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#AddModal">Add Region</button>
                        </th>
                    </tr>
                    <%
                        int i = 1;
                        if (!isRegionNull) { //menanggulangi data dari yang tidak ada 
                            for (Region r : regions) {%>
                    <tr>
                        <td><%=i++%></td>
                        <td><%=r.getId()%></td>
                        <td><%=r.getName()%></td>
                        <td><button type="button" class="btn btn-primary" data-toggle="modal" data-target="#UpdateModal<%=r.getId()%>">Update</button>
                            <% if (r.getCountryList().isEmpty()) {%>
                            <a href="region?action=delete&id=<%=r.getId()%>" class="btn btn-danger" onclick="return confirm('Are you sure to delete this data ?')">Hapus</a>
                        </td>
                        <%}%> 
                    </tr> 

                    <!-- Modal Update -->            
                    <div class="modal fade" id="UpdateModal<%=r.getId()%>">
                        <div class="modal-dialog">
                            <form method="POST" action="region">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                        <h4 class="modal-title">Update Region</h4>
                                    </div>
                                    <div class="modal-body">
                                        <div class="form-group">
                                            <label>Id:</label>
                                            <input type="text" class="form-control" value="<%=r.getId()%>" name="regionId" readonly>
                                        </div>
                                        <div class="form-group">
                                            <label>Name:</label>
                                            <input type="text" class="form-control" value="<%=r.getName()%>" name="regionName">
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <input type="submit" class="btn btn-primary">
                                        <!--<input type="reset" class="btn btn-default" value="Reset">-->
                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>

                    <!-- Modal Add Region --> 
                    <div class="modal fade" id="AddModal" role="dialog">
                        <div class="modal-dialog">
                            <form method="POST" action="region">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                        <h4 class="modal-title">Add Region</h4>
                                    </div>
                                    <div class="modal-body">
                                        <div class="form-group">
                                            <label>Id</label>
                                            <input type="text" name="regionId" value="<%=(region != null) ? region.getId() : ""%>">
                                        </div>
                                        <div class="form-group">
                                            <label>Name:</label>
                                            <input type="text" name="regionName" value="<%=(region != null) ? region.getName() : ""%>">
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <input type="submit" class="btn btn-primary">
                                        <input type="reset" class="btn btn-primary">
                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                    <% }
                        }%>
                </table>
            </div>
        </div>
    </body>

    <%
        //destroy session
        session.removeAttribute("regions");
        session.removeAttribute("region");
    %>
</html>

<%@include file="footer.jsp" %>