package com.learning.servlets;

import com.learning.dao.ModuleDao;
import com.learning.entities.modules;
import com.learning.helper.ConnectionProvider;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author praveen vuddagiri
 */
@MultipartConfig
public class addModules extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            int nom = Integer.parseInt(request.getParameter("nom"));
            try {
                int course_id = Integer.parseInt(request.getParameter("cId1"));

                Connection con = ConnectionProvider.getConnection();
                String query = "update course set c_mod = " + nom + " where c_id=" + course_id;
                Statement stm = con.createStatement();
                ResultSet rs = stm.executeQuery(query);
                while (rs.next()) {

                }
            } catch (Exception e) {
                e.printStackTrace();
            }
            modules mod;
            for (int i = 0; i < nom; i++) {
                int modId = Integer.parseInt(request.getParameter("modId" + (i + 1)));
                int cId = Integer.parseInt(request.getParameter("cId" + (i + 1)));
                String modTit = request.getParameter("modTit" + (i + 1));
                String temp = request.getParameter("modLink" + (i + 1));
                String modLink = "";
                int count = 0;
                for (char ch : temp.toCharArray()) {
                    count++;
                    if (ch == '=') {
                        break;
                    }
                }
                for (int j = count; j < temp.length(); j++) {
                    if(temp.charAt(j) == '&'){
                        break;
                    }
                    modLink += temp.charAt(j);
                    
                }

                Part part = request.getPart("modNotes" + (i + 1));
                String fname = part.getSubmittedFileName();

                InputStream in = part.getInputStream();
                byte[] data = new byte[in.available()];
                in.read(data);
                String path = request.getRealPath("/") + "/src/modules-notes" + File.separator + fname;

                try ( FileOutputStream fos = new FileOutputStream(path)) {
                    fos.write(data);
                }

                mod = new modules(modId, cId, modTit, modLink, fname);

                ModuleDao dao = new ModuleDao(ConnectionProvider.getConnection());

                boolean status = dao.addModule(mod);
                out.println(status);
            }
            response.sendRedirect("faculty.jsp#f-courses");

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
