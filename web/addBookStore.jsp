
<%@page import="com.shikshasetu.entities.BookEntity"%>
<%@page import="com.shikshasetu.dao.BookDao"%>
<%@page import="com.shikshasetu.entities.NotificationEntity"%>
<%@page import="com.shikshasetu.dao.NotificaionDao"%>
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
        <title>sikshasetu ! Add Book store :  Where student share their talent.</title>
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
                                <p class="hint-text">ADD Book or Notes in pdf format and upload it</p>
                            </div>
                            <%                                Message m = (Message) session.getAttribute("BM");
                                if (m != null) {
                            %>

                            <div class="alert alert-warning alert-dismissible fade show bg-info text-white" role="alert">
                                <strong> <%=m.getType()%><br><%=m.getMsg()%></strong>
                                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                            </div>
                            <%
                                    session.removeAttribute("BM");
                                }


                            %>

                            <!--message from deletenotificatioan servlelt--> 

                                                      


                            <!--Edit quesiton messsage  sesion message--> 


                            <!--edit quesitn  return message session end here-->


                            <div class="card-body bg-primary text-white">		
                                <form action="AddBookServlet" method="post" enctype="multipart/form-data" >

                                    <div class="form-group">
                                        <label for="formGroupExampleInput" class="form-label"><strong>Book or Note Title </strong></label>
                                        <input type="text" class="form-control" name="title"  maxlength = "40" placeholder="eg. Book title or note title" required="required">
                                    </div>

                                    <div class="form-group">
                                        <label for="formGroupExampleInput" class="form-label mt-4"><strong>Short Description , if any<font color=yellow>&nbsp;&nbsp;;Note:Optional</font></strong></label>
                                        <textarea class="form-control" id="exampleFormControlTextarea1" name="ckeditor" rows="2"></textarea>
                                         <script>
                                            CKEDITOR.replace('ckeditor');
                                        </script>
                                    </div>



                                    <div class="form-group">
                                        <label for="formGroupExampleInput" class="form-label mt-4"><strong>Upload Book or note   <font color=yellow>Recommended in pdf format.upload single file in pdf or image or zip format.</font></strong></label>
                                        <input type="file" class="form-control" name="file" required="required">

                                    </div>

                                    <div class="d-grid gap-2 mt-4">
                                        <input type="submit" class="btn btn-danger" value="Upload Book ">
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


                    <!--                    <div class="alert alert-warning alert-dismissible text-center" role="alert">
                                            <strong><script>swal("Good job!", "You clicked the button!", "success");</script>
                                                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                                        </div>
                    showing message if dissmisable;
                    -->






                </div>


                <!--</div>-->
                <div class="container">
                    <table class="table table-dark table-striped">

                        <thead>
                            <tr>
                                <th scope="col">Book or Note Title</th>
                                <th scope="col">Book description</th>
                                <th scope="col"> File Name</th>
                                <th scope="col">Action</th>
                            </tr>
                        </thead>

                        <%                            RegisterUser Ru = (RegisterUser) session.getAttribute("cuser");
                            if (Ru != null) {

                                int UserId = Ru.getUserId();
                                BookDao BD = new BookDao(ConnectionProvider.getConnect());
                                List<BookEntity> NEL = BD.getBookDetailByUserID(UserId);

                                for (BookEntity BE : NEL) {
                        %>



                        <tbody>
                            <tr>
                                <td><%=BE.getTitle()%></td>
                                <td> <%=BE.getDesc()%></td>
                                <td> <a href="./img/BookStore/<%=BE.getFileName()%>">Get file</td>
                                <!--<td>  <a href=DeleteBookServlet?Bid="<%=BE.getId()%>">Not available</a></td>-->
                                <td>  <a href="EditBook.jsp?BookId=<%=BE.getId()%>">Edit</a></td>
                                
                           
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



