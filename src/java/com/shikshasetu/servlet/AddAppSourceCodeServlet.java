/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.shikshasetu.servlet;

import com.shikshasetu.dao.SourceCodeDao;
import com.shikshasetu.entities.Message;
import com.shikshasetu.entities.SourceCodeEntity;
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
public class AddAppSourceCodeServlet extends HttpServlet {

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
            out.println("<title>Servlet AddAppSourceCodeServlet</title>");
            out.println("</head>");
            out.println("<body>");
//           fetching all form data

            String title = request.getParameter("title");
            int price = Integer.parseInt(request.getParameter("price"));
            Part appSourceFileName = request.getPart("AppSource");
            String appsource = appSourceFileName.getSubmittedFileName();
            String manually = request.getParameter("ManuallyCode");
            int aid = Integer.parseInt(request.getParameter("AID"));
            int uid = Integer.parseInt(request.getParameter("UID"));
            
            String path = request.getRealPath("/") + "img" + File.separator + "appStore" + File.separator;
//            System.out.println(title + price + appsource + manually + path + aid + uid);
//            out.println(title + price + appsource + manually + path + aid + uid);
            SourceCodeEntity ASCE = new SourceCodeEntity(title, price, appsource, manually, aid, uid);
            Boolean r = null;
            try {
                SourceCodeDao SCD = new SourceCodeDao(ConnectionProvider.getConnect());
                r = SCD.saveSourceCode(ASCE);
                if (r) {
                    Message M = new Message("Your Source Project file saved successfully. Thanks for supporting us.", "SUCCESS");
                    ImageHelper.imageSave(appSourceFileName.getInputStream(), path + appsource);
                    HttpSession session = request.getSession();
                    session.setAttribute("SourceCodeMessage", M);
                    response.sendRedirect("ShowAppStore.jsp");
                } else {
                    Message M = new Message("Your Source Project not saved. Thanks for supporting us and try again.", "ERROR");
                                       HttpSession session = request.getSession();
                    session.setAttribute("SourceCodeMessage", M);
                    response.sendRedirect("ShowAppStore.jsp");
                }
                
            } catch (Exception ex) {
                ex.printStackTrace();
                
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
