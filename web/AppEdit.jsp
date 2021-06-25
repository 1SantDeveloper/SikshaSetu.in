
<%@page import="com.shikshasetu.entities.AppSourceEntity"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page import="com.shikshasetu.dao.AppSourceDao"%>
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
        <title>Sikshasetu ! Edit live app :  Where student share their talent.</title>
        <script src="https://cdn.ckeditor.com/4.16.0/standard/ckeditor.js"></script>
        <!--css start -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="css/shikhsasetu_css.css" rel="stylesheet" type="text/css"/>


        <!--css end--> 
    </head>


    
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
                                <p class="hint-text">Please Edit carefully and upload new file.</p>
                            </div>
                           
                          
                            


                            <!--fetching app detail here-->
                            <%
                            AppSourceDao asd=new AppSourceDao(ConnectionProvider.getConnect());
                            
                            int id=Integer.parseInt(request.getParameter("appid"));
                            AppSourceEntity ase=asd.getAppDetailByAppid(id);
                            
                            %>
                            
                            
                               <!--fetching app detail section code ended here-->

                            <div class="card-body bg-primary">		
                                <form action="UpdateAppServlet" method="post" enctype="multipart/form-data">

                                    <div class="form-group">
                                        <label for="formGroupExampleInput" class="form-label"><strong>App Title</strong></label>
                                        <input type="text" class="form-control" name="title" placeholder="Title" required="required" value="<%=ase.getTitle()%>">
                                        <input type="hidden" class="form-control" name="appid" placeholder="Title" required="required" value="<%=ase.getAppid()%>">
                                    </div>                                  
                                    <div class="form-group">
                                        <label for="formGroupExampleInput" class="form-label mt-4"><strong>Upload new image </strong></label>
                                        <input type="file" class="form-control" name="fimage" accept="Image/*" >

                                    </div>
                                    <div class="form-group">
                                        <label for="formGroupExampleInput" class="form-label mt-4"><strong>Upload new Executable App or software or Zip file</strong></label>
                                        <input type="file" class="form-control" name="app"  required="required">

                                    </div>
                                    <div class="form-group">
                                        <label for="formGroupExampleInput" class="form-label mt-4"><strong>Detail Discription of Your App. <font color="white">Note: Optional</font></strong></label>
                                        <textarea class="form-control" id="exampleFormControlTextarea1" name="appdetail" rows="10" placeholder="If not available , leave it blank"><%=ase.getAppdetai()%></textarea>
                                        <script>
                                            CKEDITOR.replace('appdetail');
                                        </script>
                                    </div>

                                    <div class="form-group">
                                        <label for="formGroupExampleInput" class="form-label mt-4"><strong>Upload Your Source code of this app or full project file or zip file <font color="white">Note: Optional</font></strong></label>
                                        <input type="file" class="form-control" name="appsource"  placeholder="If not availabe , leave it blank">

                                    </div>
                                    <div class="form-group">
                                        <label for="formGroupExampleInput" class="form-label mt-4"><strong>Detail Discription of source project file and requirements suggestion notes. <font color="white">Note: Optional</font></strong></label>
                                        <textarea class="form-control" id="exampleFormControlTextarea1" name="ckdetail" rows="5" placeholder="If not available , leave it blank"></textarea>
                                        <script>
                                            CKEDITOR.replace('ckdetail');
                                        </script>
                                    </div>
                                    <div class="d-grid gap-2 mt-4">
                                        <input type="submit" class="btn btn-success" value="Update App Data">
                                    </div>
                                </form>
                            </div>
                        </div
                    </div>

                </div>
            </div>
        </div>
    </main>
    


<!--js-->
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js" integrity="sha384-q2kxQ16AaE6UbzuKqyBE9/u/KzioAlnx2maXQHiDX9d4/zp8Ok3f+M7DPm+Ib6IU" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.min.js" integrity="sha384-pQQkAEnwaBkjpqZ8RU1fF1AKtTcHJwFl3pblpTlHXybJjHpMYo79HY3hIi4NKxyj" crossorigin="anonymous"></script>
<script scr= "https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
<!--js end-->  
<!--carosolcodin-->


<!--carosole coding end-->








<%@include file="/footer.jsp" %>  




