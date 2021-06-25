
<%@page import="com.shikshasetu.entities.Message"%>
<%--<%@page import="com.shikshasetu.helper.ConnectionProvider"%>--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%--<%@page isErrorPage="true" %>--%>
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
        <title>sikshasetu! Login : Where student share their talent.</title>
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
                <div class="row justify-content-center">
                    <div class="col-lg-4">    
                        <div class="card">
                            <div class="card-header text-center backbg text-white">
                                <span class="fa fa-user-circle fa-2x fa-spin" ></span>
                                <p class="hint-text">Please login into your account !</p>
                            </div>
                            <%                                Message m = (Message) session.getAttribute("loginMsg");
                                if (m != null) {
                            %>

                            <div class="alert alert-warning alert-dismissible fade show bg-danger text-white" role="alert">
                                <strong><%=m.getMsg()%></strong> <%=m.getType()%>
                                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                            </div>
                            <%
                                    session.removeAttribute("loginMsg");
                                }


                            %>
                            <!--fetching error from error paage session ErrorType-->
                            <%  Message mm = (Message) session.getAttribute("ErrorType");
                                if (mm != null) {
                            %>

                            <div class="alert alert-warning alert-dismissible fade show bg-danger text-white" role="alert">
                                <strong><%=mm.getMsg()%></strong> <%=mm.getType()%>
                                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                            </div>

                            <%
                                    session.removeAttribute("ErrorType");
                                }

                            %>
                            <!--Fetching successfull registe sesssion when success full registe--> 
                            <%                               Message mmm = (Message) session.getAttribute("Reg");
                               if (mmm != null) {%>
                            <div class="alert alert-warning alert-dismissible fade show bg-danger text-white" role="alert">
                                <strong><%=mmm.getMsg()%></strong> <%=mmm.getType()%>
                                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                            </div> 

                            <%
                                    session.removeAttribute("Reg");
                                }
                            %>

                            <!--fetching update profile message here starting code-->
                            <%
     Message mmmm = (Message) session.getAttribute("UPM");
     if (mmmm != null) {%>
                            <div class="alert alert-warning alert-dismissible fade show bg-info text-white" role="alert">
                                <strong><%=mmmm.getMsg()%></strong> <%=mmmm.getType()%>
                                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                            </div> 

                            <%
                                    session.removeAttribute("UPM");
                                }
                            %>




                            <!--fetching update profile messge here end block here-->

                            <div class="card-body">		
                                <form action="loginServlet" method="post">

                                    <div class="form-group">
                                        <input type="email" class="form-control mt-4" name="Email" placeholder="Email" required="required">
                                    </div>

                                    <div class="form-group">
                                        <input type="password" class="form-control mt-4" name="Password" placeholder="Password" required="required">
                                    </div>

                                    <div class="d-grid gap-2 mt-4">
                                        <input type="submit" class="btn btn-outline-primary" value="Sign In">
                                    </div>

                                </form>

                                <div class="d-grid gap-2">
                                    <!--                                    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
                                                                            Launch demo modal
                                                                        </button>-->
                                    <a  href="forgotPassword.jsp" class="btn btn-outline-success mt-3 my-4 " type="button">Forgot Password</a>

                                    <!--<button class="btn btn-primary bg-success" type="button"><a href="signup.jsp  " class="text-white">Don't have Account</a></button>-->
                                </div>
                                <div class="d-grid gap-2">
                                    <!--                                    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
                                                                            Launch demo modal
                                                                        </button>-->
                                    <!--<button class="btn btn-primary bg-success d-grid gap-2" data-bs-toggle="modal" data-bs-target="#exampleModal" type="button">Forgot Password</button>-->
                                    <a href="signup.jsp" class="btn btn-outline-primary">Don't have Account</a>
                                </div>

                            </div>
                        </div
                    </div>

                </div>
            </div>
        </div>

    </main>

    <!--modal for forgot password-->

    <!--end modals-->

    <!--signup form code ened-->

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
