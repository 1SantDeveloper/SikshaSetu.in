/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.shikshasetu.servlet;

import com.shikshasetu.dao.AppSourceDao;
import com.shikshasetu.entities.AppSourceEntity;
import com.shikshasetu.entities.Message;
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
public class addAppServlet extends HttpServlet {

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
            out.println("<title>Servlet addAppServlet</title>");            
            out.println("</head>");
            out.println("<body>");
//           fetching all form data from addLiveApp.jsp
              String t= request.getParameter("title");
              Part imagepart=request.getPart("fimage");
              String i= imagepart.getSubmittedFileName();
              Part app=request.getPart("app");
              String appName=app.getSubmittedFileName();
              String appdetail=request.getParameter("appdetail");
              Part appsource= request.getPart("appsource");
              String appsourceName=appsource.getSubmittedFileName();
              String ckdetail=request.getParameter("ckdetail");
              String path=request.getRealPath("/")+"img"+File.separator+"appStore"+File.separator;
              out.println(t+i+appName+appdetail+appsourceName+ckdetail);
              HttpSession us=request.getSession();
              RegisterUser ru=(RegisterUser)us.getAttribute("cuser");
              AppSourceEntity ASE=new AppSourceEntity(t,i,appName,appdetail,appsourceName,ckdetail,ru.getUserId());
              try{
                  AppSourceDao asd= new AppSourceDao(ConnectionProvider.getConnect());
                  Boolean r= asd.saveAppSource(ASE);
                  if(r)
                  {
                      ImageHelper.imageSave(imagepart.getInputStream(), path+i);
                      ImageHelper.imageSave(app.getInputStream(), path+appName);
                      ImageHelper.imageSave(appsource.getInputStream(), path+appsourceName);
                     
                      Message m= new Message("Your App saved in Database successfully","SUCCESS");
                      HttpSession MS=request.getSession();
                         MS.setAttribute("AM",m);   
                         response.sendRedirect("addLiveApp.jsp");
                  }
                  else
                  {
                  Message m= new Message("Your App didn't  save succussfully .due to some constraints.","ERROR");
                      HttpSession MS=request.getSession();
                         MS.setAttribute("AM",m);   
                         response.sendRedirect("addLiveApp.jsp");
                  }
                  
                  
              }catch(Exception ex)
              {
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
