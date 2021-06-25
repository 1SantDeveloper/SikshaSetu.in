/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.shikshasetu.servlet;

import com.shikshasetu.dao.SolutionDao;
import com.shikshasetu.entities.Message;
import com.shikshasetu.entities.SolutionEntity;
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
public class AddSolvedPaperServlet extends HttpServlet {

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
            out.println("<title>Servlet AddSolvedPaperServlet</title>");
            out.println("</head>");
            out.println("<body>");
            //fetching all form value fo addquestion.jsp
            int userid = Integer.parseInt(request.getParameter("QID"));
            int qid = Integer.parseInt(request.getParameter("UID"));
            int amount = Integer.parseInt(request.getParameter("price"));
            String title = request.getParameter("title");
            String manually = request.getParameter("manuallytext");
            Part preview = request.getPart("previewfile");
            String previewfile = preview.getSubmittedFileName();
            Part file = request.getPart("fullfile");
            String fileName = file.getSubmittedFileName();
            String path = request.getRealPath("/") + "img" + File.separator + "solution" + File.separator;
            // end fetching value code here
            Boolean r, rr = null, rrr = null;
            String m = null, t = null;
            SolutionEntity SE = new SolutionEntity(title, previewfile, fileName, manually, amount, qid, userid);
            try {
                SolutionDao SD = new SolutionDao(ConnectionProvider.getConnect());
                r = SD.saveSolution(SE);
                if (r) {
                    rr = ImageHelper.imageSave(file.getInputStream(), path + fileName);
                    rrr = ImageHelper.imageSave(preview.getInputStream(), path + previewfile);
                    m = "Solution Added sucessfully . Thankyou";
                    t = "SUCCESS";
                    Message M = new Message(m, t);
                    HttpSession SM = request.getSession();
                    SM.setAttribute("SM", M);
                    response.sendRedirect("showAllQuestionPaper.jsp");
                } else {
                    Message M = new Message(m, t);
                    HttpSession SM = request.getSession();
                    SM.setAttribute("SM", SM);
                    m = "Solution Added unsucessfully . Thankyou and try again.";
                    t = "ERROR";
                    response.sendRedirect("showAllQuestionPaper.jsp");
                }
                System.out.println(title + userid + " " + qid + amount + manually + preview + file + "valur of r is : " + r + "rr" + rr + "rrr" + rrr);
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
