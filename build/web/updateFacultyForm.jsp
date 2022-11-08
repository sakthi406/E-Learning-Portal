<%-- 
    Document   : updateFacultyForm
    Created on : 02-Jun-2022, 7:16:32 pm
    Author     : praveen vuddagiri
--%>

<%@page import="com.learning.entities.faculty"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Faculty</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="css/addFaculty.css">
</head>
<body>
    <%
        faculty fac = (faculty)session.getAttribute("Faculty");
        String gen;
        if(fac==null){
            fac=new faculty();
            gen = "none";
        }
        else{
            gen = fac.getFacgen();
        }
    %>
    <div class="wrapper rounded bg-white">
        <form method="post" id="reg-form" action="updateFaculty"> 
        <div class="h3">Update Faculty</div>
        <div>
            <label>Faculty Id</label>
            <input type="text" class="form-control" name="id" value="<%=fac.getFacid()%>" readonly required>
        </div>
        <div class="form">
            <div class="row">
                <div class="col-md-6 mt-md-0 mt-3">
                    <label>Faculty Name</label>
                    <input type="text" class="form-control" name="name" value="<%=fac.getFacname()%>" ondrop="return false;" onpaste="return false; " onkeypress="return (event.charCode>=65 && event.charCode<=90) || (event.charCode>=97 && event.charCode<=122) || event.charCode==32" required>
                </div>
                <div class="col-md-6 mt-md-0 mt-3">
                    <label>Phone Number</label>
                    <input type="tel" class="form-control" name="phno" value="<%=fac.getFacphone()%>" readonly required>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6 mt-md-0 mt-3">
                    <label>Date of Birth</label>
                    <input type="date" class="form-control" name="dob" value="<%=fac.getFacdob()%>" required>
                </div>
                <div class="col-md-6 mt-md-0 mt-3">
                    <label>Gender</label>
                    <div class="d-flex align-items-center mt-2">
                        <label class="option">
                            <input type="radio" name="gender" value="male" <% if(gen.equals("male")){%>checked<% } %> >Male
                            <span class="checkmark"></span>
                        </label>
                        <label class="option ms-4">
                            <input type="radio" name="gender" value="female" <% if(gen.equals("female")){%>checked<% } %> >Female
                            <span class="checkmark"></span>
                        </label>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6 mt-md-0 mt-3">
                    <label>Email</label>
                    <input type="email" class="form-control" name="email" value="<%=fac.getFacemail()%>" readonly required>
                </div>
                <div class="col-md-6 mt-md-0 mt-3">
                    <label>Password</label>
                    <input type="password" class="form-control" name="pass" value="<%=fac.getFacpass()%>" required>
                </div>
            </div>
                <button class="btn btn-primary" id="loader" disabled style=" display:none; background-color: #2b6777; height: 38px; margin-top: 14px; text-align: center">
                <span class="spinner-border spinner-border-sm" role="status" aria-hidden="true"></span>
                Loading...
            </button>
            <input type="submit" value="Submit" id="add-fac" class="btn btn-primary mt-3">
            <a href="admin.jsp#a-faculties"><div class="btn btn-danger mt-3"><svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-arrow-left" viewBox="0 0 16 16">
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
                    $("#add-fac").hide();
                    $("#loader").show();
                    //send register servlet:
                    $.ajax({
                        url: "updateFaculty",
                        type: 'POST',
                        data: form,
                        success: function (data, textStatus, jqXHR) {
                            console.log(data);
                            $("#add-fac").show();
                            $("#loader").hide();
                            if (data.trim() === 'done')
                            {
                                <% 
                                    HttpSession s = request.getSession();
                                    s.removeAttribute("Faculty");
                                %>
                                swal("Update successfully..We are going to redirect to admin page")
                                        .then((value) => {
                                            window.location = "admin.jsp#a-faculties"   //to be handled
                                        });
                            } else
                            {
                                swal(data);
                            }
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            $("#add-fac").show();
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