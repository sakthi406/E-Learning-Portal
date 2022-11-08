<%-- 
    Document   : faculty
    Created on : 07-Jun-2022, 6:12:04 am
    Author     : praveen vuddagiri
--%>

<%@page import="com.learning.entities.student"%>
<%@page import="com.learning.dao.StudentDao"%>
<%@page import="com.learning.entities.course"%>
<%@page import="com.learning.dao.CourseDao"%>
<%@page import="org.apache.jasper.JasperException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.learning.helper.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.learning.entities.faculty"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Faculty Page</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js" type="text/javascript"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"></script>

        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
        <link rel="stylesheet" href="css/facultycss.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <script src="js/facultyjs.js"></script>
    </head>

    <body id="body-pd" style="overflow-y: hidden;" >

        <%

            faculty fac = (faculty) session.getAttribute("Faculty");
            if (fac == null) {
                response.sendRedirect("facultyLogin.jsp");
                fac = new faculty();
            }

        %>

        <header class="header" id="header">
            <div class="header_toggle"> <i class='bx bx-menu' id="header-toggle"></i> </div>
            <!--<div class="header_img"> <img src="https://i.imgur.com/hczKIze.jpg" alt=""> </div>-->
        </header>
        <div class="l-navbar" id="nav-bar" >
            <nav class="nav">
                <div> <a href="#" class="nav_logo"> <i class='bx bx-user nav_logo-icon'></i> <span class="nav_logo-name">E-Learning</span> </a>
                    <div class="nav_list"> 
                        <a href="#f-dashboard" class="nav_link active"> <i class='bx bx-grid-alt nav_icon'></i> <span class="nav_name" id="dashboard">Dashboard</span> </a> 
                        <a href="#f-courses" class="nav_link"> <i class='bx bx-book-content nav_icon'></i> <span class="nav_name" id="allcourses">All Courses</span> </a> 
                        <a href="#f-projects" class="nav_link" > <i class='bx bxs-user-detail nav_icon'></i> <span class="nav_name" id="allstudents">All Projects</span> </a> 

                    </div>
                </div> <a href="adminLogout" class="nav_link"> <i class='bx bx-log-out nav_icon'></i> <span class="nav_name">SignOut</span> </a>
            </nav>
        </div>
        <!--Container Main start-->
        <div class="height-100 " id="f-dashboard">
            <h4>Dashboard</h4>
            <section>
                <div class=" py-3" style="padding-right: 18px;">


                    <div class="row">
                        <div class="col-lg-4">
                            <div class="card mb-4 shadow bg-white rounded">
                                <div class="card-body text-center">
                                    <img src="" alt="avatar"
                                         class="rounded-circle img-fluid" style="width: 150px;">
                                    <h5 class="my-3"><%= fac.getFacname()%></h5>
                                </div>
                            </div>



                            <div class="card mb-4 mb-lg-0 shadow bg-white rounded">
                                <div class="card-body p-0">
                                    <ul class="list-group list-group-flush rounded-3">
                                        <li class="list-group-item d-flex justify-content-between align-items-center p-3">
                                            <h5 class="mb-0">Courses Managing</h5>
                                        </li>

                                        <%

                                            try {

                                                Connection con = ConnectionProvider.getConnection();
                                                String query = "select * from faculty where f_id=" + fac.getFacid();
                                                Statement stm = con.createStatement();
                                                ResultSet rs = stm.executeQuery(query);
                                                while (rs.next()) {
                                                    query = "select c_name from course where f_id=" + rs.getString("f_id");
                                                    Statement stm2 = con.createStatement();
                                                    ResultSet rs2 = stm2.executeQuery(query);
                                                    String cname = "";
                                                    while (rs2.next()) {
                                                        cname = rs2.getString("c_name");


                                        %>
                                        <li class="list-group-item d-flex justify-content-between align-items-center p-3">
                                            <p class="mb-0"><%=cname%></p>
                                        </li>
                                        <%
                                                    }
                                                }
                                            } catch (Exception e) {
                                                e.printStackTrace();
                                                out.println(e);
                                            }
                                        %>
                                    </ul>
                                </div>
                            </div>



                        </div>
                        <div class="col-lg-8">
                            <div class="card mb-4 shadow bg-white rounded">
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-sm-3">
                                            <p class="mb-0">Full Name</p>
                                        </div>
                                        <div class="col-sm-9">
                                            <p class="text-muted mb-0"><%= fac.getFacname()%></p>
                                        </div>
                                    </div>
                                    <hr>
                                    <div class="row">
                                        <div class="col-sm-3">
                                            <p class="mb-0">Email</p>
                                        </div>
                                        <div class="col-sm-9">
                                            <p class="text-muted mb-0"><%= fac.getFacemail()%></p>
                                        </div>
                                    </div>
                                    <hr>
                                    <div class="row">
                                        <div class="col-sm-3">
                                            <p class="mb-0">Phone</p>
                                        </div>
                                        <div class="col-sm-9">
                                            <p class="text-muted mb-0"><%= fac.getFacphone()%></p>
                                        </div>
                                    </div>
                                    <hr>
                                    <div class="row">
                                        <div class="col-sm-3">
                                            <p class="mb-0">Gender</p>
                                        </div>
                                        <div class="col-sm-9">
                                            <p class="text-muted mb-0"><%= fac.getFacgen()%></p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="card mb-4 mb-md-0 shadow bg-white rounded">
                                        <div class="card-body">
                                            <p class="mb-4"><span class="text-primary font-italic me-1">Assigned Course</span> Status
                                            </p>
                                            <p class="mb-1" style="font-size: .77rem;">Cousrse 1 - Complete Course(s)</p>
                                            <div class="progress rounded" style="height: 5px;">
                                                <div class="progress-bar" role="progressbar" style="width: 80%" aria-valuenow="80"
                                                     aria-valuemin="0" aria-valuemax="100"></div>
                                            </div>
                                            <p class="mt-4 mb-1" style="font-size: .77rem;">Cousrse 2 - Complete Course(s)</p>
                                            <div class="progress rounded" style="height: 5px;">
                                                <div class="progress-bar" role="progressbar" style="width: 72%" aria-valuenow="72"
                                                     aria-valuemin="0" aria-valuemax="100"></div>
                                            </div>
                                            <p class="mt-4 mb-1" style="font-size: .77rem;">Cousrse 3 - Complete Course(s)</p>
                                            <div class="progress rounded" style="height: 5px;">
                                                <div class="progress-bar" role="progressbar" style="width: 89%" aria-valuenow="89"
                                                     aria-valuemin="0" aria-valuemax="100"></div>
                                            </div>
                                            <p class="mt-4 mb-1" style="font-size: .77rem;">Cousrse 4 - Complete Course(s)</p>
                                            <div class="progress rounded" style="height: 5px;">
                                                <div class="progress-bar" role="progressbar" style="width: 55%" aria-valuenow="55"
                                                     aria-valuemin="0" aria-valuemax="100"></div>
                                            </div>
                                            <p class="mt-4 mb-1" style="font-size: .77rem;">Cousrse 5 - Complete Course(s)</p>
                                            <div class="progress rounded mb-2" style="height: 5px;">
                                                <div class="progress-bar" role="progressbar" style="width: 66%" aria-valuenow="66"
                                                     aria-valuemin="0" aria-valuemax="100"></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="card mb-4 mb-md-0 shadow bg-white rounded">
                                        <div class="card-body">
                                            <p class="mb-4"><span class="text-primary font-italic me-1">Student's Project</span> Status
                                            </p>
                                            <p class="mb-1" style="font-size: .77rem;">Total issued certificates</p>
                                            <div class="progress rounded" style="height: 5px;">
                                                <div class="progress-bar" role="progressbar" style="width: 80%" aria-valuenow="80"
                                                     aria-valuemin="0" aria-valuemax="100"></div>
                                            </div>
                                            <p class="mt-4 mb-1" style="font-size: .77rem;">Website Markup</p>
                                            <div class="progress rounded" style="height: 5px;">
                                                <div class="progress-bar" role="progressbar" style="width: 72%" aria-valuenow="72"
                                                     aria-valuemin="0" aria-valuemax="100"></div>
                                            </div>
                                            <p class="mt-4 mb-1" style="font-size: .77rem;">One Page</p>
                                            <div class="progress rounded" style="height: 5px;">
                                                <div class="progress-bar" role="progressbar" style="width: 89%" aria-valuenow="89"
                                                     aria-valuemin="0" aria-valuemax="100"></div>
                                            </div>
                                            <p class="mt-4 mb-1" style="font-size: .77rem;">Mobile Template</p>
                                            <div class="progress rounded" style="height: 5px;">
                                                <div class="progress-bar" role="progressbar" style="width: 55%" aria-valuenow="55"
                                                     aria-valuemin="0" aria-valuemax="100"></div>
                                            </div>
                                            <p class="mt-4 mb-1" style="font-size: .77rem;">Backend API</p>
                                            <div class="progress rounded mb-2" style="height: 5px;">
                                                <div class="progress-bar" role="progressbar" style="width: 66%" aria-valuenow="66"
                                                     aria-valuemin="0" aria-valuemax="100"></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </div>
        <div class="height-100 " id="f-courses">
            <h4>Assigned Courses</h4>
            <div class="table-wrapper-scroll-y my-custom-scrollbar">
                <table class="table table-bordered table-striped mb-0">
                    <thead>
                        <tr>
                            <th scope="col">Course ID</th>
                            <th scope="col">Course Name</th>
                            <th scope="col">Duration</th>
                            <th scope="col">Status</th>
                            <th scope="col">Action</th>
                        </tr>
                    </thead>
                    <tbody>


                        <%
                            try {

                                Connection con = ConnectionProvider.getConnection();
                                String query = "select * from course where f_id=" + fac.getFacid();
                                Statement stm = con.createStatement();
                                ResultSet rs = stm.executeQuery(query);
                                while (rs.next()) {
                                    query = "select count('m_id') from modules where c_id=" + rs.getString("c_id");
                                    Statement stm2 = con.createStatement();
                                    ResultSet rs2 = stm2.executeQuery(query);
                                    int count = 0;
                                    while (rs2.next()) {
                                        count = rs2.getInt(1);
                                    }

                                    query = "select count('q_id') from questions where c_id=" + rs.getString("c_id");
                                    stm2 = con.createStatement();
                                    rs2 = stm2.executeQuery(query);
                                    int count2 = 0;
                                    while (rs2.next()) {
                                        count2 = rs2.getInt(1);
                                    }

                                    query = "select c_pro from course where c_id=" + rs.getString("c_id");
                                    stm2 = con.createStatement();
                                    rs2 = stm2.executeQuery(query);
                                    String project = "";
                                    while (rs2.next()) {
                                        project = rs2.getString(1);
                                    }

                                    String status = (count > 0 && count2 > 0 && !project.equals("0")) ? "Completed" : "Incomplete";
                        %>
                        <tr>
                            <td><%= rs.getString("c_id")%></td>
                            <td>  <%=rs.getString("c_name")%> </td>
                            <td><%= rs.getString("c_dur")%> Months</td>
                            <td><%= status%></td> <!--for Completed :: action is not required!-->
                            <td>
                                <%  String url = "addModuleGetCount.jsp?cid=" + rs.getString("c_id");
                                    if (count > 0) {
                                        url = "faculty.jsp#f-courses";
                                    }

                                %>
                                <a  href="<%=url%>">
                                    <button  type="button" class="btn btn-primary btn-rounded" style="font-size: 12px; padding: 2px 6px 2px 6px;" data-bs-toggle="modal"  <%if (count > 0) {%> disabled <%}%> >+ Add Modules</button> 
                                </a>
                                &nbsp;&nbsp;&nbsp;&nbsp;

                                <%  String url2 = "addQuestionGetCount.jsp?cid=" + rs.getString("c_id");
                                    if (count2 > 0) {
                                        url2 = "faculty.jsp#f-courses";
                                    }

                                %>
                                <a  href="<%=url2%>">
                                    <button  type="button" class="btn btn-warning btn-rounded" style="font-size: 12px; padding: 2px 6px 2px 6px;" data-bs-toggle="modal"  <%if (count2 > 0) {%> disabled <%}%> >+ Add Questions</button> 
                                </a>
                                &nbsp;&nbsp;&nbsp;&nbsp;
                                <%  String url3 = "addProject.jsp?cid=" + rs.getString("c_id");
                                    if (!project.equals("0")) {
                                        url3 = "faculty.jsp#f-courses";
                                    }

                                %>
                                <a  href="<%=url3%>">
                                    <button  type="button" class="btn btn-success btn-rounded" style="font-size: 12px; padding: 2px 6px 2px 6px;" data-bs-toggle="modal"  <%if (!project.equals("0")) {%> disabled <%}%> >+ Add Projects</button> 
                                </a>
                            </td>
                        </tr>
                        <%
                                }
                            } catch (Exception e) {
                                e.printStackTrace();
                                out.println(e);
                            }
                        %>
                    </tbody>
                </table>
            </div>    
            <!-- Modal -->
            <div class="modal fade" id="moduleNumber" tabindex="-1" aria-labelledby="moduleNumber" aria-hidden="true" role="dialog">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="moduleNumber">Enter no. of Modules</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <form action="" method="post">
                                <div class="form-outline mb-4">
                                    <input type="number" id="noOFModules" name="nom" class="form-control" />
                                </div>
                            </form>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-primary" id="modalNext" data-bs-dismiss="modal" aria-label="Close" data-bs-toggle="modal" >Next</button>
                        </div>
                    </div>
                </div>
            </div>
            <script>
                var nom = 0;
                $('#modalNext').click(function () {
                    nom = $('#noOFModules').val();
                    window.location.replace("addModules.jsp?nom=" + nom);
                });

            </script>

            <% String numberMod = request.getParameter("nom");%>
            <!-- Modal -->
            <div class="modal fade" id="moduleEnter" tabindex="-1" aria-labelledby="moduleEnter" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="moduleEnter">Enter Modules <%=numberMod%></h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <form action="" method="post">
                                <div class="d-flex justift-conent-column">
                                    <div class="form-group">
                                        <label for="moduleName">Module ID</label>
                                        <input type="text" class="form-control" id="moduleName" value="123" readonly>
                                        &nbsp;
                                    </div>
                                    <div class="form-group" style="padding-left: 80px;">
                                        <label for="moduleName">Course ID</label>
                                        <input type="text" class="form-control" id="moduleName" value="C3" readonly>
                                        &nbsp;
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="moduleName">Module Name</label>
                                    <input type="text" class="form-control" id="moduleName" placeholder="Enter the module name">
                                    &nbsp;
                                </div>
                                <div class="form-group">
                                    <label for="videoLink">Video Link</label>
                                    <input type="text" class="form-control" id="moduleVideo" placeholder="Enter the videolink">
                                    &nbsp;
                                </div>
                                <div class="form-group">
                                    <label for="moduleNotes">Module Notes</label>
                                    <input type="text" class="form-control" id="moduleNotes" placeholder="Enter the notes link">
                                </div>
                            </form>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-primary">Submit</button>
                        </div>
                    </div>
                </div>
            </div>

        </div>
        <div class="height-100" id="f-projects">
            <h4>All Projects</h4>
            <div class="table-wrapper-scroll-y my-custom-scrollbar">
                <table class="table table-bordered table-striped mb-0">
                    <thead>
                        <tr>

                            <th scope="col">Student Name</th>
                            <th scope="col">Course Name</th>
                            <th scope="col">Project</th>
                            <th scope="col">Exam Marks</th>

                            <th scope="col">Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            Connection con = ConnectionProvider.getConnection();
                            Statement stm = con.createStatement();
                            String query = "select * from course where f_id=" + fac.getFacid();
                            ResultSet rs = stm.executeQuery(query);
                            while (rs.next()) {
//                                out.println(rs.getString("c_id"));
                                query = "select * from std_progress where c_id=" + rs.getInt("c_id") + " and cert_id=" + 0 + " and (pro_file != '" + 0 + "' and exam_marks!=" + 0 + ")";
                                stm = con.createStatement();
                                ResultSet rs2 = stm.executeQuery(query);
                                while (rs2.next()) {
                                    StudentDao dao = new StudentDao(ConnectionProvider.getConnection());
                                    student st = dao.getStudentById(rs2.getInt("s_id"));
                        %>
                        <tr>
                            <th scope="row"> <%= st.getName()%> </th>
                            <td><%= rs.getString("c_name")%></td>

                            <td><a href="src/std-project/<%= rs2.getString("pro_file")%>" target="_blank"> <%= rs2.getString("pro_file")%> </a></td>
                            <td> <%= rs2.getString("exam_marks")%>  </td>
                            <td>
                                <a href="issueCertificate?s_id=<%=rs2.getString("s_id")%>&c_id=<%=rs.getString("c_id")%>">
                                    <button type="button" class="btn btn-success btn-rounded" style="font-size: 12px; padding: 2px 6px 2px 6px;">&check; Issue Certificate</button>
                                </a>
                                <!--<button type="button" class="btn btn-danger btn-rounded" style="font-size: 12px; padding: 2px 6px 2px 6px;" data-bs-toggle="modal" data-bs-target="#moduleReport">! Issue Report</button>-->
                            </td>
                        </tr>
                        <%
                                }
                            }
                        %>
                    </tbody>
                </table>
            </div>
            <!-- Modal -->
            <div class="modal fade" id="moduleReport" tabindex="-1" aria-labelledby="moduleNumber" aria-hidden="true" role="dialog">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="moduleNumber">Submit report query</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <form action="" method="post">
                                <div class="form-outline mb-4">
                                    <textarea name="tReport" id="tReport" cols="30" rows="10" placeholder="Enter your Response"></textarea>
                                </div>
                            </form>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-primary" id="modalReportSubmit" >Submit</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </body>
</html>
