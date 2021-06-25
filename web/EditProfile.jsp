
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
        <title>sikshasetu ! Edit profile : Where student share their talent.</title>
        <!--css start -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="css/shikhsasetu_css.css" rel="stylesheet" type="text/css"/>
        <!--css end--> 
    </head>

    <body>

        <!--navbar added--> 
        <%@include file="/profileNavBar.jsp"%>



        <div class="container-fluid my-4 mb-4">
            <div class="row justify-content-center my-4 mb-4">
                <div class="col-lg-4 my-4 mb-4">
                    <div class="card text-dark mx-2 mb-4 rounded-2 p-3">
                        <div class="card-title bg-warning text-center">
                            <h5>Please Edit your Detail </h5>
                        </div>

                        <form action="ProfileEditServlet" method="post" enctype="multipart/form-data">

                            <div class="form-group">
                                <label for="formGroupExampleInput" class="form-label"><strong>Edit your Name</strong></label>
                                <input type="text" class="form-control" name="name" placeholder="Enter Name" required="required" value='<%=ru.getUserName()%>'>
                            </div>                                  
                            <div class="form-group">
                                <input type="hidden" class="form-control" name="userid"  required="required" value='<%=ru.getUserId()%>'>
                            </div>                                  
                            <div class="form-group">
                                <label for="formGroupExampleInput" class="form-label"><strong>Email Not editable</strong></label>
                                <input type="email" class="form-control"   placeholder="Email" disabled required="required" value='<%=ru.getEmail()%>'>
                            </div>                                  
                            <div class="form-group">
                                <input type="hidden" class="form-control" name="email"  placeholder="Email"  required="required" value='<%=ru.getEmail()%>'>
                            </div>                                  
                            <div class="form-group">
                                <input type="hidden" class="form-control" name="oldfile"  placeholder="Email"  required="required" value='<%=ru.getProfile()%>'>
                            </div>                                  
                            <div class="form-group">
                                <label for="formGroupExampleInput" class="form-label"><strong>Edit Phone Number</strong></label>
                                <input type="text" class="form-control" name="phone" placeholder="Phone number" required="required" value='<%=ru.getPhoneNo()%>'>
                            </div>                                  
                            <div class="form-group">
                                <label for="formGroupExampleInput" class="form-label"><strong>Edit Password</strong></label>
                                <input type="text" class="form-control" name="password" placeholder="Password" required="required" value='<%=ru.getPassword()%>'>
                            </div>                                  
                            <div class="form-group">
                                <label for="formGroupExampleInput" class="form-label mt-4"><strong>Add Profile Pic : Old Profile Pic is: <%=ru.getProfile()%> </strong></label>
                                <input type="file" class="form-control" name="pimage" required="required">

                            </div>





                            <div class="d-grid gap-2 mt-4">
                                <input type="submit" class="btn btn-outline-success" value="Save Changes">
                            </div>
                        </form>
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
