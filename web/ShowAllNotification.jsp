
<%@page import="com.shikshasetu.dao.NotificaionDao"%>
<%@page import="com.shikshasetu.entities.NotificationEntity"%>
<%@page import="com.shikshasetu.entities.AppSourceEntity"%>
<%@page import="com.shikshasetu.dao.QuestionDao"%>
<%@page import="com.shikshasetu.entities.QuestionEntity"%>
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
         <!-- Chrome, Firefox OS and Opera -->
        <meta name="theme-color" content="#4285f4">
        <!-- Windows Phone -->
        <meta name="msapplication-navbutton-color" content="#4285f4">
        <!-- iOS Safari -->
        <meta name="apple-mobile-web-app-status-bar-style" content="#4285f4">
       
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>sikshasetu! Show All notification :  Where student share their talent.</title>
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
        <!--notification search start here-->
        
        
        
        
        <div class="container-fluid">
             <section class="py-5 text-center container">
                <div class="row py-lg-5">
                    <div class="col-lg-6 col-md-8 mx-auto">
                        <h4 class="fw-light"><Strong>Welcome to Sikshasetu Notification Section</Strong></h4>
                        <p class="lead text-light text-start"><small>Sikshasetu provides the features to Upload the notification about any information which you want to share with other people like admission ,Job alert, vacancy and any information.User can also uplaod Attachment file to this notification for other users .Just signUp to create new Account and login  and do Contribution and share link to your friends. </small></p>
                        <p>
                            <a href="https://www.youtube.com/watch?v=htbjVJaGGao&feature=youtu.be" class="btn btn-primary my-2">Get Help to Start</a>
                            <a href="contactus.jsp" class="btn btn-secondary my-2">Report how to Improve</a>
                        </p>
                        <form action="indexPageSearchServlet" method="get">
                        <div class="input-group bg-light mb-4">
                            <input type="text" class="form-control bg-light"  name="SearchString" placeholder="Type anything to search" aria-label="Recipient's username with two button addons">
                            <button class="btn btn-secondary" type="submit"><span class="fa fa-search"></span></button>

                        </div>
                        </form>
                    </div>
                </div>
            </section>
            
                

                <!--//seearch blog list if any-->


                <div class="contianer bg-success">
                    <div class="row mt-4 mb-4">
                        <h4 class="text-white backbg p-4"><marquee> Read All Notification</marquee></h4><hr>
                        <!--all blog fetching--> 
                        <%                                        NotificaionDao NDd = new NotificaionDao(ConnectionProvider.getConnect());
                             List<NotificationEntity> NELl = NDd.getAllNotification();
                             for (NotificationEntity NE : NELl) {%>

                        <div class="col">
                            <div class="card shadow-sm mb-4 mx-3 text-dark" style="max-width:25rem; min-width:15rem; max-height:26rem;">
                                <div class="card-header"><span class="fa fa-hand-o-right fa-2x px-2"></span>Notification for: &nbsp;&nbsp;<strong><%=NE.getNfor()%></strong></div>
                                <div class="card-body">
                                    <p class="card-text">Title : &nbsp;&nbsp;<%=NE.getNtitle()%> </p>
                                    <div class="d-grid gap-2 d-md-flex justify-content-md-end">

                                        <a  href="ReadNotification.jsp?NID=<%=NE.getNid()%>" type="button" class="btn btn-outline-primary  btn-sm">  <span class="fa fa-hand-o-right fa-spin"></span>Read more..</a>
                                    </div>  
                                    <div class="d-flex justify-content-between align-items-center">
                                        <div class="btn-group">
                                            <%
                                                if (NE.getAttachname().equals("")) {
                                                    out.println("<p>No file attachment with this notification.</p>");
                                                } else {
                                                    out.println("<p>File is also attached with this notification.</P>");

                                                    out.println("<a href='./img/notification/" + NE.getAttachname() + "'>Download</a>");
                                                }
                                            %>
                                        </div>


                                    </div>
                                </div>
                                <div class="card-footer text-end"> <small class="text-dark text-end">From : &nbsp;<%=NE.getNfrom()%>&nbsp;&nbsp;<%=NE.getDate()%></small></div>
                                    
                            </div>
                        </div>
                        <%}%>

                    </div>
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
