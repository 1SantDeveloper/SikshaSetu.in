
<%@page import="com.shikshasetu.entities.NotificationEntity"%>
<%@page import="com.shikshasetu.dao.NotificaionDao"%>
<%@page import="com.shikshasetu.entities.RegisterUser"%>
<%@page import="com.shikshasetu.dao.RegisterDao"%>
<%@page import="com.shikshasetu.entities.BlogEntity"%>
<%@page import="java.util.List"%>
<%@page import="com.shikshasetu.dao.BlogDao"%>
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
        <meta name="theme-color" content="#4285f4">
        <!-- Windows Phone -->
        <meta name="msapplication-navbutton-color" content="#4285f4">
        <!-- iOS Safari -->
        <meta name="apple-mobile-web-app-status-bar-style" content="#4285f4">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>sikshasetu ! show all blog : Where student share their talent.</title>
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

        <main>

            <section class="py-5 text-center container">
                <div class="row py-lg-5">
                    <div class="col-lg-6 col-md-8 mx-auto">
                        <h4 class="fw-light"><Strong>Welcome to sikshasetu Blog Article Section</Strong></h4>
                        <p class="lead text-light"><small>sikshasetu provide the features to Write Blogs , articles ,Notes and any latest information .This will help to readers to know about latest information.Just signUp to create new Account and login  and do Contribution and share link to your friends. </small></p>
                        <p>
                            <a href="https://www.youtube.com/watch?v=htbjVJaGGao&feature=youtu.be" class="btn btn-primary my-2">Get Help to Start</a>
                            <a href="contactus.jsp" class="btn btn-secondary my-2">Report how to Improve</a>
                        </p>
                        <form action="SearchBlogServlet" method="post">
                            <div class="input-group bg-light mb-4">

                                <input type="text" class="form-control bg-light" name="SearchBlogString" placeholder="Type something to search in blog .." aria-label="Recipient's username with two button addons">
                                <button class="btn btn-secondary" type="submit"><span class="fa fa-search"></span></button>


                            </div>
                        </form>
                    </div>




                </div>
            </section>
            <!--my code ===-->
            <div class="container-fluid">

                <div class="row">

                    <div class="col-sm-9 col-md-6 col-lg-8 databar" >
                        <div class="contianer">

                            <div class="row mt-4 mb-4">


                                <div class="col">

                                    <h4 class="backbg p-4">Latest Blogs</h4><hr>
                                    <%
                                        BlogDao BD = new BlogDao(ConnectionProvider.getConnect());
                                        List<BlogEntity> BlogList = BD.getBlogByCategory(request.getParameter("category"));
                                        if (BlogList == null) {
                                            out.println("<h2>No category blog found..</h2>");
                                        }
                                        for (BlogEntity be : BlogList) {
                                    %>
                                    <div class="card mb-3">
                                        <div class="row g-0">
                                            <div class="col-md-4">
                                                <img src="./img/BlogImage/<%=be.getImg()%>" width="250" alt="...">
                                            </div>
                                            <div class="col-md-8">
                                                <div class="card-body">
                                                    <h5 class="card-title"><%=be.getTitle()%></h5>
                                                    <p class="card-text"><%=be.getDiscription()%></p>
                                                    <a href="ShowMyBlog.jsp?BlogTitle=<%=be.getTitle()%>" class="btn btn-outline-primary d-grid gap-2">Read More...</a>
                                                    <%
                                                        RegisterDao ud = new RegisterDao(ConnectionProvider.getConnect());
                                                        RegisterUser ru = ud.getUserDetailbyID( be.getUserId());
                                                    %>
                                                    <hr>
                                                    <p class="card-text"><small class="text-muted">BY:<%=ru.getUserName()%></small></p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <%}%>

                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-3 col-md-6 col-lg-4 notbar">

                        <div class="contianer">
                            <div class="row mt-4 mb-4">
                                <h4 class="backbg p-4 mb-3">All Blogs</h4><hr>
                                <!--all blog fetching--> 
                                <%
//                                    BlogDao BD = new BlogDao(ConnectionProvider.getConnect());
                                    List<BlogEntity> bloglist = BD.getAllBlogPost();
                                    for (BlogEntity l : bloglist) {
                                %>

                                <div class="col mb-3">
                                    <div class="card" style="max-width:25rem; max-height:35rem; background-color: #f5f5f5;">
                                        <img src="./img/BlogImage/<%=l.getImg()%>" class="card-img-top" height="160"   alt="...">
                                        <div class="card-body">
                                            <h5 class="card-title text-uppercase"><%=l.getTitle()%></h5>
                                            <p class="card-text"><%=l.getDiscription()%></p>

                                            <!--<a href="ShowMyBlog.jsp?postID=<%=l.getBlogId()%>" class="btn btn-primary d-grid gap-2">Read More...</a>-->
                                            <a href="ShowMyBlog.jsp?BlogTitle=<%=l.getTitle()%>" class="btn btn-outline-primary d-grid gap-2">Read More...</a>

                                            <!--                                            
                                            <br><small class="text-muted"><%=l.getDTime().toLocaleString()%></small>-->
                                            <%int id = l.getUserId();
                                                RegisterDao ud = new RegisterDao(ConnectionProvider.getConnect());
                                                RegisterUser ru = ud.getUserDetailbyID(id);
                                            %>
                                            <hr>
                                            <p class="text-end">Blog By : <%=ru.getUserName()%></p>

                                        </div>

                                    </div>
                                </div>

                                <%
                                    }
                                %>





                                <!--all blog fetching end here-->




                            </div>

                        </div>
                    </div>
                </div>
            </div>

            <!--end my code-->



        </main>
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
