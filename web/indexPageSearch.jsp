
<%@page import="com.shikshasetu.entities.BookEntity"%>
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
        <title>sikshasetu ! Search result :  Where student share their talent.</title>
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
            <div class="container bg-success  mt-4 mb-4">
                <div class="row">
                    <div class="col-12">


                        <%                List<NotificationEntity> NEL = (List<NotificationEntity>) session.getAttribute("SearchNotificationList");
                            if (NEL != null) {%>

                        <div class="alert alert-success alert-dismissible fade show mt-4" role="alert">
                            <h3><strong><%=NEL.size()%></strong> Results are found from Notification section.</h3>
                            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                        </div>
                        <%}

                        %>
                    </div>
                </div>

                <!--//seearch blog list if any-->


                <div class="contianer">
                    <div class="row mt-4 mb-4">
                        <h6 class="text-white"><marquee>Notification  From your search History</marquee></h6>
                        <!--all blog fetching--> 
                        <%                             for (NotificationEntity NE : NEL) {
                        %>
                        <div class="col">
                            <div class="card shadow-sm mb-4 text-dark" style="max-width:22rem;max-height:25rem;">
                                <div class="card-header"><span class="fa fa-hand-o-right fa-2x px-2"></span>Notification for: &nbsp;&nbsp;<strong><%=NE.getNfor()%></strong></div>
                                <div class="card-body">
                                    <p class="card-text">Title : &nbsp;&nbsp;<%=NE.getNtitle()%> </p>
                                    <div class="d-grid gap-2 d-md-flex justify-content-md-end">

                                        <a  href="ReadNotification.jsp?NID=<%=NE.getNid()%>" type="button" class="btn btn-secondary text-white btn-sm">  <span class="fa fa-hand-o-right fa-spin"></span>Read more..</a>
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
        </div>



        <!--notification search end here-->



        <!--show all search result for questionpaper-->
        <div class="container-fluid">
            <div class="container bg-success  mt-4 mb-4">
                <div class="row">
                    <div class="col-12">


                        <%                List<QuestionEntity> QEL = (List<QuestionEntity>) session.getAttribute("SearchQuestionList");
                            if (QEL != null) {%>

                        <div class="alert alert-success alert-dismissible fade show mt-4" role="alert">
                            <h3><strong><%=QEL.size()%></strong> Results are found from Question Paper section.</h3>
                            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                        </div>
                        <%}

                        %>
                    </div>
                </div>

                <!--//seearch blog list if any-->


                <div class="contianer">
                    <div class="row mt-4 mb-4">
                        <h6 class="text-white"><marquee>Question paper  From your search History</marquee></h6>
                        <!--all blog fetching--> 
                        <%                             for (QuestionEntity Ql : QEL) {
                        %>

                        <div class="col mb-3">
                            <div class="card bg-light" style="max-width:22rem; max-height:30rem;">

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
                                        <%
//                                                    out.println(Ql.getFileName());
//                                                    out.println(Ql.getLink());
                                                    if (Ql.getFileName()==null) {%>
                                                <a  href="<%=Ql.getLink()%>" type="button" class="btn btn-outline-primary btn-sm my-1">Download</a>

                                                <% } else {%>
                                                <a  href="./img/questionUpload/<%=Ql.getFileName()%>" type="button" class="btn btn-outline-primary btn-sm my-1">Download</a>

                                                <%   }
                                                %>

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
                            }
                        %>

                    </div>
                </div>
            </div>
        </div>
        <!--fetching all search result from all question paper end here--> 

        <!--fetching all pdf store--> 

        <div class="container-fluid  mt-4 mb-4">
            
             <div class="container bg-success  mt-4 mb-4">
                <div class="row">
            <div class="col-12">


                <%                List<BookEntity> BBEL = (List<BookEntity>) session.getAttribute("SearchBookSession");
                            if (QEL != null) {%>

                <div class="alert alert-success alert-dismissible fade show mt-4" role="alert">
                    <h3><strong><%=BBEL.size()%></strong> Results are found from BookStore  section.</h3>
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
                <%}

                %>
            </div>
                </div>
            



            <div class="contianer">
                <div class="row mt-4 mb-4">
                    <h6 class="text-white"><marquee> All Book Store items from your search History </marquee></h6>

                    <%                            for (BookEntity BE : BBEL) {


                    %>

                  <div class="col">
                            <div class="card shadow-sm mb-4 text-dark" style="max-height:24rem;max-width: 30rem;">
                             
                            <div class="card-header"><span class="fa fa-hand-o-right fa-2x px-2"></span><strong><%=BE.getTitle()%></strong></div>
                            <div class="card-body">
                                <p class="card-text"><%=BE.getDesc()%> </p>
                                <div class="d-grid gap-2">

                                    <a  href="./img/BookStore/<%=BE.getFileName()%>" type="button" class="btn btn-outline-primary  btn-sm">  <span class="fa fa-hand-o-right fa-spin"></span>Download</a>
                                </div>  

                            </div>

                            <%
                                RegisterDao r = new RegisterDao(ConnectionProvider.getConnect());
                                RegisterUser u = r.getUserDetailbyID(BE.getUserid());
                            %>
                            <div class="card-footer text-end"> <small class="text-dark text-end"><%=u.getUserName()%></small></div>
                        </div>
                    </div>
                    <%}%>

                </div>
            </div>
        </div>
                     </div>


        <!--fetching all pdf store end here-->








        <!--fetch all blog with search from user--> 

        <div class="container-fluid">
            <div class="container bg-success  mt-4 mb-4">
                <div class="row">
                    <div class="col-12">


                        <%                List<BlogEntity> BEL = (List<BlogEntity>) session.getAttribute("SearchBlogList");
                            if (BEL != null) {%>

                        <div class="alert alert-success alert-dismissible fade show mt-4" role="alert">
                            <h3><strong><%=BEL.size()%></strong> Results are found from Blog Section .</h3>
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

                        <div class="col">
                            <div class="card my-1" style="max-width:22rem; max-height:30rem;">
                                <img src="./img/BlogImage/<%=l.getImg()%>" class="card-img-top" height="160" alt="...">
                                <div class="card-body">
                                    <h5 class="card-title text-uppercase"><%=l.getTitle()%></h5>
                                    <p class="card-text"><%=l.getDiscription()%></p>
                                    <a href="ShowMyBlog.jsp?postID=<%=l.getBlogId()%>" class="btn btn-outline-primary d-grid gap-2">Read More...</a>
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

        <!--search all app store from index page start here-->
        <div class="container-fluid">
            <div class="container bg-success  mt-4 mb-4">
                <div class="row">
                    <div class="col-12">


                        <%                            List<AppSourceEntity> ASEL = (List<AppSourceEntity>) session.getAttribute("SearchAppList");
                            if (ASEL != null) {%>

                        <div class="alert alert-success alert-dismissible fade show mt-4" role="alert">
                            <h3><strong><%=ASEL.size()%></strong> Results are found from AppStore Section.</h3>
                            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                        </div>
                        <%}

                        %>
                    </div>
                </div>

                <!--//seearch blog list if any-->


                <div class="contianer">
                    <div class="row mt-4 mb-4">
                        <h6 class="text-white"><marquee >Download App from your search history</marquee></h6>
                                <%                                    for (AppSourceEntity ASE : ASEL) {
                                %>



                        <div class="col mx-4 mb-4">

                            <div class="card shadow-lg bg-body rounded" style="width:22rem; height:26rem;">
                                <img src="./img/appStore/<%=ASE.getFimage()%>" class="card-img-top" alt="appImage not available" height="150" width="150" alt="Image not available">
                                <div class="card-body">
                                    <h5 class="card-title"><%=ASE.getTitle()%></h5>
                                    <p class="card-text"><%=ASE.getAppdetai()%></p>
                                    <div class="d-grid gap-2 d-md-block justify-content-end align-self-end">
                                        <a href="./img/appStore/<%=ASE.getFileName()%>" class=" mb-1 btn btn-outline-primary btn-sm">Download App</a>
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
                                    <small class=" text-end">Uploaded By : <%=ru.getUserName()%></small>
                                </div>
                            </div>
                        </div>

                        <%
                            }
                        %>
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
