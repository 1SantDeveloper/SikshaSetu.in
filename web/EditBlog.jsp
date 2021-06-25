<%@page import="com.shikshasetu.dao.BlogDao"%>
<%@page import="com.shikshasetu.entities.Message"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.shikshasetu.helper.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.shikshasetu.entities.RegisterUser"%>
<%@page import="com.shikshasetu.entities.BlogEntity"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page isErrorPage="true" %>
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
        <title>sikshasetu! Edit Blog : Where student share their talent.</title>
        <!--css start -->
        <script src="https://cdn.ckeditor.com/4.16.0/standard/ckeditor.js"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="css/shikhsasetu_css.css" rel="stylesheet" type="text/css"/>
        <!--css end--> 
    </head>



    <!--navbar added--> 
    <%@include file="/profileNavBar.jsp"%>
    <!--navbar ended-->
    <!--body content of index page-->
    <%   int pid = Integer.parseInt(request.getParameter("postID"));
         BlogDao BD= new BlogDao(ConnectionProvider.getConnect());
         BlogEntity BE= BD.getBlogByID(pid);
    %>
    
    <!--Edit form fetching valuels;-->
    <main>
        <div class="container mt-4 mb-4">
            <div class="row">
                <div class="col-lg-12 ">    
                    <div class="card">
                        <div class="card-header text-center bg-success text-white">
                            <span class="	fa fa-btc  fa-2x fa-spin" ></span>
                            <p class="hint-text">Please Edit Carefully  in Blog Section</p>
                        </div>

                        <!--fetching EditPost session-->

                       

                        <div class="card-body bg-primary">		
                            <form action="EditBlogServlet" method="post" enctype="multipart/form-data">
                                <div class="form-group">
                                    <input type="hidden" name="PID" value="<%=BE.getBlogId()%>"/> 
                                    <input type="hidden" name="PImageName" value="<%=BE.getImg()%>"/> 
                                </div>
                                <div class="form-group">
                                    <label for="formGroupExampleInput" class="form-label"><strong>Title</strong></label>
                                    <input type="text" class="form-control" name="title" placeholder="Title" required="required" maxlength = "80" value="<%=BE.getTitle()%>">
                                </div>

                                <div class="form-group">
                                    <label for="formGroupExampleInput" class="form-label mt-4"><strong>Description</strong></label>
                                    <input type="text" class="form-control" name="discription" placeholder="Short Discription" maxlength = "150" required="required" value="<%=BE.getDiscription()%>">
                                </div>
                                <div class="form-group">
                                    <label for="formGroupExampleInput" class="form-label mt-4"><strong>Upload  New Featured Image ! Existing image is : <%=BE.getImg()%> </strong></label>
                                    <input type="file" class="form-control" name="fimage"  required="required" value="<%=BE.getImg()%>">

                                </div>
                                <div class="form-group">
                                    <label for="formGroupExampleInput" class="form-label mt-4"><strong>Detail Description</strong></label>
                                    <textarea class="form-control" id="exampleFormControlTextarea1" name="ckdetail" rows="10" value="<%=BE.getDetailDescription()%>"><%=BE.getDetailDescription()%></textarea>
                                    <script>
                                        CKEDITOR.replace('ckdetail');
                                    </script>
                                </div>
                                <div class="d-grid gap-2 mt-4">
                                    <input type="submit" class="btn btn-danger" value="Save changes in Blog">
                                </div>
                            </form>
                        </div>
                    </div
                </div>

            </div>
        </div>
    </div>
</main>





<!--edit form end section--> 








<!--ending body of content-->

<!--js-->
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js" integrity="sha384-q2kxQ16AaE6UbzuKqyBE9/u/KzioAlnx2maXQHiDX9d4/zp8Ok3f+M7DPm+Ib6IU" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.min.js" integrity="sha384-pQQkAEnwaBkjpqZ8RU1fF1AKtTcHJwFl3pblpTlHXybJjHpMYo79HY3hIi4NKxyj" crossorigin="anonymous"></script>
<!--js end-->  
<!--carosolcodin-->


<!--carosole coding end-->





<%@include file="/footer.jsp" %>  
</html>
