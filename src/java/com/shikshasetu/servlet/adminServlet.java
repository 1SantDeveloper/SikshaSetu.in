/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.shikshasetu.servlet;

import com.shikshasetu.dao.RegisterDao;
import com.shikshasetu.entities.RegisterUser;
import com.shikshasetu.helper.ConnectionProvider;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author SantDeveloper
 */
public class adminServlet extends HttpServlet {

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
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
        response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
        response.setDateHeader("Expires", 0);
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */

            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet adminServlet</title>");
            out.println("</head>");
            out.println("<body>");

            String email = request.getParameter("email");
            String pass = request.getParameter("password");
            String Email = "aryan.santosh.97@gmail.com";
            String Pass = "9810667915";
//            String email = request.getParameter("email");
//            out.println("email ;" + email + "password P:" + pass);

            if (email.equals(Email) && pass.equals(Pass)) {
                String t = " <br><br><br><center><table border='1'>\n"
                        + "\n"
                        + "                        <thead>\n"
                        + "                            <tr>\n"
                        + "                                <th scope=\"col\">User ID</th>\n"
                        + "                                <th scope=\"col\">UserName</th>\n"
                        + "                                <th scope=\"col\">User Email</th>\n"
                        + "                                <th scope=\"col\">User phone</th>\n"
                        + "                                <th scope=\"col\">User password</th>\n"
                        + "                                <th scope=\"col\">Registration Date</th>\n"
                        + "                            </tr>\n"
                        + "                        </thead>\n"
                        + "\n"
                        + "                   ";

                out.println(t);
                RegisterDao rd = new RegisterDao(ConnectionProvider.getConnect());
                List<RegisterUser> rel = rd.getAllRegisterUser();

                for (RegisterUser ru : rel) {
                    out.println("<tbody><tr>");
                    out.println("<th>");
                    out.println(ru.getUserId());
                    out.println("</th>");
                    out.println("<td>");
                    out.println(ru.getUserName());
                    out.println("</td>");
                    out.println("<td>");
                    out.println(ru.getEmail());
                    out.println("</td>");
                    out.println("<td>");
                    out.println(ru.getPhoneNo());
                    out.println("</td>");
                    out.println("<td>");
                    out.println(ru.getPassword());
                    out.println("</td>");
                    out.println("<td>");

                    out.println(ru.getDateTime());
                    out.println("</td>");
                    out.println("</tr>");
                    out.println("</tbody>");

                }
                out.println("</table></center>");
                out.println("<center><br><br>");
                out.println("<a href='index.jsp'>Home Page</a>");
                out.println("</center>");

            } else {

                response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
                response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
                response.setDateHeader("Expires", 0);

                out.println("<br><br><br><br><br><br><br><center>");
                out.println("<h2> <font color=red>Your have enter Invalid Password. <br>Please enter valid Password <br>which is sent on your valid Email Address</font><h2>");
                String back = "<button onclick=\"goBack()\">Go Back</button>\n"
                        + "\n"
                        + "<script>\n"
                        + "function goBack() {\n"
                        + "  window.history.back();\n"
                        + "}\n"
                        + "</script>";
                out.println(back);
                out.println("");
                out.println("</center>");
            }
//         
                out.println("<hr><hr><h1>Backup all data folder</h1>");
                out.println("<a href='backUpServlet'> Take Backup</a>");

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
