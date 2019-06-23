<%-- 
    Document   : login
    Created on : Jun 21, 2019, 2:05:52 PM
    Author     : Sekar Ayu Safitri
--%>
<%@include file="header.jsp" %>
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
        List<Region> regions = (List<Region>) session.getAttribute("regions");
        Region region = (Region) session.getAttribute("region");
        boolean isRegionNull = regions == null; //protection untuk memanggil jsp untuk redirect session
        if (isRegionNull) {
            response.sendRedirect("region"); //redirect
        }
    %>
    <!--end initialized-->
    <body>
        <h1>Halaman Region</h1>
        <table class="table">
            <tr>
                <th class="col-md-2">Id</th>
                <th class="col-md-2">Name</th>

                <th  class="col-md-2" align="center">
                    <button type="button" class="btn btn-info btn-sm" data-toggle="modal" data-target="#AddModal">Add Region</button>
                </th>
            </tr>
            <%
                if (!isRegionNull) { //menanggulangi data dari yang tidak ada 
                    for (Region r : regions) {%>
            <tr>
                <td><a href="${pageContext.request.contextPath}/delete/<%=r.getId()%>.html" class="btn btn-info btn-sm"  onclick="return confirm('Are you sure')">-</a></td>
                <td><%=r.getId()%></td>
                <td><%=r.getName()%></td>
                <td><button type="button" class="btn btn-info btn-sm" data-toggle="modal" data-target="#UpdateModal<%=r.getId()%>">Update</button></a>
                    <button type="button" class="btn btn-info btn-sm" data-toggle="modal" data-target="#DetailsModal<%=r.getId()%>">Details</button></a>
                </td>
            </tr> 

            <!-- Modal Detalis -->
            <div class="modal fade" id="DetailsModal<%=r.getId()%>" role="dialog">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">Region Details</h4>
                        </div>
                        <div class="modal-body">
                            <div class="form-group">
                                <label for="usr"> Product Id: <%=r.getId()%></label>
                            </div>
                            <div class="form-group">
                                <label for="usr">Name : <%=r.getName()%></label>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <input type="button" class="btn btn-default"  data-toggle="modal" data-target="#UpdateModal<%=r.getId()%>" value="Update">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Modal Update -->            
            <div class="modal fade" id="UpdateModal<%=r.getId()%>" role="dialog">
                <div class="modal-dialog">
                    <form id="pr" method="POST" action="region">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                <h4 class="modal-title">Update Region</h4>
                            </div>
                            <div class="modal-body">
                                <div class="form-group">
                                    <label for="usr">Id:</label>
                                    <input type="text" class="form-control" value="<%=r.getId()%>" name="id" id="usr">
                                </div>
                                <div class="form-group">
                                    <label for="usr">Name:</label>
                                    <input type="text" class="form-control" value="<%=r.getName()%>" name="name" id="usr">
                                </div>
                            </div>
                            <div class="modal-footer">
                                <input type="submit" class="btn btn-default" value="Save">
                                <input type="reset" class="btn btn-default" value="Reset">
                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
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
                                    <label for="usr">Id</label>
                                    <input type="text" name="regionId" value="<%=(region != null) ? region.getId() : ""%>" />
                                </div>
                                <div class="form-group">
                                    <label for="usr">Name:</label>
                                    <input type="text" name="regionName" value="<%=(region != null) ? region.getName() : ""%>" />
                                </div>
                            </div>
                            <div class="modal-footer">
                                <input type="submit" class="btn btn-default" value="Save">
                                <input type="reset" class="btn btn-default" value="Reset">
                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
            <% }
                }%>



        </table>
    </body>

    <%
        //destroy session
        session.removeAttribute("regions");
        session.removeAttribute("region");
    %>
</html>

<%@include file="footer.jsp" %>