<%-- 
    Document   : exam-des
    Created on : 27-Jun-2022, 11:29:38 pm
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
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"
        integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
    <title>Start Exam</title>
</head>

<body>
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
    <div style="height: 100vh;">
        <div class="card text-center shadow" style="margin: 8% 25% 8% 25%; padding-left: 3%; padding-right: 3%;">
            <div class="card-body">
                <form action="">
                    <h5 class="card-title" style="padding-top: 3%; padding-bottom: 3%;">Exam instructions</h5>
                    <p class="card-text" style="padding-bottom: 2%;">Lorem ipsum dolor sit amet consectetur adipisicing
                        elit. Delectus accusamus eos vel, dolore facilis sunt? Adipisci rem facere error quis, rerum,
                        atque provident distinctio omnis non suscipit aperiam molestias exercitationem.</p>
                    <a href="examMCQ.jsp?c_id=<%=request.getParameter("c_id")%>" class="btn btn-success" style="margin-bottom: 3%;"></i><i
                            class="fa-solid fa-pen-to-square"></i> Start Exam</a>
                </form>
            </div>
        </div>
    </div>
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

    h5 {
        font-weight: 600;
        font-size: 30px;
    }
</style>

</html>