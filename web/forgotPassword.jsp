
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
        <title>sikshasetu! Forget Password :  Where student share their talent.</title>
        <!--css start -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="css/shikhsasetu_css.css" rel="stylesheet" type="text/css"/>
        <!--css end--> 
    </head>

    <body>
        <%@include file="/navbar.jsp"%>

        <div class="container my-4 mb-4 p-4">
            <div class="row justify-content-center my-4 mb-4">
                <div class="col-lg-4  mb-4">
                    <div class="card mb-4">
                        <div class="card-header bg-secondary  rounded-2 text-white text-center">
                            <h5>Please Enter correct detail .It will verify the credential</h5>
                        </div>
                        <form  action="ResetPasswordServlet" method="post">
                            <div class="mb-2 p-2">
                                <label for="exampleFormControlInput1" class="form-label text-white">User Name</label>
                                <input required="required"  name="name" type="text" class="form-control" id="exampleFormControlInput1" placeholder="Register User name">
                            </div>
                            <div class="mb-2 p-2">
                                <label   for="exampleFormControlInput1" class="form-label text-white">Email address</label>
                                <input  required="required"  name= "email" type="email" class="form-control" id="exampleFormControlInput1" placeholder="Register Email">
                            </div>
                            
                           <div class="d-grid gap-2 p-2 mb-2">
                              
                               <p class="rounded-2 bg-secondary text-white">Note:<small>Please wait after form submission. It will validate you.</small></p>
                           
                           </div>     
                           <div class="d-grid gap-2  p-2 mb-2">
                               <button class="btn btn-outline-primary text-success bg-white" type="submit">Validate</button>
                           </div>     
                    </div>
                    </form>


                </div>
            </div>


        </div>





        <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js" integrity="sha384-q2kxQ16AaE6UbzuKqyBE9/u/KzioAlnx2maXQHiDX9d4/zp8Ok3f+M7DPm+Ib6IU" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.min.js" integrity="sha384-pQQkAEnwaBkjpqZ8RU1fF1AKtTcHJwFl3pblpTlHXybJjHpMYo79HY3hIi4NKxyj" crossorigin="anonymous"></script>
        <!--js end-->  
        <!--carosolcodin-->


        <!--carosole coding end-->




    </body>
    <%@include file="/footer.jsp" %>  
</html>
