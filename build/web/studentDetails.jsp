<%-- 
    Document   : studentDetails
    Created on : 27-Jun-2022, 11:05:49 pm
    Author     : praveen vuddagiri
--%>

<%@page import="com.learning.entities.course"%>
<%@page import="com.learning.dao.CourseDao"%>
<%@page import="com.learning.entities.student"%>
<%@page import="com.learning.helper.ConnectionProvider"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />


        <title>Student Details</title>
    </head>

    <body style="font-family: 'Poppins', sans-serif;">
        <!-- Navbar -->
        <nav class="navbar navbar-expand-lg navbar-light fixed-top">
            <!-- Container wrapper -->
            <div class="container">
                <!-- Navbar brand -->
                <a href="admin.jsp#a-students"><button type="button" class="btn btn-danger me-3 mt-4">
                        <i class="fa-solid fa-arrow-left"></i> Back
                    </button></a>
            </div>
        </nav>

        <%
            student st = new student();
            try {

                Connection con = ConnectionProvider.getConnection();
                String query = "select * from student where id=" + request.getParameter("s_id");
                Statement stm = con.createStatement();
                ResultSet rs = stm.executeQuery(query);
                while (rs.next()) {
                    st.setId(rs.getInt("id"));
                    st.setName(rs.getString("name"));
                    st.setEmail(rs.getString("email"));
                    st.setPhone(rs.getString("phone"));
                    st.setDob(rs.getString("dob"));
                    st.setGen(rs.getString("gender"));
                    st.setClg(rs.getString("college"));
                    st.setImg(rs.getString("img"));
                    st.setAdd(rs.getString("address"));

                }

            } catch (Exception e) {
                out.println(e);
            }

        %>
        <!-- Navbar -->
        <div style=" height: 100px;"></div>
        <div class="container py-3" style="padding-right: 18px;">

            <div class="row">
                <div class="col-lg-4">
                    <div class="card mb-4 shadow bg-white rounded">
                        <div class="card-body text-center">
                            <img src="src/stud-img/<%= st.getImg()%>"
                                 alt="avatar" class="rounded-circle img-fluid" style="width: 109.5px;">
                            <h5 class="my-3"> <%= st.getName()%> </h5>
                        </div>
                    </div>
                    <div class="card mb-4 mb-lg-0 shadow bg-white rounded">
                        <div class="card-body p-0">
                            <ul class="list-group list-group-flush rounded-3 scroll">
                                <li class="list-group-item d-flex justify-content-between align-items-center p-3">
                                    <h5 class="mb-0">Courses Enrolled</h5>
                                </li>
                                <%
                                    Connection con = ConnectionProvider.getConnection();
                                    Statement stm = con.createStatement();
                                    String query = "select * from std_progress where s_id=" + st.getId();
                                    ResultSet rs = stm.executeQuery(query);
                                    while (rs.next()) {
                                        CourseDao dao = new CourseDao(ConnectionProvider.getConnection());
                                        course co = dao.getCourseById(rs.getInt("c_id"));
                                %>
                                <li class="list-group-item d-flex justify-content-between align-items-center p-3">
                                    <p class="mb-0"><%= co.getC_name()%></p>
                                </li>
                                <%}%>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col-lg-8">

                    <div class="card mb-4 shadow bg-white rounded">
                        <div class="card-body">

                            <p class="mb-0" style="font-size: 30px;">Student Details</p>

                            <hr>
                            <div class="row">
                                <div class="col-sm-3">
                                    <p class="mb-0">Full Name</p>
                                </div>
                                <div class="col-sm-9">
                                    <p class="text-muted mb-0"><%= st.getName()%></p>
                                </div>
                            </div>
                            <hr>
                            <div class="row">
                                <div class="col-sm-3">
                                    <p class="mb-0">Email</p>
                                </div>
                                <div class="col-sm-9">
                                    <p class="text-muted mb-0"><%= st.getEmail()%></p>
                                </div>
                            </div>
                            <hr>
                            <div class="row">
                                <div class="col-sm-3">
                                    <p class="mb-0">Phone</p>
                                </div>
                                <div class="col-sm-9">
                                    <p class="text-muted mb-0">  <%= st.getPhone()%></p>
                                </div>
                            </div>
                            <hr>
                            <div class="row">
                                <div class="col-sm-3">
                                    <p class="mb-0">Address</p>
                                </div>
                                <div class="col-sm-9">
                                    <p class="text-muted mb-0"><%= st.getAdd()%></p>
                                </div>
                            </div>
                            <hr>
                            <div class="row">
                                <div class="col-sm-3">
                                    <p class="mb-0">Gender</p>
                                </div>
                                <div class="col-sm-9">
                                    <p class="text-muted mb-0"><%= st.getGen()%></p>
                                </div>
                            </div>
                            <hr>
                            <div class="row">
                                <div class="col-sm-3">
                                    <p class="mb-0">DOB</p>
                                </div>
                                <div class="col-sm-9">
                                    <p class="text-muted mb-0"><%= st.getDob()%></p>
                                </div>
                            </div>
                            <hr>
                            <div class="row">
                                <div class="col-sm-3 ">
                                    <p class="mb-0">College Name</p>
                                </div>
                                <div class="col-sm-9">
                                    <p class="text-muted mb-0"><%= st.getClg()%></p>
                                </div>
                            </div>
                        </div>

                    </div>

                </div>
            </div>
        </div>
    </body>
    <style>
        .scroll{
            max-height: 290px;
            overflow-y: auto;
        }
    </style>
</html>