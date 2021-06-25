<%@page import="java.util.Date"%>
<%--<%@page import="java.sql.Date"%>--%>
<%@page import="com.shikshasetu.entities.BookEntity"%>
<%@page import="com.shikshasetu.dao.BookDao"%>
<%@page import="com.shikshasetu.dao.BookDao"%>
<%@page import="com.shikshasetu.entities.BlogEntity"%>
<%@page import="com.shikshasetu.dao.BlogDao"%>
<%@page import="com.shikshasetu.entities.QuestionEntity"%>
<%@page import="com.shikshasetu.dao.QuestionDao"%>
<%@page import="com.shikshasetu.dao.QuestionDao"%>
<%@page import="com.shikshasetu.entities.NotificationEntity"%>
<%@page import="com.shikshasetu.dao.NotificaionDao"%>
<%@page import="com.shikshasetu.entities.Message"%>
<%@page import="com.shikshasetu.entities.AppSourceEntity"%>
<%@page import="java.util.List"%>
<%@page import="com.shikshasetu.dao.AppSourceDao"%>
<%@page import="com.shikshasetu.helper.ConnectionProvider"%>
<%@page import="com.shikshasetu.dao.RegisterDao"%>
<%--<%@page import="com.shikshasetu.helper.ConnectionProvider"%>--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%--<%@page  import ="java.sql.*"%>--%>
<!DOCTYPE html>
<html>
    <head


        <!--adding favicon image-->
        <link rel="apple-touch-icon" sizes="57x57" href="favicon/apple-icon-57x57.png">
        <link rel="apple-touch-icon" sizes="60x60" href="favicon/apple-icon-60x60.png">
        <link rel="apple-touch-icon" sizes="72x72" href="favicon/apple-icon-72x72.png">
        <link rel="apple-touch-icon" sizes="76x76" href="favicon/apple-icon-76x76.png">
        <link rel="apple-touch-icon" sizes="114x114" href="favicon/apple-icon-114x114.png">
        <link rel="apple-touch-icon" sizes="120x120" href="favicon/apple-icon-120x120.png">
        <link rel="apple-touch-icon" sizes="144x144" href="favicon/apple-icon-144x144.png">
        <link rel="apple-touch-icon" sizes="152x152" href="favicon/apple-icon-152x152.png">
        <link rel="apple-touch-icon" sizes="180x180" href="favicon/apple-icon-180x180.png">
        <link rel="icon" type="image/png" sizes="192x192"  href="favicon/android-icon-192x192.png">
        <link rel="icon" type="image/png" sizes="32x32" href="favicon/favicon-32x32.png">
        <link rel="icon" type="image/png" sizes="96x96" href="favicon/favicon-96x96.png">
        <link rel="icon" type="image/png" sizes="16x16" href="favicon/favicon-16x16.png">
        <link rel="manifest" href="favicon/manifest.json">
        <meta name="msapplication-TileColor" content="#ffffff">
        <meta name="msapplication-TileImage" content="favicon/ms-icon-144x144.png">
        <meta name="theme-color" content="#ffff87">




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
        <!--<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">-->
        <title>sikshasetu !Home : Where student share their talent.</title>
        <!--css start -->
        <!--        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="css/shikhsasetu_css.css" rel="stylesheet" type="text/css"/>

        <!--css end--> 
        <!--help popup menu-->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>

        <!--creating session for showing help page-->



        <!--help popup menu--> 
    </head>

    <body>

        <!--navbar added--> 
        <%@include file="/navbar.jsp"%>
        <!--navbar ended-->
        <!--body content of index page-->

        <!-- Modal -->
        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">

                    <h5 class="modal-title" id="exampleModalLabel">Welcome to SikshaSetu Help Section</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>

                    <div class="modal-body bg-info">
                        <div class="container-fluid justify-content-center">
                            <center>
                                <iframe width="350" height="300" src="https://www.youtube.com/embed/htbjVJaGGao" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                            </center>
                        </div></div>
                    <div class="modal-footer">

                        <a  href="" target="_blank" type="button" class="btn btn-primary">Get Help to use this site.</a>
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Ignore</button>
                    </div>
                </div>
            </div>
        </div>
        <!--modal help end here-->
        <div class="container-fluid mb-4 mt-2 ">
            <div id="carouselExampleSlidesOnly" class="carousel slide" data-bs-ride="carousel">
                <div class="carousel-inner">

                    <div class="carousel-item active">
                        <img src="./img/slide1.jpg" class="d-block w-100" alt="..." style="max-height:350px; min-height: 265px">
                    </div>
                    <div class="carousel-item">
                        <img src="./img/slide2.jpg" class="d-block w-100" alt="..." style="max-height:350px; min-height: 265px">
                    </div>
                    <div class="carousel-item">
                        <img src="./img/slide3.jpg" class="d-block w-100" alt="..." style="max-height:350px; min-height: 265px">
                    </div>
                    <div class="carousel-item">
                        <img src="./img/slide4.jpg" class="d-block w-100" alt="..." style="max-height:350px; min-height: 265px">
                    </div>
                    <div class="carousel-item">
                        <img src="./img/slide5.jpg" class="d-block w-100" alt="..." style="max-height:350px; min-height: 265px">
                    </div>
                </div>
            </div>
        </div>
        <!--quick link start here-->
        <div class="container mb-4 mt-2 notbar">

            <div class="row mb-2 mx-1">
                <h4><center>Quick Links for site tour</center></h4>
                <hr>
                <div class="col-lg-12 mb-4"> 
                    <center>
                        <a class="btn btn-primary" href="#notification" role="button">Notification</a>
                        <a class="btn btn-secondary" href="#question" role="button">Downlaod latest question</a>
                        <a class="btn btn-info" href="#blog" role="button">Read latest blogs</a>
                        <a class="btn btn-warning" href="#book" role="button">Download Pdf Books</a>
                        <a class="btn btn-dark" href="#app" role="button">Download latest app & source code</a>

                    </center>
                </div>
            </div>

        </div>



        <!--sliding card test code start here-->
        <div class="container-fluid ">
            <div class="row mx-1" id="notification">
                <div class="col-6 bg-light border border-3  border-secondary">
                    <h6><center>Latest Job Notification</center></h6>
                    <hr>
                    <div class="scroll">
                        <!--<table border="1">-->  
                        <%
                            NotificaionDao noda = new NotificaionDao(ConnectionProvider.getConnect());
                            List<NotificationEntity> noel = noda.getAllNotificationByCategory("job");
                            for (NotificationEntity noe : noel) {%> 
                        <!--<tr><td>-->
                        <span class="fa fa-hand-o-right" style="font-size:12px;"></span><a class="" href="ReadNotification.jsp?NID=<%=noe.getNid()%>"><%=noe.getNtitle()%></a>
                        <!--</td>-->
                        <!--</tr>-->
                        <hr class="bg-dark">


                        <%}%>
                        <!--</table>-->
                    </div>
                </div>

                <!----------------------------------->

                <div class="col-6 bg-light border border-3 border-secondary">
                    <h6><center>Latest Result  Notification</center></h6>
                    <hr class="bg-dark">
                    <div class="scroll">
                        <%
                            NotificaionDao noda1 = new NotificaionDao(ConnectionProvider.getConnect());
                            List<NotificationEntity> noel1 = noda1.getAllNotificationByCategory("Result");
                            for (NotificationEntity noe1 : noel1) {%> 
                        <span class="fa fa-hand-o-right" style="font-size:12px;"></span><a class="" href="ReadNotification.jsp?NID=<%=noe1.getNid()%>"><%=noe1.getNtitle()%></a>
                        <hr>



                        <%}%>
                    </div>
                </div>
                <!------------------------->
                
            </div>
        </div>
        <!--adding again notification bar start here-->  
        <div class="container-fluid mb-4 ">
            <div class="row mx-1">
                <div class="col-6 bg-light border border-3  border-secondary">
                    <h6><center>Latest Admit card or datesheet Notification</center></h6>
                    <hr>
                    <div class="scroll">
                        <!--<table border="1">-->  
                        <%
                            NotificaionDao noda4 = new NotificaionDao(ConnectionProvider.getConnect());
                            List<NotificationEntity> noe4 = noda4.getAllNotificationByCategory("admitcard");
                            for (NotificationEntity noe : noe4) {%> 
                        <!--<tr><td>-->
                        <span class="fa fa-hand-o-right" style="font-size:12px;"></span><a class="" href="ReadNotification.jsp?NID=<%=noe.getNid()%>"><%=noe.getNtitle()%></a>
                        <!--</td>-->
                        <!--</tr>-->
                        <hr class="bg-dark">


                        <%}%>
                        <!--</table>-->
                    </div>
                </div>
                        
                        <div class="col-6 bg-light border border-3 border-secondary">
                    <h6><center>University or education board Notification</center></h6>
                    <hr class="bg-dark">
                    <div class="scroll">
                        <%
                            NotificaionDao noda2 = new NotificaionDao(ConnectionProvider.getConnect());
                            List<NotificationEntity> noel2 = noda2.getAllNotificationByCategory("university");
                            for (NotificationEntity noe2 : noel2) {%> 
                        <span class="fa fa-hand-o-right" style="font-size:12px;"></span><a class="" href="ReadNotification.jsp?NID=<%=noe2.getNid()%>"><%=noe2.getNtitle()%></a>
                        <hr>



                        <%}%>
                    </div>
                </div>                          

                        
                        
            </div>
        </div>

                <!----------------------------------->
                <div class="container-fluid mb-4 ">
                    <div class="row mx-1">
                        <div class="col-6 bg-light border border-3 border-secondary">
                            <h6><center>Latest important link  Notification</center></h6>
                            <hr class="bg-dark">
                            <div class="scroll">
                                <%
                                    NotificaionDao noda5 = new NotificaionDao(ConnectionProvider.getConnect());
                                    List<NotificationEntity> noel5 = noda5.getAllNotificationByCategory("importantlink");
                                    for (NotificationEntity noe1 : noel5) {%> 
                                <span class="fa fa-hand-o-right" style="font-size:12px;"></span><a class="" href="ReadNotification.jsp?NID=<%=noe1.getNid()%>"><%=noe1.getNtitle()%></a>
                                <hr>



                                <%}%>
                            </div>
                        </div>
                        <!------------------------->
                        <div class="col-6  bg-light border border-3 border-secondary">
                            <h6><center> All notification </center></h6>
                            <hr class="bg-dark">
                            <div class="scroll">
                                <%
                                    NotificaionDao noda6 = new NotificaionDao(ConnectionProvider.getConnect());
                                    List<NotificationEntity> noel6 = noda6.getAllNotification();
                                    for (NotificationEntity noe2 : noel6) {%> 
                                <span class="fa fa-hand-o-right" style="font-size:12px;"></span><a class="" href="ReadNotification.jsp?NID=<%=noe2.getNid()%>"><%=noe2.getNtitle()%></a>
                                <hr>



                                <%}%>
                            </div>
                        </div>




                    </div>

                </div>



                <div class="container mt-4">
                    <div class="row" id="offer">
                        <div class="col-6">
                            <div class="shadow-lg p-3 mb-5 bg-body rounded alert   alert-warning alert-dismissible fade show" role="alert">
                                <span class="fa fa-hand-o-up fa-spin fa-2x" style="color:#757575;"></span>   <strong>OFFER!</strong> Add any Question paper (general paper , govt.job paper,entrance exam) that should be unique  and get 10 rupees per paper.you can also send on <a  href="mailto:Software.SantDeveloper@gmail.com">mail</a> or 
                                <a href="https://api.whatsapp.com/send?phone=919599217946&text=Hii! SikshaSetu team , I wana contribute some data ? ">instant messaging app</a>

                                <br><hr>
                                <strong>T&C apply:</strong> Email us to verify and getting instant payments 
                                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                            </div>
                        </div>
                        <!--<div class="clearfix"></div>-->
                        <div class="col-6">
                            <div class="shadow-lg p-3 mb-5 bg-body rounded alert  alert-warning alert-dismissible fade show" role="alert">
                                <span class="fa fa-hand-o-up fa-spin fa-2x" style="color:red;"></span>   <strong>OFFER!</strong> Add  Solution of any given  Question paper  get 80 rupees per paper.User can also upload both question paper as well its solution.you can also send on  <a  class="text-success" href="mailto:Software.SantDeveloper@gmail.com">mail</a> or 
                                <a class="text-success" href="https://api.whatsapp.com/send?phone=919599217946&text=Hii! SikshaSetu team , I wana contribute some data ? ">instant messaging app</a>
                                <br><hr>
                                <strong>T&C apply:</strong> Question paper should be unique and pdf format. 
                                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                            </div>
                        </div>

                    </div>
                </div>





















                <!--sliding card test code start here-->


                <div class="container-fluid">

                    <div class="row">
                        <!--                <div class="col-sm-3 col-md-6 col-lg-4 notbar  ">
                                            <div class="contianer ">
                        
                                                <div class="row mb-4">
                        
                                                    <div class="col ">
                                                        <h4 class="backbg p-4"><marquee direction="right">Notification Panel</marquee></h4>
                        
                                                                                        <h6>Notification Panel</h6>
                                                        <hr>
                                                        <marquee behavior="ALTERNATE" onmouseover="stop()" onmouseout="start()"  direction="down" scrolldelay="50" height="900">
                        <%                                    NotificaionDao NDd = new NotificaionDao(ConnectionProvider.getConnect());
                            List<NotificationEntity> NELl = NDd.getAllNotification();
                            int nc = 0;
                            for (NotificationEntity NE : NELl) {
                                nc++;
                        %>
        
        
                        <div class="card shadow-sm mb-4 shadow-lg p-3 mb-5 bg-body rounded bg-light" style="background-color:#6666ff; max-height:28rem;">
                            <div class="card-header"><span class="fa fa-hand-o-right fa-2x px-2"></span>Notification for: &nbsp;&nbsp;<strong><%=NE.getNfor()%></strong></div>
                            <div class="card-body">
                                <p class="card-text">Title : &nbsp;&nbsp;<%=NE.getNtitle()%> </p>
                                <div class="d-grid gap-2 d-md-flex justify-content-md-end">
        
                                    <a  href="ReadNotification.jsp?NID=<%=NE.getNid()%>" type="button" class=" mb-1 btn btn-outline-success btn-sm">  <span class="fa fa-hand-o-right fa-spin"></span>Read more..</a>
                                </div>  
                                <div class="d-flex justify-content-between align-items-center">
                                    <div class="btn-group">
                        <%
                            if (NE.getAttachname().equals("")) {
                                out.println("<p>No file attachment with this notification.</p>");
                            } else {
                                out.println("<p>File is also attached with this notification.</P>");

                                out.println("<a href='./img/notification/" + NE.getAttachname() + "'><font color=black>&nbsp;&nbsp;Download</font></a>");
                            }
                        %>
                    </div>
        
        
                </div>
            </div>
        
            <div class="card-footer text-end"> <small class="text-end">From : &nbsp;<%=NE.getNfrom()%>&nbsp;Date:&nbsp;<%=NE.getDate()%></small></div>
        
        </div>
        
                        <% if (nc >= 10) {
                                    break;
                                }
                            }%>
                    </marquee>
                </div>
                <div class="d-grid gap-2">
                    <a href="ShowAllNotification.jsp" class=" mt-4 btn btn-outline-light btn-sm mb-4">Search and show more Notification&nbsp;&nbsp;&nbsp; <span class="fa fa-refresh fa-spin fa-2x" style="color:white;"></span></a>
        
                </div>
            </div>
        </div>
        </div>-->


                        <!--<div class="col-sm-9 col-md-6 col-lg-8" style="background-color:#ba68c8;">-->
                        <div class="col-sm-9 col-md-6 col-lg-12 databar">
                            <div class="contianer">

                                <div class="row  mb-4" id="question">
                                    <!--all blog fetching--> 
                                    <h4 class="backbg p-4"><marquee>Download Latest Question paper and its solution</marquee></h4>
                                    <hr class="mt-2">
                                    <%
                                        QuestionDao QD = new QuestionDao(ConnectionProvider.getConnect());
                                        List<QuestionEntity> Questionlist = QD.getAllQuestionDetail();
                                        int counter = 0;
                                        for (QuestionEntity Ql : Questionlist) {
                                            counter++;
                                    %>

                                    <div class="col mb-3 ">
                                        <div class="card bg-light shadow p-2 mb-2 bg-body mx-1 rounded" style="max-width:23rem; max-height:35rem;">

                                            <div class="card-body">

                                                <table>


                                                    <th scope="col">Attribute</th>
                                                    <th scope="col">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
                                                    <th scope="col">Name</th>




                                                    <tr>
                                                        <td>Subject</td>
                                                        <TD>    </TD>
                                                        <td><%=Ql.getSubject()%></td>
                                                    </tr>
                                                    <tr>
                                                        <td>University</td>
                                                        <TD></TD>
                                                        <td><%=Ql.getUniversity()%></td>
                                                    </tr>
                                                    <tr>
                                                        <td>Course</td>
                                                        <TD></TD>
                                                        <td><%=Ql.getCourse()%></td>
                                                    </tr>
                                                    <tr>
                                                        <td>Semester</td>
                                                        <TD></TD>
                                                        <td><%=Ql.getSemester()%></td></tr>
                                                    <tr>
                                                        <td>Year</td>
                                                        <TD></TD>
                                                        <td><%=Ql.getYear()%></td></tr>

                                                </table>

                                                <div class="d-grid gap-2 d-md-block">
                                                    <a  href="./img/questionUpload/<%=Ql.getFileName()%>" type="button" class="btn btn-outline-primary btn-sm mb-1">Download</a>
                                                    <a  href="QuestionSolutionAvailable.jsp?QuestionID=<%=Ql.getQuestionid()%>" type="button" class="btn btn-outline-success btn-sm">Check Solution is available ?</a>
                                                </div>
                                                <!--solved to use--><hr>

                                                <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                                                    <small class="text-muted">Please Add more Solution for other Student.</small>
                                                    <a  href="AddQuestionSolution.jsp?QuestionID=<%=Ql.getQuestionid()%>" type="button" class="btn btn-outline-primary btn-sm">  <span class="fa fa-plus-circle fa-2x fa-spin"></span>ADD</a>
                                                </div>  



                                                <!--solved to user end--> 

                                                <%int id = Ql.getUserid();
                                                    RegisterDao ud = new RegisterDao(ConnectionProvider.getConnect());
                                                    RegisterUser ru = ud.getUserDetailbyID(id);
                                                %>                                                                                     
                                            </div>
                                            <div class="card-footer text-end text-uppercase">
                                                <small class="text-muted text-end">Uploaded By : <%=ru.getUserName()%></small>
                                            </div>
                                        </div>
                                    </div>
                                    <%
                                            if (counter >= 6) {
                                                break;
                                            }
                                        }
                                    %>



                                </div>
                                <div class="d-grid gap-2">
                                    <a href="showAllQuestionPaper.jsp" class ="mt-1 btn btn-outline-light btn-sm mb-4">Show All Question Papers&nbsp;&nbsp;&nbsp; <span class="fa fa-refresh fa-spin fa-2x" style="color:white;"></span></a>

                                </div>

                            </div>
                        </div>
                    </div>
                </div>

                <!--show quetion paper here-->
                <hr>





                <!--////////////show blog fetch minimum 6 blog ///////-->




                <div class="container-fluid bg-secondary">

                    <div class="row" id="book">


                        <div class="row mt-4 mb-4">
                            <h4 class="text-white backbg p-4"><marquee> Download Book or notes </marquee></h4><hr>
                            <br><hr><br>
                            <!--all blog fetching--> 
                            <div class="contianer">
                                <table class="table table-bordered border-2 table-success table-striped">

                                    <thead>
                                        <tr>
                                            <th scope="col">Book Detail</th>
                                            <!--<th scope="col">Book description</th>-->
                                            <th scope="col">File</th>
                                            <th scope="col">By</th>
                                        </tr>
                                    </thead>


                                    <%
                                        BookDao BDdd = new BookDao(ConnectionProvider.getConnect());
                                        List<BookEntity> BEL12 = BDdd.getAllBookDetail();
                                        int bbbb = 0;
                                        for (BookEntity BE : BEL12) {
                                            bbbb++;


                                    %>
                                    <tbody>
                                        <tr>
                                            <td><%=BE.getTitle()%>, &nbsp;<%=BE.getDesc()%></td>
                                            <td> <a href="./img/BookStore/<%=BE.getFileName()%>">Download</td>


                                            <%
                                                RegisterDao r = new RegisterDao(ConnectionProvider.getConnect());
                                                RegisterUser u = r.getUserDetailbyID(BE.getUserid());
                                            %>
                                            <td><small><%=u.getUserName()%></small></td>
                                        </tr>
                                    </tbody>

                                    <%
                                            if (bbbb > 8) {
                                                break;
                                            }
                                        }


                                    %>
                                </table>



                            </div>
                            <div class="d-grid gap-2">
                                <a href="showAllBookStore.jsp" class="btn btn-outline-light btn-sm mb-4"> Search and Show All Book & note&nbsp;&nbsp; <span class="fa fa-refresh fa-spin fa-2x" style="color:white;"></span></a>

                            </div>
                        </div>

                    </div>
                </div>





                <div class="container-fluid">

                    <div class="row" id="blog">

                        <!--<div class="col-sm-9 col-md-6 col-lg-8" style="background-color:#ba68c8;">-->
                        <div class="col-sm-9 col-md-6 col-lg-12 databar">
                            <div class="contianer">
                                <div class="row ">
                                    <h4 class="backbg p-4 mx-1"><marquee direction="left">Read Latest Blog and news</marquee></h4>
                                    <hr class="mt-2">
                                    <!--all blog fetching--> 
                                    <%                                BlogDao BD = new BlogDao(ConnectionProvider.getConnect());
                                        List<BlogEntity> bloglist = BD.getAllBlogPost();
                                        int counter1 = 0;
                                        for (BlogEntity l : bloglist) {
                                            counter1++;
                                    %>

                                    <div class="col-sm  mb-4">
                                        <!--<div class="card" style="max-width:19rem; min-width:22rem; max-height:30rem;">-->
                                        <div class="card shadow p-1 mb-2 bg-body rounded mx-2" style="max-width:22rem;  max-height:35rem;">
                                            <img src="./img/BlogImage/<%=l.getImg()%>" class="card-img-top" height="160" alt="...">
                                            <div class="card-body">
                                                <h5 class="card-title text-uppercase"><%=l.getTitle()%></h5>
                                                <p class="card-text"><%=l.getDiscription()%></p>
                                                <a href="ShowMyBlog.jsp?BlogTitle=<%=l.getTitle()%>" class="btn btn-outline-primary d-grid gap-2">Read More...</a>
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
                                            if (counter1 >= 4) {
                                                break;
                                            }
                                        }
                                    %>





                                    <!--all blog fetching end here-->




                                </div>
                                <div class="d-grid gap-2">
                                    <a href="showAllBlog.jsp" class="btn btn-outline-light mb-4 btn-sm">Show All Blogs&nbsp;&nbsp;&nbsp; <span class="fa fa-refresh fa-spin fa-2x" style="color:white;"></span></a>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>



                <hr class="text-white">




                <!--///////app store fetching here minimum 6/////////////-->
                <div class="container-fluid">

                    <div class="row">
                        <!--                <div class="col-sm-3 col-md-6 col-lg-4 notbar">
                                            <div class="col-sm-3 col-md-6 col-lg-4" style="background-color:#e1f5fe;">
                                            <div class="contianer">
                        
                                                <div class="row  mb-4">
                                                    <div clss="col">
                        
                                                    </div>
                                                    <div class="col">
                                                        <h4 class="backbg p-4"><marquee direction="right">Notification Panel</marquee></h4>
                                                        <hr>
                        <%
                            NotificaionDao NDdd = new NotificaionDao(ConnectionProvider.getConnect());
                            List<NotificationEntity> NELll = NDdd.getAllNotification();
                            for (NotificationEntity NE : NELll) {%>
        
        
                        <div class="card shadow-sm mb-4 text-primary" style="background-color:#e6ffe6;">
                        <div class="card shadow-sm mb-4 text-primary shadow p-1  bg-body rounded">
                            <div class="card-header"><span class="fa fa-hand-o-right fa-2x px-2"></span><strong><%=NE.getNfor()%></strong></div>
                            <div class="card-body">
                                <p class="card-text"><%=NE.getNdesc()%> </p>
                                <div class="d-flex justify-content-between align-items-center">
                                    <div class="btn-group">
                        <%
                            if (NE.getAttachname().equals("")) {
                                out.println("<p>No file attachment</p>");
                            } else {
                                out.println("File is also attached with this notification.");

                                out.println("<a href='./img/notification/" + NE.getAttachname() + "'><font color=black>&nbsp;&nbsp;Download</font></a>");
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
        </div>-->

                        <!--<div class="col-sm-9 col-md-6 col-lg-8" style="background-color:#ba68c8;">-->
                        <div class="col-sm-9 col-md-6 col-lg-12 databar">
                            <div class="contianer">


                                <div class="row  mb-4" id="app">

                                    <!--all app detail fetching--> 
                                    <h4 class="backbg p-4" id="test"><marquee >Download Latest App and Its Source Code</marquee></h6>
                                        <hr class="mt-2">
                                        <%
                                            AppSourceDao ASD = new AppSourceDao(ConnectionProvider.getConnect());
                                            List<AppSourceEntity> ASL = ASD.getAllAppDetail();
                                            int counter2 = 0;
                                            for (AppSourceEntity ASE : ASL) {
                                                counter2++;
                                        %>



                                        <div class="col  mb-4">

                                            <div class="card shadow-lg bg-body rounded" style="max-width:22rem; min-width:15rem; max-height:30rem;">
                                                <img src="./img/appStore/<%=ASE.getFimage()%>" class="card-img-top" alt="appImage not available" height="150" width="150" alt="Image not available">
                                                <div class="card-body">
                                                    <h5 class="card-title"><%=ASE.getTitle()%></h5>
                                                    <p class="card-text"><%=ASE.getAppdetai()%></p>
                                                    <div class="d-grid gap-2 d-md-block">
                                                        <a href="./img/appStore/<%=ASE.getFileName()%>" class=" my-1 btn btn-outline-primary btn-sm">Download App</a>
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
                                                if (counter2 >= 6) {
                                                    break;
                                                }
                                            }
                                        %>


                                </div>  

                                <div class="d-grid gap-2">
                                    <a href="ShowAppStore.jsp" class="btn btn-outline-light btn-sm mb-4 p-1">Show All AppStore Apps &nbsp;&nbsp;&nbsp; <span class="fa fa-refresh fa-spin fa-2x" style="color:white;"></span></a>
                                </div>


                                <!--all quesiont fetching end here-->




                            </div>

                        </div>
                    </div>
                </div>

                <!--/////////app store end here///////////-->







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
