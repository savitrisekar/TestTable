<%-- 
    Document   : region
    Created on : Jun 25, 2019, 10:05:15 AM
    Author     : Sekar Ayu Safitri
--%>

<%@page import="models.Region"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Region</title>
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/dt/dt-1.10.18/datatables.min.css"/>
        <script type="text/javascript" src="https://cdn.datatables.net/v/dt/dt-1.10.18/datatables.min.js"></script>
        <script>
            $(document).ready(function () {
                $('#t_table').DataTable();
            });
        </script>
        <script>
            $(document).ready(function () {
                $("#coba").click(function () {
                    alert('coba coba');
                });
            });
        </script>
        <script>
            $(document).ready(function () {
                $('[id="Details"]').click(function () {
                    var id = $(this).attr('value');
                    $.get("region?action=update&id=" + id, function (HASIL, status) {
                        $("#detail").html(HASIL);
                        $("#SaveRegion").modal('show');
                    });
                });
            });
        </script>
        <script>
            $(document).ready(function () {
                $("#btnInsert").click(function () {
                    $.get("region?action=update", function (HASIL, status) {
                        $("#detail").html(HASIL);
                        $("#SaveRegion").modal('show');
                    });
                });
            });
        </script>
    </head>
    <body>
        <!--initialized-->
        <%
            List<Region> regions = (List<Region>) session.getAttribute("regions");
            Region region = (Region) session.getAttribute("region");
            boolean isRegionNull = regions == null; //protection untuk memanggil jsp untuk redirect session
            if (isRegionNull) {
                response.sendRedirect("region"); //redirect
            }
            //        String result = (String) request.getAttribute("id");
        %>
        <!--end initialized-->


        <!--Show Data-->
        <div class="container">
            <h2 id="coba">Halaman Region</h2>
            <br>
            <button type="button" id="btnInsert" class="btn btn-lg btn-success" data-toggle="modal" data-target="#SaveRegion">Add Data</button>
            <br><br>
            <table class="table table-striped table-bordered table-hover" id="t_table">
                <thead>
                    <tr>
                        <th>No</th>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        int i = 1;
                        if (!isRegionNull) {
                            for (Region region1 : regions) {
                    %>
                    <tr>
                        <td><%=i++%></td>
                        <td><%=region1.getId()%></td>
                        <td><%=region1.getName()%></td>
                        <td><a id="Details" value="<%=region1.getId()%>" class="btn btn-primary" data-toggle="modal">Edit</a>
                            <% if (region1.getCountryList().isEmpty()) {%>
                            <a href="region?action=delete&id=<%=region1.getId()%>" class="btn btn-danger" onclick="return confirm('Are you sure to delete this data ?')">Hapus</a>
                        </td>
                        <%}%>
                    </tr>
                    <%  }
                        }
                    %>
                </tbody>
            </table>
        </div>
        <!--End of Show Data-->

        <!--Modal save-->
        <div id="SaveRegion" class="modal fade">
            <div class="modal-dialog">
                <!-- Modal content-->
                <form method="POST" action="RegionServlet">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title">Save Data</h4>
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                        </div>
                        <div class="modal-body">
                            <div id="detail">

                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="submit" class="btn btn-success">Save</button>
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
        <!--End of Modal Save-->
    </body>
    <%
        session.removeAttribute("regions");
        session.removeAttribute("region");
    %>
</html>
