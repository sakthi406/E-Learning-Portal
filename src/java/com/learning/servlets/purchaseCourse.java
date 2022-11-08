package com.learning.servlets;

import com.learning.dao.CourseDao;
import com.learning.entities.course;
import com.learning.entities.student;
import com.learning.helper.ConnectionProvider;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Random;
import java.util.UUID;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author praveen vuddagiri
 */
public class purchaseCourse extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            int course_id = Integer.parseInt(request.getParameter("c_id"));
            HttpSession s = request.getSession();
            student st = (student) s.getAttribute("Student");
            if(st==null){
                response.sendRedirect("studentLog.jsp");
                st = new student();
            }
            int std_id = st.getId();

            course co;
            CourseDao dao = new CourseDao(ConnectionProvider.getConnection());
            co = dao.getCourseById(course_id);

            String trans_id = UUID.randomUUID().toString().replace("-", "");
            String mop = "UPI payment";
            DateTimeFormatter dtf = DateTimeFormatter.ofPattern("dd/MM/yyyy");
            LocalDateTime now = LocalDateTime.now();

            String cur_date = dtf.format(now);
            dtf = DateTimeFormatter.ofPattern("HH:mm:ss");
            now = LocalDateTime.now();
            String cur_time = dtf.format(now);
            out.println("");
            try {
                Connection con = ConnectionProvider.getConnection();
                Statement stm = con.createStatement();
                String query = "insert into std_progress values(" + std_id + "," + course_id + ",0,'" + trans_id + "','0',0)";
                ResultSet rs = stm.executeQuery(query);

                query = "insert into transactions values('" + trans_id + "'," + co.getC_price() + ",'" + mop + "','" + cur_date + "','" + cur_time + "')";
                rs = stm.executeQuery(query);
            } catch (Exception e) {
                out.println(e);
                e.printStackTrace();
            }
            
            out.println("<body style='background-color: #81dcf3;display: flex;flex-direction:column;justify-content: center;align-items: center; height:100vh;'><a href='https://upier-pp.vercel.app/pay?vpa=vuddagiripraveen@oksbi&amount="+co.getC_price()+"' target='_blank'>"
                    + "<button style='text-decoration:none;height: 30px;width:100px;margin-bottom: 40px;'>PAY NOW</button></a>");
            out.println("<form method='post' action='student.jsp#s-courses'>");
            out.println("<button type='submit' style='text-decoration:none;height: 30px;width:200px;margin-bottom: 40px;'>Done Payment</button></form></body>");
//            response.sendRedirect("student.jsp#s-courses");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
