
<%@page import="com.learning.entities.student"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Update Faculty</title>
        <link rel="stylesheet" href="css/addFaculty.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    </head>
    <body style="background-color: #7c7cf3">

        <%
            student st = (student) session.getAttribute("Student");
            String gen;
            if (st == null) {
                st = new student();
                gen = "none";
            } else {
                gen = st.getGen();
            }
        %>


        <div class="wrapper rounded bg-white">
            <form action="updateStudent" method="post" id="reg-form">

                <div class="h3">Update Student</div>
                <div class="form">
                    <div class="row">
                        <div class="col-md-6 mt-md-0 mt-3">
                            <label>Student ID</label>
                            <input type="text" class="form-control" name="sid" value="<%= st.getId()%>" readonly>
                        </div>
                        <div class="col-md-6 mt-md-0 mt-3">
                            <label>Student Name</label>
                            <input type="text" name="name" value="<%= st.getName()%>" class="form-control" ondrop="return false;" onpaste="return false; " onkeypress="return (event.charCode>=65 && event.charCode<=90) || (event.charCode>=97 && event.charCode<=122) || event.charCode==32" required>
                        </div>

                    </div>
                    <div class="row">
                        <div class="col-md-6 mt-md-0 mt-3">
                            <label>Date of Birth</label>
                            <input type="date" name="dob" value="<%= st.getDob()%>" class="form-control" required>
                        </div>
                        <div class="col-md-6 mt-md-0 mt-3">
                            <label>Gender</label>
                            <div class="d-flex align-items-center mt-2">
                                <label class="option">
                                    <input type="radio" name="gender" value="male" <% if (gen.equals("male")) {%>checked<% } %> >Male
                                    <span class="checkmark"></span>
                                </label>
                                <label class="option ms-4">
                                    <input type="radio" name="gender" value="female" <% if (gen.equals("female")) {%>checked<% }%> >Female
                                    <span class="checkmark"></span>
                                </label>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6 mt-md-0 mt-3">
                            <label>Email</label>
                            <input type="email" name="email" value="<%= st.getEmail()%>" class="form-control" readonly>
                        </div>
                        <div class="col-md-6 mt-md-0 mt-3">
                            <label>Phone Number</label>
                            <input type="tel" name="phno" class="form-control" value="<%= st.getPhone()%>" readonly>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6 mt-md-0 mt-3">
                            <label>Password</label>
                            <input type="password" name="pass" value="<%= st.getPass()%>" class="form-control" required>
                        </div>
                        <div class="col-md-6 mt-md-0 mt-3">
                            <label>College Name</label>
                            <input type="text" name="clg" value="<%= st.getClg()%>" class="form-control" required>
                        </div>
                    </div>

                    <div class=" my-md-2 my-3">
                        <label>Address</label>
                        <textarea id="sub" name="add" rows="2" required ><%= st.getAdd()%>
                        </textarea>
                    </div>
                    <div class="row">
                        <div class="col-md-12 mt-md-0 mt-3">
                            <label>Photo</label>
                            <input type="file" name="img" class="form-control" required>
                        </div>

                    </div>

                    <button class="btn btn-primary" id="loader" disabled style=" display:none; background-color: #2b6777; height: 38px; margin-top: 14px; text-align: center">
                        <span class="spinner-border spinner-border-sm" role="status" aria-hidden="true"></span>
                        Loading...
                    </button>
                    <input type="submit" value="Submit" id="add-std" class="btn btn-primary mt-3">
                    <a href="student.jsp#s-dashboard"><div class="btn btn-danger mt-3"><svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-arrow-left" viewBox="0 0 16 16">
                            <path fill-rule="evenodd" d="M15 8a.5.5 0 0 0-.5-.5H2.707l3.147-3.146a.5.5 0 1 0-.708-.708l-4 4a.5.5 0 0 0 0 .708l4 4a.5.5 0 0 0 .708-.708L2.707 8.5H14.5A.5.5 0 0 0 15 8z"/>
                            </svg> Back</div></a>
                </div>
            </form>
        </div>
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
                $("#add-std").hide();
                $("#loader").show();
                //send register servlet:
                $.ajax({
                    url: "updateStudent",
                    type: 'POST',
                    data: form,
                    success: function (data, textStatus, jqXHR) {
                        console.log(data);
                        $("#add-std").show();
                        $("#loader").hide();
                        if (data.trim() === 'done')
                        {

                            swal("Update successfully..We are going to redirect to admin page")
                                    .then((value) => {
                                        window.location = "student.jsp#s-dashboard"   //to be handled
                                    });
                        } else
                        {
                            swal(data);
                        }
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        $("#add-std").show();
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