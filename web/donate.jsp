
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
        <title>sikshasetu !donate us :  Where student share their talent.</title>
        <!--css start -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="css/shikhsasetu_css.css" rel="stylesheet" type="text/css"/>
        <!--css end--> 
    </head>

    <body>

        <!--navbar added--> 
        <%@include file="/navbar.jsp"%>

        <div class="container mt-4">
            <div class="card-group">
                <div class="card">
                    <img src="img/donate.jpg" class="card-img-top" alt="...">
                    <div class="card-body">
                        <h5 class="card-title">Donation via Razorpay</h5>
                        <p class="card-text">Sikshasetu is on initial stage and your little bit donation will help to develop this web application unique .</p>
                        <form><script src="https://checkout.razorpay.com/v1/payment-button.js" data-payment_button_id="pl_H0DO5gA56Td57s" async></script> </form>
                    
                    </div>
                </div>
                <div class="card">
                    <!--<a href="img/phonepe.jpeg">--> 
                    <!--                    <img src="img/phonepe.jpeg" class="card-img-top" height="250" width="200" alt="...">-->
                    <!--</a>-->
                    <img src="img/donate.jpg" class="card-img-top" alt="...">
                    <div class="card-body">
                        <h5 class="card-title">Donation via Scanning QR Code</h5>
                        <p class="card-text">Please scan this QR code to help sikshasetu Developer.
                        </p>
                        <!--<a href="img/googlepay.jpeg">click to zoom</a>-->

                        <img src="img/googlepay.jpeg" height="220" width="350" alt="">

                    </div>
<!--                    <div class="d-grid gap-2">
                        <button class="btn btn-success" type="button"><a href="img/googlepay.jpeg">click to zoom</a></button>

                    </div>-->
                </div>
                <div class="card">
                    <!--<img src="img/donate.jpg" alt=""/>-->
                    <img src="img/donate.jpg" class="card-img-top" alt="...">
                    <div class="card-body">
                        <h5 class="card-title">Donation via UPI ID</h5>
                        <p class="card-text">Google pay UPI id: aryan.santosh.97@okicici</p>
                        <p class="card-text">Phonepe pay UPI id: santdeveloper@ybl`</p>

                    </div>
                </div>
            </div>
        </div>

        <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js" integrity="sha384-q2kxQ16AaE6UbzuKqyBE9/u/KzioAlnx2maXQHiDX9d4/zp8Ok3f+M7DPm+Ib6IU" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.min.js" integrity="sha384-pQQkAEnwaBkjpqZ8RU1fF1AKtTcHJwFl3pblpTlHXybJjHpMYo79HY3hIi4NKxyj" crossorigin="anonymous"></script>
        <!--js end-->  
        <!--carosolcodin-->


        <!--carosole coding end-->




    </body>
    <%@include file="/footer.jsp" %>  
</html>
