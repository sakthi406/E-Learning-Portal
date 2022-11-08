/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.learning.servlets;

import com.learning.dao.CourseDao;
import com.learning.entities.course;
import com.learning.helper.ConnectionProvider;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@MultipartConfig
public class addCourseAdmin extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            
            String cname = request.getParameter("cname");
            float cprice = Float.parseFloat(request.getParameter("cprice"));
            String cdesc = request.getParameter("cdesc");
            int cdur = Integer.parseInt(request.getParameter("cdur"));
            int cat = Integer.parseInt(request.getParameter("cat"));
            int fac = Integer.parseInt(request.getParameter("fac"));
            Part part = request.getPart("cimg");
                String fname = part.getSubmittedFileName();

                InputStream in = part.getInputStream();
                byte[] data = new byte[in.available()];
                in.read(data);
                String path = request.getRealPath("/") + "/src/course-img" + File.separator + fname;

                try ( FileOutputStream fos = new FileOutputStream(path)) {
                    fos.write(data);
                }
            course c = new course(cname,cprice,cdesc,cdur,cat,fac,fname);
            
            CourseDao dao = new CourseDao(ConnectionProvider.getConnection());
            boolean status = dao.addCourse(c);
            
            if(status){
                out.println("done");
            }
            else{
                out.println("Some sql constraints are been voilated, please check again.\nDescription length should be less than 2000 characters.");
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
