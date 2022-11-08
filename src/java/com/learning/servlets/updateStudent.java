
package com.learning.servlets;

import com.learning.dao.StudentDao;
import com.learning.entities.student;
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
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@MultipartConfig
public class updateStudent extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try ( PrintWriter out = response.getWriter()) {
            
            HttpSession ss = request.getSession();
            student st1 = (student)ss.getAttribute("Student");
            String path1 = request.getRealPath("/")+"/src/stud-img"+File.separator+st1.getImg();
            File f = new File(path1);
            f.delete();
                        
            String name = request.getParameter("name");
            String dob = request.getParameter("dob");
            String add = request.getParameter("add");
            String clg = request.getParameter("clg");
            String gen = request.getParameter("gender");
            String pass = request.getParameter("pass");            
            String email = request.getParameter("email");
            String phone = request.getParameter("phno");

            
            Part part = request.getPart("img");
            String fname = part.getSubmittedFileName();
            
            InputStream in = part.getInputStream();
            byte []data = new byte[in.available()];
            in.read(data);
            String path = request.getRealPath("/")+"/src/stud-img"+File.separator+fname;

            try (FileOutputStream fos = new FileOutputStream(path)) {
                fos.write(data);
            }
            
            student st = new student(name,phone,email,dob,add,clg,gen,pass,fname);
            st.setId(Integer.parseInt(request.getParameter("sid")));
            StudentDao dao = new StudentDao(ConnectionProvider.getConnection());
            String status = dao.updateStudent(st);
            
            if(status.equals("")){
                out.println("done");
                HttpSession s = request.getSession();
                s.setAttribute("Student", st);
            }
            else{
                out.println(status+"Some sql constraints are been voilated, please check again.\nUser may already exits \nEmail and phone number may be reapeted.");
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
            throws ServletException, IOException{
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
