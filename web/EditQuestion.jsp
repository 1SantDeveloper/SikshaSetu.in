
<%@page import="java.util.List"%>
<%@page import="com.shikshasetu.entities.QuestionEntity"%>
<%@page import="com.shikshasetu.dao.QuestionDao"%>
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
        <title>sikshasetu ! Add Question :  Where student share their talent.</title>
        <script src="https://cdn.ckeditor.com/4.16.0/standard/ckeditor.js"></script>
        <!--css start -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="css/shikhsasetu_css.css" rel="stylesheet" type="text/css"/>


        <!--css end--> 
    </head>


    <Body>
        <!--navbar added--> 
        <%@include file="/profileNavBar.jsp"%>
        <!--navbar ended-->

        <!--signup form code-->
        <main>
            <div class="container mt-4 mb-4">
                <div class="row">
                    <div class="col-lg-12 ">    
                        <div class="card">
                            <div class="card-header text-center bg-success text-white">
                                <span class="	fa fa-btc  fa-2x fa-spin" ></span>
                                <p class="hint-text">Please Edit Carefully Question Paper Section</p>
                            </div>

                            <!--Edit question sesion message--> 

                            <%                                int qid = Integer.parseInt(request.getParameter("QuestionID"));
                                QuestionDao QD = new QuestionDao(ConnectionProvider.getConnect());
                                QuestionEntity QE = QD.getQuestionDetailByQuestionID(qid);
                            %>

                            <div class="card-body bg-primary text-white">		
                                <form action="EdiitQuestionSevlet" method="post" enctype="multipart/form-data">


                                    <div class="form-group">
                                        <label for="formGroupExampleInput" class="form-label"><strong>Subject Name</strong></label>
                                        <input type="text" class="form-control" name="subject" value="<%=QE.getSubject()%>" placeholder="eg. Artificail intelligence" required="required">
                                    </div>

                                    <div class="form-group">
                                        <label for="formGroupExampleInput" class="form-label mt-4"><strong>University Name or Education Board Name</strong></label>
                                        <input type="text" class="form-control" name="university" value="<%=QE.getUniversity()%>" placeholder="Short name eg. mdu for maharishi dayanand University or HBSE for haryana Board" required="required">
                                    </div>
                                    <div class="form-group">
                                        <label for="formGroupExampleInput" class="form-label mt-4"><strong>Course</strong></label>
                                        <input type="text" class="form-control" name="course" value="<%=QE.getCourse()%>" placeholder="eg. MCA" required="required">
                                    </div>
                                    <div class="form-group">
                                        <label for="formGroupExampleInput" class="form-label mt-4"><strong>Semester</strong></label>
                                        <input type="number" class="form-control" name="semester" value="<%=QE.getSemester()%>"  placeholder="If not applicable leave it blank">
                                    </div>
                                    <div class="form-group">
                                        <label for="formGroupExampleInput" class="form-label mt-4"><strong>Year</strong></label>
                                        <input type="number" class="form-control" name="year" value="<%=QE.getYear()%>" placeholder="If not applicable leave it blank">
                                    </div>
                                    <div class="form-group">
                                        <label for="formGroupExampleInput" class="form-label mt-4"><strong>Upload Question Paper : Old file:<%=QE.getFileName()%></strong></label>
                                        <input type="file" class="form-control" name="filename" accept="image/*,.pdf">

                                    </div>
                                    <div class="form-group">
                                       
                                        <input type="hidden" class="form-control" name="QID" value="<%=QE.getQuestionid()%>">

                                    </div>

                                    <div class="d-grid gap-2 mt-4">
                                        <input type="submit" class="btn btn-danger" value="Update Paper">
                                    </div>
                                </form>
                            </div>
                        </div
                    </div>

                </div>
            </div>
        </div>
    </main>
    <section>
        <div class="container mt-4 mb-4 ">
            <div class="card w-100">
                <div class="card-body">
                    <h5 class="card-title text-center"><span class="fa fa-btc fa-spin fa-2x"></span></h5>
                    <p class="card-body text-center"><strong>Thanks for supporting us . Your  Contribution is here !..</strong></p>
                </div>


                <!--</div>-->
                <div class="container">
                    <table class="table table-dark table-striped">

                        <thead>
                            <tr>
                                <th scope="col">Question Title</th>
                                <th scope="col">Univesity Name</th>
                                <th scope="col">Course</th>
                                <th scope="col">Action</th>
                            </tr>
                        </thead>

                        <%
                            RegisterUser Ru = (RegisterUser) session.getAttribute("cuser");
                            if (Ru != null) {

                                int UserId = Ru.getUserId();
                                QuestionDao QDD = new QuestionDao(ConnectionProvider.getConnect());
                                List<QuestionEntity> QEL = QDD.getQuestionDetailByUserID(UserId);

                                for (QuestionEntity QEE : QEL) {
                        %>



                        <tbody>
                            <tr>
                                <th scope="row" class="text-white"><%=QEE.getSubject()%></th>

                                <td> <%=QEE.getUniversity()%></td>
                                <td> <%=QEE.getCourse()%></td>
                                <td>  <a href="EditQuestion.jsp?QuestionID=<%=QEE.getQuestionid()%>" class="btn btn-danger btn-sm">EDIT</a></td>
                            </tr>
                            </tr>
                        </tbody>

                        <%
                                    //                                                        out.println(RS.getInt("UID"));
                                    //                                                        out.println(RS.getString("PTitle"));
                                    //                                                        out.println(RS.getInt("PID"));
                                }

                            }
                        %>
                    </table>
                </div>
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







</body>
<%@include file="/footer.jsp" %>  
</html>



