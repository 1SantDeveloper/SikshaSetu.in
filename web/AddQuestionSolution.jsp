
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
        <title>sikshasetu ! Add Question solution :  Where student share their talent.</title>
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
                                <p class="hint-text">Thanks for supporting us to ADD solution for this Question .</p>
                            </div>

                            <!--Edit question sesion message--> 

                            <%
                                int qid = Integer.parseInt(request.getParameter("QuestionID"));
                                QuestionDao QD = new QuestionDao(ConnectionProvider.getConnect());
                                QuestionEntity QE = QD.getQuestionDetailByQuestionID(qid);
                            %>


                            <div class="card">
                                <div class="card-header"><h4><center>Your Question detail is here.</h4></center> </div>
                                <div classs="card-body">
                                    <table class="table table-bordered border-primary table-warning">
                                        <tr>
                                            <td>subject Name</td>
                                            <td><%=QE.getSubject()%></td>
                                        </tr>
                                        <tr>
                                            <td>University Name</td>
                                            <td><%=QE.getUniversity()%></td>
                                        </tr>

                                        <tr>
                                            <td>Course Name</td>
                                            <td><%=QE.getCourse()%></td>
                                        </tr>
                                        <tr>
                                            <td>Semester</td>
                                            <td><%=QE.getSemester()%></td>
                                        </tr>
                                        <tr>
                                            <td>Year</td>
                                            <td><%=QE.getYear()%></td>
                                        </tr>
                                        <tr>
                                            <td>Question Paper</td>
                                            <td colspan="2" style="height:27rem;">
                                                <object height="100%" width="100%" type="application/pdf" data="./img/questionUpload/<%=QE.getFileName()%>" scroll="no" style="height: 100%; overflow: hidden">

                                                    <p>It appears your device does not support this feature.  you can  <a  href="./img/questionUpload/<%=QE.getFileName()%>" >click here to download Question paper and check manually.</a></p>

                                                </object>
                                            </td>
                                        </tr>


                                    </table>
                                </div>
                            </div>
                            <div class="card-body bg-primary text-white">		
                                <form action="AddSolvedPaperServlet" method="post" enctype="multipart/form-data" >


                                   <div class="form-group">
                                        <label for="formGroupExampleInput" class="form-label mt-4"><strong>Title of Solution</strong></label>
                                        <input type="text" class="form-control" name="title"   placeholder="If not applicable , leave it blank">
                                    </div>
                                    
                                   
                                   
                                    <div class="form-group">
                                        <label for="formGroupExampleInput" class="form-label mt-4"><strong>Amount In INR</strong></label>
                                        <input type="number" class="form-control" name="price"   value="0.00" placeholder="0.000 INR">
                                    </div>
                                    
                                    <div class="form-group">
                                        <label for="formGroupExampleInput" class="form-label mt-4"><strong>Upload Preview file of solution </strong></label>
                                        <input type="file" class="form-control" name="previewfile"  accept="image/*,.pdf" required="required">

                                    </div>
                                    <div class="form-group">
                                        <label for="formGroupExampleInput" class="form-label mt-4"><strong>Upload Solution as pdf file or zip file </strong></label>
                                        <input type="file" class="form-control" name="fullfile" accept="image/*,.pdf"  required="required">

                                    </div>
                                    <div class="form-group">

                                        <input type="hidden" class="form-control" name="QID" value="<%=QE.getQuestionid()%>">
                                        <input type="hidden" class="form-control" name="UID" value="<%=ru.getUserId()%>">

                                    </div>
                                        
                                         <div class="form-group">
                                             <label for="formGroupExampleInput" class="form-label mt-4"><strong>Write Manually all the Answers.<font color="yellow"> Note: it is optional .In case user have no solved pdf file or leave it blank. </font></strong></label>
                                        <textarea class="form-control" id="exampleFormControlTextarea1" name="manuallytext" rows="10"></textarea>
                                        <script>
                                            CKEDITOR.replace('ckdetail');
                                        </script>
                                    </div>

                                    <div class="d-grid gap-2 mt-4">
                                        <input type="submit" class="btn btn-danger" value="Upload solved Paper">
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
                    <p class="card-body text-center"><strong>Thanks for supporting us ...</strong></p>
                </div>


                <!--</div>-->
               

    </section>

    <!--signup form code ened-->

    <!--js-->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js" integrity="sha384-q2kxQ16AaE6UbzuKqyBE9/u/KzioAlnx2maXQHiDX9d4/zp8Ok3f+M7DPm+Ib6IU" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.min.js" integrity="sha384-pQQkAEnwaBkjpqZ8RU1fF1AKtTcHJwFl3pblpTlHXybJjHpMYo79HY3hIi4NKxyj" crossorigin="anonymous"></script>
    <script scr= "https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
    <!--js end-->  
    <!--carosolcoding-->


    <!--carosole coding end-->







</body>
<%@include file="/footer.jsp" %>  
</html>



