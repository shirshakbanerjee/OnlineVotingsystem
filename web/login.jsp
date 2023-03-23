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
        <link rel="stylesheet" type="text/css" href="assets/vendor/bootstrap/css/bootstrap.min.css">        
        <link rel="stylesheet" type="text/css" href="assets/css/login2.css">
        <link rel="stylesheet" type="text/css" href="assets/css/login1.css">
        <!--===============================================================================================-->
        <link rel="shortcut icon" type="image/x-icon" href="assets/img/vote-icon.png">
        <!-- Google Fonts -->
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Roboto:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

        <!-- Vendor CSS Files -->
        <link href="assets/vendor/aos/aos.css" rel="stylesheet">
        <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
        <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
        <link href="assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
        <link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">
        <link href="assets/css/style.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" crossorigin="anonymous">

    </head>

    <style>
        .form-floating.password-input {
            position: relative;
        }

        .form-floating.password-input i {
            position: absolute;
            top: 50%;
            right: 10px;
            transform: translateY(-50%);
            cursor: pointer;
            z-index: 2;
        }
    </style>
    <script src="https://code.jquery.com/jquery-3.6.3.js" integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM=" crossorigin="anonymous">
    </script>

    <script>
        function toggleLoginPasswordVisibility(inputId, iconId) {
            const input = document.getElementById(inputId);
            const icon = document.getElementById(iconId);
            if (input.type === "password") {
                input.type = "text";
                icon.classList.remove("fa-eye-slash");
                icon.classList.add("fa-eye");
            } else {
                input.type = "password";
                icon.classList.remove("fa-eye");
                icon.classList.add("fa-eye-slash");
            }
        }
    </script>
    <body>        
        <div class="limiter">
            <div class="container-login100" style="background-image: url('assets/img/newlanding.png');">
                <div class="col-md-6">
                    <div class="wrap-login100 p-l-110 p-r-110 p-t-62 p-b-33" style="opacity: 0.9;">

                        <main class="form-signin w-100 m-auto ">                                                   
                            <c:set var="user" value="${User}" />
                            <form action="Login" method="post">
                                <h1 class="h3 mb-3 fw-normal" style="text-align: center;">Please sign in</h1>
                                <p></p>
                                <div class="form-floating">
                                    <input name="emailAddress" type="emailAddress" class="form-control" id="emailAddress" placeholder="name@example.com" value="${user.emailAddress}" required>
                                    <label for="floatingInput">Email address<span class="text-danger">*</span></label>
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
                                    <label for="password">Password<span class="text-danger">*</span></label>
                                    <i class="far fa-eye-slash" id="password-toggle" onclick="toggleLoginPasswordVisibility('password', 'password-toggle')"></i>
                                </div>



                                <div class="form-floating otp-input" style="display: none;">
                                    <input name="otp" type="number" class="form-control" id="otp" placeholder="OTP">
                                    <label for="otp">One-time password<span class="text-danger">*</span></label>
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
                                <script>
                                    document.addEventListener('DOMContentLoaded', function () {
                                        const togglePasswordOTP = document.getElementById('togglePasswordOTP');
                                        const passwordInput = document.querySelector('.password-input');
                                        const otpInput = document.querySelector('.otp-input');
                                        const slider = document.querySelector('.slider');
                                        const toggleButtonLabel = document.querySelector('.toggle-button-label');

                                        // Check if OTP is not null
                                        if (${OTP} !== null) {
                                            togglePasswordOTP.checked = true;
                                            passwordInput.style.display = 'none';
                                            otpInput.style.display = 'block';
                                            slider.style.backgroundColor = '#ff9800';
                                            toggleButtonLabel.textContent = 'OTP';
                                        }

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
                                    });
                                </script>
                                <br>
                                <div class="form-floating">
                                    <input name="voterId" type="number" class="form-control" id="voterId" placeholder="VoterId" value="${user.voterId}">
                                    <label for="floatingInput2">Voter Id [Only for voters]</label>
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
//                                                alert("OTP sent to your email address. Please check your inbox.");
//                                                clearInterval(timer);
//                                                setTimeout(function () {
//                                                    location.reload(true);
//                                                }, 1000); // Wait for 1 second before reloading the page
//                                                $("#" + 'getOtp').html(responseText);
                                                window.location.replace("http://localhost:8080/OnlineVotingSystem/login.jsp");
                                            }
                                        };
                                        xmlhttp.open("GET", "SendOTP?emailAddress=" + email + "&password=" + password + "&voterId=" + voterId, true);
                                        xmlhttp.send();
                                    }
                                }




                                function verifyOTP() {
                                    var enteredOTP = document.getElementById("otp").value;
                                    var storedOTP = '${sessionScope.OTP}';
                                    if (enteredOTP === storedOTP) {
                                        return true;
                                    } else {
                                        alert("Invalid OTP. Please try again.");
                                        return false;
                                    }
                                }


                            </script> 
                    </div>
                    </main>
                </div>
            </div>
        </div>
        <div id="getOtp"> 
        </div>
        <div id="dropDownSelect1"></div>
    </body>
</html>