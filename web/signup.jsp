
<%@page import="com.shikshasetu.entities.Message"%>
<%@page import="com.shikshasetu.helper.ConnectionProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%--<%@page  import ="java.sql.*"%>--%>
<!DOCTYPE html>
<html>
    <head>
        <!--meta tag file is added-->
        <%@include file="/metatag.jsp"%>
        <!--meta tag file is added-->
        <meta name="theme-color" content="#4285f4">
        <!-- Windows Phone -->
        <meta name="msapplication-navbutton-color" content="#4285f4">
        <!-- iOS Safari -->
        <meta name="apple-mobile-web-app-status-bar-style" content="#4285f4">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!--<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">-->
        <title>SikshaSetu! signUp page :  Where student share their talent.</title>
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

        <!--signup form code-->
        <main>
            <div class="container mt-4 mb-4">
                <div class="row align-items-center justify-content-center">
                    <div class="col-lg-4 ">    
                        <div class="card ">
                            <div class="card-header text-center backbg text-light">
                                <span class="fa fa-user-plus fa-2x"></span>
                                <p class="hint-text">Fill in this form to create your account!</p>
                            </div>
                            <%
                                Message m = (Message)session.getAttribute("msg");
                                if (m != null) {
                            %>
                            <div class="alert alert-danger alert-dismissible fade show bg-danger text-light" role="alert">
                                <strong><%=m.getMsg()%></strong><%=m.getType()%>
                                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                            </div> 
                            <%      
                                    session.removeAttribute("msg");
                                }
                                  
                            %>
                              
                            
                            <!--message from signuup otp mysq error code--> 
                            <%
                            
                            Message mmm=(Message) session.getAttribute("Reg");
                             if(mmm!=null)
                             {%>
                                <div class="alert alert-warning alert-dismissible fade show bg-danger text-white" role="alert">
                                <strong><%=mmm.getMsg()%></strong> <%=mmm.getType()%>
                                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                            </div> 
                             
                           <%
                               session.removeAttribute("Reg");
                                 }
                               %>

                            
                            
                            <!--message end  from signuup otp mysq error code--> 
                            
                            
                            
                            
                            

                            <div class="card-body mt-1 bg-white text-dark">		
                                <form  class="p-2" id="reg-form" action="RegisterServlet" method="post">

                                    <div class="form-group mt-2">
                                        <input type="text" class="form-control" name="UserName" placeholder="Username" required="required">
                                    </div>
                                    <div class="form-group mt-2">
                                        <input type="Email" class="form-control" name="Email" placeholder="Email" required="required">
                                    </div>
                                    <div class="form-group mt-2">
                                        <input type="number" class="form-control" name="Phone" placeholder="Phone No" required="required">
                                    </div>
                                    <div class="form-group mt-2">
                                        <input type="password" class="form-control" name="Password" placeholder="Password" required="required">
                                    </div>
                                    <div class="form-group mt-2">
                                        <input type="password" class="form-control" name="RPassword" placeholder="Confirm Password" required="required">
                                    </div>
                                    <div class="form-group mt-4">
                                        <label class="form-check-label"><input type="checkbox" name="term" value="i agree" required="required"> I accept the <a href="terms.jsp">Terms &amp; Conditions</a></label>
                                    </div>
                                    <div class="form-group mt-2">
                                        <p class="bg-secondary text-light rounded-3 p-2 mt-2">Note:<small>Please wait after form submission .It will send OTP to Your Email</small></p>
                                    </div>
                                    
                                    <div class="d-grid gap-2 mt-4">
                                        <input type="submit" class="btn btn-outline-primary " value="Sign up">
                                    </div>

                                </form>
                            </div>
                        </div
                    </div>

                </div>
            </div>
        </div>

    </main>

    <!--signup form code ened-->

    <!--js-->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js" integrity="sha384-q2kxQ16AaE6UbzuKqyBE9/u/KzioAlnx2maXQHiDX9d4/zp8Ok3f+M7DPm+Ib6IU" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.min.js" integrity="sha384-pQQkAEnwaBkjpqZ8RU1fF1AKtTcHJwFl3pblpTlHXybJjHpMYo79HY3hIi4NKxyj" crossorigin="anonymous"></script>
    <!--js end-->      <!--carosolcodin-->


    <!--carosole coding end-->




    <%@include file="/footer.jsp" %>  
</body>

</html>
