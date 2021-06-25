

<%@page import="com.shikshasetu.entities.NotificationEntity"%>
<%@page import="com.shikshasetu.dao.NotificaionDao"%>
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
         <!-- Chrome, Firefox OS and Opera -->
        <meta name="theme-color" content="#4285f4">
        <!-- Windows Phone -->
        <meta name="msapplication-navbutton-color" content="#4285f4">
        <!-- iOS Safari -->
        <meta name="apple-mobile-web-app-status-bar-style" content="#4285f4">
       
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>sikshasetu! Read notification :  Where student share their talent.</title>
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

                        <%                            int id = Integer.parseInt(request.getParameter("NID"));
                            NotificaionDao Nd = new NotificaionDao(ConnectionProvider.getConnect());
                            NotificationEntity NE = Nd.getAllNotificatinByID(id);
                            if (NE != null) {%>


                        <div class="card shadow-sm mb-4 mt-4 text-dark">
                            <div class="card-header"><span class="fa fa-hand-o-right fa-2x px-2"></span>Notification for: &nbsp;&nbsp;<strong><%=NE.getNfor()%></strong></div>
                            <div class="card-body">
                                <p class="card-text">Title : &nbsp;&nbsp;<%=NE.getNtitle()%> </p>
                                <hr>
                                <p class="card-text">Description : &nbsp;&nbsp;<%=NE.getNdesc()%> </p>
                                <hr class="text-white">
                                <div class="d-flex">
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
                            <div class="card-footer text-end"> <small class="text-dark text-end">From : &nbsp;<%=NE.getNfrom()%>&nbsp;Date:&nbsp;<%=NE.getDate()%></small></div>
                                    
                        </div>

                        <%}

                        %>

                    </div>
                </div>

                <!--//seearch blog list if any-->

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
