
<%@page import="com.shikshasetu.entities.UniversityEntity"%>
<%@page import="com.shikshasetu.entities.UniversityEntity"%>
<%@page import="com.shikshasetu.dao.UniversityDao"%>
<%@page import="com.shikshasetu.entities.CourseEntity"%>
<%@page import="com.shikshasetu.dao.CourseDao"%>
<%@page import="com.shikshasetu.entities.NotificationEntity"%>
<%@page import="com.shikshasetu.dao.NotificaionDao"%>
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
        <meta name="theme-color" content="#4285f4">
        <!-- Windows Phone -->
        <meta name="msapplication-navbutton-color" content="#4285f4">
        <!-- iOS Safari -->
        <meta name="apple-mobile-web-app-status-bar-style" content="#4285f4">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>sikshasetu! Question paper : Where student share their talent.</title>
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

            <section class="py-1 text-center container">
                <div class="row py-lg-5">
                    <div class="col-lg-6 col-md-8 mx-auto">
                        <h4 class="fw-light"><Strong>Welcome to SikshaSetu Question Section</Strong></h4>
                        <p class="lead text-light"><small>SikshaSetu provide the features to Write and upload Question paper with any subtitle or any sector like Institute ,Govt. Banking , School question paper .This will help users to find out Exams pattern and crack the exams. Register user can also add solution of any question paper. Just signUp to create new Account and login  and do Contribution and share link to your friends. </small></p>
                        <p>
                            <a href="https://www.youtube.com/watch?v=htbjVJaGGao&feature=youtu.be" class="btn btn-primary my-2">Get Help to Start</a>
                            <a href="contactus.jsp" class="btn btn-secondary my-2">Report how to Improve</a>
                            <button class="btn btn-warning my-2" data-bs-toggle="modal" data-bs-target="#exampleModal">Search paper with filter</button>

                        </p>

                        <!--relatively search--> 


                        <form action="SearchQuestionServlet" method="post">
                            <div class="input-group bg-light mb-4">





                                <input type="text" class="form-control bg-light" list="datalistOptions" id="exampleDataList"  name="SearchString" placeholder="Type University or subject name to relatively search.." aria-label="Recipient's username with two button addons">
                                <!--<input class="form-control" list="datalistOptions" id="exampleDataList" placeholder="Type to search...">-->
                                <datalist id="datalistOptions">
                                    <%                                        QuestionDao qd = new QuestionDao(ConnectionProvider.getConnect());
                                        List<QuestionEntity> ql = qd.getAllQuestionDetailWithCategory();
                                        for (QuestionEntity qe : ql) {
                                    %>
                                    <option value="<%=qe.getUniversity()%>">
                                    <option value="<%=qe.getCourse()%>">
                                    <option value="<%=qe.getSubject()%>">
                                        <%}%>
                                </datalist>



                                <button class="btn btn-secondary" type="submit"><span class="fa fa-search"></span></button>

                            </div>
                        </form>

                        <!--relatively search end here--> 



                        <div class="container bg-light">
                            <!-- Modal -->
                            <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="exampleModalLabel">Advance Question paper search with filter</h5>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                        </div>
                                        <div class="modal-body">
                                            <div class="card-body bg-info text-white">	

                                                <form action="AdvanceSearchServlet" method="post">
                                                    <div class="form-group">
                                                        <label for="formGroupExampleInput" class="form-label mt-4"><strong>Choose University Name or Education Board Name</strong></label> 
                                                        <!--coding for madals add education board name-->
                                                        <!-- Button trigger modal -->



                                                        <select class="form-select" name="university" aria-label="Default select example">
                                                            <%                                                                UniversityDao ud = new UniversityDao(ConnectionProvider.getConnect());
                                                                List<UniversityEntity> ull = ud.getUniversityList();
                                                                for (UniversityEntity ue : ull) {
                                                            %>
                                                            <hr>
                                                            <option   class="separator" value="<%=ue.getUname()%>,<%=ue.getState()%>"><%=ue.getUname()%>,<%=ue.getState()%></option>
                                                            <option disabled>--------------------------------------------------------------------------</option>
                                                            <%}%>
                                                        </select>

                                                        <!--<input type="text" class="form-control" name="university" placeholder="eg. mdu for maharishi dayanand University or HBSE for haryana Board" required="required">-->
                                                    </div>
                                                    <div class="form-group">
                                                        <!--<label for="formGroupExampleInput" class="form-label mt-4"><strong>Choose Exam Category</strong></label>-->
                                                        <% String c = request.getParameter("category");
                                                        %>
                                                        <input type="hidden" class="form-control" name="category" value="<%=c%>" required="required">


                                                    </div>
                                                    <div class="form-group">
                                                        <label for="formGroupExampleInput" class="form-label mt-4"><strong>Choose Course</strong></label>


                                                        <select class="form-select" name="course" aria-label="Default select example">
                                                            <%
                                                                CourseDao Cdd = new CourseDao(ConnectionProvider.getConnect());
                                                                List<CourseEntity> cll = Cdd.getAllCourse();
                                                                for (CourseEntity ec : cl) {
                                                            %>
                                                            <option value="<%=ec.getCoursename()%>,<%=ec.getShortname()%>"><%=ec.getCoursename()%>,&nbsp;<%=ec.getShortname()%></option>
                                                            <option disabled>--------------------------------------------</option>
                                                            <%}%>
                                                        </select>
                                                        <!--<input type="text" class="form-control" name="course" placeholder="eg. MCA" required="required">-->
                                                    </div>

                                                    <!--previous code end here without select option-->
                                                    <div class="form-group">
                                                        <label for="formGroupExampleInput" class="form-label mt-4"><strong>Enter Subject Name</strong></label>

                                                        <input type="text" class="form-control bg-light " list="datalistOptions" id="exampleDataList"  name="subject" placeholder="subject name question paper name" aria-label="Recipient's username with two button addons">
                                                        <!--<input class="form-control" list="datalistOptions" id="exampleDataList" placeholder="Type to search...">-->
                                                        <datalist id="datalistOptions">
                                                            <%//                                                               UniversityDao ud = new UniversityDao(ConnectionProvider.getConnect());
                                                                QuestionDao qdao22 = new QuestionDao(ConnectionProvider.getConnect());
                                                                List<QuestionEntity> ql22 = qdao22.getAllQuestionDetailWithCategory();
                                                                for (QuestionEntity qe2 : ql2) {
                                                            %>
                                                            <option value="<%=qe2.getSubject()%>"><%=qe2.getSubject()%></option>
                                                            <!--<option disabled>----------------------------------------</option>-->
                                                            <%}%>
                                                        </datalist>

                                                    </div>

                                                    <div class="d-grid gap-2 mt-4">
                                                        <input type="submit" class="btn btn-warning" value="Search Question with filter">
                                                    </div>
                                                </form>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </section>
            <!--my code ===-->
            <div class="container-fluid">

                <div class="row">


                    <div class="col-sm-9 col-md-6 col-lg-8 databar">
                        <div class="contianer">
                            <%
                                Message m = (Message) session.getAttribute("SM");
                                if (m != null) {%>
                            <div class="alert alert-warning alert-dismissible fade show bg-info text-white" role="alert">
                                <strong> <%=m.getType()%><br><%=m.getMsg()%></strong>
                                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                            </div>
                            <%
                                    session.removeAttribute("SM");
                                }
                            %>
                            <div class="row mt-4 mb-4">
                                <!--all blog fetching--> 
                                <h4 class="backbg p-4 mb-3">Question panel</h4>
                                <hr mt-4>
                                <%
                                    QuestionDao QD = new QuestionDao(ConnectionProvider.getConnect());
                                    List<QuestionEntity> Questionlist = QD.getAllQuestionDetail(c);
