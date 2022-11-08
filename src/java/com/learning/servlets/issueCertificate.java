package com.learning.servlets;

import com.learning.helper.ConnectionProvider;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.Math.random;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author praveen vuddagiri
 */
public class issueCertificate extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            try {
                String s_id = request.getParameter("s_id");
                String c_id = request.getParameter("c_id");

                Connection con = ConnectionProvider.getConnection();
                Statement stm = con.createStatement();
                String cert_id = s_id+c_id+((int)((Math.random() * 10000) + 1));
                out.println(cert_id);
                
                String query = "update std_progress set cert_id="+cert_id+" where s_id = "+s_id+" and c_id="+c_id;
                ResultSet rs = stm.executeQuery(query);
                DateTimeFormatter dtf = DateTimeFormatter.ofPattern("dd/MM/yyyy");
                LocalDateTime now = LocalDateTime.now();
                query = "insert into certificates values("+cert_id+", '"+dtf.format(now)+"')";
                stm = con.createStatement();
                rs = stm.executeQuery(query);

                response.sendRedirect("faculty.jsp#f-projects");
            } catch (Exception e) {
                e.printStackTrace();
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
