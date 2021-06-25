
<%@page import="com.shikshasetu.entities.NotificationEntity"%>
<%@page import="com.shikshasetu.dao.NotificaionDao"%>
<%@page import="com.shikshasetu.entities.AppSourceEntity"%>
<%@page import="com.shikshasetu.dao.AppSourceDao"%>
<%@page import="com.shikshasetu.entities.Message"%>
<%@page import="com.shikshasetu.entities.QuestionEntity"%>
<%@page import="com.shikshasetu.dao.QuestionDao"%>
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
         <!-- Chrome, Firefox OS and Opera -->
        <meta name="theme-color" content="#4285f4">
        <!-- Windows Phone -->
        <meta name="msapplication-navbutton-color" content="#4285f4">
        <!-- iOS Safari -->
        <meta name="apple-mobile-web-app-status-bar-style" content="#4285f4">
       
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>sikshasetu !Show all app : Where student share their talent.</title>
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
                        <h4 class="fw-light"><Strong>Welcome to sikshasetu AppSourceCode Section</Strong></h4>
                        <p class="lead text-light"><small>sikshasetu provides the features to Upload user's app or software and make it available for other users.Users can also upload it source code for learning purpose to other computer science students.Just signUp to create new Account and login  and do Contribution and share link to your friends. </small></p>
                        <p>
                            <a href="https://www.youtube.com/watch?v=htbjVJaGGao&feature=youtu.be" class="btn btn-primary my-2">Get Help to Start</a>
                            <a href="contactus.jsp" class="btn btn-secondary my-2">Report how to Improve</a>
                        </p>
                        <form action="SearchAppServlet" method="get">
                        <div class="input-group bg-light mb-4">
                            <input type="text" class="form-control bg-light"  name="SearchString" placeholder="Type App or software  name to search.." aria-label="Recipient's username with two button addons">
                            <button class="btn btn-secondary" type="submit"><span class="fa fa-search"></span></button>

                        </div>
                        </form>
                    </div>
                </div>
            </section>
            <!--my code ===-->
            <div class="container-fluid">

                <div class="row">
                    <div class="col-sm-9 col-md-6 col-lg-8 databar">
                        <div class="contianer">

                            <%
                                Message m = (Message) session.getAttribute("SourceCodeMessage");
                                if (m != null) {%>
                            <div class="alert alert-warning alert-dismissible fade show bg-info text-white" role="alert">
                                <strong> <%=m.getType()%><br><%=m.getMsg()%></strong>
                                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                            </div>
                            <%
                                    session.removeAttribute("SourceCodeMessage");
                                }
                            %>
                            <div class="row mt-4 mb-4">

                                <!--all app detail fetching--> 
                                <h4 class="backbg p-4 mb-3"><marquee >AppStore Panel</marquee></h4> <hr>
                                <%
                                    AppSourceDao ASD = new AppSourceDao(ConnectionProvider.getConnect());
                                    List<AppSourceEntity> ASL = ASD.getAllAppDetail();
                                    for (AppSourceEntity ASE : ASL) {
                                %>



                                <div class="col  mb-4">

                                    <div class="card shadow-lg bg-body rounded" style="max-width:25rem; min-width:15rem; background-color:#fafafa; max-height:32rem;">
                                        <img src="./img/appStore/<%=ASE.getFimage()%>" class="card-img-top" alt="appImage not available" height="150" width="150" alt="Image not available">
                                        <div class="card-body">
                                            <h5 class="card-title"><%=ASE.getTitle()%></h5>
                                            <p class="card-text"><%=ASE.getAppdetai()%></p>
                                               <div class="d-grid gap-2 d-md-block">
                                                <a href="./img/appStore/<%=ASE.getFileName()%>" class="my-1 btn btn-outline-primary btn-sm">Download App</a>
                                                <a href="SourceCodeAvailable.jsp?AID=<%=ASE.getAppid()%>" class="btn btn-outline-success btn-sm ">Check Source code available ?</a>
                                            </div>
                                            <hr>
                                            <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                                                <small>Support us to add source Code and how to develop this App</small>
                                                <a href="AddSourceCode.jsp?AID=<%=ASE.getAppid()%>" class="btn btn-outline-primary btn-sm "><span class="fa fa-plus-circle fa-spin"></span>Add</a>
                                            </div>
                                        </div>
                                             <%int id = ASE.getUid();
                                                RegisterDao ud = new RegisterDao(ConnectionProvider.getConnect());
                                                RegisterUser ru = ud.getUserDetailbyID(id);
                                            %>                                                                                     
                                        
                                        <div class="card-footer text-end text-uppercase">
                                            <small class="text-muted text-end">Uploaded By : <%=ru.getUserName()%></small>
                                        </div>
                                    </div>
                                </div>







                                <%
                                    }
                                %>
                            </div>  




                            <!--all quesiont fetching end here-->




                        </div>

                    </div>
                            
                            <div class="col-sm-3 col-md-6 col-lg-4 notbar">
                        <div class="contianer">

                            <div class="row mt-4 mb-4">
                                <div clss="col">

                                </div>
                                <div class="col">
                                    <h4 class="backbg p-4"><marquee direction="right">Notification Panel</marquee></h4><hr>
                                    <%
                                        NotificaionDao ND = new NotificaionDao(ConnectionProvider.getConnect());
                                        List<NotificationEntity> NEL = ND.getAllNotification();
                                        for (NotificationEntity NE : NEL) {%>

                                    
                                        <div class="card shadow-sm mb-4 text-dark">
                                        <div class="card-header"><span class="fa fa-hand-o-right fa-2x px-2"></span><strong><%=NE.getNfor()%></strong></div>
                                        <div class="card-body">
                                            <p class="card-text"><%=NE.getNdesc()%> </p>
                                            <div class="d-flex justify-content-between align-items-center">
                                                <div class="btn-group">
                                                    <%
                                                        if(NE.getAttachname().equals("")){
                                                        out.println("<p>No file attachment</p>");
                                                        }
                                                        else
                                                        {
                                                            out.println("File is also attached with this notification.");
                                                        
                                                            out.println("<a href='./img/notification/"+NE.getAttachname()+"'>Download</a>");
                                                        }
                                                        %>
                                                </div>
                                                
                                               
                                            </div>
                                         </div>
                                         <div class="card-footer text-end"> <small class="text-dark text-end">From : &nbsp;<%=NE.getNfrom()%>&nbsp;&nbsp;<%=NE.getDate()%></small></div>
                                    
                                        </div>
                                        
                                        <%}%>
                                </div>
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
