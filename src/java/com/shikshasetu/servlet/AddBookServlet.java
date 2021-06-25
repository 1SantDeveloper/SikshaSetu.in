/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.shikshasetu.servlet;

import com.shikshasetu.dao.BookDao;
import com.shikshasetu.entities.BookEntity;
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
public class AddBookServlet extends HttpServlet {

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
            out.println("<title>Servlet AddBookServlet</title>");            
            out.println("</head>");
            out.println("<body>");
//          fetching all form data from bookstore.sp
           String t=request.getParameter("title");
           String desc= request.getParameter("ckeditor");
           Part file= request.getPart("file");
           String fileName=file.getSubmittedFileName();
           out.println(t+desc+fileName);
           String path=request.getRealPath("/")+"img"+File.separator+"BookStore"+File.separator;
           HttpSession s=request.getSession();
          RegisterUser u=(RegisterUser) s.getAttribute("cuser");
           BookEntity BE= new BookEntity(t,desc,fileName,u.getUserId());
           Boolean r=false;
           try{
               BookDao BD= new BookDao(ConnectionProvider.getConnect());
              r= BD.saveBook(BE);
              if(r)
              {
                  ImageHelper.imageSave(file.getInputStream(), path+fileName);
                  Message m=new Message("Book save successfully in database","SUCCESS");
                  HttpSession ss=request.getSession();
                  ss.setAttribute("BM", m);
              }
              else
              {
                  Message m=new Message("Something went wrong , book not saved. try again","ERROR");
                  HttpSession ss=request.getSession();
                  ss.setAttribute("BM", m);
              }
           
               
               
           }catch(Exception e)
           {
           e.printStackTrace();
           }
           response.sendRedirect("addBookStore.jsp");
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
