<%-- 
    Document   : transferCourses
    Created on : 05-Jul-2022, 8:00:52 pm
    Author     : praveen vuddagiri
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.learning.helper.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> Transfer Course </title>
    </head>
    <body>
        <!DOCTYPE html>
    <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta http-equiv="X-UA-Compatible" content="IE=edge">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Delete Faculty</title>
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
                  integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
            <link rel="stylesheet" href="css/addFaculty.css">
        </head>

        <body>

            <%
                int count = 0;
                Connection con = ConnectionProvider.getConnection();
                Statement stm = con.createStatement();
                String query = "select count('c_id') from course where f_id=" + request.getParameter("f_id");
                ResultSet rs = stm.executeQuery(query);
                while (rs.next()) {
                    count = rs.getInt(1);
                }
                if (count > 0) {
            %>

            <div class="wrapper rounded bg-white">
                <form action="deleteFaculty?f_id=<%=request.getParameter("f_id")%>" method="post" id="deletefaculty">
                    <div class="alert alert-danger" role="alert">
                        The faculty you are going to delete is already assigned to a course. So please transfer the course management responsibility to some other faculty.
                    </div>
                    <h5 style="padding-top: 18px; padding-bottom:10px;">Select Faculty</h5>
                    <select class="form-select" id="sel1" name="faculty">
                        <option selected hidden>Select Faculty</option>
                        <%
                            con = ConnectionProvider.getConnection();
                            stm = con.createStatement();
                            query = "select f_id,f_name from faculty where f_id!=" + request.getParameter("f_id");
                            rs = stm.executeQuery(query);
                            while (rs.next()) {
                        %>
                        <option value="<%= rs.getString("f_id") %>" > <%=rs.getString("f_name")%> </option>
                        <%
                            }
                        %>

                    </select>
                    <input type="submit" value="Transfer" class="btn btn-success mt-3">
                    <a href="admin.jsp#a-faculties"><div class="btn btn-danger mt-3"><svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-arrow-left" viewBox="0 0 16 16">
                            <path fill-rule="evenodd" d="M15 8a.5.5 0 0 0-.5-.5H2.707l3.147-3.146a.5.5 0 1 0-.708-.708l-4 4a.5.5 0 0 0 0 .708l4 4a.5.5 0 0 0 .708-.708L2.707 8.5H14.5A.5.5 0 0 0 15 8z"/>
                            </svg> Back</div></a>
                </form>
            </div>
            <%} else {
                                
                    response.sendRedirect("deleteFaculty?f_id=" + request.getParameter("f_id"));
                }%>

        </body>


    </html>
</body>
</html>
