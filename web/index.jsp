<%-- 
    Document   : homepage
    Created on : 24-May-2022, 10:27:50 pm
    Author     : praveen vuddagiri
--%>

<%@page import="com.learning.entities.student"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <main>
        <head>
            <title>Welcome to E-Learning LMS</title>
            <link rel = "icon" href = "src/icon1.gif" type = "image/x-icon">
            <link rel="stylesheet" type="text/css" href="css/cssfile.css">
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous"> 
            <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;700&display=swap" rel="stylesheet">
            <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous"/>
            <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" />
        </head>
        <body>

            <%

                student st = (student) session.getAttribute("Student");

            %>
            <div id="homepage">
                <div id="first-section">
                    <nav class="navbar navbar-expand-lg navbar-light bg-light">
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
                                        <a class="nav-link" id="nav_home" href="#">Home</a>
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
                                    <a href="adminLogin.jsp">
                                        <button type="button" class="btn btn-warning me-3 ">
                                            Admin Login
                                        </button>
                                    </a>

                                    <a href="facultyLogin.jsp">
                                        <button type="button" class="btn btn-info me-3">
                                            Faculty Login
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
                                    <a href="adminLogout">
                                        <button type="button" class="btn btn-danger me-3">
                                            Sign Out
                                        </button>
                                    </a>
                                </div>
                                <%}%>

                            </div>
                        </div>
                    </nav>

                    <img align="right" src="src/firstvector.png" alt="vector image" width="500" height="500" style="margin-right: 120px; margin-top:5%;" class="vectorimg1">
                    <div id="first-section-text-box">
                        <b style="font-size:50px; color:bisque;">Welcome to our E-Learning portal.</b>
                        <br>
                        <br>
                        <p style="font-size:23px; color:bisque; font-weight: 300;">Open your door to more with world-class Professional Certificates and degrees.<p>
                    </div>
                    <div class="ocean">
                        <div class="wave"></div>
                        <div class="wave"></div>
                        <div class="wave"></div>
                    </div>
                </div>
                <div id="second-section">
                    <center><h1 class="aboutus" style="padding-top:5%;">About Us</h1></center>
                    <img align="left" src="src/About us.png" alt="vector image" width="500" height="500" style="margin-left: 120px; margin-top:1%;" class="vectorimg2">
                    <div id="aboutcontent">
                        <h3 style="color: rgb(124, 124, 240);">Changing learning for the better</h3>
                        <p>We help organizations of all types and sizes prepare for the path ahead — wherever it leads. Our curated collection of business and technical courses help companies, governments, and nonprofits go further by placing learning at the center of their strategies.
                            <br>
                            <br>
                            We At "E-Learning" Believe In Making Our Youth Especially The Students Self-Aware And Exploring The
                            Untouched World Of Technology And Tremendous Growth-Making Fields.
                            We Believes In Bridging The Gap Between Students And Their Knowledge In The Industrial Field &amp; Bringing Them
                            A Step Closer To Their Dream. We Are MSME Registered Start-Up, Always Open To Connect New People With Us
                            Over This Journey Of Endless Learning And Great Joy!
                        </p>
                    </div>
                </div>
                <div id="third-section">
                    <center><h1 class="ourachievements" style="padding-top:5%; color:rgb(124, 124, 243);">Our Achievements</h1></center>
                    <div class="a-cards">
                        <div class="card">
                            <i class="fab fa-google"></i>
                            <h4 style="color:rgb(0, 0, 0);">100+</h4>
                            <p>Students from E-Learning are placed in Google LLC, offering CTC 5 Lacs p.a. or above.</p>
                        </div>

                        <div class="card">
                            <i class="fab fa-microsoft"></i>
                            <h4 style="color:rgb(0, 0, 0);">150+</h4>
                            <p>Students from E-Learning are placed in Microsoft, offering CTC 7 Lacs p.a. or above.</p>
                        </div>

                        <div class="card">
                            <i class="fab fa-apple"></i>
                            <h4 style="color:rgb(0, 0, 0);">200+</h4>
                            <p>Students from E-Learning are placed in Apple Inc., offering CTC 9 Lacs p.a. or above.</p>
                        </div>
                    </div>
                </div>
                <div id="fourth-section">
                    <center><h1 class="certificate" style="padding-top:5%; color:rgb(124, 124, 243);">Certificate</h1></center>
                    <img align="right" src="src/certificate.png" alt="vector image" width="600" height="400" style="margin-right: 120px; margin-top:3%; box-shadow: 2px 2px 8px;" class="certificateimg">
                    <div id="aboutcertificate">
                        <h3 style="color: rgb(0, 0, 0);">Certificate of Completion</h3>
                        <p>Training certificate will be given to each enrolled student on completing the required internship guidelines. There is no Fee or Charges for issuing internship certificate to students.
                            <br>
                            <br>
                            Approved from AICTE & MSME.
                        </p>
                        <img src="src/aicte.png" alt="aicte" width="70px" height="70px">
                        <img src="src/msme.png" alt="msme" width="140px" height="70px">
                    </div>
                    <div class="oa-wave2"></div>
                </div>
                <div id="fifth-section">
                    <center><h1 class="certificate" style="padding-top:5%; color:rgb(255, 255, 255);">Our Faculties</h1></center>
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-12 col-sm-8 col-lg-6">
                                <div class="section_heading text-center wow fadeInUp" data-wow-delay="0.2s" style="visibility: visible; animation-delay: 0.2s; animation-name: fadeInUp;">
                                    <p style="color: white;">Instructors from around the world teach millions of students on E-Learning. We provide the tools and skills to teach what you love.</p>
                                    <div class="line"></div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-12 col-sm-6 col-lg-3">
                                <div class="single_advisor_profile wow fadeInUp" data-wow-delay="0.2s" style="visibility: visible; animation-delay: 0.2s; animation-name: fadeInUp;">
                                    <div class="advisor_thumb"><img src="https://bootdey.com/img/Content/avatar/avatar1.png" alt="">

                                        <div class="social-info"><a href="#"><i class="fa fa-facebook"></i></a><a href="#"><i class="fa fa-twitter"></i></a><a href="#"><i class="fa fa-linkedin"></i></a></div>
                                    </div>

                                    <div class="single_advisor_details_info">
                                        <h6>Rohit Singh</h6>
                                        <p class="designation">Web &amp; Developer</p>
                                    </div>
                                </div>
                            </div>

                            <div class="col-12 col-sm-6 col-lg-3">
                                <div class="single_advisor_profile wow fadeInUp" data-wow-delay="0.3s" style="visibility: visible; animation-delay: 0.3s; animation-name: fadeInUp;">

                                    <div class="advisor_thumb"><img src="https://bootdey.com/img/Content/avatar/avatar7.png" alt="">

                                        <div class="social-info"><a href="#"><i class="fa fa-facebook"></i></a><a href="#"><i class="fa fa-twitter"></i></a><a href="#"><i class="fa fa-linkedin"></i></a></div>
                                    </div>

                                    <div class="single_advisor_details_info">
                                        <h6>Suresh Dev</h6>
                                        <p class="designation">AI/ML Expert</p>
                                    </div>
                                </div>
                            </div>

                            <div class="col-12 col-sm-6 col-lg-3">
                                <div class="single_advisor_profile wow fadeInUp" data-wow-delay="0.4s" style="visibility: visible; animation-delay: 0.4s; animation-name: fadeInUp;">

                                    <div class="advisor_thumb"><img src="https://bootdey.com/img/Content/avatar/avatar6.png" alt="">

                                        <div class="social-info"><a href="#"><i class="fa fa-facebook"></i></a><a href="#"><i class="fa fa-twitter"></i></a><a href="#"><i class="fa fa-linkedin"></i></a></div>
                                    </div>

                                    <div class="single_advisor_details_info">
                                        <h6>Varun Sharma</h6>
                                        <p class="designation">Java Developer</p>
                                    </div>
                                </div>
                            </div>

                            <div class="col-12 col-sm-6 col-lg-3">
                                <div class="single_advisor_profile wow fadeInUp" data-wow-delay="0.5s" style="visibility: visible; animation-delay: 0.5s; animation-name: fadeInUp;">

                                    <div class="advisor_thumb"><img src="https://bootdey.com/img/Content/avatar/avatar2.png" alt="">

                                        <div class="social-info"><a href="#"><i class="fa fa-facebook"></i></a><a href="#"><i class="fa fa-twitter"></i></a><a href="#"><i class="fa fa-linkedin"></i></a></div>
                                    </div>

                                    <div class="single_advisor_details_info">
                                        <h6>Vinay Raj</h6>
                                        <p class="designation">Android Developer</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="sixth-section">
                    <center><h1 class="topratings" style="padding-top:5%; color:rgb(255, 255, 255);">Top Reviews</h1></center>
                    <div id="test">
                        <figure class="snip1390">
                            <img src="src/rahul-kumar.jpg" alt="profile-sample3" class="profile" />
                            <figcaption>
                                <h2>Rahul Kumar</h2>
                                <h4>UX Design</h4>
                                <blockquote>E-Learning fit us like a glove. Their team curates fresh, up-to-date courses from their marketplace and makes them available to customers.</blockquote>
                            </figcaption>
                        </figure>
                        <figure class="snip1390 hover"><img src="src/divya-sharma.jpg" alt="profile-sample5" class="profile" />
                            <figcaption>
                                <h2>Divya Sharma</h2>
                                <h4>Accountant</h4>
                                <blockquote>In total, it was a big success, I would get emails about what a fantastic resource it was. I recommend everyone to get Registered here.</blockquote>
                            </figcaption>
                        </figure>
                        <figure class="snip1390"><img src="src/anil-singh.jpg" alt="profile-sample6" class="profile" />
                            <figcaption>
                                <h2>Anil Singh</h2>
                                <h4>Public Relations</h4>
                                <blockquote>E-Learning responds to the needs of the business in an agile and global manner. It’s truly the best solution for our employees and their careers.</blockquote>
                            </figcaption>
                        </figure>
                    </div>
                    <div id="svgfooter"></div>
                </div>
                <div id="footer">
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
                                            <a href="#second-section" class="text-reset">About Us</a>
                                        </p>
                                        <p>
                                            <a href="#third-section" class="text-reset">Our Achievements</a>
                                        </p>
                                        <p>
                                            <a href="#fourth-section" class="text-reset">Certificate</a>
                                        </p>
                                        <p>
                                            <a href="#fifth-section" class="text-reset">Our Faculties</a>
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
                                        <p><i class="fas fa-phone me-3"></i>+91 92212-34561</p>
                                        <p><i class="fas fa-print me-3"></i>+91 92221-34562</p>
                                    </div>
                                </div>
                            </div>
                        </section>
                        <div class="text-center p-4" style="background-color: rgba(0, 0, 0, 0.05);">
                            © 2022Copyright:
                            <a class="text-reset fw-bold" href="homepage.html">E-Learning</a>
                        </div>
                    </footer>
                </div>
            </div>

        </body>
    </main>
</html>
