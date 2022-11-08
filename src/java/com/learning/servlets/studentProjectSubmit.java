package com.learning.servlets;

import com.learning.entities.student;
import com.learning.helper.ConnectionProvider;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author praveen vuddagiri
 */
@MultipartConfig
public class studentProjectSubmit extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            Part part = request.getPart("pro_file");
            String fname = part.getSubmittedFileName();

            InputStream in = part.getInputStream();
            byte[] data = new byte[in.available()];
            in.read(data);
            String path = request.getRealPath("/") + "/src/std-project" + File.separator + fname;

            try ( FileOutputStream fos = new FileOutputStream(path)) {
                fos.write(data);
            }
            out.println(fname);
            out.println(request.getParameter("c_id"));

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
                String query = "update std_progress set pro_file = '" + fname + "' where c_id = " + request.getParameter("c_id") + " and s_id=" + std_id;
                ResultSet rs = stm.executeQuery(query);

                RequestDispatcher dd = request.getRequestDispatcher("project-submit.jsp?c_id=" + request.getParameter("c_id"));
                dd.forward(request, response);

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
