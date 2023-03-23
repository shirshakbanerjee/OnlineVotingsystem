<%-- 
    Document   : signup.jsp
    Created on : Feb 21, 2023, 7:37:32 PM
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Sign Up</title>

        <link href="assets/vendor/aos/aos.css" rel="stylesheet">
        <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
        <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
        <link href="assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
        <link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">    
        <!-- Template Main CSS File -->
        <link href="assets/css/style.css" rel="stylesheet">
        <link href="assets/css/signup.css" rel="stylesheet">
        <link rel="shortcut icon" type="image/x-icon" href="assets/img/vote-icon.png">       
        <link rel="stylesheet" type="text/css" href="assets/vendor/bootstrap/css/bootstrap.min.css">         
        <link rel="stylesheet" type="text/css" href="assets/css/login2.css">
        <link rel="stylesheet" type="text/css" href="assets/css/login1.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" crossorigin="anonymous">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/1000hz-bootstrap-validator/0.11.9/validator.min.js"></script>

    </head>

    <header>
        <jsp:include page="menu.jsp"></jsp:include>
        </header>
        <style>
            .form-floating {
                position: relative;
            }

            .form-floating .fas {
                position: absolute;
                top: 50%;
                right: 10px;
                transform: translateY(-50%);
                cursor: pointer;
                z-index: 2;
            }
            .form-floating i {
                position: absolute;
                top: 50%;
                right: 10px;
                transform: translateY(-50%);
                cursor: pointer;
                z-index: 2;
            </style>

            <script>
                function validateForm(event) {
                    // Get the password and verify_password fields
                    var password = document.getElementById("floatingPassword").value;
                    var verify_password = document.getElementById("floatingPassword2").value;
                    // Compare the two values
                    if (password !== verify_password) {
                        // If they don't match, set the error message below the Confirm Password field
                        event.preventDefault();
                        document.getElementById("password-mismatch").innerHTML = "Passwords don't match. Enter correct password.";
                    } else {
                        // If they match, clear the error message
                        document.getElementById("password-mismatch").innerHTML = "";
                    }
                }

            </script>
            <script>

                function togglePasswordVisibility(inputId, iconId) {
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
            <script>
                document.addEventListener("DOMContentLoaded", function () {
                    const dobInput = document.getElementById("dateofbirth");
                    const ageInput = document.getElementById("age");
                    dobInput.addEventListener("change", function () {
                        const dob = new Date(this.value);
                        const ageInMilliseconds = Date.now() - dob.getTime();
                        const ageInYears = ageInMilliseconds / (1000 * 60 * 60 * 24 * 365.25);
                        ageInput.value = Math.floor(ageInYears);
                    });
                });
            </script>
            <script>
                function setDefaultDate() {
                    var today = new Date();
                    var maxDate = new Date(today.getFullYear() - 18, today.getMonth(), today.getDate() - 1);
                    document.getElementById('dateofbirth').setAttribute('max', maxDate.toISOString().substr(0, 10));
                }
            </script>


            <body style="overflow-x:hidden;">


                <div class="jumbotron"  ">

                    <div class="container" >  
                        <h1 class="display-3">Welcome! Come Be a Voter!</h1>
                        <!--                    <p>This is a responsibility.</p>-->
                    </div>
                </div>

                <div class="container">
                    <!-- Example row of columns -->

                    <div class="row">
                        <div class="col-md-6" style="width: 550px">
                                <h2 class="h2 mb-3 fw-normal" style="text-align: center;">Voter Sign-up</h2>
                            <main class="form-signin w-100 m-auto" >
                                <form action="Signup" method="post" data-toggle="validator" onsubmit="validateForm(event)"> 

                                    <div class="form-floating">
                                        <input type="text" class="form-control" id="aadhar" placeholder="Voter ID" name="voterId" pattern="[0-9]{5}" title="Should have five numbers only" required onkeyup="validateVoterId(this)">
                                        <label for="aadhar">Voter ID<span class="text-danger">*</span></label>
                                        <i class="fas fa-check" id="voterId-check" style="display:none;
                                           color: green"></i>
                                           <span id="voterId-message" style="font-style: italic;
                                           color: red"></span>
                                        </div>

                                        <script>
                                            function validateVoterId(input) {
                                                var voterId = input.value;
                                                var message = document.getElementById("voterId-message");
                                                var check = document.getElementById("voterId-check");
                                                var regex = /^[0-9]{5}$/; // regular expression to check if voter ID has 5 digits and only consists of numbers

                                                if (regex.test(voterId)) {
                                                    message.innerHTML = "";
                                                    check.style.display = "inline-block";
                                                } else {
                                                    message.innerHTML = "Voter ID should consist of 5 digits only.";
                                                    check.style.display = "none";
                                                }
                                            }
                                        </script>



                                        <p></p>

                                        <div class="form-floating">
                                            <input type="email" class="form-control" id="floatingInput" placeholder="name@example.com" name="emailAddress" required onkeyup="validateEmail(this)">
                                            <label for="floatingInput">Email address<span class="text-danger">*</span></label>
                                            <i class="fas fa-check" id="email-check" style="display:none;
                                            color: green"></i>
                                            <span id="email-message" style="font-style: italic;
                                            color: red"></span>
                                        </div>
                                        <script>
                                            function validateEmail(input) {
                                                var email = input.value;
                                                var message = document.getElementById("email-message");
                                                var check = document.getElementById("email-check");
                                                var regex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
                                                if (regex.test(email)) {
                                                    message.innerHTML = "";
                                                    check.style.display = "inline-block";
                                                } else {
                                                    message.innerHTML = "Invalid email address";
                                                    check.style.display = "none";
                                                }
                                            }


                                        </script>
                                        <p></p>

                                        <div class="form-floating">
                                            <input type="password" class="form-control" id="floatingPassword" placeholder="Password" name="password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters" required>
                                            <label for="floatingPassword">Password<span class="text-danger">*</span></label>
                                            <p id="password-message" style="font-style: italic;
                                        display: none;">Password must be at least 8 characters long and contain at least one uppercase letter, one lowercase letter, and one number.</p>
                                        <span><i class="fas fa-eye-slash" id="togglePassword" onclick="togglePasswordVisibility('floatingPassword', 'togglePassword')"></i></span>
                                    </div>

                                    <script>
                                        var passwordField = document.getElementById("floatingPassword");
                                        var passwordMessage = document.getElementById("password-message");

                                        passwordField.addEventListener("input", function () {
                                            if (passwordField.checkValidity() && /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}$/.test(passwordField.value)) {
                                                passwordMessage.innerHTML = "Correct Password format";
                                                passwordMessage.style.color = "green";
                                                passwordMessage.style.display = "block";
                                                passwordMessage.style.fontStyle = "italic";
                                            } else {
                                                passwordMessage.innerHTML = "Password must be at least 8 characters long and contain at least one uppercase letter, one lowercase letter, and one number.";
                                                passwordMessage.style.color = "red";
                                                passwordMessage.style.display = "block";
                                                passwordMessage.style.fontStyle = "italic";
                                            }
                                        });
                                    </script>



                                    <p></p>

                                    <div class="form-floating">
                                        <input type="password" class="form-control" id="floatingPassword2" placeholder="Password" name="password2" data-match="#floatingPassword2" data-match-error="Passwords do not match" required>
                                        <label for="floatingPassword2">Confirm Password<span class="text-danger">*</span></label>
                                        <i class="fas fa-eye-slash" id="password2-toggle" onclick="togglePasswordVisibility('floatingPassword2', 'password2-toggle')"></i>
                                        <p id="password-mismatch" class="text-danger"></p>
                                    </div>



                                    <p></p>

                                    <div class="form-floating">
                                        <input type="text" class="form-control" id="firstName" placeholder="First Name" name="firstName" pattern="[A-Z][a-zA-Z]*" required title="Should start with uppercase">
                                        <label for="firstName">First Name<span class="text-danger">*</span></label>
                                        <div class="invalid-feedback">Please enter a valid first name.</div>
                                    </div>

                                    <p></p>

                                    <div class="form-floating">
                                        <input type="text" class="form-control" id="lastName" placeholder="Last Name" name="lastName" pattern="[A-Z][a-zA-Z]*" required title="Should start with uppercase">
                                        <label for="lastName">Last Name<span class="text-danger">*</span></label>
                                        <div class="invalid-feedback">Please enter a valid last name.</div>
                                    </div>

                                    <p></p>
                                    <div class="form-floating">
                                        <select name="gender" class="form-control" id="gender" required>
                                            <option value="" hidden>Select Gender</option>
                                            <option value="male">Male</option>
                                            <option value="female">Female</option>
                                        </select>
                                        <label for="gender">Gender<span class="text-danger">*</span></label>
                                        <div class="invalid-feedback">Please select a gender.</div>
                                    </div>
                                    <p></p>
                                    <div class="form-floating">
                                        <input class="form-control" name="dob" type="date" id="dateofbirth" placeholder="dd/mm/yyyy" onclick="setDefaultDate()">
                                        <label for="address">DOB<span class="text-danger">*</span></label>
                                        <div class="invalid-feedback">Please select correct date of birth.</div>
                                    </div>                                    

                                    <p></p>
                                    <div class="form-floating">
                                        <input type="number" class="form-control" id="age" placeholder="Age" name="age" min="18" readonly>
                                        <label for="age">Age<span class="text-danger">*</span> </label>
                                        <div class="invalid-feedback">Please select correct date of birth.</div>
                                    </div>
                                    <p></p>
                                    <div class="form-floating">
                                        <select name="state" class="form-control" id="stateName">
                                            <option value="">Select State</option>
                                        <c:forEach var="state" items="${StateList}">
                                            <option value="${state.getStateName()}">
                                                ${state.getStateName()}
                                            </option>
                                        </c:forEach>
                                    </select>
                                    <label for="floatingInput">State Name<span class="text-danger">*</span> </label>
                                </div>
                                <p></p>


                                <button class="w-100 btn btn-lg btn-info mb-2" type="submit">Sign Up</button>
                                <p></p>
                                <a href="logout.jsp">
                                    <button type="button" class="w-100 btn btn-lg btn-secondary">Cancel</button>
                                </a>
                            </form>
                        </main>
                    </div>
                    <div class="col-md-6" style="padding-left: 50px;
                         background-size: cover;
                         object-fit: none;">
                        <img src="assets/img/signUps.jpeg" style="height: 694px;
                             opacity :0.6;" >
                    </div>
                </div>
            </div>

            <footer class="container" style="text-align: center;">
                <p> &copy;Vote india   2017-2018</p>
            </footer>
            <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
            <script>window.jQuery || document.write('<script src="../../assets/js/vendor/jquery-slim.min.js"><\/script>');</script>
            <script src="../../assets/js/vendor/popper.min.js"></script>
            <script src="../../dist/js/bootstrap.min.js"></script>
        </body>
    </html>