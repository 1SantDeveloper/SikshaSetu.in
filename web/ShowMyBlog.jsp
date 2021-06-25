
<%@page import="com.shikshasetu.dao.BlogDao"%>
<%@page import="com.shikshasetu.entities.BlogEntity"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.shikshasetu.helper.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.shikshasetu.entities.RegisterUser"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="com.shikshasetu.entities.Message"%>
<%--<%@page import="com.shikshasetu.helper.ConnectionProvider"%>--%>
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
        <title>sikshasetu ! Show Blogs :  Where student share their talent.</title>
        <script src="https://cdn.ckeditor.com/4.16.0/standard/ckeditor.js"></script>
        <!--css start -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="css/shikhsasetu_css.css" rel="stylesheet" type="text/css"/>
    <div id="fb-root"></div>
    <script async defer crossorigin="anonymous" src="https://connect.facebook.net/en_US/sdk.js#xfbml=1&version=v10.0" nonce="3ZbKergx"></script>
    <!--css end--> 
</head>


<Body>
    <!--navbar added--> 
    <%@include file="/navbar.jsp"%>
    <!--navbar ended-->

    <!--signup form code-->
    <main>
        <div class="container mt-4 mb-4">
            <div class="row">
                <div class="col-lg-12 ">    

                    <div class="card-header text-center bg-success text-white">
                        <span class="	fa fa-btc  fa-2x fa-spin" ></span>
                        <p class="hint-text">Welcome to Sikshasetu : Please do more Contribute </p>
                    </div>

                    <%                                String title = request.getParameter("BlogTitle");
//                    <%                                int pid = Integer.parseInt(request.getParameter("postID"));
                        BlogDao Bd = new BlogDao(ConnectionProvider.getConnect());
                        BlogEntity BE = Bd.getBlogByID(title);

                    %>
                    <div class="alert alert-success " role="alert">
                        <h2 class="alert-heading text-danger">Title : <%=BE.getTitle()%></h2>

                        <hr>
                        <h4 class="mb-4 text-primary"><br>Description :  <%=BE.getDiscription()%><hr></h4>

                        <div class="contianer text-dark">


                            <div class="card mb-3">

                                <div class="card-body text-dark">
                                    <Center> <img src="./img/BlogImage/<%=BE.getImg()%>" class="card-img-top" height="160"   alt="..."></center>
                                </div>

                            </div>
                            <p class="p-2 ml-2 text-dark">Content : <br><hr><%=BE.getDetailDescription()%></p>
                            <hr>
                        </div>
                        <!--<div class="fb-comments" data-href="http://localhost:8080/sikshasetu/ShowMyBlog.jsp?postID=<%//BE.getBlogId()%>" data-width="" data-numposts="10"></div>-->
                        <!--                    <div class="fb-comments" data-href="http://localhost:8080/shikshasetu/ShowMyBlog.jsp?postID=" data-width="700" data-numposts="12"></div>
                        -->
                        <div class="fb-comments" data-href="https://sikshasetu.in/ShowMyBlog.jsp?postID=<%=BE.getBlogId()%>" data-width="1000" data-numposts="20"></div>
                    </div>
                </div>
            </div>
        </div>


    </main>
    <section>
        <div class="container mt-4 mb-4 ">
            <div class="card w-100">
                <div class="card-body bg-info">
                    <h5 class="card-title text-center"><span class="fa fa-btc fa-spin fa-2x"></span></h5>
                    <p class="card-body text-center"><strong>Thanks for supporting us .</strong></p>



                </div>


                <!--</div>-->

            </div>

    </section>

    <!--signup form code ened-->

    <!--js-->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js" integrity="sha384-q2kxQ16AaE6UbzuKqyBE9/u/KzioAlnx2maXQHiDX9d4/zp8Ok3f+M7DPm+Ib6IU" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.min.js" integrity="sha384-pQQkAEnwaBkjpqZ8RU1fF1AKtTcHJwFl3pblpTlHXybJjHpMYo79HY3hIi4NKxyj" crossorigin="anonymous"></script>
    <script scr= "https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
    <!--js end-->  
    <!--carosolcodin-->


    <!--carosole coding end-->



    <!--fb comment plugin-->





</body>
<%@include file="/footer.jsp" %>  
</html>



