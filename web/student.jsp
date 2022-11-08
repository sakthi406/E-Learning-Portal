<%-- 
    Document   : student
    Created on : 25-Jun-2022, 8:04:31 pm
    Author     : praveen vuddagiri
--%>

<%@page import="com.learning.entities.course"%>
<%@page import="com.learning.dao.CourseDao"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.learning.helper.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.learning.entities.student"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
    <head>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
        <link rel="stylesheet" href="css/studentcss.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <script src="js/studentjs.js"></script>
        <title>Welcome Student</title>
    </head>
    <body id="body-pd" style="overflow-y: hidden;" >

        <%

            student st = (student) session.getAttribute("Student");
            if (st == null) {
                response.sendRedirect("studentLog.jsp");
                st = new student();
                st.setPass("");
            }
        %>
        <header class="header" id="header">
            <div class="header_toggle"> <i class='bx bx-menu' id="header-toggle"></i> </div>
        </header>
        <div class="l-navbar" id="nav-bar" >
            <nav class="nav">
                <div> <a href="index.jsp" class="nav_logo"> <i class='bx bx-user nav_logo-icon'></i> <span class="nav_logo-name">E-Learning</span> </a>
                    <div class="nav_list"> 
                        <a href="#s-dashboard" class="nav_link active"> <i class='bx bx-grid-alt nav_icon'></i> <span class="nav_name" id="dashboard">Dashboard</span> </a> 
                        <a href="#s-courses" class="nav_link"> <i class='bx bx-book-content nav_icon'></i> <span class="nav_name" id="allcourses">Courses</span> </a> 
                        <a href="#s-certificates" class="nav_link" > <i class="fa-solid fa-address-card"></i> <span class="nav_name" id="allstudents">Certificates</span> </a> 
                        <a href="#s-transactions" class="nav_link" > <i class="fa-solid fa-money-check-dollar"></i> <span class="nav_name" id="allstudents">Transactions</span> </a>
                    </div>
                </div> <a href="adminLogout" class="nav_link"> <i class='bx bx-log-out nav_icon'></i> <span class="nav_name">Sign Out</span> </a>
            </nav>
        </div>
        <!--Container Main start-->

        <%
            Connection con = ConnectionProvider.getConnection();
            Statement stm = con.createStatement();
            String query = "";
        %>
        <div class="height-100 " id="s-dashboard">
            <h4>Dashboard</h4>
            <section>
                <div class=" py-3" style="padding-right: 18px;">
                    <div class="row">
                        <div class="col-lg-4">
                            <div class="card mb-4 shadow bg-white rounded">
                                <div class="card-body text-center">
                                    <img src="src/stud-img/<%=st.getImg()%>" alt="avatar"
                                         class="rounded-circle img-fluid" style="width: 109.5px;">
                                    <h5 class="my-3"><%= st.getName()%></h5>
                                    <div class="d-flex justify-content-center mb-2">
                                        <a href="updateStudent.jsp"><button type="button" class="btn btn-outline-primary ms-1">Edit Profile</button></a>
                                    </div>
                                    <div class="alert alert-danger"> Image has to be re-uploaded if you update your profile. </div>
                                </div>
                            </div>
                            <div class="card mb-4 mb-lg-0 shadow bg-white rounded">
                                <div class="card-body p-0">
                                    <ul class="list-group list-group-flush rounded-3 scroll">
                                        <li class="list-group-item d-flex justify-content-between align-items-center p-3">
                                            <h5 class="mb-0">Courses Enrolled</h5>
                                        </li>
                                        <%

                                            query = "select * from std_progress where s_id=" + st.getId();
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

                            <div class="card mb-4 shadow bg-white rounded" >
                                <div class="card-body">

                                    <p class="mb-0" style="font-size: 30px;">Profile</p>

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
                                            <p class="text-muted mb-0"><%= st.getPhone()%></p>
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
                                            <p class="mb-0">Password</p>
                                        </div>
                                        <div class="col-sm-9">
                                            <%
                                                String pass = "";
                                                for (int i = 0; i < st.getPass().length(); i++) {

                                                    if (i > 2) {
                                                        pass += "*";
                                                    } else {
                                                        pass += st.getPass().charAt(i);
                                                    }

                                                }
                                            %>
                                            <p class="text-muted mb-0"><%= pass%></p>
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
                                        <div class="col-sm-3 " >
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
            </section>


        </div>
        <div class="height-100 mb-0" id="s-courses">
            <h4>Courses</h4>
            <div class="tabs" style="margin-top: 20px;">
                <input type="radio" name="tabs" id="tabone" checked="checked">
                <label for="tabone">Current</label>
                <div class="tab scroll" style="max-height: 100%;">

                    <div class="row">
                        <%

                            query = "select * from std_progress where s_id=" + st.getId() + "and cert_id=" + 0;
                            rs = stm.executeQuery(query);
                            while (rs.next()) {
                                CourseDao dao = new CourseDao(ConnectionProvider.getConnection());
                                course co = dao.getCourseById(rs.getInt("c_id"));
                        %>
                        <div class="col-lg-3 col-md-4 wow fadeInUp" data-wow-delay="0.1s">



                            <div class="course-item bg-light">
                                <div class="position-relative overflow-hidden">
                                    <img class="img-fluid" style="width: 100%; height: 200px;" src="src/course-img/<%= co.getC_img()%>" alt="">
                                </div>
                                <div class="text-center p-4 pb-0">
                                    <h5 class="mb-4"><%= co.getC_name()%></h5>
                                </div>
                                <div class="d-flex border-top">
                                    <small class="flex-fill text-center border-end py-2"><i class="fa fa-file text-primary me-2"></i><%= co.getC_mod()%> Modules</small>
                                    <small class="flex-fill text-center border-end py-2"><i class="fa fa-clock text-primary me-2"></i><%= co.getC_dur()%> Months</small>
                                    <small class="flex-fill text-center py-2 btn-primary text-white"><a href="enrolled-course-view.jsp?c_id=<%= co.getC_id()%>" style="text-decoration: none; color: white;"><i class="fa fa-arrow-right text-white me-2"></i>Access Course</a></small>
                                </div>
                            </div>


                        </div>
                        <%}%>
                    </div>

                </div>

                <input type="radio" name="tabs" id="tabtwo">
                <label for="tabtwo">Completed</label>
                <div class="tab scroll" style="max-height: 100%;">
                    <div class="row">
                        <%

                            query = "select * from std_progress where s_id=" + st.getId() + "and cert_id!=" + 0;
                            rs = stm.executeQuery(query);
                            while (rs.next()) {
                                CourseDao dao = new CourseDao(ConnectionProvider.getConnection());
                                course co = dao.getCourseById(rs.getInt("c_id"));
                        %>
                        <div class="col-lg-3 col-md-4 wow fadeInUp" data-wow-delay="0.3s">

                            <div class="course-item bg-light">
                                <div class="position-relative overflow-hidden">
                                    <img class="img-fluid" style="width: 100%; height: 200px;" src="src/course-img/<%= co.getC_img()%>" alt="">
                                </div>
                                <div class="text-center p-4 pb-0">
                                    <h5 class="mb-4"> <%= co.getC_name()%> </h5>
                                </div>
                                <div class="d-flex border-top">
                                    <small class="flex-fill text-center border-end py-2"><i class="fa fa-file text-success me-2"></i>Project completed</small>
                                    <small class="flex-fill text-center border-end py-2"><i class="fa fa-clock text-success me-2"></i>Exam Completed</small>
                                    <small class="flex-fill text-center py-2 btn-primary text-white"><a href="enrolled-course-view.jsp?c_id=<%= co.getC_id()%>" style="text-decoration: none; color: white;"><i class="fa fa-arrow-right text-white me-2"></i>Access Course</a></small>
                                </div>
                            </div>
                        </div>
                        <%}%>
                    </div>
                </div>
            </div>   
        </div>
        <div class="height-100" id="s-certificates">
            <h4>Certificates</h4>
            <div class="table-wrapper-scroll-y my-custom-scrollbar">
                <table class="table table-bordered table-striped mb-0">
                    <thead>
                        <tr>
                            <th scope="col">Certificate Id</th>
                            <th scope="col">Course Name</th>
                            <th scope="col">Duration</th>
                            <th scope="col">Date of Issue</th>
                            <th scope="col">Total Marks obtained</th>
                            <th scope="col">Certificate</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            
                            query = "select * from std_progress where s_id=" + st.getId() + "and cert_id!=" + 0;
                            rs = stm.executeQuery(query);
                            while (rs.next()) {
                                CourseDao dao = new CourseDao(ConnectionProvider.getConnection());
                                course co = dao.getCourseById(rs.getInt("c_id"));
                                stm = con.createStatement();
                                query = "select * from certificates where cert_id="+rs.getString("cert_id");
                                ResultSet rs2 = stm.executeQuery(query);
                                while(rs2.next()){
                                
                            
                        %>
                        <tr>
                            <td> <%= rs.getString("cert_id") %> </td>
                            <td> <%= co.getC_name() %> </td>
                            <td> <%= co.getC_dur() %> Months</td>
                            <td> <%= rs2.getString("date_of_issue") %> </td>
                            <td> <%= rs.getString("exam_marks") %> </td>
                            <td><a href="certificateDisplay.jsp?c_id=<%= co.getC_id() %>&s_id=<%= rs.getString("s_id")%>"><button type="button" class="btn btn-primary btn-rounded" style="font-size: 12px; padding: 2px 6px 2px 6px;">View Certificate</button></a></td>
                        </tr>
                        <%}}%>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="height-100" id="s-transactions">
            <h4>Transaction History</h4>
            <div class="table-wrapper-scroll-y my-custom-scrollbar">
                <table class="table table-bordered table-striped mb-0">
                    <thead>
                        <tr>
                            <th scope="col">Transaction ID</th>
                            <th scope="col">Course Name</th>
                            <th scope="col">Course Amount</th>
                            <th scope="col">Payment Method</th>
                            <th scope="col">Date of Purchase</th>
                            <th scope="col">Time of Purchase</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%

                            query = "select * from std_progress where s_id=" + st.getId();
                            rs = stm.executeQuery(query);
                            while (rs.next()) {
                                
                                CourseDao dao = new CourseDao(ConnectionProvider.getConnection());
                                course co = dao.getCourseById(rs.getInt("c_id"));
                                query = "select * from transactions where trans_id='" + rs.getString("trans_id") + "'";
                                stm = con.createStatement();
                                ResultSet rs2 = stm.executeQuery(query);
                                while (rs2.next()) {


                        %>
                        <tr>
                            <th><%=rs2.getString("trans_id")%></th>
                            <td><%= co.getC_name()%></td>
                            <td><%= rs2.getString("amount")%></td>
                            <td><%= rs2.getString("mop")%></td>
                            <td><%= rs2.getString("date_of_trans")%></td>                            
                            <td><%= rs2.getString("time_of_trans")%></td>
                        </tr>
                        <%}
                            }
                        %>
                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>