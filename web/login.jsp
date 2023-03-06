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
    <script src="https://code.jquery.com/jquery-3.6.3.js" integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM=" crossorigin="anonymous">
    </script>
    <!--    <script>
            function sendOTP() {
                let email = document.getElementById("emailAddress").value; // Recipient email address
                alert(document.getElementById("emailAddress").value);
                // Generate random OTP
                otp = Math.floor(Math.random() * 9000) + 1000;
    
                // Send OTP to user's email using Ajax
                $.ajax({
                    type: "POST",
                    url: "SendOtp",
                    data: {emailAddress: email, otp: otp},
                    success: function (result) {
                        console.log("OTP sent successfully");
                    },
                    error: function (error) {
                        console.log("Error sending OTP: " + error);
                    }
                });
            }
    
            function verifyOTP() {
                let enteredOTP = document.getElementById("otp").value; // Get OTP entered by user
    
                if (enteredOTP === otp.toString()) { // Verify OTP
                    alert("OTP verified successfully");
                } else {
                    alert("Incorrect OTP");
                }
            }
        </script>-->
    <body>

        <jsp:include page="menu.jsp"></jsp:include>


            <div class="limiter">
                <div class="container-login100" style="background-image: url('assets/img/newlanding.png');">
                    <div class="col-md-6">
                        <div class="wrap-login100 p-l-110 p-r-110 p-t-62 p-b-33" style="opacity: 0.9;">

                            <main class="form-signin w-100 m-auto ">

                                <!--                                <form action="Login" method="post">
                                
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
                        <br> comment 
                        <div class="form-floating">
                            <input name="password" type="password" class="form-control" id="floatingPassword" placeholder="Password" required>
                            <label for="floatingPassword">Password</label>
                        </div>
                        <br> comment 
                        <div class="form-floating">
                            <input name="voterId" type="number" class="form-control" id="floatingInput2" placeholder="VoterId">
                            <label for="floatingInput2">VoterId</label>
                        </div>
                        <br>
                        <div>
                            <label for="otp">Enter OTP</label> 
                            <input name="otp" type="number" class="form-control" id="otp" placeholder="OTP">
                            <br>
                            <div>
                                <button class="w-100 btn btn-lg btn-outline-warning" onclick="sendOTP()">Send OTP</button>
                            </div>
                            <div id="verifyOTP" style="display: none">
                                <label for="otpInput">Enter OTP</label>
                                <input type="number" id="otpInput" class="form-control">
                                <br>
                                <div>
                                    <button class="w-100 btn btn-lg btn-outline-success" onclick="verifyOTP()">Verify OTP</button>
                                </div>
                            </div>
                        </div>

                        <br>
                        <button class="w-100 btn btn-lg btn-face btn-outline-dark" type="submit">Sign in</button>
                        <p></p>
                        <div class="form-floating align-items-center" style="font-size: 20px;text-align: center">
                            <a class="nav-link scrollto link-primary" href="PreSignup">Create New Account</a>
                        </div>

                        <p class="mt-5 mb-3 text-muted" style="color: white"></p>
                    </form>-->
                            <c:set var="user" value="${User}" /> 

                            <form action="Login" method="post">
                                <h1 class="h3 mb-3 fw-normal " style="text-align: center;">Please sign in</h1>
                                <p></p>
                                <div class="form-floating">
                                    <input name="emailAddress" type="emailAddress" class="form-control" id="emailAddress" placeholder="name@example.com" value="${user.emailAddress}" required>
                                    <label for="floatingInput">Email address</label>
                                </div>
                                <br>
                                <div class="form-floating">
                                    <input name="password" type="password" class="form-control" id="password" placeholder="Password" value="${user.password}" required>
                                    <label for="floatingPassword">Password</label>
                                </div>
                                <br>
                                <div class="form-floating">
                                    <input name="voterId" type="number" class="form-control" id="voterId" placeholder="VoterId" value="${user.voterId}">
                                    <label for="floatingInput2">VoterId</label>
                                </div>
                                <br>
                                <div class="form-floating">
                                    <input name="otp" type="number" class="form-control" id="otp" placeholder="OTP" required>
                                    <label for="floatingInput3">One-time password</label>
                                    <button class="btn btn-lg btn-block btn-outline-warning" type="button" onclick="sendOTP()">Send OTP</button>
                                    <p></p>
                                </div>
                                <br>
                                <c:set var='error' value='${Error}'/>
                                <c:if  test="${error!=null}">
                                <div class="alert-danger text-center btn-outline-dark bg-danger" style="color: #ccffff; border-radius: 10px; padding: 20px">                                                                        
                                    ${error}
                                </div>
                                </c:if>
                                <br>
                                <button class="w-100 btn btn-lg btn-face btn-outline-dark text-center " type="submit" onclick="return verifyOTP();">Sign in</button>
                                <p></p>
                                <a href="logout.jsp">
                                    <button type="button" class="w-100 btn btn-lg btn-secondary">Cancel</button>
                                </a>
                                <p></p>
                                <div class="form-floating align-items-center" style="font-size: 20px;text-align: center">
                                    <a class="nav-link scrollto link-primary" href="PreSignup">Create New Account</a>
                                </div>
                            </form>



                            <script>
                                function sendOTP() {
                                    var email = document.getElementById("emailAddress").value;
                                    var password = document.getElementById("password").value;
                                    var voterId = document.getElementById("voterId").value;
                                    if (email === "") {
                                        alert("Please enter an email address.");
                                    } else {
                                        // Send an AJAX request to the server to generate and send the OTP via email
                                        alert(email);
                                        var xmlhttp = new XMLHttpRequest();
                                        xmlhttp.onreadystatechange = function () {
                                            if (this.readyState === 4 && this.status === 200) {
                                                alert("OTP sent to your email address. Please check your inbox.");
                                                location.reload(true);
                                                $("#" + 'getOtp').html(responseText);

                                            }
                                        };
                                        xmlhttp.open("GET", "SendOTP?emailAddress=" + email + "&password=" + password + "&voterId=" + voterId, true);
                                        xmlhttp.send();
                                    }
                                }

                                function verifyOTP() {
                                    alert("Clean and build--Nitish");
                                    var enteredOTP = document.getElementById("otp").value;
//                                    var storedOTP = '${otp}';
//                                    alert('${otp}');
//                                    alert(sessionStorage.getItem("OTP"));
                                    var storedOTP = '${sessionScope.OTP}';
                                    alert(storedOTP);
                                    if (enteredOTP === storedOTP) {
                                        alert("OTP is verified. You may now proceed with login.");
                                        return true;
                                    } else {
                                        alert("Invalid OTP. Please try again.");
                                        return false;
                                    }
                                }

