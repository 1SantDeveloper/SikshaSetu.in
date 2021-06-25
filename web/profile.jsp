
<%@page import="com.shikshasetu.entities.RegisterUser"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%--<%@page  import ="java.sql.*"%>--%>
<!DOCTYPE html>
<html>
    <head>
        <!--meta tag file is added-->
        <%@include file="/metatag.jsp"%>
        <!--meta tag file is added-->
         <!-- Chrome, Firefox OS and Opera -->
        <meta name="theme-color" content="#FF0000">
        <!-- Windows Phone -->
        <meta name="msapplication-navbutton-color" content="#FF0000">
        <!-- iOS Safari -->
        <meta name="apple-mobile-web-app-status-bar-style" content="#FF0000">
       
         <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>sikshasetu ! profile area :  Where student share their talent.</title>
        <!--css start -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="css/shikhsasetu_css.css" rel="stylesheet" type="text/css"/>
        <!--css end--> 
    </head>

    <body>
        <!--       //
        ////            RegisterUser ru = (RegisterUser) session.getAttribute("cuser");
        //            if (ru == null) {
        //
        //                //        out.println(ru);
        //                response.sendRedirect("login.jsp");
        //
        //            }-->




        <%
            response.setHeader("Pragma", "no-cache");
            response.setHeader("Cache-Control", "no-store,must-revalidate, no-cache");
            response.setHeader("Expires", "0");
            response.setDateHeader("Expires", -1);
        %>
        <!--navbar added--> 

        <%@include file="/profileNavBar.jsp" %>
        <!--navbar ended-->
        <!--body content of index page-->
        <div class="container mt-4 mb-4">
            <div class="row row-cols-1 row-cols-md-6 g-4  mt-4 mb-4">
                <div class="col"> 
                   
                    <div class="card h-80 bg-warning text-dark  mt-4 mb-3">
                        <span class="	fa fa-plus-square text-center fa-5x mt-2"  style="color:white;"></span>
                        <div class="card-body">
                            <h5 class="card-title pb-1 text-center">Contribute in Article or Blog</h5>
                        </div>
                        <div class="card-footer text-center">
                           
                            <a type="button" class="btn btn-primary btn-sm" href="addBlog.jsp" class="text-white">ADD</a>
                           <a type="button" class="btn btn-dark btn-sm" href="showAllBlog.jsp" class="text-white">VIEW</a>
                        </div>
                    </div>
                </div>
                <div class="col">
                    <div class="card h-80 bg-info text-light mt-4 mb-3">
                        <span class="fa fa-file-text-o text-center fa-5x mt-2"  style="color:white;"></span>
                        <div class="card-body">
                            <h5 class="card-title pb-1 text-center">Contribute in Q-paper</h5>
                        </div>
                        <div class="card-footer text-center">
                           <a type="button" class="btn btn-primary btn-sm" href="addQuestion.jsp" class="text-white">UPLOAD</a>
                           <a type="button" class="btn btn-primary btn-sm" href="AddQuestionlink.jsp" class="text-white">LINK</a>
                           
                        </div>
                    </div>
                </div>
                <div class="col">
                    <div class="card h-80 bg-danger text-light mt-4 mb-3">
                        <span class="fa fa-file-text-o text-center fa-5x mt-2"  style="color:yellow;"></span>
                        <div class="card-body">
                            <h5 class="card-title pb-1 text-center">Add Solution of Q-paper</h5>
                        </div>
                        <div class="card-footer text-center">
                          <a type="button" class="btn btn-primary btn-sm" href="showAllQuestionp.jsp" class="text-white">ADD / VIEW</a>
                         
                        </div>
                    </div>
                </div>
                <div class="col">
                    <div class="card h-80 bg-primary text-light mt-4 mb-3">
                        <span class="fa fa-file-code-o text-center fa-5x mt-2"  style="color:yellow;"></span>
                        <div class="card-body">
                            <h5 class="card-title pb-1 text-center">Contribute in LiveAppStore</h5>
                        </div>
                        <div class="card-footer text-center">
                           <a type="button" class="btn btn-dark btn-sm" href="addLiveApp.jsp" class="text-white">ADD/VIEW</a>
                                                  
                        </div>
                    </div>
                </div>
                <div class="col">
                    <div class="card h-80 bg-secondary text-white mt-4 mb-3">
                        <span class="fa fa-file-code-o text-center fa-5x mt-2"  style="color:white;"></span>
                        <div class="card-body">
                            <h5 class="card-title pb-1 text-center">Add App Source Code</h5>
                        </div>
                        <div class="card-footer text-center">
                            <a type="button" class="btn btn-warning btn-sm" href="ShowAppStore.jsp" class="text-white">ADD/VIEW</a>
                           
                        </div>
                    </div>
                </div>
                <div class="col">
                    <div class="card h-80 bg-success text-light mt-4 mb-3">
                        <span class="fa fa-hand-o-down text-center fa-5x mt-2"  style="color:black;"></span>
                        <div class="card-body">
                            <h5 class="card-title pb-1 text-center">Contribute in Notification</h5>
                        </div>
                        <div class="card-footer text-center">
                           <a type="button" class="btn btn-dark btn-sm" href="addNotification.jsp" class="text-white">ADD/VIEW</a>
                           
                           
                        </div>
                    </div>
                    
                   
                    
                </div>
            </div>
        </div>
        <!--end body content of inedex page--> 

  <div class="container mt-2 mb-4">
      <div class="row row-cols-1 row-cols-md-6 g-4  mt-4 mb-4">
          
          
           
                    <!--//ading bookstore card-->
                    <div class="col">
                    <div class="card h-80 bg-info text-light mt-4 mb-3">
                        <span class="fa fa-hand-o-down text-center fa-5x mt-2"  style="color:white;"></span>
                        <div class="card-body">
                            <h5 class="card-title pb-1 text-center">Contribute in Book or Note Store</h5>
                        </div>
                        <div class="card-footer text-center">
                           <a type="button" class="btn btn-dark btn-sm" href="addBookStore.jsp" class="text-white">ADD/VIEW</a>
                           
                           
                        </div>
                    </div>
                </div>
                    
                    <!--adding bookstore card end here-->
                     
                    <!--//ading share file card-->
                   
                    
                    <!--adding sharefile  card end here-->
          
          
      </div>
      </div>





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





































