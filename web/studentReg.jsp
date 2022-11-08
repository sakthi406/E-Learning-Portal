

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="UTF-8">
    <title>Registration</title>
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" type="text/css" href="css/cssfile.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous"> 
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous"/>
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
     <meta name="viewport" content="width=device-width, initial-scale=1.0">
   </head>
<body>
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
                <a class="nav-link" href="index.jsp">Home</a>
                <a class="nav-link" href="courses.jsp?cat_id=-1">Courses</a>
                <a class="nav-link" href="aboutUs.jsp">About</a>
              </li>
            </ul>
          </div>
      </nav>
  <div class="container">
    <div class="title">Registration</div>
    <div class="content">
        
        
        
        <form id="reg-form" action="studentSignup" method="post">   <!--form start-->
        <div class="user-details">
          <div class="input-box">
            <span class="details">Full Name</span>
            <input type="text" placeholder="Enter student's name" ondrop="return false;" name="name" onpaste="return false; " onkeypress="return (event.charCode>=65 && event.charCode<=90) || (event.charCode>=97 && event.charCode<=122) || event.charCode==32" required>
          </div>
          <div class="input-box">
            <span class="details">Phone Number</span>
            <input type="tel" id="phone" ondrop="return false;" name="phno" maxlength="10" title="Must enter only numbers and cannot enter more than 10digits."  placeholder="Enter your mobile number" onpaste="return false; " onkeypress="return event.charCode>=48 && event.charCode<=57" required/>
          </div>
          <div class="input-box">
            <span class="details">Email</span>
            <input type="text" placeholder="Enter your email" name="email" required>
          </div>
          <div class="input-box">
            <span class="details">Date of Birth</span>
            <input type="date"  required name="dob">
          </div>
          <div class="input-box">
            <span class="details">Address</span>
            <input type="textarea" placeholder="Enter Address" required name="add">
        </div>
        <div class="input-box">
          <span class="details">College name</span>
            <input type="text" placeholder="Enter College Name" name="clg" required>
        </div>
        
          
          <div class="gender-details">
            <input type="radio" name="gender" id="dot-1" value="male">
            <input type="radio" name="gender" id="dot-2" value="female">
            <span class="gender-title">Gender</span>
            <div class="category">
              <label for="dot-1">
              <span class="dot one"></span>
              <span class="gender">Male</span>
            </label>
            <label for="dot-2">
              <span class="dot two"></span>
              <span class="gender">Female</span>
            </label>
            </div>
          </div>
          <div class="input-box">
            <span class="details">Upload Student Photo</span>
            <input class="form-control form-control-lg" name="img" id="formFileLg" type="file" />
          </div>
          <div class="input-box">
            <span class="details">Password</span>
            <input type="password" id="password" name="pass" minlength="8" placeholder="Create password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain at least one  number and one uppercase and lowercase letter, and at least 8 or more characters" required>          </div>
          <div class="input-box">
            <span class="details">Confirm Password</span>
            <input type="password" placeholder="Confirm your password" name="pass2" required>
          </div>
        </div>
        
        
          
        <button class="btn btn-primary" id="loader" disabled style="display: none; background-color: #2b6777; height: 40px; margin-left: 46%; text-align: center">
            <span class="spinner-border spinner-border-sm" role="status" aria-hidden="true"></span>
            Loading...
        </button>
        <div class="button" id="register">
          <input type="submit" id="reg_stud" value="Register">
        </div>
      </form>
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

</body>
    <script
            src="https://code.jquery.com/jquery-3.4.1.min.js"
            integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
        crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="js/myjs.js" type="text/javascript"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script><!-- comment -->
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <script>
            $(document).ready(function () {
                console.log("loaded........");
                $('#reg-form').on('submit', function (event) {
                    event.preventDefault();
                    let form = new FormData(this);
                    $("#register").hide();
                    $("#loader").show();
                    //send register servlet:
                    $.ajax({
                        url: "studentSignup",
                        type: 'POST',
                        data: form,
                        success: function (data, textStatus, jqXHR) {
                            console.log(data);
                            $("#register").show();
                            $("#loader").hide();
                            if (data.trim() === 'done')
                            {
                                swal("Registered successfully..We are going to redirect to login page")
                                        .then((value) => {
                                            window.location = "studentLog.jsp"
                                        });
                            } else
                            {
                                swal(data);
                            }
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            $("#register").show();
                            $("#loader").hide();
                            swal("something went wrong..try again");
                        },
                        processData: false,
                        contentType: false
                    });
                });
            });
        </script>
     
</html>

