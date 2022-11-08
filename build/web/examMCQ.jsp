<%-- 
    Document   : examMCQ
    Created on : 28-Jun-2022, 7:04:44 pm
    Author     : praveen vuddagiri
--%>

<%@page import="com.learning.entities.student"%>
<%@page import="com.learning.entities.student"%>
<%@page import="com.learning.entities.questions"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.learning.helper.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Course Exam</title>
        <!-- FontAweome CDN Link for Icons -->
        <link rel="stylesheet" href="css/examStudent.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"/>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"
              integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script><!-- comment -->
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    </head>
    <body  class="bg-primary">
        <script>
            history.pushState(null, document.title, location.href);
            history.back();
            history.forward();
            window.onpopstate = function () {
                history.go(1);
            };
        </script>


        <%
            student st = (student) session.getAttribute("Student");
            if (st == null) {
                st = new student();
            
        %>
        <script>

            swal("Sorry you are logged out due to some technical issues. We are going to redirect to login page\nPlease come after login again.")
                    .then((value) => {
                        window.location = "studentLog.jsp"
                    });


        </script>
        <%
            }
        %>

        <%
            int marks = 0;
            Connection con = ConnectionProvider.getConnection();
            Statement stm = con.createStatement();
            String query = "";
            query = "select * from std_progress where s_id=" + st.getId() + "and exam_marks!=" + 0 +" and c_id="+request.getParameter("c_id");
            ResultSet rs = stm.executeQuery(query);
            while (rs.next()) {
                marks = rs.getInt("exam_marks");
            }
            if (marks != 0) {

        %>
        <a href="enrolled-course-view.jsp?c_id=<%=request.getParameter("c_id")%>" style="margin-left: 70px; "><button type="button" class="btn btn-danger me-3 mt-4 mb-3">
        <i class="fa-solid fa-arrow-left"></i> Back
    </button></a>
        
        <h1 class="alert alert-success w-100 vh-100 d-flex justify-content-between align-items-center text-center">
            You had already given your exam, you cannot give your exam again. Your score was : <%=marks%>% </h1>
        <%
            }else{
                    
            
            int noq = 0;
            int i = 0;

            try {

                con = ConnectionProvider.getConnection();
                 query = "select count('q_id') from questions where c_id = " + request.getParameter("c_id");
                 stm = con.createStatement();
                 rs = stm.executeQuery(query);
                while (rs.next()) {
                    noq = rs.getInt(1);
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
            questions q[] = new questions[noq];
            try {

                 query = "select * from questions where c_id = " + request.getParameter("c_id");
                 con = ConnectionProvider.getConnection();
                 stm = con.createStatement();
                 rs = stm.executeQuery(query);
                while (rs.next()) {
                    q[i] = new questions(rs.getInt("q_id"), rs.getInt("C_id"), rs.getString("question"), rs.getString("a"), rs.getString("b"), rs.getString("c"), rs.getString("d"), rs.getString("ans"));
                    i++;
                }
            } catch (Exception e) {
                e.printStackTrace();
            }

        %>

        <%                if (noq == 0) {
        %>
        <a href="enrolled-course-view.jsp?c_id=<%=request.getParameter("c_id")%>" style="margin-left: 70px; width: 100%; "><button type="button" class="btn btn-warning me-3 mt-3 mb-3">
                <i class="fa-solid fa-arrow-left"></i> Back
            </button></a>
        <h1 class="alert alert-danger w-100 vh-100 d-flex justify-content-between align-items-center text-center">Sorry, No questions are uploaded by the faculty till now for this course. Please visit after sometime.</h1>

        <%
        } else {
        %>
        <!-- start Quiz button -->
        <div class="start_btn"><button>Start Quiz</button></div>        


        <!-- Info Box -->
        <div class="info_box">
            <div class="info-title"><span>Some Rules of this Quiz</span></div>
            <div class="info-list">
                <div class="info">1. You will have only <span>15 seconds</span> per each question.</div>
                <div class="info">2. Once you select your answer, it can't be undone.</div>
                <div class="info">3. You can't select any option once time goes off.</div>
                <div class="info">4. You can't exit from the Quiz while you're playing.</div>
                <div class="info">5. You'll get points on the basis of your correct answers.</div>
            </div>
            <div class="buttons">
                <a href="enrolled-course-view.jsp?c_id=<%=request.getParameter("c_id")%>"><button class="quit">Exit Quiz</button></a>
                <button class="restart">Continue</button>
            </div>
        </div>
        <!-- Quiz Box -->
        <div class="quiz_box">
            <header>
                <div class="title">Course Examination</div>
                <div class="timer">
                    <div class="time_left_txt">Time Left</div>
                    <div class="timer_sec">15</div>
                </div>
                <div class="time_line"></div>
            </header>
            <section>
                <div class="que_text">
                    <!-- Here I've inserted question from JavaScript -->
                </div>
                <div class="option_list">
                    <!-- Here I've inserted options from JavaScript -->
                </div>
            </section>
            <!-- footer of Quiz Box -->
            <footer>
                <div class="total_que">
                    <!-- Here I've inserted Question Count Number from JavaScript -->
                </div>
                <button class="next_btn">Next Que</button>
            </footer>
        </div>
        <!-- Result Box -->
        <div class="result_box">
            <div class="icon">
                <i class="fas fa-crown"></i>
            </div>
            <div class="complete_text">You've completed the Quiz!</div>
            <div class="score_text">
                <!-- Here I've inserted Score Result from JavaScript -->
            </div>
            <div class="buttons">
                <a href="enrolled-course-view.jsp?c_id=<%=request.getParameter("c_id")%>"><button class="restart">Exit</button></a>
                <form method="post" action="submitResult?c_id=<%=request.getParameter("c_id")%>">
                    <input type="hidden" name="result" id="result" value="">
                    <button class="quit">Submit Result</button>
                </form>
            </div>
        </div>
        <%}%>
    </body>

    <script>
        let questions = [];

        <%
            for (int j = 0; j < noq; j++) {
        %>
        var numb = (<%=(j + 1)%>);
        var question = "<%=q[j].getQue()%>";
        var answer = "<%=q[j].getAnswerAccToAns(q[j].getAns())%>";
        var op1 = "<%=q[j].getA()%>";
        var op2 = "<%=q[j].getB()%>";
        var op3 = "<%=q[j].getC()%>";
        var op4 = "<%=q[j].getD()%>";

        var options = [op1, op2, op3, op4];

        questions.push({
            numb: numb,
            question: question,
            answer: answer,
            options: options
        });
        <%}%>
        console.log(questions);

        //selecting all required elements
        const start_btn = document.querySelector(".start_btn button");
        const info_box = document.querySelector(".info_box");
        const exit_btn = info_box.querySelector(".buttons .quit");
        const continue_btn = info_box.querySelector(".buttons .restart");
        const quiz_box = document.querySelector(".quiz_box");
        const result_box = document.querySelector(".result_box");
        const option_list = document.querySelector(".option_list");
        const time_line = document.querySelector("header .time_line");
        const timeText = document.querySelector(".timer .time_left_txt");
        const timeCount = document.querySelector(".timer .timer_sec");

// if startQuiz button clicked
        start_btn.onclick = () => {
            info_box.classList.add("activeInfo"); //show info box
        }

// if exitQuiz button clicked
        exit_btn.onclick = () => {
            info_box.classList.remove("activeInfo"); //hide info box
        }

// if continueQuiz button clicked
        continue_btn.onclick = () => {
            info_box.classList.remove("activeInfo"); //hide info box
            quiz_box.classList.add("activeQuiz"); //show quiz box
            showQuetions(0); //calling showQestions function
            queCounter(1); //passing 1 parameter to queCounter
            startTimer(15); //calling startTimer function
            startTimerLine(0); //calling startTimerLine function
        }

        let timeValue = 15;
        let que_count = 0;
        let que_numb = 1;
        let userScore = 0;
        let counter;
        let counterLine;
        let widthValue = 0;

        const restart_quiz = result_box.querySelector(".buttons .restart");
        const quit_quiz = result_box.querySelector(".buttons .quit");

// if restartQuiz button clicked
        restart_quiz.onclick = () => {
            quiz_box.classList.add("activeQuiz"); //show quiz box
            result_box.classList.remove("activeResult"); //hide result box
            timeValue = 15;
            que_count = 0;
            que_numb = 1;
            userScore = 0;
            widthValue = 0;
            showQuetions(que_count); //calling showQestions function
            queCounter(que_numb); //passing que_numb value to queCounter
            clearInterval(counter); //clear counter
            clearInterval(counterLine); //clear counterLine
            startTimer(timeValue); //calling startTimer function
            startTimerLine(widthValue); //calling startTimerLine function
            timeText.textContent = "Time Left"; //change the text of timeText to Time Left
            next_btn.classList.remove("show"); //hide the next button
        }

// if quitQuiz button clicked
        quit_quiz.onclick = () => {
            window.location.reload(); //reload the current window
        }

        const next_btn = document.querySelector("footer .next_btn");
        const bottom_ques_counter = document.querySelector("footer .total_que");

// if Next Que button clicked
        next_btn.onclick = () => {
            if (que_count < questions.length - 1) { //if question count is less than total question length
                que_count++; //increment the que_count value
                que_numb++; //increment the que_numb value
                showQuetions(que_count); //calling showQestions function
                queCounter(que_numb); //passing que_numb value to queCounter
                clearInterval(counter); //clear counter
                clearInterval(counterLine); //clear counterLine
                startTimer(timeValue); //calling startTimer function
                startTimerLine(widthValue); //calling startTimerLine function
                timeText.textContent = "Time Left"; //change the timeText to Time Left
                next_btn.classList.remove("show"); //hide the next button
            } else {
                clearInterval(counter); //clear counter
                clearInterval(counterLine); //clear counterLine
                showResult(); //calling showResult function
            }
        }

// getting questions and options from array
        function showQuetions(index) {
            const que_text = document.querySelector(".que_text");

            //creating a new span and div tag for question and option and passing the value using array index
            let que_tag = '<span>' + questions[index].numb + ". " + questions[index].question + '</span>';
            let option_tag = '<div class="option"><span>' + questions[index].options[0] + '</span></div>'
                    + '<div class="option"><span>' + questions[index].options[1] + '</span></div>'
                    + '<div class="option"><span>' + questions[index].options[2] + '</span></div>'
                    + '<div class="option"><span>' + questions[index].options[3] + '</span></div>';
            que_text.innerHTML = que_tag; //adding new span tag inside que_tag
            option_list.innerHTML = option_tag; //adding new div tag inside option_tag

            const option = option_list.querySelectorAll(".option");

            // set onclick attribute to all available options
            for (i = 0; i < option.length; i++) {
                option[i].setAttribute("onclick", "optionSelected(this)");
            }
        }
// creating the new div tags which for icons
        let tickIconTag = '<div class="icon tick"><i class="fas fa-check"></i></div>';
        let crossIconTag = '<div class="icon cross"><i class="fas fa-times"></i></div>';

//if user clicked on option
        function optionSelected(answer) {
            clearInterval(counter); //clear counter
            clearInterval(counterLine); //clear counterLine
            let userAns = answer.textContent; //getting user selected option
            let correcAns = questions[que_count].answer; //getting correct answer from array
            const allOptions = option_list.children.length; //getting all option items

            if (userAns == correcAns) { //if user selected option is equal to array's correct answer
                userScore += 1; //upgrading score value with 1
                answer.classList.add("correct"); //adding green color to correct selected option
                answer.insertAdjacentHTML("beforeend", tickIconTag); //adding tick icon to correct selected option
                console.log("Correct Answer");
                console.log("Your correct answers = " + userScore);
            } else {
                answer.classList.add("incorrect"); //adding red color to correct selected option
                answer.insertAdjacentHTML("beforeend", crossIconTag); //adding cross icon to correct selected option
                console.log("Wrong Answer");

                for (i = 0; i < allOptions; i++) {
                    if (option_list.children[i].textContent == correcAns) { //if there is an option which is matched to an array answer 
                        option_list.children[i].setAttribute("class", "option correct"); //adding green color to matched option
                        option_list.children[i].insertAdjacentHTML("beforeend", tickIconTag); //adding tick icon to matched option
                        console.log("Auto selected correct answer.");
                    }
                }
            }
            for (i = 0; i < allOptions; i++) {
                option_list.children[i].classList.add("disabled"); //once user select an option then disabled all options
            }
            next_btn.classList.add("show"); //show the next button if user selected any option
        }

        function showResult() {
            info_box.classList.remove("activeInfo"); //hide info box
            quiz_box.classList.remove("activeQuiz"); //hide quiz box
            result_box.classList.add("activeResult"); //show result box
            const scoreText = result_box.querySelector(".score_text");



            if (70 < ((userScore / questions.length) * 100)) { // if user scored more than 70%
                //creating a new span tag and passing the user score number and total question number
                document.getElementById("result").value = ((userScore / questions.length) * 100);
                let scoreTag = '<span>and congrats! , You got <p>' + userScore + '</p> out of <p>' + questions.length + '</p></span>';
                scoreText.innerHTML = scoreTag;  //adding new span tag inside score_Text
            } else if (30 < ((userScore / questions.length) * 100)) { // if user scored more than 30%
                document.getElementById("result").value = ((userScore / questions.length) * 100);

                let scoreTag = '<span>and nice , You got <p>' + userScore + '</p> out of <p>' + questions.length + '</p></span>';
                scoreText.innerHTML = scoreTag;
            } else { // if user scored less than 1
                document.getElementById("result").value = ((userScore / questions.length) * 100);

                let scoreTag = '<span>Resubmit exam, You got only <p>' + userScore + '</p> out of <p>' + questions.length + '</p></span>';
                scoreText.innerHTML = scoreTag;
            }
        }

        function startTimer(time) {
            counter = setInterval(timer, 1000);
            function timer() {
                timeCount.textContent = time; //changing the value of timeCount with time value
                time--; //decrement the time value
                if (time < 9) { //if timer is less than 9
                    let addZero = timeCount.textContent;
                    timeCount.textContent = "0" + addZero; //add a 0 before time value
                }
                if (time < 0) { //if timer is less than 0
                    clearInterval(counter); //clear counter
                    timeText.textContent = "Time Off"; //change the time text to time off
                    const allOptions = option_list.children.length; //getting all option items
                    let correcAns = questions[que_count].answer; //getting correct answer from array
                    for (i = 0; i < allOptions; i++) {
                        if (option_list.children[i].textContent == correcAns) { //if there is an option which is matched to an array answer
                            option_list.children[i].setAttribute("class", "option correct"); //adding green color to matched option
                            option_list.children[i].insertAdjacentHTML("beforeend", tickIconTag); //adding tick icon to matched option
                            console.log("Time Off: Auto selected correct answer.");
                        }
                    }
                    for (i = 0; i < allOptions; i++) {
                        option_list.children[i].classList.add("disabled"); //once user select an option then disabled all options
                    }
                    next_btn.classList.add("show"); //show the next button if user selected any option
                }
            }
        }

        function startTimerLine(time) {
            counterLine = setInterval(timer, 29);
            function timer() {
                time += 1; //upgrading time value with 1
                time_line.style.width = time + "px"; //increasing width of time_line with px by time value
                if (time > 549) { //if time value is greater than 549
                    clearInterval(counterLine); //clear counterLine
                }
            }
        }

        function queCounter(index) {
            //creating a new span tag and passing the question number and total question
            let totalQueCounTag = '<span><p>' + index + '</p> of <p>' + questions.length + '</p> Questions</span>';
            bottom_ques_counter.innerHTML = totalQueCounTag;  //adding new span tag inside bottom_ques_counter
        }
    </script>

<%}%>
</html>




