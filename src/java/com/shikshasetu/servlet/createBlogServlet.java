package com.shikshasetu.servlet;

import com.shikshasetu.dao.BlogDao;
import com.shikshasetu.entities.BlogEntity;
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
public class createBlogServlet extends HttpServlet {

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
            out.println("<title>Servlet createBlogServlet</title>");
            out.println("</head>");
            out.println("<body>");
//            getting all form value for save data into database
            String title = request.getParameter("title");
            String desc = request.getParameter("discription");
            Part imgpart= request.getPart("fimage");
            
            String imageName = imgpart.getSubmittedFileName();
            String blogContent = request.getParameter("ckdetail");
            String category= request.getParameter("blogcategory");
            HttpSession us = request.getSession();
            RegisterUser ru = (RegisterUser) us.getAttribute("cuser");
            Boolean r = false;
            try {
                BlogEntity Be = new BlogEntity(ru.getUserId(), title, desc, imageName, blogContent,category);
                BlogDao bd = new BlogDao(ConnectionProvider.getConnect());
                r = bd.saveBlog(Be);
                String M = null;
                String T = null;
                if (r) {
                    String path=request.getRealPath("/")+"img"+File.separator+"BlogImage"+File.separator+imageName;
                    Boolean fr=ImageHelper.imageSave(imgpart.getInputStream(), path);
                    M = "Blog saved successfully .";
                    T = "Succsss";
                    Message BlogMessage = new Message(M, T);
                    HttpSession BM = request.getSession();
                    BM.setAttribute("BlogMessage", BlogMessage);
                    //creating session ojbect for edit post 
                    
                    
                } else {
                    M = "Blog data is not saved.Something went wrong.pleast try again.";
                    T = "Error";
                    Message BlogMessage = new Message(M, T);
                    HttpSession BM = request.getSession();
                    BM.setAttribute("BlogMessage", BlogMessage);

                }

            } catch (Exception e) {
                e.printStackTrace();
            }

            response.sendRedirect("addBlog.jsp");

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
