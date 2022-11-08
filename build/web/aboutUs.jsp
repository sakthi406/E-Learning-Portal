<%-- 
    Document   : aboutUs
    Created on : 07-Jun-2022, 7:33:09 am
    Author     : praveen vuddagiri
--%>

<%@page import="com.learning.entities.student"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta content="width=device-width, initial-scale=1.0" name="viewport">

        <title>About Us</title>
        <meta content="" name="description">
        <meta content="" name="keywords">

        <!-- Favicons -->
        <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

        <!-- Google Fonts -->
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

        <!-- Vendor CSS Files -->
        <link href="assets/vendor/aos/aos.css" rel="stylesheet">
        <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
        <link href="assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
        <link href="assets/vendor/remixicon/remixicon.css" rel="stylesheet">
        <link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

        <!-- Template Main CSS File -->
        <link href="assets/css/style.css" rel="stylesheet">


    </head>

    <body>
        <%

            student st = (student) session.getAttribute("Student");

        %>
        <!-- ======= Header ======= -->
        <i class="bi bi-list mobile-nav-toggle"></i>

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
                    E-Learning
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
                            <a class="nav-link" href="index.jsp">Home</a>
                            <a class="nav-link" href="courses.jsp?cat_id=-1">Courses</a>                  
                            <a class="nav-link" href="aboutUs.jsp" id="nav_home">About Us</a>

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
            </div>
        </nav>
        <!-- ======= Hero Section ======= -->
        <section id="hero" class="hero d-flex align-items-center">

            <div class="container">
                <div class="row">
                    <h1 data-aos="fade-up" style="align-items: center;">We share knowledge with the world</h1>
                    <div class="col-lg-6 d-flex flex-column justify-content-center">
                        <h4 data-aos="fade-up">Open your door to more with world-class Professional Certificates and degrees.</h4>
                        <p><br>We provide various accessible study materials, interactive classes and courses on different topics through this portal as learners can access material at any time they want. <br> <br>Students who reside at places that are distant to the physical classrooms or those who do not have the time to be with the instructor, have the luxury of choosing a time of their convenience, to go through school coursework. </p>
                        <div data-aos="fade-up" data-aos-delay="600">
                            <div class="text-center text-lg-start">
                                <a href="#about" class="btn-get-started scrollto d-inline-flex align-items-center justify-content-center align-self-center">
                                    <span>Get Started</span>
                                    <i class="bi bi-arrow-right"></i>
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 hero-img" data-aos="zoom-out" data-aos-delay="200">
                        <img src="assets/img/hero-img.png" class="img-fluid" alt="">
                    </div>
                </div>
            </div>

        </section><!-- End Hero -->

        <main id="main">
            <!-- ======= About Section ======= -->
            <section id="about" class="about">

                <div class="container" data-aos="fade-up">
                    <div class="row gx-0">

                        <div class="col-lg-6 d-flex flex-column justify-content-center" data-aos="fade-up" data-aos-delay="200">
                            <div class="content">
                                <h1>ABOUT US</h1><br>
                                <h2>E-Learning is reliable, dependable and accessible around the clock via an internet connection.</h2>
                                <p>
                                    Our exceptional staff of over 800+ valued employees who are highly motivated to work at a successful company. <br><br>They are trained in technology and skilled in the English language to ensure we not only provide first class solutions but can communicate effectively with clients globally.<br><br>Tried and tested processes ensure a smooth process from project initiation through to delivery and support.
                                </p>
                                <div class="text-center text-lg-start">
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-6 d-flex align-items-center" data-aos="zoom-out" data-aos-delay="200">
                            <img src="assets/img/about.jpg" class="img-fluid" alt="">
                        </div>

                    </div>
                </div>

            </section><!-- End About Section -->

            <!-- ======= Values Section ======= -->
            <section id="values" class="values">

                <div class="container" data-aos="fade-up">

                    <header class="section-header">
                        <h2>SERVICES</h2>
                        <p>What are the services we provide?</p>
                    </header>

                    <div class="row">

                        <div class="col-lg-4" data-aos="fade-up" data-aos-delay="200">
                            <div class="box">
                                <img src="assets/img/values-1.png" class="img-fluid" alt="">
                                <h3>Course Management</h3>
                                <p>Provide structure to their training process and easily manage training content.</p>
                            </div>
                        </div>

                        <div class="col-lg-4 mt-4 mt-lg-0" data-aos="fade-up" data-aos-delay="400">
                            <div class="box">
                                <img src="assets/img/values-2.png" class="img-fluid" alt="">
                                <h3>E-Notes Management</h3>
                                <p>Helps users to upload, download and manage notes of their particular course.</p>
                            </div>
                        </div>

                        <div class="col-lg-4 mt-4 mt-lg-0" data-aos="fade-up" data-aos-delay="600">
                            <div class="box">
                                <img src="assets/img/values-3.png" class="img-fluid" alt="">
                                <h3>Student Management</h3>
                                <p>Keep track of all the activities done by each student in an easy and efficient way.</p>
                            </div>
                        </div>

                    </div>

                </div>

            </section><!-- End Values Section -->

            <!-- ======= Counts Section ======= -->
            <section id="counts" class="counts">
                <div class="container" data-aos="fade-up">

                    <div class="row gy-4">

                        <div class="col-lg-3 col-md-6">
                            <div class="count-box">
                                <i class="bi bi-emoji-smile"></i>
                                <div>
                                    <span data-purecounter-start="0" data-purecounter-end="232" data-purecounter-duration="1" class="purecounter"></span>
                                    <p>Happy Students</p>
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-3 col-md-6">
                            <div class="count-box">
                                <i class="bi bi-journal-richtext" style="color: #ee6c20;"></i>
                                <div>
                                    <span data-purecounter-start="0" data-purecounter-end="521" data-purecounter-duration="1" class="purecounter"></span>
                                    <p>Projects</p>
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-3 col-md-6">
                            <div class="count-box">
                                <i class="bi bi-headset" style="color: #15be56;"></i>
                                <div>
                                    <span data-purecounter-start="0" data-purecounter-end="1463" data-purecounter-duration="1" class="purecounter"></span>
                                    <p>Hours Of Support</p>
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-3 col-md-6">
                            <div class="count-box">
                                <i class="bi bi-people" style="color: #bb0852;"></i>
                                <div>
                                    <span data-purecounter-start="0" data-purecounter-end="15" data-purecounter-duration="1" class="purecounter"></span>
                                    <p>Hard Workers</p>
                                </div>
                            </div>
                        </div>

                    </div>

                </div>
            </section><!-- End Counts Section -->

            <!-- ======= Features Section ======= -->
            <section id="features" class="features">

                <div class="container" data-aos="fade-up">

                    <header class="section-header">
                        <h2>Features</h2>
                        <p>Why is it so great?</p>
                    </header>

                    <div class="row">

                        <div class="col-lg-6">
                            <img src="assets/img/features.png" class="img-fluid" alt="">
                        </div>

                        <div class="col-lg-6 mt-5 mt-lg-0 d-flex">
                            <div class="row align-self-center gy-4">

                                <div class="col-md-6" data-aos="zoom-out" data-aos-delay="200">
                                    <div class="feature-box d-flex align-items-center">
                                        <i class="bi bi-check"></i>
                                        <h3>Personalized learning</h3>
                                    </div>
                                </div>

                                <div class="col-md-6" data-aos="zoom-out" data-aos-delay="300">
                                    <div class="feature-box d-flex align-items-center">
                                        <i class="bi bi-check"></i>
                                        <h3>Friendly User Interface</h3>
                                    </div>
                                </div>

                                <div class="col-md-6" data-aos="zoom-out" data-aos-delay="400">
                                    <div class="feature-box d-flex align-items-center">
                                        <i class="bi bi-check"></i>
                                        <h3>Ease of access</h3>
                                    </div>
                                </div>

                                <div class="col-md-6" data-aos="zoom-out" data-aos-delay="500">
                                    <div class="feature-box d-flex align-items-center">
                                        <i class="bi bi-check"></i>
                                        <h3>Convenient & Flexible</h3>
                                    </div>
                                </div>

                                <div class="col-md-6" data-aos="zoom-out" data-aos-delay="600">
                                    <div class="feature-box d-flex align-items-center">
                                        <i class="bi bi-check"></i>
                                        <h3>24x7 Availability</h3>
                                    </div>
                                </div>

                                <div class="col-md-6" data-aos="zoom-out" data-aos-delay="700">
                                    <div class="feature-box d-flex align-items-center">
                                        <i class="bi bi-check"></i>
                                        <h3>Cost Effective</h3>
                                    </div>
                                </div>

                            </div>
                        </div>

                    </div> <!-- / row -->

                    <!-- Feature Tabs -->
                    <div class="row feture-tabs" data-aos="fade-up">
                        <div class="col-lg-6">
                            <h3>Why we need E-Learning?</h3>

                            <!-- Tab Content -->
                            <div class="tab-content">

                                <div class="tab-pane fade show active" id="tab1">
                                    <p>A drastic shift to electronic learning after the pandemic has brought limitless advantages to students. The Ministry of Electronics and Information Technology identifies online learning as an essential tool for imparting education. The advancement of technology has made access to information quicker. <br><br>Let’s decode how e-learning is creating an impact in the education sector: .</p>
                                    <div class="d-flex align-items-center mb-2">
                                        <i class="bi bi-check2"></i>
                                        <h4>Quick Delivery of Lessons</h4>
                                    </div>
                                    <p>Post-2020, students have adapted the e-learning concept completely. One of the reasons for it is quick access to lessons. In comparison to the traditional teaching mode, online learning has relatively faster delivery access. .</p>
                                    <div class="d-flex align-items-center mb-2">
                                        <i class="bi bi-check2"></i>
                                        <h4>Scalability</h4>
                                    </div>
                                    <p>Online learning helps students to create and communicate new ideas. You get the chance to uplift your skills and gain knowledge apart from school education. One of the prime importance of e-learning is that it helps students and teachers develop advanced skills.</p>
                                </div><!-- End Tab 1 Content -->

                                <div class="tab-pane fade show" id="tab2">
                                    <p>Consequuntur inventore voluptates consequatur aut vel et. Eos doloribus expedita. Sapiente atque consequatur minima nihil quae aspernatur quo suscipit voluptatem.</p>
                                    <div class="d-flex align-items-center mb-2">
                                        <i class="bi bi-check2"></i>
                                        <h4>Repudiandae rerum velit modi et officia quasi facilis</h4>
                                    </div>
                                    <p>Laborum omnis voluptates voluptas qui sit aliquam blanditiis. Sapiente minima commodi dolorum non eveniet magni quaerat nemo et.</p>
                                    <div class="d-flex align-items-center mb-2">
                                        <i class="bi bi-check2"></i>
                                        <h4>Incidunt non veritatis illum ea ut nisi</h4>
                                    </div>
                                    <p>Non quod totam minus repellendus autem sint velit. Rerum debitis facere soluta tenetur. Iure molestiae assumenda sunt qui inventore eligendi voluptates nisi at. Dolorem quo tempora. Quia et perferendis.</p>
                                </div><!-- End Tab 2 Content -->

                            </div>

                        </div>

                        <div class="col-lg-6">
                            <img src="assets/img/features-2.png" class="img-fluid" alt="">
                        </div>

                    </div><!-- End Feature Tabs -->


                    <!-- ======= Pricing Section ======= -->
                    <section id="pricing" class="pricing">

                        <div class="container" data-aos="fade-up">

                            <header class="section-header">
                                <h2>Pricing</h2>
                                <p>Check our Pricing</p>
                            </header>

                            <div class="row gy-4" data-aos="fade-left">

                                <div class="col-lg-3 col-md-6" data-aos="zoom-in" data-aos-delay="100">
                                    <div class="box">
                                        <h3 style="color: #07d5c0; font-weight: bold; font-family: Arial, Helvetica, sans-serif">Java Programming</h3>
                                        <div class="price"><sup>₹</sup>499</div>
                                        <img src="assets/img/java.png" class="img-fluid" alt="">
                                        <ul>
                                            <li>Master Java</li>
                                            <li>basics and concepts</li>
                                            <li>of Object Oriented </li>
                                            <li>Programming and develop</li>
                                            <li>an awesome game</li>
                                        </ul>
                                        <a href="#" class="btn-buy">Buy Now</a>
                                    </div>
                                </div>

                                <div class="col-lg-3 col-md-6" data-aos="zoom-in" data-aos-delay="200">
                                    <div class="box">
                                        <h3 style="color: #65c600; font-weight: bold; font-family: Arial, Helvetica, sans-serif">Web Development</h3>
                                        <div class="price"><sup>₹</sup>2799</div>
                                        <img src="assets/img/web-development.png" class="img-fluid" alt="">
                                        <ul>
                                            <li>Learn HTML/CSS,</li>    
                                            <li>MySQL, PHP,</li>
                                            <li>JavaScript, and React</li>
                                            <li>and build a website</li>
                                            <li>from scratch!</li>
                                        </ul>
                                        <a href="#" class="btn-buy">Buy Now</a>
                                    </div>
                                </div>

                                <div class="col-lg-3 col-md-6" data-aos="zoom-in" data-aos-delay="300">
                                    <div class="box">
                                        <h3 style="color: #ff901c; font-weight: bold; font-family: Arial, Helvetica, sans-serif">Machine learning</h3>
                                        <div class="price"><sup>₹</sup>399</div>
                                        <img src="assets/img/machine-learning.png" class="img-fluid" alt="">
                                        <ul>
                                            <li>Learn Python and </li>   
                                            <li>6 most important Machine</li>
                                            <li>Learning algorithms</li>
                                            <li>to build predictive</li>
                                            <li>models</li>
                                        </ul>
                                        <a href="#" class="btn-buy">Buy Now</a>
                                    </div>
                                </div>

                                <div class="col-lg-3 col-md-6" data-aos="zoom-in" data-aos-delay="400">
                                    <div class="box">
                                        <h3 style="color: #ff0071; font-weight: bold; font-family: Arial, Helvetica, sans-serif">Android Development</h3>
                                        <div class="price"><sup>₹</sup>679</div>
                                        <img src="assets/img/android.png" class="img-fluid" alt="">
                                        <ul>
                                            <li>Learn XML and Kotlin</li>    
                                            <li>and how to put them</li>
                                            <li>together to build</li>
                                            <li>your own Zomato,</li>
                                            <li>Instagram or any other app</li>
                                        </ul>
                                        <a href="#" class="btn-buy">Buy Now</a>
                                    </div>
                                </div>

                            </div>

                        </div>

                    </section><!-- End Pricing Section -->

                    <!-- ======= F.A.Q Section ======= -->
                    <section id="faq" class="faq">

                        <div class="container" data-aos="fade-up">

                            <header class="section-header">
                                <h2>F.A.Q</h2>
                                <p>Frequently Asked Questions</p>
                            </header>

                            <div class="row">
                                <div class="col-lg-6">
                                    <!-- F.A.Q List 1-->
                                    <div class="accordion accordion-flush" id="faqlist1">
                                        <div class="accordion-item">
                                            <h2 class="accordion-header">
                                                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#faq-content-1">
                                                    How do I purchase a course?
                                                </button>
                                            </h2>
                                            <div id="faq-content-1" class="accordion-collapse collapse" data-bs-parent="#faqlist1">
                                                <div class="accordion-body">
                                                    To purchase your course online just follow the "course" link mention at the bottom of the page. Online purchases can either be paid for immediately by credit/debit card, you can nominate somebody else to pay on your behalf, or an invoice can be requested. Existing Members login using their existing membership number and password. New Members must register their details first.
                                                </div>
                                            </div>
                                        </div>

                                        <div class="accordion-item">
                                            <h2 class="accordion-header">
                                                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#faq-content-2">
                                                    How do I access the courses I have paid for?
                                                </button>
                                            </h2>
                                            <div id="faq-content-2" class="accordion-collapse collapse" data-bs-parent="#faqlist1">
                                                <div class="accordion-body">
                                                    On completing the online purchase process you will have immediate access to your course. Please click 'E-Learning' at the top of the page. 
                                                </div>
                                            </div>
                                        </div>

                                        <div class="accordion-item">
                                            <h2 class="accordion-header">
                                                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#faq-content-3">
                                                    How long do I have access to my purchased course?
                                                </button>
                                            </h2>
                                            <div id="faq-content-3" class="accordion-collapse collapse" data-bs-parent="#faqlist1">
                                                <div class="accordion-body">
                                                    You have access to the courses you have purchased indefinitely.  Access to the assessment will be for a 12-month period from the date of purchase.
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                </div>

                                <div class="col-lg-6">

                                    <!-- F.A.Q List 2-->
                                    <div class="accordion accordion-flush" id="faqlist2">

                                        <div class="accordion-item">
                                            <h2 class="accordion-header">
                                                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#faq2-content-1">
                                                    Is my purchased course transferable?
                                                </button>
                                            </h2>
                                            <div id="faq2-content-1" class="accordion-collapse collapse" data-bs-parent="#faqlist2">
                                                <div class="accordion-body">
                                                    No. Your course cannot be transferred to anyone else.
                                                </div>
                                            </div>
                                        </div>

                                        <div class="accordion-item">
                                            <h2 class="accordion-header">
                                                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#faq2-content-2">
                                                    Do I have to complete a course in one go?
                                                </button>
                                            </h2>
                                            <div id="faq2-content-2" class="accordion-collapse collapse" data-bs-parent="#faqlist2">
                                                <div class="accordion-body">
                                                    No, you can visit it at anytime, wherever you are. Each course is made up of a number of individual modules which enables you to complete it in your own time and at times convenient to you. If you wish to return to the course at the point you last left it at, please ensure you use the same device to access the course and do not clear your cache in between visits.
                                                </div>
                                            </div>
                                        </div>

                                        <div class="accordion-item">
                                            <h2 class="accordion-header">
                                                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#faq2-content-3">
                                                    Do I receive a certificate?
                                                </button>
                                            </h2>
                                            <div id="faq2-content-3" class="accordion-collapse collapse" data-bs-parent="#faqlist2">
                                                <div class="accordion-body">
                                                    Training certificate will be given to each enrolled student on completing the required internship guidelines. There is no Fee or Charges for issuing internship certificate to students. Approved from AICTE & MSME.
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                </div>

                            </div>

                        </div>

                    </section><!-- End F.A.Q Section -->

                    <!-- ======= Testimonials Section ======= -->
                    <section id="testimonials" class="testimonials">

                        <div class="container" data-aos="fade-up">

                            <header class="section-header">
                                <h2>Testimonials</h2>
                                <p>What they are saying about us</p>
                            </header>

                            <div class="testimonials-slider swiper" data-aos="fade-up" data-aos-delay="200">
                                <div class="swiper-wrapper">

                                    <div class="swiper-slide">
                                        <div class="testimonial-item">
                                            <div class="stars">
                                                <i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i>
                                            </div>
                                            <p>
                                                I wanted to take an opportunity to send kudos for Justin Hubbard. His level of service is simply outstanding. It is a wonderful opportunity to partner with E-Learning.
                                            </p>
                                            <div class="profile mt-auto">
                                                <img src="assets/img/testimonials/testimonials-1.jpg" class="testimonial-img" alt="">
                                                <h3>Gary Crites</h3>
                                                <h4>Training Manager</h4>
                                            </div>
                                        </div>
                                    </div><!-- End testimonial item -->

                                    <div class="swiper-slide">
                                        <div class="testimonial-item">
                                            <div class="stars">
                                                <i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i>
                                            </div>
                                            <p>
                                                E-Learning provides a powerful and simple concept in designing, deploying and tracking training and learning. The system is intuitive – putting the fun back in teaching and learning
                                            </p>
                                            <div class="profile mt-auto">
                                                <img src="assets/img/testimonials/testimonials-2.jpg" class="testimonial-img" alt="">
                                                <h3>Wei Zhang</h3>
                                                <h4>Manager</h4>
                                            </div>
                                        </div>
                                    </div><!-- End testimonial item -->

                                    <div class="swiper-slide">
                                        <div class="testimonial-item">
                                            <div class="stars">
                                                <i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i>
                                            </div>
                                            <p>
                                                This feature is amazing! I can definitely see this as a game changer especially when we get our Supervisors to log on and complete these observations on their own.
                                            </p>
                                            <div class="profile mt-auto">
                                                <img src="assets/img/testimonials/testimonials-3.jpg" class="testimonial-img" alt="">
                                                <h3>Alaina Wilson</h3>
                                                <h4>Training Coordinator</h4>
                                            </div>
                                        </div>
                                    </div><!-- End testimonial item -->

                                    <div class="swiper-slide">
                                        <div class="testimonial-item">
                                            <div class="stars">
                                                <i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i>
                                            </div>
                                            <p>
                                                We’ve been very pleased with your service. The trainees found it very easy to use and it required very little support on our end. Thank you!
                                            </p>
                                            <div class="profile mt-auto">
                                                <img src="assets/img/testimonials/testimonials-4.jpg" class="testimonial-img" alt="">
                                                <h3>Matt Brandon</h3>
                                                <h4>Freelancer</h4>
                                            </div>
                                        </div>
                                    </div><!-- End testimonial item -->

                                    <div class="swiper-slide">
                                        <div class="testimonial-item">
                                            <div class="stars">
                                                <i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i>
                                            </div>
                                            <p>
                                                Thank you for all you help. I’m really pleased with how easy it is to set up courses, upload content and assign users in eLeaP.
                                            </p>
                                            <div class="profile mt-auto">
                                                <img src="assets/img/testimonials/testimonials-5.jpg" class="testimonial-img" alt="">
                                                <h3>John Larson</h3>
                                                <h4>Chief Operating Officer</h4>
                                            </div>
                                        </div>
                                    </div><!-- End testimonial item -->

                                </div>
                                <div class="swiper-pagination"></div>
                            </div>

                        </div>

                    </section><!-- End Testimonials Section -->

                    <!-- ======= Team Section ======= -->
                    <section id="team" class="team">

                        <div class="container" data-aos="fade-up">

                            <header class="section-header">
                                <h2>Team</h2>
                                <p>Our hard working team</p>
                            </header>

                            <div class="row gy-4">

                                <div class="col-lg-3 col-md-6 d-flex align-items-stretch" data-aos="fade-up" data-aos-delay="100">
                                    <div class="member">
                                        <div class="member-img">
                                            <img src="assets/img/team/team-1.jpg" class="img-fluid" alt="">
                                            <div class="social">
                                                <a href=""><i class="bi bi-twitter"></i></a>
                                                <a href=""><i class="bi bi-facebook"></i></a>
                                                <a href=""><i class="bi bi-instagram"></i></a>
                                                <a href=""><i class="bi bi-linkedin"></i></a>
                                            </div>
                                        </div>
                                        <div class="member-info">
                                            <h4>Praveen Vuddagiri</h4>
                                            <span>Back-End Developer</span>
                                            <p>Develop the server-side logics that powers web application, primarily focuses on databases, scripting, backend logic, APIs, and website architecture.</p>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-lg-3 col-md-6 d-flex align-items-stretch" data-aos="fade-up" data-aos-delay="200">
                                    <div class="member">
                                        <div class="member-img">
                                            <img src="assets/img/team/team-2.jpeg" class="img-fluid" alt="">
                                            <div class="social">
                                                <a href=""><i class="bi bi-twitter"></i></a>
                                                <a href=""><i class="bi bi-facebook"></i></a>
                                                <a href=""><i class="bi bi-instagram"></i></a>
                                                <a href=""><i class="bi bi-linkedin"></i></a>
                                            </div>
                                        </div>
                                        <div class="member-info">
                                            <h4>Nabinoy Baroi</h4>
                                            <span>UI / Graphic Designer</span>
                                            <p>Design visual and interactive properties of a visual experience, ensuring the interface is both clear for the user to navigate and overall aesthetically pleasing</p>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-lg-3 col-md-6 d-flex align-items-stretch" data-aos="fade-up" data-aos-delay="300">
                                    <div class="member">
                                        <div class="member-img">
                                            <img src="assets/img/team/team-3.jpeg" class="img-fluid" alt="">
                                            <div class="social">
                                                <a href=""><i class="bi bi-twitter"></i></a>
                                                <a href=""><i class="bi bi-facebook"></i></a>
                                                <a href=""><i class="bi bi-instagram"></i></a>
                                                <a href=""><i class="bi bi-linkedin"></i></a>
                                            </div>
                                        </div>
                                        <div class="member-info">
                                            <h4>S Naresh</h4>
                                            <span>Front-End Developer</span>
                                            <p>Optimize user experience by developing and maintaining the User Interface using HTML, JavaScript and CSS etc.</p>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-lg-3 col-md-6 d-flex align-items-stretch" data-aos="fade-up" data-aos-delay="400">
                                    <div class="member">
                                        <div class="member-img">
                                            <img src="assets/img/team/team-4.jpeg" class="img-fluid" alt="">
                                            <div class="social">
                                                <a href=""><i class="bi bi-twitter"></i></a>
                                                <a href=""><i class="bi bi-facebook"></i></a>
                                                <a href=""><i class="bi bi-instagram"></i></a>
                                                <a href=""><i class="bi bi-linkedin"></i></a>
                                            </div>
                                        </div>
                                        <div class="member-info">
                                            <h4>Stanislaus</h4>
                                            <span>Requirement Analyst & Documentation Specialist</span>
                                            <p>Troubleshoot a website's design in order to improve user experience, increase page views, and turn website leads into customers.</p>
                                        </div>
                                    </div>
                                </div>

                            </div>

                        </div>

                    </section><!-- End Team Section -->

                    <!-- ======= Clients Section ======= -->
                    <section id="clients" class="clients">

                        <div class="container" data-aos="fade-up">

                            <header class="section-header">
                                <h2>Our Clients</h2>
                                <p>Who collaborated with</p>
                            </header>

                            <div class="clients-slider swiper">
                                <div class="swiper-wrapper align-items-center">
                                    <div class="swiper-slide"><img src="assets/img/clients/client-1.png" class="img-fluid" alt=""></div>
                                    <div class="swiper-slide"><img src="assets/img/clients/client-2.png" class="img-fluid" alt=""></div>
                                    <div class="swiper-slide"><img src="assets/img/clients/client-3.png" class="img-fluid" alt=""></div>
                                    <div class="swiper-slide"><img src="assets/img/clients/client-4.png" class="img-fluid" alt=""></div>
                                    <div class="swiper-slide"><img src="assets/img/clients/client-5.png" class="img-fluid" alt=""></div>
                                    <div class="swiper-slide"><img src="assets/img/clients/client-6.png" class="img-fluid" alt=""></div>
                                    <div class="swiper-slide"><img src="assets/img/clients/client-7.png" class="img-fluid" alt=""></div>
                                    <div class="swiper-slide"><img src="assets/img/clients/client-8.png" class="img-fluid" alt=""></div>
                                </div>
                                <div class="swiper-pagination"></div>
                            </div>
                        </div>

                    </section><!-- End Clients Section -->

                    <!-- ======= Contact Section ======= -->
                    <section id="contact" class="contact">

                        <div class="container" data-aos="fade-up">

                            <header class="section-header">
                                <h2>Contact</h2>
                                <p>Contact Us</p>
                            </header>

                            <div class="row gy-4">

                                <div class="col-lg-6">

                                    <div class="row gy-4">
                                        <div class="col-md-6">
                                            <div class="info-box">
                                                <i class="bi bi-geo-alt"></i>
                                                <h3>Address</h3>
                                                <p>Pahargaon, Port Blair, South Andaman, A & N islands India.</p>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="info-box">
                                                <i class="bi bi-telephone"></i>
                                                <h3>Call Us</h3>
                                                <p>+91 92212-34561<br>+91 92221-34562</p>

                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="info-box">
                                                <i class="bi bi-envelope"></i>
                                                <h3>Email Us</h3>
                                                <p>e-learning@gmail.com</p>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="info-box">
                                                <i class="bi bi-clock"></i>
                                                <h3>Open Hours</h3>
                                                <p>24x7 Available</p>
                                            </div>
                                        </div>
                                    </div>

                                </div>

                                <div class="col-lg-6">
                                    <form action="sendMail" "method="post" class="php-email-form">
                                        <div class="row gy-4">

                                            <div class="col-md-6">
                                                <input type="text" name="name" class="form-control" placeholder="Your Name" required>
                                            </div>

                                            <div class="col-md-6 ">
                                                <input type="email" class="form-control" name="email" placeholder="Your Email" required>
                                            </div>

                                            <div class="col-md-12">
                                                <input type="text" class="form-control" name="subject" placeholder="Subject" required>
                                            </div>

                                            <div class="col-md-12">
                                                <textarea class="form-control" name="message" rows="6" placeholder="Message" required></textarea>
                                            </div>

                                            <div class="col-md-12 text-center">
                                                <div class="loading">Loading</div>
                                                <div class="error-message"></div>
                                                <div class="sent-message">Your message has been sent. Thank you!</div>

                                                <button type="submit">Send Message</button>
                                            </div>

                                        </div>
                                    </form>

                                </div>

                            </div>

                        </div>

                    </section><!-- End Contact Section -->

                    </main><!-- End #main -->

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
                                            <a href="#!" class="text-reset">Java Programming</a>
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
                            © 2022 Copyright:
                            <a class="text-reset fw-bold" href="homepage.html">E-Learning</a>
                        </div>
                    </footer>

                    <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

                    <!-- Vendor JS Files -->
                    <script src="assets/vendor/purecounter/purecounter.js"></script>
                    <script src="assets/vendor/aos/aos.js"></script>
                    <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
                    <script src="assets/vendor/glightbox/js/glightbox.min.js"></script>
                    <script src="assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
                    <script src="assets/vendor/swiper/swiper-bundle.min.js"></script>
                    <script src="assets/vendor/php-email-form/validate.js"></script>

                    <!-- Template Main JS File -->
                    <script src="assets/js/main.js"></script>

                    </body>

                    </html>