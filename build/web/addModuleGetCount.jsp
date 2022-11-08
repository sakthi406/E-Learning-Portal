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
        <title>Get Module Count</title>
    </head>
    <body style="font-family: 'Poppins', sans-serif;">
        <form method="post" action="addModules.jsp">
            <div class="wrapper rounded bg-white">

                <div class="h3">Enter Number of Modules </div>

                <div class="form">
                    <div class="col-md-6 mt-md-0 mt-3">
                        <label>Number of Modules</label>
                        <input type="text"  class="form-control" name="nom" required>
                    </div>
                    <%
                        String cid = request.getParameter("cid");
                    %>
                    <div class="col-md-6 mt-md-0 mt-3">
                        <label>Course Id</label>
                        <input type="text"  class="form-control" name="c_id" value="<%=cid%>" readonly>
                    </div>

                    <button style="margin-top: 20px;" type="submit" class="btn btn-danger" >Submit</button>
                </div>

            </div>
        </form>
    </body>
</html>