
package com.learning.servlets;

import com.learning.dao.ModuleDao;
import com.learning.dao.QuestionDao;
import com.learning.entities.modules;
import com.learning.entities.questions;
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

public class addQuestions extends HttpServlet {

 
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            int noq = Integer.parseInt(request.getParameter("noq"));
            
            questions q;
            
            for (int i = 0; i < noq; i++) {

                int qId = Integer.parseInt(request.getParameter("qId" + (i + 1)));
                int cId = Integer.parseInt(request.getParameter("cId" + (i + 1)));
                String que = request.getParameter("que" + (i + 1));
                String a = request.getParameter("a" + (i + 1));
                String b = request.getParameter("b" + (i + 1));
                String c = request.getParameter("c" + (i + 1));
                String d = request.getParameter("d" + (i + 1));
                String ans = request.getParameter("ans" + (i + 1));
                            

                q = new questions(qId,cId,que,a,b,c,d,ans);

                QuestionDao dao = new QuestionDao(ConnectionProvider.getConnection());

                boolean status = dao.addQuestion(q);
                System.out.println(status);
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
