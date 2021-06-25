/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.shikshasetu.servlet;

import com.shikshasetu.dao.NotificaionDao;
import com.shikshasetu.entities.Message;
import com.shikshasetu.entities.NotificationEntity;
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
public class AddNotificationServlet extends HttpServlet {

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
            out.println("<title>Servlet AddNotificationServlet</title>");
            out.println("</head>");
            out.println("<body>");
//           fetchin all value from addnotification.jsp page
            HttpSession session = request.getSession();
            RegisterUser RU = (RegisterUser) session.getAttribute("cuser");
            int userid = RU.getUserId();
            String title = request.getParameter("title");
            String desc = request.getParameter("ckdetail");
            String nfor = request.getParameter("for");
            String nfrom = request.getParameter("from");
            Part file = request.getPart("filename");
            String attachname = file.getSubmittedFileName();
//            System.out.println(userid+title+desc+nfor+nfrom+attachname);
            String category = request.getParameter("notificationcategory");
            String path = request.getRealPath("/") + "img" + File.separator + "notification" + File.separator;
            NotificationEntity NE = new NotificationEntity(title, desc, nfor, nfrom, attachname, userid,category);
            Boolean r = null;

            try {
                NotificaionDao ND = new NotificaionDao(ConnectionProvider.getConnect());
                r = ND.saveNotificaion(NE);
                if (r) {
                    ImageHelper.imageSave(file.getInputStream(), path + attachname);
                    Message m = new Message("Notification uploaded successfull.", "SUCCESS MESSAGE");
                    HttpSession s = request.getSession();
                    s.setAttribute("NM", m);
                    response.sendRedirect("addNotification.jsp");

                } else {
                    Message m = new Message("Notification uploaded Unsuccessfull.", "ERROR MESSAGE");
                    HttpSession s = request.getSession();
                    s.setAttribute("NM", m);
                    response.sendRedirect("addNotification.jsp");
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
