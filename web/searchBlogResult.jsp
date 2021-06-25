
<%@page import="com.shikshasetu.dao.RegisterDao"%>
<%@page import="com.shikshasetu.dao.BlogDao"%>
<%@page import="com.shikshasetu.helper.ConnectionProvider"%>
<%@page import="com.shikshasetu.helper.ConnectionProvider"%>
<%@page import="com.shikshasetu.entities.BlogEntity"%>
<%@page import="java.util.List"%>
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
        <title>sikshasetu ! Search blog page:  Where student share their talent.</title>
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
        <div class="container-fluid">
            <div class="container bg-success  mt-4 mb-4">
                <div class="row">
                    <div class="col-12">


                        <%                List<BlogEntity> BEL = (List<BlogEntity>) session.getAttribute("SearchBlogList");
                if (BEL != null) {%>

                        <div class="alert alert-success alert-dismissible fade show mt-4" role="alert">
                            <h3><strong><%=BEL.size()%></strong> Results are found .</h3>
                            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                        </div>
                        <%}

                        %>
                    </div>
                </div>

                <!--//seearch blog list if any-->


                <div class="contianer">
                    <div class="row mt-4 mb-4">
                        <h6 class="text-white"><marquee>Blog From your search History</marquee></h6>
                        <!--all blog fetching--> 
                        <%                                    for (BlogEntity l : BEL) {
                        %>

                        <div class="col-sm my-4 ">
                            <div class="card" style="max-height: 30rem; max-width: 25rem">
                                <img src="./img/BlogImage/<%=l.getImg()%>" class="card-img-top" height="160" alt="...">
                                <div class="card-body">
                                    <h5 class="card-title text-uppercase"><%=l.getTitle()%></h5>
                                    <p class="card-text"><%=l.getDiscription()%></p>
                                    <a href="ShowMyBlog.jsp?postID=<%=l.getBlogId()%>" class="btn btn-primary d-grid gap-2">Read More...</a>
<!--                                                <br><small class="text-muted"><%=l.getDTime().toLocaleString()%></small>-->
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

                        <%
//                            session.removeAttribute("SearchBlogList");
                        %>
                    </div>
                </div>
            </div>
        </div>



            <!--all blog fetching end here-->
















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