//                                    out.println("value of category is:"+c);
                                    for (QuestionEntity Ql : Questionlist) {
                                %>

                                <div class="col mb-3">
                                    <div class="card bg-light " style="max-width:22rem; max-height:32rem;">

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
                                                   if (Ql.getFileName() == null) {%>
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
                                                RegisterDao uddd = new RegisterDao(ConnectionProvider.getConnect());
                                                RegisterUser ru = uddd.getUserDetailbyID(id);
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





                                <!--all quesiont fetching end here-->




                            </div>

                        </div>
                    </div>
                    <div class="col-sm-3 col-md-6 col-lg-4 notbar">

                        <div class="contianer">

                            <div class="row mt-4 mb-4">

                                <div class="col">
                                    <h4 class="backbg p-4">
                                        Notification Panel</h4><hr>
                                    <marquee behavior="ALTERNATE" onmouseover="stop()" onmouseout="start()" direction="down" scrolldelay="100">

                                        <%                                        NotificaionDao ND = new NotificaionDao(ConnectionProvider.getConnect());
                                            List<NotificationEntity> NEL = ND.getAllNotification();
                                            for (NotificationEntity NE : NEL) {%>


                                        <div class="card mb-4 text-dark">
                                            <!--<div class="card shadow-sm mb-4 text-white" style="background-color:#">-->
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

                                                                out.println("<a href='./img/notification/" + NE.getAttachname() + "'>Download</a>");
                                                            }
                                                        %>
                                                    </div>


                                                </div>
                                            </div>
                                            <div class="card-footer text-end"> <small class="text-dark text-end">From : &nbsp;<%=NE.getNfrom()%>&nbsp;&nbsp;<%=NE.getDate()%></small></div>

                                        </div>

                                        <%}%>
                                    </marquee>
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
