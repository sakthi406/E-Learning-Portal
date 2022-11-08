<%-- 
    Document   : addQuestions
    Created on : 25-Jun-2022, 12:36:13 pm
    Author     : praveen vuddagiri
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,400;0,700;1,300&display=swap" rel="stylesheet"> 
        <link href="css/addFaculty.css" rel="stylesheet">
        <title>Add Module</title>
    </head>
    <body style="font-family: 'Poppins', sans-serif;">
        <form action="addQuestions" method="post">

            <%
                int noq = Integer.parseInt(request.getParameter("noq"));
                int c_id = Integer.parseInt(request.getParameter("c_id"));
            %>
            <center><h4 style="margin-top: 20px;">Total Number of Questions are :</h4>
                <input type="text" name="noq" class="form-control" value="<%=noq%>" style="width: 100px" readonly></center>
                <%

                    for (int i = 0; i < noq; i++) {

                        String qId = "qId" + (i + 1);
                        String cId = "cId" + (i + 1);
                        String que = "que" + (i + 1);
                        String a = "a" + (i + 1);
                        String b = "b" + (i + 1);
                        String c = "c" + (i + 1);
                        String d = "d" + (i + 1);
                        String ans = "ans" + (i + 1);
                %>
            <div class="wrapper rounded bg-white">
                <div class="h3"><center>Enter Question Number - <%=(i + 1)%></center></div>
                <div class="form">
                    <div class="row">
                        <div class="col-md-6 mt-md-0 mt-3">
                            <label>Course ID</label>
                            <input type="text" name="<%=cId%>" class="form-control" value = "<%=c_id%>" readonly>
                        </div>
                        <div class="col-md-6 mt-md-0 mt-3">
                            <label>Question ID</label>
                            <input type="text" class="form-control" name="<%=qId%>"  value="<%=(i + 1)%>" readonly>
                        </div>

                    </div>

                    <div class="col-md-12 mt-md-0 mt-3">
                        <label>Question <%=(i + 1)%></label>
                        <input type="text" name="<%=que%>" class="form-control" placeholder="Enter the full question">
                    </div>
                    <div class="col-md-12 mt-md-0 mt-2">
                        <label>Option A</label>
                        <input type="text" name="<%=a%>" class="form-control" placeholder="Enter option A" >
                    </div>
                    <div class="col-md-12 mt-md-0 mt-3">
                        <label>Option B</label>
                        <input type="text" name="<%=b%>" class="form-control" placeholder="Enter option B">
                    </div><div class="col-md-12 mt-md-0 mt-3">
                        <label>Option C</label>
                        <input type="text" name="<%=c%>" class="form-control" placeholder="Enter option C">
                    </div>
                    <div class="col-md-12 mt-md-0 mt-3">
                        <label>Option D</label>
                        <input type="text" name="<%=d%>" class="form-control" placeholder="Enter option D">
                    </div>
                    <div class="col-md-12 mt-md-0 mt-3 ">
                        <label>Answer</label>
                        <div class="d-flex align-items-center mt-2">
                        <label class="option col-md-3">
                            <input type="radio" name="<%=ans%>" value="A"  >A
                            <span class="checkmark"></span>
                        </label>
                        <label class="option col-md-3">
                            <input type="radio" name="<%=ans%>" value="B" >B
                            <span class="checkmark"></span>
                        </label>
                        <label class="option col-md-3">
                            <input type="radio" name="<%=ans%>" value="C" >C
                            <span class="checkmark"></span>
                        </label>
                        <label class="option col-md-3">
                            <input type="radio" name="<%=ans%>" value="D" >D
                            <span class="checkmark"></span>
                        </label>
                        </div>
                        <!--<input type="text" name="<%=ans%>" class="form-control" placeholder="Enter the correct option A or B or C or D">-->
                    </div>

                </div>
            </div>
            <%                }
            %>

            <center> <input style="margin-bottom: 30px;" type="submit" value="Submit" class="btn btn-danger mt-3"></center>
        </form>
    </body>
</html>

