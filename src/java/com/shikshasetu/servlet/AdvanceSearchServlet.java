/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.shikshasetu.servlet;

import com.shikshasetu.dao.QuestionDao;
import com.shikshasetu.entities.QuestionEntity;
import com.shikshasetu.helper.ConnectionProvider;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author SantDeveloper
 */
public class AdvanceSearchServlet extends HttpServlet {

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
            out.println("<title>Servlet AdvanceSearchServlet</title>");
            out.println("</head>");
            out.println("<body>");
            String university = request.getParameter("university");
            String course = request.getParameter("course");
            String category = request.getParameter("category");
            String subject = request.getParameter("subject");
//            subject="%"+subject+"%";
//            System.out.println(university+course+category+subject);
            String query=null;
            try{
//             query="select * from questionpaper where university=\'"+university+"\' and course=\'"+course+"\' and subject= \'"+subject+"\'";
//             query="select * from questionpaper where university like " +university + "or course like "+ course+ "or category like "+category;
               QuestionDao QD= new QuestionDao(ConnectionProvider.getConnect());
//               System.out.println("reacxh at List ");
//              List<QuestionEntity> QEL= QD.getSearchQuestionPaperwithCustomQuery(query);
              List<QuestionEntity> QEL= QD.getSearchQuestionPaperwithCustomQuery(university,course,category, subject);
//              System.out.println("value of"+QEL);
              if(QEL!=null){
                  
                     System.out.println("value of not null"+QEL);
//                 Datafound=true;
//                 out.println(BEL.size()+" Data found for your search");
                 HttpSession bs=request.getSession();
                 bs.setAttribute("SearchQuestionList",QEL);
                 HttpSession ms=request.getSession();
//                 Message SM=new Message();
//                 ms.setAttribute("SearchBlogMessage",M);
                 response.sendRedirect("searchQuestionResult.jsp");
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
