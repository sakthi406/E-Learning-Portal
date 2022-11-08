<%-- 
    Document   : courses
    Created on : 25-Jun-2022, 11:04:06 pm
    Author     : praveen vuddagiri
--%>

<%@page import="com.learning.entities.student"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.learning.helper.ConnectionProvider"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
    <head>
        <meta charset="UTF-8">
        <title>Courses Page</title>
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" type="text/css" href="css/cssfile.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous"> 
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;700&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous"/>
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <%

            student st = (student) session.getAttribute("Student");

        %>
        <nav class="navbar navbar-expand-lg navbar-light bg-light" style="width: 100%;">
            <div class="container">
                <a class="navbar-brand me-2" href="index.jsp" id="logo">
                    <img
                        src="src/icon1.gif"
                        alt="E-Learning Logo"
                        loading="lazy"
                        width="50px"
                        height="50px"
                        />
                    E-learning
                </a>

                <button
                    class="navbar-toggler"
                    type="button"
                    data-mdb-toggle="collapse"
                    data-mdb-target="#navbarButtonsExample"
                    aria-controls="navbarButtonsExample"
                    aria-expanded="false"
                    aria-label="Toggle navigation"
                    >
                    <i class="fas fa-bars"></i>
                </button>

                <div class="collapse navbar-collapse" id="navbarButtonsExample">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item">
                            <a class="nav-link"  href="index.jsp">Home</a>
                            <a class="nav-link" id="nav_home" href="#">Courses</a>
                            <a class="nav-link" href="aboutUs.jsp">About Us</a>
                        </li>
                    </ul>
                    <%    if (st == null) {
                    %>
                    <div class="d-flex align-items-right" id="login-signup">
                        <a href="studentLog.jsp">
                            <button type="button" class="btn btn-primary me-3">
                                Student Login
                            </button>
                        </a>
                        <a href="studentReg.jsp">

                            <button type="button" class="btn btn-success me-3">
                                Register
                            </button>
                        </a>
                    </div>
                    <%
                    } else {
                    %>

                    <div class="d-flex align-items-right" id="login-signup">
                        <a href="student.jsp#s-dashboard">
                            <button type="button" class="btn btn-primary me-3">
                                Dashboard
                            </button>
                        </a>
                    </div>
                    <%}%>
                </div>
                
        </nav>


        <!-- Courses Start -->
        <div class="container-xxl py-5">
            <div class="container">
                <div class="text-center wow fadeInUp mb-5" data-wow-delay="0.1s">
                    <h6 class="section-title bg-white text-center text-primary px-3">e-learning</h6>
                    <h1 class="mb-5">Courses</h1>
                    <label>Select Category  </label>
                    <select id="sub" required name="cat" onchange="loadCategory()" value="<%=request.getParameter("cat_id")%>">
                        <option value="-1" <%if (Integer.parseInt(request.getParameter("cat_id")) == -1 || request.getParameter("cat_id") == null) {%>selected<%}%> >All Category </option>
                        <%
                            try {
                                Connection con = ConnectionProvider.getConnection();
                                String query = "select * from category";
                                Statement stm = con.createStatement();
                                ResultSet rs = stm.executeQuery(query);
                                while (rs.next()) {
                        %>
                        <option value='<%=rs.getString("cat_id")%>' <%if (Integer.parseInt(request.getParameter("cat_id")) == rs.getInt("cat_id")) {%>selected<%}%>><%=rs.getString("cat_name")%></option>
                        <%

                                }
                                rs.close();
                                stm.close();
                            } catch (Exception e) {
                                e.printStackTrace();
                                out.println(e);
                            }

                        %>

                    </select>
                </div>
                <script >

                    function loadCategory() {
                        var cat_id = document.getElementById("sub").value;
                        console.log(cat_id);
                        window.location.replace("courses.jsp?cat_id=" + cat_id);
                    }
                </script>
                <div class="row g-4 justify-content-center mt-5">
                    <%   
                        Connection con;
                        Statement stm;
                        ResultSet rs;
                        try {
                            con = ConnectionProvider.getConnection();
                            String query = "";
                            if (Integer.parseInt(request.getParameter("cat_id")) == -1 || request.getParameter("cat_id") == null) {
                                query = "select * from course ";
                            } else {
                                query = "select * from course where cat_id=" + request.getParameter("cat_id");
                            }
                            stm = con.createStatement();
                            rs = stm.executeQuery(query);
                            while (rs.next()) {

                    %>

                    <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
                        <div class="course-item bg-light">
                            <div class="position-relative overflow-hidden">
                                <img class="img-fluid" src="src/course-img/<%=rs.getString("c_img")%>" style="height:300px; width: 100%; " alt="">
                            </div>
                            <div class="text-center p-4 pb-0">
                                <h3 class="mb-0">₹<%=rs.getString("c_price")%></h3>
                                <h5 class="mb-4"><%=rs.getString("c_name")%></h5>
                            </div>
                            <div class="d-flex border-top">
                                <small class="flex-fill text-center border-end py-2"><i class="fa fa-file text-primary me-2"></i><%=rs.getString("c_mod")%> Modules</small>
                                <small class="flex-fill text-center border-end py-2"><i class="fa fa-clock text-primary me-2"></i><%= rs.getString("c_dur")%> Months</small>
                                <small class="flex-fill text-center py-2 btn-danger text-white"><a href="coursedes.jsp?c_id=<%= rs.getString("c_id")%>" style="text-decoration: none; color: white;"><i class="fa fa-arrow-right text-white me-2"></i>Join Now</a></small>
                            </div>
                        </div>
                    </div>

                    <%

                            }
                            rs.close();
                            stm.close();
                        } catch (Exception e) {
                            out.println(e);
                        }

                    %>
                </div>
            </div>
        </div>
        <!-- Courses End -->




        <footer class="text-center text-lg-start bg-light text-muted">
            <section
                class="d-flex justify-content-center justify-content-lg-between p-4 border-bottom"
                >
                <div class="me-5 d-none d-lg-block">
                    <span>Get connected with us on social networks:</span>
                </div>
                <div>
                    <a href="" class="me-4 text-reset"><i class="fab fa-facebook-f"></i></a>
                    <a href="" class="me-4 text-reset"><i class="fab fa-twitter"></i></a>
                    <a href="" class="me-4 text-reset"><i class="fab fa-google"></i></a>
                    <a href="" class="me-4 text-reset"><i class="fab fa-instagram"></i></a>
                    <a href="" class="me-4 text-reset"><i class="fab fa-linkedin"></i></a>
                    <a href="" class="me-4 text-reset"><i class="fab fa-github"></i></a>
                </div>
            </section>
            <section class="">
                <div class="container text-center text-md-start mt-5">
                    <div class="row mt-3">
                        <div class="col-md-3 col-lg-4 col-xl-3 mx-auto mb-4">
                            <img
                                src="src/icon1.gif"
                                alt="E-Learning Logo"
                                loading="lazy"
                                width="50px"
                                height="50px"
                                />E-Learning
                            <p>
                                We’re committed to changing the future of learning for the better. 
                                Dig into our original research to learn about the forces that are shaping the modern workplace.
                            </p>
                        </div>
                        <div class="col-md-2 col-lg-2 col-xl-2 mx-auto mb-4">
                            <h6 class="text-uppercase fw-bold mb-4">
                                Courses
                            </h6>
                            <p>
                                <a href="#!" class="text-reset">Web Development</a>
                            </p>
                            <p>
                                <a href="#!" class="text-reset">Machine Learning</a>
                            </p>
                            <p>
                                <a href="#!" class="text-reset">Android Development</a>
                            </p>
                            <p>
                                <a href="#!" class="text-reset">Java</a>
                            </p>
                        </div>
                        <div class="col-md-3 col-lg-2 col-xl-2 mx-auto mb-4">
                            <h6 class="text-uppercase fw-bold mb-4">
                                Company
                            </h6>
                            <p>
                                <a href="#!" class="text-reset">About Us</a>
                            </p>
                            <p>
                                <a href="#!" class="text-reset">Our Achievements</a>
                            </p>
                            <p>
                                <a href="#!" class="text-reset">Certificate</a>
                            </p>
                            <p>
                                <a href="#!" class="text-reset">Our Faculties</a>
                            </p>
                        </div>
                        <div class="col-md-4 col-lg-3 col-xl-3 mx-auto mb-md-0 mb-4">
                            <h6 class="text-uppercase fw-bold mb-4">
                                Contact Us
                            </h6>
                            <p><i class="fas fa-home me-3"></i>Pahargaon, Port Blair, South Andaman, A & N islands India.</p>
                            <p>
                                <i class="fas fa-envelope me-3"></i>
                                e-learning@gmail.com
                            </p>
                            <p><i class="fas fa-phone me-3"></i>+3192 3456</p>
                            <p><i class="fas fa-print me-3"></i>+3192 3456</p>
                        </div>
                    </div>
                </div>
            </section>
            <div class="text-center p-4" style="background-color: rgba(0, 0, 0, 0.05);">
                © 2022Copyright:
                <a class="text-reset fw-bold" href="vuddagiripraveen@gmail.com">Prime Autocrats</a>
            </div>
        </footer>

    </body>
</html>