//                                function sendOTP()
//                                {
//                                    var urls = 'SendOTP?emailAddress=' + document.getElementById("emailAddress").value;
//                                    alert(urls + '?emailAddress=' + document.getElementById("emailAddress").value);
//                                    var xmlhttp = new XMLHttpRequest();
//                                    xmlhttp.onreadystatechange = function ()
//                                    {
//                                        //document.getElementById("displayResult").innerHTML = xmlhttp.responseText;
//                                    };
//
//
//                                    xmlhttp.open("POST", urls, true);
//                                    xmlhttp.send();
//                                }
//                                function sendOTP() {
//                                    var email = document.getElementById("emailAddress").value;
//                                    var xhr = new XMLHttpRequest();
//                                    xhr.open("POST",'SendOTP?emailAddress=' + document.getElementById("emailAddress").value; , true);
//                                    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
//                                    xhr.onreadystatechange = function () {
//                                        if (xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200) {
//                                            var response = xhr.responseText;
//                                            if (response === "success") {
//                                                var otp = prompt("Enter OTP sent to your email:");
//                                                verifyOTP(otp);
//                                            } else {
//                                                alert("Failed to send OTP.");
//                                            }
//                                        }
//                                    };
//                                    xhr.send("emailAddress=" + email);
//                                }
                            </script> 
                    </div>



                    </main>
                </div>
            </div>
        </div>
        <div id="getOtp"> 

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