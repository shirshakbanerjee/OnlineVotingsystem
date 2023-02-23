<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Login V5</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

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
        <header id="header" class="d-flex align-items-center">
            <jsp:include page="menu.jsp"></jsp:include>
            </header><!-- End Header -->

            <div class="limiter">
                <div class="container-login100" style="background-image: url('assets/img/map.png');">
                    <div class="col-md-6">
                    <div class="wrap-login100 p-l-110 p-r-110 p-t-62 p-b-33" style="opacity: 0.9;">
                        <!--                    <form class="login100-form validate-form flex-sb flex-w">
                                                <span class="login100-form-title p-b-53">
                                                    Sign In With
                                                </span>
                        
                                                <a href="#" class="btn-face m-b-20">
                                                    <i class="fa fa-facebook-official"></i>
                                                    Facebook
                                                </a>
                        
                                                <a href="#" class="btn-google m-b-20">
                                                    <img src="assets/img/login/icons/icon-google.png" alt="GOOGLE">
                                                    Google
                                                </a>
                        
                        
                                                <div class="form-floating">
                                                    <input type="text" class="form-control"  placeholder="Voter Id" name="voterId">
                                                    <label for="floatingPassword">VoterId</label>
                                                </div>
                        
                                                <div class="p-t-13 p-b-9">
                                                    <span class="txt1">
                                                        Password
                                                    </span>
                        
                                                    <a href="#" class="txt2 bo1 m-l-5">
                                                        Forgot?
                                                    </a>
                                                </div>
                                                <div class="wrap-input100 validate-input" data-validate = "Password is required">
                                                    <input class="input100" type="password" name="pass" >
                                                    <span class="focus-input100"></span>
                                                </div>
                        
                                                <div class="container-login100-form-btn m-t-17">
                                                    <button class="login100-form-btn">
                                                        Sign In
                                                    </button>
                                                </div>
                        
                                                <div class="w-full text-center p-t-55">
                                                    <span class="txt2">
                                                        Not a member?
                                                    </span>
                        
                                                    <a href="#" class="txt2 bo1">
                                                        Sign up now
                                                    </a>
                                                </div>
                                            </form>-->

                        
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

                                    <h3 class="alert-danger">
                                        <c:set var='error' value='${Error}'/>
                                    ${error}
                                </h3>

                                <div class="form-floating">
                                    <input name="emailAddress" type="emailAddress" class="form-control" id="floatingInput" placeholder="name@example.com" required>
                                    <label for="floatingInput">Email address</label>
                                </div>
                                <div class="form-floating">
                                    <input name="password" type="password" class="form-control" id="floatingPassword" placeholder="Password" required>
                                    <label for="floatingPassword">Password</label>
                                </div>
                                <div class="form-floating">
                                    <input name="voterId" type="number" class="form-control" id="floatingInput2" placeholder="VoterId">
                                    <label for="floatingInput2">VoterId</label>
                                </div>

                                <div class="checkbox mb-3">
                                    <label style="color: white">
                                        <input type="checkbox" value="remember-me"> Remember me
                                    </label>
                                </div>
                                <button class="w-100 btn btn-lg btn-primary" type="submit">Sign in</button>
                                <p class="mt-5 mb-3 text-muted" style="color: white">&copy; 2017?2022</p>
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