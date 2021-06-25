<%@page import="com.shikshasetu.entities.Message"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page isErrorPage="true" %>
<%--<%@page  import ="java.sql.*"%>--%>
<!DOCTYPE html>
<html>
    <head>
        <!--meta tag file is added-->
        <%@include file="/metatag.jsp"%>
        <!--meta tag file is added-->
         <!-- Chrome, Firefox OS and Opera -->
        <meta name="theme-color" content="#4285f4">
        <!-- Windows Phone -->
        <meta name="msapplication-navbutton-color" content="#4285f4">
        <!-- iOS Safari -->
        <meta name="apple-mobile-web-app-status-bar-style" content="#4285f4">
       
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>sikshasetu ! Error page:  Where student share their talent.</title>
        <!--css start -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="css/shikhsasetu_css.css" rel="stylesheet" type="text/css"/>
        <!--css end--> 
    </head>

    <body>

        <!--navbar added--> 
        <%@include file="/navbar.jsp"%>
        <!--navbar ended-->
        <!--body content of index page-->

        <div class="contianer text-center">

            
                        <div class="card  text-center">
                            <center> <img src="img/4042.jpg" height="160" width="300" class="crd-img-top mt-4" alt="..."></center>
                            
                            <div class="card-body">
                                <h5 class="card-title"> 
                                    <% if(exception!=null)
                                    { 
                                   out.println(exception + "<br>In case of Exception  : Refresh the page and LogIn again.");
                                   Message EM= new Message("Please Insure that you are not trying to access any authenticate page. please Login again and try again.",exception.toString());
                                   session.setAttribute("ErrorType", EM);
                                   response.sendRedirect("login.jsp");
                                    
                                       }  else{
                                    out.println("The page your are trying to acees that is not available on this site.");
                                    }
                                    %>
                                        
                                        
                                </h5>
                                
                        </div>


                        


                    </div>

               
           





        <!--ending body of content-->

        <!--js-->
        <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js" integrity="sha384-q2kxQ16AaE6UbzuKqyBE9/u/KzioAlnx2maXQHiDX9d4/zp8Ok3f+M7DPm+Ib6IU" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.min.js" integrity="sha384-pQQkAEnwaBkjpqZ8RU1fF1AKtTcHJwFl3pblpTlHXybJjHpMYo79HY3hIi4NKxyj" crossorigin="anonymous"></script>
        <!--js end-->  
        <!--carosolcodin-->


        <!--carosole coding end-->




    </body>
    <%@include file="/footer.jsp" %>  
</html>
