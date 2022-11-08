<%-- 
    Document   : project-submit
    Created on : 27-Jun-2022, 11:29:09 pm
    Author     : praveen vuddagiri
--%>

<%@page import="com.learning.entities.student"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.learning.helper.ConnectionProvider"%>
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
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"
              integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />
        <title>Project</title>
    </head>

    <body>
        <%
            Connection con = ConnectionProvider.getConnection();
            Statement stm = con.createStatement();
            String query = "";
        %>


        <%
            student st = (student) session.getAttribute("Student");
            if (st == null) {
                st = new student();
        %>
        <script>

            swal("Sorry you are logged out due to some technical issues. We are going to redirect to login page\nPlease come after login again.")
                    .then((value) => {
                        window.location = "studentLog.jsp"
                    });


        </script>

        <%
            }

            String proFName = "";
            try {

                query = "select c_pro from course where c_id = " + request.getParameter("c_id");
                ResultSet rs = stm.executeQuery(query);
                while (rs.next()) {
                    proFName = rs.getString("c_pro");
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        %>
        <!-- Navbar -->
        <nav class="navbar navbar-expand-lg navbar-light fixed-top">
            <!-- Container wrapper -->
            <div class="container">
                <!-- Navbar brand -->
                <a href="enrolled-course-view.jsp?c_id=<%=request.getParameter("c_id")%>"><button type="button" class="btn btn-primary me-3 mt-4">
                        <i class="fa-solid fa-arrow-left"></i> Back
                    </button></a>
            </div>
        </nav>
        <!-- Navbar -->
        <%
            String pro_file = "";
            query = "select * from std_progress where s_id=" + st.getId() + " and pro_file!='" + 0 + "' and c_id="+request.getParameter("c_id");
            ResultSet rs = stm.executeQuery(query);
            while (rs.next()) {
                pro_file = rs.getString("pro_file");
            }
            if (pro_file != "") {

        %>
        <h1 class="alert alert-success w-100 vh-100 d-flex flex-column justify-content-center align-items-center text-center">
            You had already submitted your project. If needed you can see your submitted project.
            And other thing is your project will not be sent to faculty for evaluation until you 
            do not complete your examination.
            <a href="src/std-project/<%= pro_file%>" target="_blank"><div class="btn btn-primary"><i class="fa-solid fa-download"></i> Download Your Project</div></a>
        </h1>
        

        <%        } else if (proFName.equals("0")) {
        %>

        <h1 class="alert alert-danger w-100 vh-100 d-flex justify-content-between align-items-center text-center">Sorry, No project are uploaded by the faculty till now for this course. Please visit after sometime.</h1>

        <%
        } else {
        %>

        <div style="height: 100vh;">
            <div class="card text-center shadow" style="margin: 8% 25% 8% 25%;">
                <div class="mt-5">
                    <h5 ><u>Course Project Description</u></h5>
                    <p>This description is given by course faculty</p>

                    <a href="src/modules-notes/<%= proFName%>" target="_blank" class="btn btn-primary"><i class="fa-solid fa-download"></i> Download</a>
                </div>


                <hr >


                <div class="card-body">
                    <form action="studentProjectSubmit?c_id=<%= request.getParameter("c_id") %>" method="post" enctype="multipart/form-data">
                        <h5 class="card-title" style="padding-top: 3%; padding-bottom: 3%;">Upload your Assignment</h5>
                        <p class="alert alert-danger">Please be careful before uploading the project, because you can upload it only once.
                            And submit the project in .zip/.rar format.
                        </p>

                        <label class="form-label" for="customFile">Upload your file here</label>
                        <input type="file" class="form-control " name="pro_file" id="customFile" style="margin-bottom: 30px;" />
                        <button type="submit" class="btn btn-success " style="margin-bottom: 3%;"><i class="fa-solid fa-upload"></i> Upload</button>
                    </form>
                </div>
            </div>
        </div>
        <%}%>
    </body>

    <style>
        @import url("https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;700&display=swap");

        html {
            scroll-behavior: smooth;
        }

        body {
            font-family: 'Poppins', sans-serif;
            background-color: rgb(236, 236, 236);
            overflow: hidden;
        }

        h5 {
            font-weight: 600;
            font-size: 30px;
        }
    </style>

</html>
