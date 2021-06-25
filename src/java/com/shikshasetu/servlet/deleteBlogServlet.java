
package com.shikshasetu.servlet;

import com.shikshasetu.dao.BlogDao;
import com.shikshasetu.entities.Message;
import com.shikshasetu.helper.ConnectionProvider;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author SantDeveloper
 */
public class deleteBlogServlet extends HttpServlet {

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
            out.println("<title>Servlet deleteBlogServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            //fetching post id from addblogjsppage internal namei postID ;
            int  pid= Integer.parseInt(request.getParameter("postID"));
            try{
            BlogDao bd= new BlogDao(ConnectionProvider.getConnect());
            Boolean s= bd.deleteBlog(pid);
            if(s){
                Message DeleteBlogMessage= new Message("Blog Deleted Successfully.","SUCCESS");
                HttpSession DeleteBlogSession=request.getSession();
                DeleteBlogSession.setAttribute("DeleteBlog",DeleteBlogMessage);
                response.sendRedirect("addBlog.jsp");
            }
            else
            {
                 Message DeleteBlogMessage= new Message("Blog not Deleted Successfully.Please try again","ERROR");
                HttpSession DeleteBlogSession=request.getSession();
                DeleteBlogSession.setAttribute("DeleteBlog",DeleteBlogMessage);
                response.sendRedirect("addBlog.jsp");
            }
            
            }catch(Exception e)
            {
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
