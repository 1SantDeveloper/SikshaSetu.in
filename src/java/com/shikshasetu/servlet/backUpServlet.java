/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.shikshasetu.servlet;

import java.io.IOException;
import java.io.*;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author SantDeveloper
 */
public class backUpServlet extends HttpServlet {

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
            out.println("<title>Servlet backUpServlet</title>");
            out.println("</head>");
            out.println("<body>");
                       
//            backup code start here
            String source = request.getRealPath("/") + "img";
            String dest = System.getProperty("user.home");
            String destination= dest+File.separator+"imgData";
            out.println(source);
            out.println("<br>"+destination);

            out.println("<br>");
//            String newpath = destination;

            File sourcefile = new File(source);
            File destinationfile = new File(destination);
            copyFolder(sourcefile, destinationfile);
            out.println("path of home destination:  " + destination);
            out.println("path of home source:  " + source);

//            backup code end  here
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

    public static void copyFolder(File source, File destination) {
        
       InputStream is = null;
      OutputStream os = null;
      if(!destination.exists())
      {
          destination.mkdirs();
      }
      try {
          is = new FileInputStream(source);
          os = new FileOutputStream(destination);
          byte[] buffer = new byte[1024];
          int length;
          while ((length = is.read(buffer)) > 0) {
              os.write(buffer, 0, length);
          }
          System.out.println("able to copy file:");
      }catch(Exception ex) {
        System.out.println("Unable to copy file:"+ex.getMessage());
      }  
      finally {
        try {
          is.close();
          os.close();
        }catch(Exception ex) {}
      }
        
        
    }

}
