<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Login </title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <link href="assets/vendor/aos/aos.css" rel="stylesheet">
        <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
        <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
        <link href="assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
        <link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

        <!-- Template Main CSS File -->
        <link href="assets/css/style.css" rel="stylesheet">

        <!-- <link rel="icon" type="image/png" href="images/icons/favicon.ico"/>
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="assets/vendor/bootstrap/css/bootstrap.min.css"> 
        <!--===============================================================================================-->
        <!-- <link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css"> -->
        <!--===============================================================================================-->
        <!-- <link rel="stylesheet" type="text/css" href="fonts/Linearicons-Free-v1.0.0/icon-font.min.css"> -->
        <!--===============================================================================================-->
        <!-- <link rel="stylesheet" type="text/css" href="vendor/animate/animate.css"> -->
        <!--===============================================================================================-->	
        <!-- <link rel="stylesheet" type="text/css" href="vendor/css-hamburgers/hamburgers.min.css"> -->
        <!--===============================================================================================-->
        <!-- <link rel="stylesheet" type="text/css" href="vendor/animsition/css/animsition.min.css"> -->
        <!--===============================================================================================-->
        <!-- <link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css"> -->
        <!--===============================================================================================-->	
        <!-- <link rel="stylesheet" type="text/css" href="vendor/daterangepicker/daterangepicker.css"> -->
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="assets/css/login2.css">
        <link rel="stylesheet" type="text/css" href="assets/css/login1.css">
        <!--===============================================================================================-->
    </head>
    <body>

        <jsp:include page="menu.jsp"></jsp:include>


            <div class="limiter">
                <div class="container-login100" style="background-image: url('assets/img/newlanding.png');">
                    <div class="col-md-6">
                        <div class="wrap-login100 p-l-110 p-r-110 p-t-62 p-b-33" style="opacity: 0.9;">
                           
                            <main class="form-signin w-100 m-auto ">

                                <form action="Login" method="post">

                                    <h1 class="h3 mb-3 fw-normal " style="text-align: center;" >Please sign in</h1>
                                    <div class="row">
                                        <a href="#" class="btn-face m-b-20">
                                            <i class="fa fa-facebook-official"></i>
                                            Facebook
                                        </a>

                                        <a href="#" class="btn-google m-b-20">
                                            <img src="assets/img/login/icons/icon-google.png" alt="GOOGLE">
                                            Google
                                        </a>
                                    </div>

                                    <div class="alert-danger" style="color: red">
                                    <c:set var='error' value='${Error}'/>
                                        ${error}
                                    </div>
                                    <p></p>

                                <div class="form-floating">
                                    <input name="emailAddress" type="emailAddress" class="form-control" id="floatingInput" placeholder="name@example.com" required>
                                    <label for="floatingInput">Email address</label>
                                </div>
                                <br><!-- comment -->
                                <div class="form-floating">
                                    <input name="password" type="password" class="form-control" id="floatingPassword" placeholder="Password" required>
                                    <label for="floatingPassword">Password</label>
                                </div>
                                <br><!-- comment -->
                                <div class="form-floating">
                                    <input name="voterId" type="number" class="form-control" id="floatingInput2" placeholder="VoterId">
                                    <label for="floatingInput2">VoterId</label>
                                </div>
                                <br>
                                <button class="w-100 btn btn-lg btn-primary" type="submit">Sign in</button>
                                <p></p>
                                <div class="form-floating align-items-center" style="font-size: 20px;text-align: center">
                                    <a class="nav-link scrollto link-primary" href="PreSignup">Create New Account</a>
                                </div>
                                
                                <p class="mt-5 mb-3 text-muted" style="color: white"></p>
                            </form>

                        </main>
                    </div>
                </div>
            </div>
        </div>


        <div id="dropDownSelect1"></div>

        <!--===============================================================================================-->
        <!--	<script src="vendor/jquery/jquery-3.2.1.min.js"></script>-->
        <!--===============================================================================================-->
        <!--	<script src="vendor/animsition/js/animsition.min.js"></script>-->
        <!--===============================================================================================-->
        <!--	<script src="vendor/bootstrap/js/popper.js"></script>
                <script src="vendor/bootstrap/js/bootstrap.min.js"></script>-->
        <!--===============================================================================================-->
        <!--	<script src="vendor/select2/select2.min.js"></script>-->
        <!--===============================================================================================-->
        <!--	<script src="vendor/daterangepicker/moment.min.js"></script>
                <script src="vendor/daterangepicker/daterangepicker.js"></script>-->
        <!--===============================================================================================-->
        <!--	<script src="vendor/countdowntime/countdowntime.js"></script>-->
        <!--===============================================================================================-->
        <!--	<script src="js/main.js"></script>-->

    </body>
</html>