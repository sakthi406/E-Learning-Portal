
package com.learning.servlets;

import com.learning.entities.student;
import com.learning.helper.ConnectionProvider;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class submitResult extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            double result = Double.parseDouble(request.getParameter("result"));
            HttpSession s = request.getSession();
            student st = (student) s.getAttribute("Student");
            if (st == null) {
                response.sendRedirect("studentLog.jsp");
                st = new student();
            }
            int std_id = st.getId();
            try {
                Connection con = ConnectionProvider.getConnection();
                Statement stm = con.createStatement();
                if(result>30){
                    String query = "update std_progress set exam_marks = " + result + " where c_id = " + request.getParameter("c_id") + " and s_id=" + std_id;
                    ResultSet rs = stm.executeQuery(query);
                    RequestDispatcher dd = request.getRequestDispatcher("examMCQ.jsp?c_id=" + request.getParameter("c_id"));
                    dd.forward(request, response);
                }
                else{
                    RequestDispatcher dd = request.getRequestDispatcher("enrolled-course-view.jsp?c_id=" + request.getParameter("c_id"));
                    dd.forward(request, response);
                }
                

            } catch (Exception e) {
                e.printStackTrace();
                out.println(e);
            }
            
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
