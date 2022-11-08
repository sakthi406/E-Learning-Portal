<%-- 
    Document   : addModules
    Created on : 24-Jun-2022, 9:18:47 pm
    Author     : praveen vuddagiri
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,400;0,700;1,300&display=swap" rel="stylesheet"> 
        <link href="css/addFaculty.css" rel="stylesheet">
        <title>Add Module</title>
    </head>
    <body style="font-family: 'Poppins', sans-serif;">
        <form action="addModules" method="post" enctype='multipart/form-data'>

            <%
                int nom = Integer.parseInt(request.getParameter("nom"));
                int c_id = Integer.parseInt(request.getParameter("c_id"));
            %>
            <center><h4 style="margin-top: 20px;">Total Number of modules are :</h4>
                <input type="text" name="nom" class="form-control" value="<%=nom%>" style="width: 100px" readonly></center>
                <%

                    for (int i = 0; i < nom; i++) {

                        String modId = "modId" + (i + 1);
                        String cId = "cId" + (i + 1);
                        String modTit = "modTit" + (i + 1);
                        String modLink = "modLink" + (i + 1);
                        String modNotes = "modNotes" + (i + 1);


                %>
            <div class="wrapper rounded bg-white">

                <div class="h3">Enter Module - <%=(i + 1)%></div>

                <div class="form">
                    <div class="row">
                        <div class="col-md-6 mt-md-0 mt-3">
                            <label>Module ID</label>
                            <input type="text" class="form-control" name="<%= modId%>" value="<%= (i + 1)%>" readonly>
                        </div>
                        <div class="col-md-6 mt-md-0 mt-3">
                            <label>Course ID</label>
                            <input type="text" name="<%= cId%>" class="form-control" value="<%= c_id%>" readonly>
                        </div>

                    </div>

                    <div class="col-md-12 mt-md-0 mt-3">
                        <label>Module Name</label>
                        <input type="text" name="<%= modTit%>" class="form-control" required>
                    </div>
                    <div class="col-md-12 mt-md-0 mt-3">
                        <label>Video Link</label>
                        <input type="text" name="<%= modLink%>" class="form-control" required >
                    </div>


                    <div class="col-md-12 mt-md-0 mt-3">
                        <label>Module Notes</label>
                        <input type="file" name="<%= modNotes%>" class="form-control" required>
                    </div>
                </div>
            </div>
            <%
                }
            %>

            <center> <input style="margin-bottom: 30px;" type="submit" value="Submit" class="btn btn-danger mt-3"></center>
        </form>
    </body>
</html>