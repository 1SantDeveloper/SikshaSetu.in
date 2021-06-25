
<%@page import="com.shikshasetu.helper.MailSending"%>
<%@page import="com.shikshasetu.helper.CreateRandomNumber"%>
<%@page import="java.util.List"%>
<%@page import="com.shikshasetu.dao.RegisterDao"%>
<%@page import="com.shikshasetu.helper.ConnectionProvider"%>
<%--<%@page import="com.shikshasetu.helper.ConnectionProvider"%>--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <title>Sikshasetu ! Admin Panel : Where student share their talent.</title>
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
        <!--admin access verification-->
       <div class="container-fluid my-4 mb-4">
            <div class="row justify-content-center my-4 mb-4">
                <div class="col-lg-4 my-4 mb-4">
                    <div class="card bg-success mx-2 mb-4 rounded-2 p-3">
                        <div class="card-title bg-warning text-center">
                            <h5>Please Enter correct detail .It will verify the credential</h5>
                        </div>
                        <form action="adminServlet" method="post">
                            <div class="mb-3">
                                <label for="exampleFormControlInput1" class="form-label text-white">Admin Email</label>
                                <input required="required"  name="email" type="email" class="form-control" id="exampleFormControlInput1" placeholder= "Admin Email address">
                            </div>
                            <div class="mb-3">
                                <label   for="exampleFormControlInput1" class="form-label text-white">Password</label>
                                <input  required="required"  name= "password" type="password" class="form-control" id="exampleFormControlInput1" placeholder="Password">
                            </div>

                            <div class="d-grid gap-2 my-4 mb-4">

                               
                            </div>     
                            <div class="d-grid gap-2 my-4 mb-4">
                                <button class="btn btn-outline-primary text-success bg-white" type="submit">Validate</button>
                            </div>     
                    </div>
                    </form>


                </div>
            </div>


        </div>



<div class="container">
            <div class="row mb-2 mt-4 justify-content-center">
                  <div class="col">
                    <div class="card mb-3 bg-info text-white" style="max-height:35rem; max-width:34rem ">
                      
                            
                                <!--<img src="..." alt="...">-->
                               <center> <img src="img/santoshimage.jpg" alt="image" height="140" width="150" class="rounded-circle"/></center>
                              
                            
                           
                                <div class="card-body">
                                    <h5 class="card-title">Developer of this website</h5>
                                    <p class="card-text">Santosh Sharma </p>
                                    <p class="card-text">sikshasetu is developed by targeting to hold many features and useful things.</p>
                                    <p class="card-text"><small class="text-warning"> <a  class="text-white" href="http://santdeveloper.tk/"> visit our site</a></small></p>
                                    <hr><strong>Phone:</strong> <a href="tel://+91 9599217946">+91 9599217946</a><br>
                            
                            <strong>Email:</strong> <a href="mailto:Software.SantDeveloper@gmail.com">Software.SantDeveloper@gmail.com</a><br>

                                </div>
                          
                       
                    </div>

                </div>
              
                   <div class="col">
                    <div class="card mb-3 bg-info text-white" style="max-height:35rem; max-width:34rem   ;">
                       
                        <center> <img src="img/sumitimage.png" alt="image" height="140" width="150" class="rounded-circle"/></center>
                                <!--<img src="..." alt="...">-->
                            
                            
                                <div class="card-body">
                                    <h5 class="card-title">Best Contributor of this site.</h5>
                                    <p class="card-text">Sumit chauhan</p>
                                    <p class="card-text">Thanks to sumit for uploading much more data on this site and make it available for other users.</p>
                                    <p class="card-text"><small class="text-warning"><a class="text-white" href="http://santdeveloper.tk/"> visit our site</a></small></p>
                                    <hr>
                                <strong>Phone:</strong> <a href="tel://+91 8930530060">+91 8930530060</a><br>
                            <strong>Email:</strong> <a href="mailto:Software.SantDeveloper@gmail.com">Software.SantDeveloper@gmail.com</a><br>

                                </div>
                            
                        </div>
                    </div>
                </div>
            </div>
        



        <!--end body content of inedex page--> 







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
