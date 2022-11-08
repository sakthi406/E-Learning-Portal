<%-- 
    Document   : certificateDisplay
    Created on : 30-Jun-2022, 9:54:48 am
    Author     : praveen vuddagiri
--%>

<%@page import="com.learning.entities.student"%>
<%@page import="com.learning.dao.StudentDao"%>
<%@page import="com.learning.entities.course"%>
<%@page import="com.learning.dao.CourseDao"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.learning.helper.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="css/certificate.css">
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400&display=swap" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/0.4.1/html2canvas.min.js"></script>
        <script src="https://superal.github.io/canvas2image/canvas2image.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" 
              integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" 
              crossorigin="anonymous" referrerpolicy="no-referrer" />
        <title>Certificate</title>
    </head>
    <style type="text/css" media="print">
        @page { size: landscape; }
        @media print {
            @page { margin: 0; }
            body { margin: 1.6cm; }
        }
        @media print {
            * {
                -webkit-print-color-adjust: exact !important; /*Chrome, Safari */
                color-adjust: exact !important;  /*Firefox*/
            }
        }

    </style>
    <body style="color: black; ">
        <!-- Navbar -->
        <nav class="navbar navbar-expand-lg navbar-light fixed-top" >
            <!-- Container wrapper -->
            <div class="container">
                <!-- Navbar brand -->
                <a href="student.jsp#s-certificates"><button type="button" class="btn btn-primary me-3 mt-4" style="font-family: 'Poppins', sans-serif;">
                        <i class="fa-solid fa-arrow-left"></i> Back
                    </button></a>
                <input type="button" class="btn btn-info text-white" onclick="printDiv('areaForPrint')" style="font-family: 'Poppins', sans-serif;" value="Print Certificate" />
            </div>
        </nav>
        <!-- Navbar -->
        <%
            Connection con = ConnectionProvider.getConnection();
            Statement stm = con.createStatement();
            String query = "select * from std_progress where s_id=" + request.getParameter("s_id") + "and cert_id!=" + 0 +" and c_id="+request.getParameter("c_id") ;
            ResultSet rs = stm.executeQuery(query);
            while (rs.next()) {
            
                StudentDao daos = new StudentDao(ConnectionProvider.getConnection());
                student st = daos.getStudentById(rs.getInt("s_id"));
                CourseDao daoc = new CourseDao(ConnectionProvider.getConnection());
                course co = daoc.getCourseById(rs.getInt("c_id"));
                stm = con.createStatement();
                query = "select * from certificates where cert_id=" + rs.getString("cert_id");
                ResultSet rs2 = stm.executeQuery(query);
                while (rs2.next()) {

        %>
        <div class="certificate-container cursive " style=" margin: auto; width: 60%; padding: 10px; padding-top: 100px; " id="areaForPrint">
            <div class="certificate" >
                <div class="water-mark-overlay"></div>
                <div class="certificate-header">
                    <img src="src/certificate-img/logoheader.png" class="logo" alt="">
                </div>
                <div class="certificate-body">
                    <div>
                        <h1 style="font-size: 60px;font-family: 'Pinyon Script', cursive;">Certificate of Completion</h1>
                    </div>
                    <span class="student-name line" style="font-size: 30px;"> <%= st.getName() %> </span>
                    <div class="certificate-content">
                        <div class="about-certificate">
                            <p style="font-family: 'Pinyon Script', cursive;">
                                has scored
                            </p>
                        </div>
                        <span class="topic-score line">
                            <%= rs.getString("exam_marks") %>%
                        </span>
                        <div class="about-certificate" >
                            <p style="font-family: 'Pinyon Script', cursive;">
                                while completing the training course entitled
                            </p>
                        </div>
                        <span class="topic-title line">
                            <%= co.getC_name() %>
                        </span>
                        <p style="padding-top: 10px;font-family: 'Pinyon Script', cursive;">an online non-credit course authorized by E-learning.</p>
                    </div>
                </div>
                <div class="certificate-footer text-muted" style="font-family: roboto;">
                    <span style="font-size: 12px; padding-top: 40px; float:left; padding-left: 10px;">Date of Issue
                        certificate : <b><span> <%= rs2.getString("date_of_issue") %> </span></b></span>
                    <span style="float: right; font-size: 12px; padding-top: 40px; padding-right: 10px;">
                        Certificate ID : <b><span> <%= rs2.getString("cert_id") %> </span></b>
                    </span>
                </div>
            </div>

        </div>
        <%}
            }%>
    </body>



    <script>
        function printDiv(divName) {
            var printContents = document.getElementById(divName).innerHTML;
            var originalContents = document.body.innerHTML;

            document.body.innerHTML = printContents;

            window.print();

            document.body.innerHTML = originalContents;
        }
    </script>

</html>