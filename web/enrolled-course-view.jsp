<%-- 
    Document   : enrolled-course-view
    Created on : 27-Jun-2022, 5:06:11 pm
    Author     : praveen vuddagiri
--%>

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
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"
              integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="css/ecv-homecss.css">
        <title>Course - View</title>
    </head>

    <body>
        <%
            String c_name = "";
            try {

                Connection con = ConnectionProvider.getConnection();
                String query = "select * from course where c_id = " + request.getParameter("c_id");
                Statement stm = con.createStatement();
                ResultSet rs = stm.executeQuery(query);
                while (rs.next()) {
                    c_name = rs.getString("c_name");
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
                <a href="student.jsp#s-courses"><button type="button" class="btn btn-primary me-3 mt-4">
                        <i class="fa-solid fa-arrow-left"></i> Back
                    </button></a>
            </div>
        </nav>
        <!-- Navbar -->
        <div style="height: 100vh; padding-top: 5%;">
            <div class="wrapper">
                <h1><%=c_name%> Course</h1>
                <div class="cols">
                    <div class="col" ontouchstart="this.classList.toggle('hover');">
                        <div class="container">
                            <div class="front" style="background-image: url(src/course-img.jpg)">
                                <div class="inner">
                                    <p style="font-size: 30px;">Course</p>
                                    <span>Read Modules <i class="fa-solid fa-arrow-right"></i></span>
                                </div>
                            </div>
                            <div class="back">
                                <div class="inner">
                                    <p> From this page you can get access to all the course modules. </p>
                                    <a href="course-access.jsp?c_id=<%=request.getParameter("c_id")%>"><button type="button" class="btn btn-primary">Access
                                            Course</button></a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col" ontouchstart="this.classList.toggle('hover');">
                        <div class="container">
                            <div class="front" style="background-image: url(src/project-img.jpg)">
                                <div class="inner">
                                    <p style="font-size: 30px;">Project</p>
                                    <span>Submit Project<i class="fa-solid fa-arrow-right"></i></span>
                                </div>
                            </div>
                            <div class="back">
                                <div class="inner">
                                    <p>From this page you can study description of course project and after you can also submit your project.</p>
                                    <a href="project-submit.jsp?c_id=<%=request.getParameter("c_id")%>"><button type="button" class="btn btn-primary">Upload
                                            Project</button></a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col" ontouchstart="this.classList.toggle('hover');">
                        <div class="container">
                            <div class="front" style="background-image: url(src/exam-img.jpg)">
                                <div class="inner">
                                    <p style="font-size: 30px;">Exam</p>
                                    <span>Give Exam<i class="fa-solid fa-arrow-right"></i></span>
                                </div>
                            </div>
                            <div class="back">
                                <div class="inner">
                                    <p>From this page you can give exam and prove your understanding level of this course. Based on performance your certificate will be issued.</p>
                                    <a href="examMCQ.jsp?c_id=<%=request.getParameter("c_id")%>"><button type="button" class="btn btn-primary">Start
                                            Exam</button></a>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>


                <%
                    String f_mail = "";
                    try {

                        Connection con = ConnectionProvider.getConnection();
                        String query = "select f_id from course where c_id = " + request.getParameter("c_id");
                        Statement stm = con.createStatement();
                        ResultSet rs = stm.executeQuery(query);
                        while (rs.next()) {
                            query = "select * from faculty where f_id=" + rs.getString("f_id");
                            stm = con.createStatement();
                            ResultSet rs2 = stm.executeQuery(query);
                            while (rs2.next()) {
                                f_mail = rs2.getString("f_email");
                            }
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    }


                %>
                <div class="text-center text-primary mt-5">
                    <a href="https://mail.google.com/mail/?view=cm&fs=1&tf=1&to=<%= f_mail %>" target="_blank" style="text-decoration: none;font-size:19px; color: black;">
                        <p > For any doubts regarding course you can contact faculty through : <span><i><u> <%= f_mail %> </u></i></span></p></a>
                </div>
            </div>
        </div>
    </body>

</html>
