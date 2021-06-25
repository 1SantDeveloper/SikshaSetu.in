
<%@page import="com.shikshasetu.entities.SourceCodeEntity"%>
<%@page import="com.shikshasetu.dao.SourceCodeDao"%>
<%@page import="com.shikshasetu.entities.AppSourceEntity"%>
<%@page import="com.shikshasetu.dao.AppSourceDao"%>
<%@page import="com.shikshasetu.dao.RegisterDao"%>
<%@page import="com.shikshasetu.entities.SolutionEntity"%>
<%@page import="com.shikshasetu.dao.SolutionDao"%>
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
<%--<%@page import="com.sikshasetu.helper.ConnectionProvider"%>--%>
<%--<%@page  import ="java.sql.*"%>--%>
<!DOCTYPE html>
<html>
    <!--meta tag file is added-->
        <%@include file="/metatag.jsp"%>
        <!--meta tag file is added-->
     <!-- Chrome, Firefox OS and Opera -->
        <meta name="theme-color" content="#4285f4">
        <!-- Windows Phone -->
        <meta name="msapplication-navbutton-color" content="#4285f4">
        <!-- iOS Safari -->
        <meta name="apple-mobile-web-app-status-bar-style" content="#4285f4">
       
    <head><meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>sikshasetu ! Add source code available :  Where student share their talent.</title>
        <script src="https://cdn.ckeditor.com/4.16.0/standard/ckeditor.js"></script>
        <!--css start -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="css/shikhsasetu_css.css" rel="stylesheet" type="text/css"/>


        <!--css end--> 
    </head>


    <Body>
        <!--navbar added--> 
        <%@include file="/navbar.jsp"%>
        <!--navbar ended-->

        <!--signup form code-->
        <main>
            <div class="container mt-4 mb-4">
                <div class="row">
                    <div class="col-lg-12 ">    
                        <div class="card">
                            <div class="card-header text-center bg-success text-white">
                                <span class="	fa fa-btc  fa-2x fa-spin" ></span>
                                <p class="hint-text">Thanks for visit us. if not found solution . please add and support us.</p>
                            </div>

                            <!--Edit question session message--> 

                            <%
                                int aid = Integer.parseInt(request.getParameter("AID"));
                                AppSourceDao ASD = new AppSourceDao(ConnectionProvider.getConnect());
                                AppSourceEntity ASE = ASD.getAppDetailByAppid(aid);
                            %>


                            <div class="card">
                                <div class="card-header"><h4><center>Your App  detail is here.</h4></center> </div>
                                <div classs="card-body">
                                    <table class="table table-bordered border-primary table-warning">
                                        <tr>

                                            <td>App Name</td>
                                            <td><%=ASE.getTitle()%></td>
                                        </tr>
                                        <tr>
                                            <td> App image</td>
                                            <td><img src="./img/appStore/<%=ASE.getFimage()%>" height='50' width='50'></td>
                                        </tr>

                                        <tr>
                                            <td>App detail</td>
                                            <td><%=ASE.getAppdetai()%></td>
                                        </tr>
                                        <tr>
                                            <td>App source detail</td>
                                            <td><%=ASE.getAppsourcedetail()%></td>
                                        </tr>
                                        <tr>
                                            <td>App Source File </td>
                                            <td><%=ASE.getAppsourceName()%></td>
                                        </tr>
                                        <tr>
                                            <td>App Executable file</td>
                                            <td colspan="2">

                                                <a  href="./img/appStore/<%=ASE.getAppsourceName()%>" >click here to download the App.</a></p>

                                            </td>
                                        </tr>


                                    </table>
                                </div>
                            </div>
                            <div class="card">
                                <div class="alert alert-success alert-dismissible fade show" role="alert">
                                    <h4>Please donate to help us.!
                                    <form><script src="https://checkout.razorpay.com/v1/payment-button.js" data-payment_button_id="pl_H0DO5gA56Td57s" async></script> </form>
                    </h4> <h5>All source code or source project is free <span class="badge bg-secondary">Offer</span></h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                                </div>
                                <div class="card-body">
                                    <table class="table table-bordered border-primary table-success">
                                        <th>Sr.no.</th>
                                        <th>
                                            Source project Title
                                        </th>
                                        <th>
                                            Price
                                        </th>
                                        <th>
                                            Download Project file
                                        </th>
                                        <th>Written Source code</th>
                                        <th>
                                            Uploaded by
                                        </th>
                                        <!--fetching all available solution by different user--> 


                                        <%
                                            SourceCodeDao SCD = new SourceCodeDao(ConnectionProvider.getConnect());
                                            List<SourceCodeEntity> SCEL = SCD.getProjectByAppID(aid);
                                            int c = 0;
                                            for (SourceCodeEntity SCE : SCEL) {

                                                c++;
                                        %>

                                        <tr>
                                            <td>
                                                <%=c%>
                                            </td>  
                                            <td><%=SCE.getStitle()%></td>
                                            <td><%=SCE.getSprice()%></td>
                                            <td><a href="./img/appStore/<%=SCE.getSfile()%>">get it</a></td>
                                            <td><%=SCE.getSmanually()%></td>
                                            <td>
                                                <%
                                                    int f = SCE.getSuid();
                                                    RegisterDao rrd = new RegisterDao(ConnectionProvider.getConnect());
                                                    RegisterUser rrusr = rrd.getUserDetailbyID(f);
                                                    out.println(rrusr.getUserName());

                                                %>


                                            </td>
                                        </tr> 
                                        <%                                            }
                                        %>

                                    </table>
                                        <%
                                                if (c == 0) {%>

                                        <div class="alert alert-danger alert-dismissible fade show" role="alert">
                                            <h5>Sorry no source Code available for this app.!<br>Please add if you have.</h5> 
                                            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                                        </div>
                                        <%  }
                                        %>
                                </div>
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
                <!--carosolcodin-->


                <!--carosole coding end-->







                </body>
                <%@include file="/footer.jsp" %>  
                </html>



