<%-- 
    Document   : studentLogin.jsp
    Created on : 24-May-2022, 8:58:33 pm
    Author     : praveen vuddagiri
--%>

<%@page import="com.learning.entities.student"%>
<%@page import="com.learning.entities.Message"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">

    <link rel="stylesheet" href="css/login-std.css">
    <link rel="stylesheet" type="text/css" href="css/cssfile.css">

    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous"> 
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous"/>
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script><!-- comment -->
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<body>
    
    <%
            student st = (student)session.getAttribute("Student");
            if(st!=null){
                response.sendRedirect("student.jsp#s-dashboard");
            }
    %>
    <nav class="navbar navbar-expand-lg navbar-light bg-light" style="height: 60px;">
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
                <a class="nav-link" href="index.jsp">Home</a>
                <a class="nav-link" href="courses.jsp?cat_id=-1">Courses</a>
                <a class="nav-link" href="aboutUs.jsp">About</a>
              </li>
            </ul>
          </div>
      </nav>

    <div class="container">
        <div class="forms">
            <div class="form login">
                <span class="title">Login</span>
                
                
                <form action="studentLogin" method="post">
                    <div class="input-field">
                        <input type="text" placeholder="Enter your email" name="email" required>
                        <i class="uil uil-envelope icon"></i>
                    </div>
                    <div class="input-field">
                        <input type="password" class="password" name="pass" placeholder="Enter your password" required>
                        <i class="uil uil-lock icon"></i>
                    </div>

                    <div class="g-recaptcha" style="margin-left: 33%; margin-top: 20px;" data-sitekey="6LeUFBAgAAAAANgrjNU7PHu6tKQD0cT-xKGOSY1g"></div>

                    <div class="input-field button">
                        <input type="submit" value="Login Now" onclick="error()">
                    </div>
                </form>
                <div style="margin: 20px ; margin-right: 300px; margin-bottom: 50px;">
                <%
                                Message m = (Message) session.getAttribute("msg");
                                if (m != null) {
                            %>
                            <div class="alert <%= m.getCssClass() %>" role="alert" style="width:50%; margin-left: 27%">
                                <%= m.getContent() %>
                                
                            </div> 


                            <%        
                                    session.removeAttribute("msg");
                                }
                            %>
                </div>
            </div>
        </div>
    </div>    

    
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
    <script src="https://www.google.com/recaptcha/api.js" async defer></script>
</body>
</html>

