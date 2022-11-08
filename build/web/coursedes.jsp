

<%@page import="com.learning.entities.student"%>
<%@page import="com.learning.helper.ConnectionProvider"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">

    <head>
        <meta charset="UTF-8">
        <title>Course Details</title>
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="css/coursedes.css">
        <link rel="stylesheet" type="text/css" href="css/cssfile.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/svg-with-js.min.css"
              integrity="sha512-W3ZfgmZ5g1rCPFiCbOb+tn7g7sQWOQCB1AkDqrBG1Yp3iDjY9KYFh/k1AWxrt85LX5BRazEAuv+5DV2YZwghag=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" type="text/css"
              href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" />
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;700&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"
              integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous" />
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script><!-- comment -->
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>

    <body>

        <%

            student st = (student) session.getAttribute("Student");
            
        %>
        
        
        <nav class="navbar navbar-expand-lg navbar-light bg-light" style="width: 100%;">
            <div class="container">
                <a class="navbar-brand me-2" href="index.jsp" id="logo">
                    <img src="src/icon1.gif" alt="E-Learning Logo" loading="lazy" width="50px" height="50px" />
                    E-learning
                </a>

                <button class="navbar-toggler" type="button" data-mdb-toggle="collapse" data-mdb-target="#navbarButtonsExample"
                        aria-controls="navbarButtonsExample" aria-expanded="false" aria-label="Toggle navigation">
                    <i class="fas fa-bars"></i>
                </button>

                <div class="collapse navbar-collapse" id="navbarButtonsExample">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item">
                            <a class="nav-link" href="index.jsp">Home</a>
                            <a class="nav-link" href="courses.jsp?cat_id=-1">Courses</a>
                            <a class="nav-link" href="aboutUs.jsp">About</a>
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
        <%            Connection con;
            Statement stm;
            ResultSet rs;
            String fac_name = "";
            try {
                con = ConnectionProvider.getConnection();
                String query = "";

                query = "select * from course where c_id=" + request.getParameter("c_id");

                stm = con.createStatement();
                rs = stm.executeQuery(query);
                String cat_name = "";
                while (rs.next()) {
                    query = "select * from category where cat_id=" + rs.getString("cat_id");
                    stm = con.createStatement();
                    ResultSet rs2 = stm.executeQuery(query);
                    while (rs2.next()) {
                        cat_name = rs2.getString("cat_name");
                    }
                    query = "select f_name from faculty where f_id=" + rs.getString("f_id");
                    stm = con.createStatement();
                    rs2 = stm.executeQuery(query);
                    while (rs2.next()) {
                        fac_name = rs2.getString("f_name");
                    }
        %>
        <div class="rounded-background-box" style="margin: 30px 0px; ">
            <div class="left-rounded-column">
                <div class="product" style="width: 100%; margin-top: 90px">
                    <img class="tablet float" style="width: 80%; height: 400px" src="src/course-img/<%=rs.getString("c_img")%>" >
                </div>
            </div>
            <div class="right-rounded-column">
                <div class="product-info">
                    <h2><%=rs.getString("c_name")%></h2>
                    <h6> <%=cat_name%> </h6>
                    <h4>₹<%=rs.getString("c_price")%>  </h4>
                    <p><span style="font-weight:300;">Beginner level</span> | <span style="font-weight:300;">Lifetime-access</span> </p>
                    <br>
                    <div>

                        <p style="max-height: 80px; overflow-y: auto;"> 
                            <%=rs.getString("c_desc")%>

                        </p>
                    </div>

                    <div class="d-flex justify-content-between">
                        <p><i class="fa fa-clock"></i>  Duration: <span style="font-weight:500; font-size: 19px; color:blue;"> <%=rs.getString("c_dur")%> Months</span></p>
                        <p ><i class="fa fa-file "></i>  No.of modules: <span style="font-weight:500; font-size: 19px; text-align: right; color:blue"> <%=rs.getString("c_mod")%></span></p>
                    </div>
                </div>
                <div class="cart-price">
                    <%
                        if (st == null) {
                    %>
                    <button class="button2" disabled> Enroll Now </button>
                    <%
                    } else {

                        con = ConnectionProvider.getConnection();
                        String qur = "select * from std_progress where c_id=" + request.getParameter("c_id") + " and s_id=" + st.getId();

                        stm = con.createStatement();
                        ResultSet rs3 = stm.executeQuery(qur);
                        int c_id = 0;
                        while (rs3.next()) {
                            c_id = rs3.getInt("c_id");
                        }
                        if (c_id == Integer.parseInt(request.getParameter("c_id"))) {
                    %>
                    <button class="button2" >Enrolled</button>

                    <%
                    } else {
                    %>
                    <a href="purchaseCourse?c_id=<%=rs.getString("c_id")%>" > <button class="button2" > Enroll Now </button></a>
                    <%}
                        }
                    %>
                </div>
            </div>
        </div>


        <%                }
                rs.close();
                stm.close();
            } catch (Exception e) {
                out.println(e);
            }

        %>

        <%    if (st == null) {
        %>
        <div class="alert alert-danger">Student should be logged in for enrolling into the course.</div>
        <%
            }%>



        <section class="main-content">
            <div class="container">
                <h1 class="text-center text-uppercase">How will your training work?</h1>
                <br /><br />

                <div class="service-box shadow bg-white p-4">
                    <div class="row">
                        <div class="col-sm-4">
                            <div class="card border-top-0 border-bottom-0 border-left-0 border-right">
                                <div class="card-body text-center">
                                    <div class="icon-box icon-box--success">
                                        <i class="fa fa-play fa-2x"></i>
                                    </div>
                                    <h3>Learn concepts</h3>
                                    <p class="text-muted">Go through training videos to learn concepts</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="card border-top-0 border-bottom-0 border-left-0 border-right">
                                <div class="card-body text-center">
                                    <div class="icon-box icon-box--primary">
                                        <i class="fa fa-code fa-2x"></i>
                                    </div>
                                    <h3>Test yourself</h3>
                                    <p class="text-muted">Test your knowledge through quizzes & module tests at regular intervals</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="card border-0 ">
                                <div class="card-body text-center">
                                    <div class="icon-box icon-box--success">
                                        <i class="fa fa-envelope fa-2x"></i>
                                    </div>
                                    <h3>1:1 doubt solving</h3>
                                    <p class="text-muted">Get your doubts solved by experts through Q&A forum within 24 hours</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="card border-top-0 border-bottom-0 border-left-0 border-right">
                                <div class="card-body text-center">
                                    <div class="icon-box icon-box--success">
                                        <i class="fa fa-pencil-square-o fa-2x"></i>
                                    </div>
                                    <h3>Take final exam and Project submission</h3>
                                    <p class="text-muted">Complete your training by taking the final exam and also submitting hte project
                                    </p>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="card border-top-0 border-bottom-0 border-left-0 border-right">
                                <div class="card-body text-center">
                                    <div class="icon-box icon-box--warning">
                                        <i class="fa fa-graduation-cap fa-2x"></i>
                                    </div>
                                    <h3>Get certified</h3>
                                    <p class="text-muted">Get certified in Python upon successful completion of training</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="card border-0 ">
                                <div class="card-body text-center">
                                    <div class="icon-box icon-box--success">
                                        <i class="fa fa-file-archive-o fa-2x"></i>
                                    </div>
                                    <h3>Downloadable Content</h3>
                                    <p class="text-muted">Downloadable content with lifetime access</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>



        <section class="team-section py-5">
            <h1 class="text-center text-uppercase">Your Teachers</h1>
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-12 col-md-6 col-lg-4">
                        <div class="card border-0 shadow-lg pt-5 my-5 position-relative">
                            <div class="card-body p-4">
                                <div class="member-profile position-absolute w-100 text-center">
                                    <img class="rounded-circle mx-auto d-inline-block shadow-sm"
                                         src="https://bootdey.com/img/Content/avatar/avatar8.png" alt="">
                                </div>
                                <div class="card-text pt-1">
                                    <h5 class="member-name mb-0 text-center text-primary font-weight-bold"> <%=fac_name%> </h5>
                                    <div class="mt-3 ">Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Vivamus
                                        eget eros vestibulum, accumsan ante viverra, condimentum tellus. </div>
                                </div>
                            </div>
                            <!--//card-body-->
                            <div class="card-footer theme-bg-primary border-0 text-center">
                                <ul class="social-list list-inline mb-0 mx-auto">
                                    <li class="list-inline-item"><a class="text-dark" href="#"><svg
                                                class="svg-inline--fa fa-twitter fa-w-16 fa-fw" aria-hidden="true" focusable="false"
                                                data-prefix="fab" data-icon="twitter" role="img" xmlns="http://www.w3.org/2000/svg"
                                                viewBox="0 0 512 512" data-fa-i2svg="">
                                            <path fill="currentColor"
                                                  d="M459.37 151.716c.325 4.548.325 9.097.325 13.645 0 138.72-105.583 298.558-298.558 298.558-59.452 0-114.68-17.219-161.137-47.106 8.447.974 16.568 1.299 25.34 1.299 49.055 0 94.213-16.568 130.274-44.832-46.132-.975-84.792-31.188-98.112-72.772 6.498.974 12.995 1.624 19.818 1.624 9.421 0 18.843-1.3 27.614-3.573-48.081-9.747-84.143-51.98-84.143-102.985v-1.299c13.969 7.797 30.214 12.67 47.431 13.319-28.264-18.843-46.781-51.005-46.781-87.391 0-19.492 5.197-37.36 14.294-52.954 51.655 63.675 129.3 105.258 216.365 109.807-1.624-7.797-2.599-15.918-2.599-24.04 0-57.828 46.782-104.934 104.934-104.934 30.213 0 57.502 12.67 76.67 33.137 23.715-4.548 46.456-13.32 66.599-25.34-7.798 24.366-24.366 44.833-46.132 57.827 21.117-2.273 41.584-8.122 60.426-16.243-14.292 20.791-32.161 39.308-52.628 54.253z">
                                            </path>
                                            </svg><!-- <i class="fab fa-twitter fa-fw"></i> Font Awesome fontawesome.com --></a></li>
                                    <li class="list-inline-item"><a class="text-dark" href="#"><svg
                                                class="svg-inline--fa fa-facebook-f fa-w-10 fa-fw" aria-hidden="true" focusable="false"
                                                data-prefix="fab" data-icon="facebook-f" role="img" xmlns="http://www.w3.org/2000/svg"
                                                viewBox="0 0 320 512" data-fa-i2svg="">
                                            <path fill="currentColor"
                                                  d="M279.14 288l14.22-92.66h-88.91v-60.13c0-25.35 12.42-50.06 52.24-50.06h40.42V6.26S260.43 0 225.36 0c-73.22 0-121.08 44.38-121.08 124.72v70.62H22.89V288h81.39v224h100.17V288z">
                                            </path>
                                            </svg><!-- <i class="fab fa-facebook-f fa-fw"></i> Font Awesome fontawesome.com --></a></li>
                                    <li class="list-inline-item"><a class="text-dark" href="#"><svg
                                                class="svg-inline--fa fa-instagram fa-w-14 fa-fw" aria-hidden="true" focusable="false"
                                                data-prefix="fab" data-icon="instagram" role="img" xmlns="http://www.w3.org/2000/svg"
                                                viewBox="0 0 448 512" data-fa-i2svg="">
                                            <path fill="currentColor"
                                                  d="M224.1 141c-63.6 0-114.9 51.3-114.9 114.9s51.3 114.9 114.9 114.9S339 319.5 339 255.9 287.7 141 224.1 141zm0 189.6c-41.1 0-74.7-33.5-74.7-74.7s33.5-74.7 74.7-74.7 74.7 33.5 74.7 74.7-33.6 74.7-74.7 74.7zm146.4-194.3c0 14.9-12 26.8-26.8 26.8-14.9 0-26.8-12-26.8-26.8s12-26.8 26.8-26.8 26.8 12 26.8 26.8zm76.1 27.2c-1.7-35.9-9.9-67.7-36.2-93.9-26.2-26.2-58-34.4-93.9-36.2-37-2.1-147.9-2.1-184.9 0-35.8 1.7-67.6 9.9-93.9 36.1s-34.4 58-36.2 93.9c-2.1 37-2.1 147.9 0 184.9 1.7 35.9 9.9 67.7 36.2 93.9s58 34.4 93.9 36.2c37 2.1 147.9 2.1 184.9 0 35.9-1.7 67.7-9.9 93.9-36.2 26.2-26.2 34.4-58 36.2-93.9 2.1-37 2.1-147.8 0-184.8zM398.8 388c-7.8 19.6-22.9 34.7-42.6 42.6-29.5 11.7-99.5 9-132.1 9s-102.7 2.6-132.1-9c-19.6-7.8-34.7-22.9-42.6-42.6-11.7-29.5-9-99.5-9-132.1s-2.6-102.7 9-132.1c7.8-19.6 22.9-34.7 42.6-42.6 29.5-11.7 99.5-9 132.1-9s102.7-2.6 132.1 9c19.6 7.8 34.7 22.9 42.6 42.6 11.7 29.5 9 99.5 9 132.1s2.7 102.7-9 132.1z">
                                            </path>
                                            </svg><!-- <i class="fab fa-instagram fa-fw"></i> Font Awesome fontawesome.com --></a></li>
                                </ul>
                                <!--//social-list-->
                            </div>
                            <!--//card-footer-->
                        </div>
                        <!--//card-->
                    </div>
                    <!--//col-->


                </div>
                <!--//row-->

            </div>

        </section>



        <footer class="text-center text-lg-start bg-light text-muted">
            <section class="d-flex justify-content-center justify-content-lg-between p-4 border-bottom">
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
                            <img src="src/icon1.gif" alt="E-Learning Logo" loading="lazy" width="50px" height="50px" />E-Learning
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
                <a class="text-reset fw-bold" href="www.primeautocrats.com">Prime Autocrats</a>
            </div>
        </footer>