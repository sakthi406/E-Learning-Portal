<%-- 
    Document   : course-access
    Created on : 27-Jun-2022, 11:28:46 pm
    Author     : praveen vuddagiri
--%>

<%@page import="com.learning.entities.modules"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
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
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"
              integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />
        <title>Learn Course</title>
    </head>

    <body>

        <%
            int nom = 0;
            int i = 0, j = 0;

            try {

                Connection con = ConnectionProvider.getConnection();
                String query = "select c_mod from course where c_id = " + request.getParameter("c_id");
                Statement stm = con.createStatement();
                ResultSet rs = stm.executeQuery(query);
                while (rs.next()) {
                    nom = rs.getInt("c_mod");
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
            modules md[] = new modules[nom];
            try {

                String query = "select * from modules where c_id = " + request.getParameter("c_id");
                Connection con = ConnectionProvider.getConnection();
                Statement stm = con.createStatement();
                ResultSet rs = stm.executeQuery(query);
                while (rs.next()) {
                    md[i] = new modules(rs.getInt("m_id"), rs.getInt("C_id"), rs.getString("m_title"), rs.getString("m_link"), rs.getString("m_pdf"));
                    i++;
                }
            } catch (Exception e) {
                e.printStackTrace();
            }


        %>
        <!-- Navbar -->
        <nav class="navbar navbar-expand-lg navbar-light fixed-top">
            <!-- Container wrapper -->
            <div class="container">
                <!-- Navbar brand -->
                <a href="enrolled-course-view.jsp?c_id=<%=request.getParameter("c_id")%>"><button type="button" class="btn btn-primary me-3 mt-4">
                        <i class="fa-solid fa-arrow-left"></i> Back
                    </button></a>
            </div>
        </nav>
        <!-- Navbar -->

        <%
            if (nom == 0) {
        %>
        <h1 class="alert alert-danger w-100 vh-100 d-flex justify-content-between align-items-center text-center">Sorry, No modules are uploaded by the faculty till now. Please visit after sometime.</h1>


        <%} else {
        %>


        <%
            if (nom == 1) {
        %>

        <div style="height: 100vh;" id="c-one">
            <div style=" height: 100px;"></div>
            <div class="row" style="margin: 0% 8% 3% 8%;">
                <div class="card text-center shadow" id="firstcard">
                    <div style="padding-top: 20px; font-size: 22px;">Module 1 : </div>
                    <hr>
                    <div class="card-body">
                        <h5 class="card-title"><%= md[0].getMod_title()%></h5>
                        <p class="card-text">Click below to download the module notes.</p>
                        <a href="src/modules-notes/<%= md[0].getMod_notes()%>" target="_blank" class="btn btn-primary"><i class="fa-solid fa-download"></i> Download</a>
                    </div>
                </div>

                <div class="card shadow" id="secondcard" style="margin-left: 50px;">
                    <iframe width="820" height="413" src="https://www.youtube.com/embed/<%= md[0].getMod_link()%>"
                            frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
                            allowfullscreen style="margin-top: 12px; border-radius: 3px;"></iframe>
                    <p class="text-center" style="margin-top: 12px;">Course Video</p>
                </div>
            </div>

        </div>


        <%
        } else if (j == 0) {

        %>
        <div style="height: 100vh;" id="c<%=j%>">
            <div style=" height: 100px;"></div>
            <div class="row" style="margin: 0% 8% 3% 8%;">
                <div class="card text-center shadow" id="firstcard">
                    <div style="padding-top: 20px; font-size: 22px;">Module <%=(j+1)%> : </div>
                    <hr>
                    <div class="card-body">
                        <h5 class="card-title"> <%= md[j].getMod_title() %> </h5>
                        <p class="card-text">Click below to download the module notes.</p>
                        <a href="src/modules-notes/<%= md[j].getMod_notes() %>" target="_blank" class="btn btn-primary"><i class="fa-solid fa-download"></i> Download</a>
                    </div>
                </div>

                <div class="card shadow" id="secondcard" style="margin-left: 50px;">
                    <iframe width="820" height="413" src="https://www.youtube.com/embed/<%= md[j].getMod_link() %>"
                             frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
                            allowfullscreen style="margin-top: 12px; border-radius: 3px;"></iframe>
                    <p class="text-center" style="margin-top: 12px;">Course Video</p>
                </div>
            </div>
            <div class="text-center">
                <button type="button" class="btn btn-primary btn-rounded"
                        style="border-radius: 25px; margin-right: 40px;" disabled><i class="fa-solid fa-circle-arrow-up"></i>
                    Previous</button>
                <a href="#c1"><button type="button" class="btn btn-success btn-rounded" style="border-radius: 25px;"><i
                            class="fa-solid fa-circle-arrow-down"></i> Next</button></a>
            </div>
        </div>
        <%            }
            for (j = 1; j < nom - 1; j++) {
        %>

        <div style="height: 100vh;" id="c<%=j%>">
            <div style=" height: 100px;"></div>
            <div class="row" style="margin: 0% 8% 3% 8%;">
                <div class="card text-center shadow" id="firstcard">
                    <div style="padding-top: 20px; font-size: 22px;">Module <%=(j+1)%> : </div>
                    <hr>
                    <div class="card-body">
                        <h5 class="card-title"> <%= md[j].getMod_title() %> </h5>
                        <p class="card-text">Click below to download the module notes.</p>
                        <a href="src/modules-notes/<%= md[j].getMod_notes() %>" target="_blank" class="btn btn-primary"><i class="fa-solid fa-download"></i> Download</a>
                    </div>
                </div>

                <div class="card shadow" id="secondcard" style="margin-left: 50px;">
                    <iframe width="820" height="413" src="https://www.youtube.com/embed/<%= md[j].getMod_link() %>"
                             frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
                            allowfullscreen style="margin-top: 12px; border-radius: 3px;"></iframe>
                    <p class="text-center" style="margin-top: 12px;">Course Video</p>
                </div>
            </div>
            <div class="text-center">
                <a href="#c<%=(j - 1)%>"><button type="button" class="btn btn-primary btn-rounded"
                                                 style="border-radius: 25px; margin-right: 40px;"><i class="fa-solid fa-circle-arrow-up"></i>
                        Previous</button></a>
                <a href="#c<%=(j + 1)%>"><button type="button" class="btn btn-success btn-rounded" style="border-radius: 25px; "><i
                            class="fa-solid fa-circle-arrow-down"></i> Next</button></a>
            </div>
        </div>

        <%}
            if (j == (nom - 1)) {%>
        <div style="height: 100vh;" id="c<%=j%>">
            <div style=" height: 100px;"></div>
            <div class="row" style="margin: 0% 8% 3% 8%;">
                <div class="card text-center shadow" id="firstcard">
                    <div style="padding-top: 20px; font-size: 22px;">Module <%=(j+1)%> : </div>
                    <hr>
                    <div class="card-body">
                        <h5 class="card-title"> <%= md[j].getMod_title() %> </h5>
                        <p class="card-text">Click below to download the module notes.</p>
                        <a href="src/modules-notes/<%= md[j].getMod_notes() %>" target="_blank" class="btn btn-primary"><i class="fa-solid fa-download"></i> Download</a>
                    </div>
                </div>

                <div class="card shadow" id="secondcard" style="margin-left: 50px;">
                    <iframe width="820" height="413" src="https://www.youtube.com/embed/<%= md[j].getMod_link() %>"
                             frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
                            allowfullscreen style="margin-top: 12px; border-radius: 3px;"></iframe>
                    <p class="text-center" style="margin-top: 12px;">Course Video</p>
                </div>
            </div>
            <div class="text-center">
                <a href="#c<%=(j - 1)%>"><button type="button" class="btn btn-primary btn-rounded"
                                                 style="border-radius: 25px; margin-right: 40px;"><i class="fa-solid fa-circle-arrow-up"></i>
                        Previous</button></a>
                <button type="button" disabled class="btn btn-success btn-rounded" style="border-radius: 25px; "><i
                        class="fa-solid fa-circle-arrow-down"></i> Next</button>
            </div>
        </div>

        <%
                }

            }%>
    </body>

    <style>
        @import url("https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;700&display=swap");

        html {
            scroll-behavior: smooth;
        }

        body {
            font-family: 'Poppins', sans-serif;
            background-color: rgb(236, 236, 236);
            overflow: hidden;
        }

        #firstcard {
            width: 30%;
        }

        #secondcard {
            width: 845px;
            height: 473px;
        }
    </style>

</html>