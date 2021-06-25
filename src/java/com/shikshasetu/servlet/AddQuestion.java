/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.shikshasetu.servlet;

import com.shikshasetu.dao.QuestionDao;
import com.shikshasetu.entities.Message;
import com.shikshasetu.entities.QuestionEntity;
import com.shikshasetu.entities.RegisterUser;
import com.shikshasetu.helper.ConnectionProvider;
import com.shikshasetu.helper.ImageHelper;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author SantDeveloper
 */
@MultipartConfig
public class AddQuestion extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AddQuestion</title>");
            out.println("</head>");
            out.println("<body>");
            int semester, year;
            String subject = request.getParameter("subject");
            String university = request.getParameter("university");
            String course = request.getParameter("course");
            String s = request.getParameter("semester");
            String y = request.getParameter("year");
            if (s.isEmpty()) {
                semester = 0;
            } else {
                semester = Integer.parseInt(request.getParameter("semester"));
            }
            if (y.isEmpty()) {
                year = 0;
            } else {
                year = Integer.parseInt(request.getParameter("year"));
            }

// fetchig mutiple file
//            List<Part> fileParts = request.getParts().stream().filter(part -> "filename".equals(part.getName())).collect(Collectors.toList()); // Retrieves <input type="file" name="file" multiple="true">
//
//            for (Part filePart : fileParts) {
//                String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString(); // MSIE fix.
//                InputStream fileContent = filePart.getInputStream();
//                out.println("file name is :" + fileName);
//                out.println("file content is : " + fileContent);
//                // ... (do your job he
//            }

//end mutiple fetching file end here
String category=request.getParameter("category");
            Part filepart = request.getPart("filename");
            String fileName = filepart.getSubmittedFileName();
            String filelocation = request.getRealPath("/") + "img" + File.separator + "questionUpload" + File.separator + fileName;

            HttpSession usr = request.getSession();
            RegisterUser ru = (RegisterUser) usr.getAttribute("cuser");
            int userid = ru.getUserId();
            out.println(subject + " " + university + course + semester + year + filelocation + userid);
            QuestionEntity QE = new QuestionEntity(subject, university,category, course, semester, year, fileName, userid);
            try {
                QuestionDao QD = new QuestionDao(ConnectionProvider.getConnect());
                Boolean r = QD.saveQuestion(QE);
                if (r) {
                    Boolean f = ImageHelper.imageSave(filepart.getInputStream(), filelocation);
                    String m = "Question paper saved successfully.";
                    String t = "Success";
                    Message QM = new Message(m, t);
                    HttpSession QSM = request.getSession();
                    QSM.setAttribute("QM", QM);
                    response.sendRedirect("addQuestion.jsp");
                } else {
                    Message QM = new Message("Something Went wrong.", "Error");
                    HttpSession QSM = request.getSession();
                    QSM.setAttribute("QM", QM);
                    response.sendRedirect("addQuestion.jsp");
                }

            } catch (Exception e) {
                e.printStackTrace();
            }
            out.println("</body>");
            out.println("</html>");
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
