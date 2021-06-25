
<%@page import="com.shikshasetu.entities.BookEntity"%>
<%@page import="com.shikshasetu.dao.BookDao"%>
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
        <meta name="theme-color" content="#4285f4">
        <!-- Windows Phone -->
        <meta name="msapplication-navbutton-color" content="#4285f4">
        <!-- iOS Safari -->
        <meta name="apple-mobile-web-app-status-bar-style" content="#4285f4">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>sikshasetu ! book store :  Where student share their talent.</title>
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
                        <h4 class="fw-light"><Strong>Welcome to Sikshasetu Book or Note Store Section</Strong></h4>
                        <p class="lead text-light"><small>Sikshasetu provides the features to Upload the Book or Written note . About any information which you want to share with other people like Study Materials or any Book in pdf format  .Just signUp to create new Account and login  and do Contribution and share link to your friends. </small></p>
                        <p>
                            <a href="https://www.youtube.com/watch?v=htbjVJaGGao&feature=youtu.be" class="btn btn-primary my-2">Get Help to Start</a>
                            <a href="contactus.jsp" class="btn btn-secondary my-2">Report how to Improve</a>
                        </p>
                        <form action="indexPageSearchServlet" method="get">
                            <div class="input-group bg-light mb-4">
                                <input type="text" class="form-control bg-light"  required="required" name="SearchString" placeholder="Type anything to search" aria-label="Recipient's username with two button addons">
                                <button class="btn btn-outline-darkt" type="submit"><span class="fa fa-search"></span></button>

                            </div>
                        </form>
                    </div>
                </div>
            </section>
            <div class="container-fluid bg-secondary  mt-4 mb-4">


                <!--//seearch blog list if any-->


                <div class="contianer">
                    <div class="row mt-4 mb-4">
                        <h4 class="text-white backbg p-4"><marquee> Download Book or notes </marquee></h4><hr>
                        <br><hr><br>
                        <!--all blog fetching--> 
                        <table class="table table-bordered border-2 table-success table-striped">

                            <thead>
                                <tr>
                                    <th scope="col">Book or Note Title</th>
                                    <!--<th scope="col">Book description</th>-->
                                    <th scope="col">File</th>
                                    <th scope="col">By</th>
                                </tr>
                            </thead>

                        <%
                            BookDao BD= new BookDao(ConnectionProvider.getConnect());
                            List<BookEntity> BEL= BD.getAllBookDetail();
                            for(BookEntity BE:BEL)
                            {


                        %>

                         <tbody>
                                <tr>
                                    <td><%=BE.getTitle()%>,<%=BE.getDesc()%></td>
                                    <!--<td> </td>-->
                                    <td> <a href="./img/BookStore/<%=BE.getFileName()%>">Download</td>
                                   

                                    <%
                                        RegisterDao r = new RegisterDao(ConnectionProvider.getConnect());
                                        RegisterUser u = r.getUserDetailbyID(BE.getUserid());
                                    %>
                                    <td><%=u.getUserName()%></td>
                                </tr>
                            </tbody>

                            <%
                                      
                                    }

                                
                            %>
                        </table>


                    </div>
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
