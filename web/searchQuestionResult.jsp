
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
        <meta name="theme-color" content="#4285f4">
        <!-- Windows Phone -->
        <meta name="msapplication-navbutton-color" content="#4285f4">
        <!-- iOS Safari -->
        <meta name="apple-mobile-web-app-status-bar-style" content="#4285f4">
         <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>sikshasetu ! Search Question paper :  Where student share their talent.</title>
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


                        <%                List<QuestionEntity> QEL = (List<QuestionEntity>) session.getAttribute("SearchQuestionList");
                if (QEL != null) {%>

                        <div class="alert alert-success alert-dismissible fade show mt-4" role="alert">
                            <h3><strong><%=QEL.size()%></strong> Results are found .</h3>
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
                         <%
                                           
                                            for (QuestionEntity Ql : QEL) {
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

                                                <a  href="QuestionSolutionAvailable.jsp?QuestionID=<%=Ql.getQuestionid()%>" type="button" class="btn btn-success btn-sm">Check Solution is available ?</a>
                                            </div>
                                            <!--solved to use--><hr>

                                            <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                                                <small class="text-muted">Please Add more Solution for other Student.</small>
                                                <a  href="AddQuestionSolution.jsp?QuestionID=<%=Ql.getQuestionid()%>" type="button" class="btn btn-warning btn-sm">  <span class="fa fa-plus-circle fa-2x fa-spin"></span>ADD</a>
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
