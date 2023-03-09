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
        <link rel="shortcut icon" type="image/x-icon" href="assets/img/vote-icon.png">
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
        <jsp:include page="menu.jsp"></jsp:include>
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
                                <h1 class="h3 mb-3 fw-normal" style="text-align: center;">Please sign in</h1>
                                <p></p>
                                <div class="form-floating">
                                    <input name="emailAddress" type="emailAddress" class="form-control" id="emailAddress" placeholder="name@example.com" value="${user.emailAddress}" required>
                                    <label for="floatingInput">Email address</label>
                                </div>
                                <br>
                                <div class="form-floating">
                                    <input name="voterId" type="number" class="form-control" id="voterId" placeholder="VoterId" value="${user.voterId}">
                                    <label for="floatingInput2">Voter Id [Only for voters, otherwise leave blank]</label>
                                </div>
                                <br>

                                <div class="form-check form-switch">
                                    <input class="form-check-input" type="checkbox" id="togglePasswordOTP" name="togglePasswordOTP" style="visibility: hidden;">
                                    <label class="form-check-label" for="togglePasswordOTP">
                                        <div class="toggle-button">
                                            <div class="slider"></div>
                                            <div class="toggle-button-label">Password</div>
                                        </div>
                                    </label>
                                </div>

                                <div class="form-floating password-input">
                                    <input name="password" type="password" class="form-control" id="password" placeholder="Password">
                                    <label for="password">Password</label>
                                </div>

                                <div class="form-floating otp-input" style="display: none;">
                                    <input name="otp" type="number" class="form-control" id="otp" placeholder="OTP">
                                    <label for="otp">One-time password</label>
                                    <button class="btn btn-lg btn-block btn-outline-warning position-absolute end-0 top-50 translate-middle-y " type="button" onclick="sendOTP()">Send OTP</button>
                                    <p id="timer"></p>
                                    <p></p>
                                </div>

                                <style>
                                    .toggle-button {
                                        position: relative;
                                        width: 120px;
                                        height: 32px;
                                        border-radius: 20px;
                                        background-color: #ccc;
                                        cursor: pointer;
                                        user-select: none;
                                    }

                                    .toggle-button-label {
                                        position: absolute;
                                        top: 0;
                                        left: 0;
                                        right: 0;
                                        bottom: 0;
                                        margin: auto;
                                        text-align: center;
                                        font-size: 14px;
                                        font-weight: bold;
                                        color: #333;
                                    }

                                    .slider {
                                        position: absolute;
                                        top: 4px;
                                        left: 4px;
                                        width: 60px;
                                        height: 24px;
                                        border-radius: 12px;
                                        background-color: #fff;
                                        box-shadow: 0px 1px 3px rgba(0, 0, 0, 0.2);
                                        transition: all 0.2s ease-in-out;
                                    }

                                    #togglePasswordOTP:checked + .form-check-label .slider {
                                        transform: translateX(56px);
                                    }

                                    .password-input {
                                        margin-top: 20px;
                                    }

                                    .otp-input {
                                        margin-top: 20px;
                                    }
                                </style>

                                <script>
                                    const togglePasswordOTP = document.getElementById('togglePasswordOTP');
                                    const passwordInput = document.querySelector('.password-input');
                                    const otpInput = document.querySelector('.otp-input');
                                    const slider = document.querySelector('.slider');
                                    const toggleButtonLabel = document.querySelector('.toggle-button-label');

                                    togglePasswordOTP.addEventListener('change', function () {
                                        if (togglePasswordOTP.checked) {
                                            passwordInput.style.display = 'none';
                                            otpInput.style.display = 'block';
                                            slider.style.backgroundColor = '#ff9800';
                                            toggleButtonLabel.textContent = 'OTP';
                                        } else {
                                            passwordInput.style.display = 'block';
                                            otpInput.style.display = 'none';
                                            slider.style.backgroundColor = '#fff';
                                            toggleButtonLabel.textContent = 'Password';
                                        }
                                    });
                                </script>
                                <br>
                                <c:set var='error' value='${Error}'/>
                                <c:if  test="${error!=null}">
                                    <div class="alert-danger text-center btn-outline-dark bg-danger" style="color: #ccffff; border-radius: 10px; padding: 20px">
                                        ${error}
                                    </div>
                                </c:if>
                                <br>
                                <button class="w-100 btn btn-lg btn-face btn-outline-dark text-center " type="submit" onclick="return verifyForm();">Sign in</button>
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
                                    var count = 70;
                                    var timer = setInterval(function () {
                                        document.getElementById("timer").innerHTML = "You have " + count + " seconds left to enter OTP.";
                                        count--;
                                        if (count < 0) {
                                            clearInterval(timer);
                                            document.getElementById("timer").innerHTML = "Time's up! Please request a new OTP.";
                                        }
                                    }, 1000);

                                    var email = document.getElementById("emailAddress").value;
                                    var password = document.getElementById("password").value;
                                    var voterId = document.getElementById("voterId").value;
                                    if (email === "") {
                                        alert("Please enter an email address.");
                                    } else {

                                        // Send an AJAX request to the server to generate and send the OTP via email
                                        var xmlhttp = new XMLHttpRequest();
                                        xmlhttp.onreadystatechange = function () {
                                            if (this.readyState === 4 && this.status === 200) {
                                                alert("OTP sent to your email address. Please check your inbox.");
                                                clearInterval(timer);
                                                setTimeout(function () {
                                                    location.reload(true);
                                                }, 1000); // Wait for 1 second before reloading the page
                                                $("#" + 'getOtp').html(responseText);
                                            }
                                        };
                                        xmlhttp.open("GET", "SendOTP?emailAddress=" + email + "&password=" + password + "&voterId=" + voterId, true);
                                        xmlhttp.send();
                                    }
                                }




                                function verifyOTP() {
                                    //alert("Clean and build--Nitish");
                                    var enteredOTP = document.getElementById("otp").value;

//                                    var storedOTP = '${otp}';
//                                    alert('${otp}');
//                                    alert(sessionStorage.getItem("OTP"));
                                    var storedOTP = '${sessionScope.OTP}';
                                    alert(storedOTP);
                                    if (enteredOTP === storedOTP) {
                                        //alert("OTP is verified. You may now proceed with login.");
                                        return true;
                                    } else {
                                        // alert("Invalid OTP. Please try again.");
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