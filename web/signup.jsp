<%-- 
    Document   : signup.jsp
    Created on : Feb 21, 2023, 7:37:32 PM
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!--<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
    </body>
</html>
-->

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
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" crossorigin="anonymous">


        <!--===============================================================================================-->
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
                        // If they don't match, prevent the form from submitting
                        event.preventDefault();
                        alert("Passwords don't match. Please try again.");
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
                                <form action="Signup" method="post" onsubmit="validateForm(event)"> 
                                    <div class="form-floating">
                                        <input type="text" class="form-control" id="aadhar" placeholder="Voter ID" name="voterId" pattern="[0-9]{5}" title="Should have five numbers only" required>
                                        <label for="aadhar">Voter ID</label>
                                    </div>
                                    <p></p>

                                    <div class="form-floating">
                                        <input type="email" class="form-control" id="floatingInput" placeholder="name@example.com" name="emailAddress" required>
                                        <label for="floatingInput">Email address</label>
                                    </div>
                                    <p></p>
                                    <div class="form-floating">
                                        <input type="password" class="form-control" id="floatingPassword" placeholder="Password" name="password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters" required>
                                        <label for="floatingPassword">Password</label>
                                        <span><i class="fas fa-eye-slash" id="togglePassword" onclick="togglePasswordVisibility('floatingPassword', 'togglePassword')"></i></span>
                                    </div>

                                    <p></p>
                                    <div class="form-floating">
                                        <input type="password" class="form-control" id="floatingPassword2" placeholder="Password" name="password2">
                                        <label for="floatingPassword2">Confirm Password</label>
                                        <i class="far fa-eye-slash" id="password2-toggle" onclick="togglePasswordVisibility('floatingPassword2', 'password2-toggle')"></i>
                                    </div>
                                    <p></p>


                                    <p></p>


                                    <div class="form-floating">
                                        <input type="text" class="form-control" id="firstName" placeholder="First Name" name="firstName" pattern="[A-Z][a-zA-Z]*" required title ="should start with uppercase">
                                        <label for="firstName">First Name</label>
                                    </div>

                                    <p></p>
                                    <div class="form-floating">
                                        <input type="text" class="form-control" id="lastName" placeholder="last name" name="lastName" pattern="[A-Z][a-zA-Z]*" required   title ="should start with uppercase">
                                        <label for="firstName">Last Name</label>
                                    </div>
                                    <p></p>
                                    <div class="form-floating">
                                        <select name="gender" class="form-control" id="gender" required>
                                            <option value="" hidden>Select Gender</option>
                                            <option value="male"> Male  </option>
                                            <option value="female"> Female  </option>
                                        </select>
                                    </div>
                                    <p></p>
                                    <div class="form-floating">
                                        <input class="form-control" name="dob" type="date" id="dateofbirth" placeholder="dd/mm/yyyy">
                                        <label for="address">DOB</label>
                                    </div>
                                    <p></p>
                                    <div class="form-floating">
                                        <input type="number" class="form-control" id="age" placeholder="Age" name="age" min="18" >
                                        <label for="age">Age </label>
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
                                    <label for="floatingInput">State Name</label>
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


            <!-- <p>Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui. </p>
             <p><a class="btn btn-secondary" href="#" role="button">View details &raquo;</a></p>
           
           <div class="col-md-4">
             <h2>Heading</h2>
             <p>Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui. </p>
             <p><a class="btn btn-secondary" href="#" role="button">View details &raquo;</a></p>
           </div>
           <div class="col-md-4">
             <h2>Heading</h2>
             <p>Donec sed odio dui. Cras justo odio, dapibus ac facilisis in, egestas eget quam. Vestibulum id ligula porta felis euismod semper. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus.</p>
             <p><a class="btn btn-secondary" href="#" role="button">View details &raquo;</a></p>
           </div>
         
    
         <hr>
    
       </div>  /container -->



            <footer class="container" style="text-align: center;">
                <p> &copy;Vote india   2017-2018</p>
            </footer>

            <!-- Bootstrap core JavaScript
            ================================================== -->
            <!-- Placed at the end of the document so the pages load faster -->
            <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
            <script>window.jQuery || document.write('<script src="../../assets/js/vendor/jquery-slim.min.js"><\/script>');</script>
            <script src="../../assets/js/vendor/popper.min.js"></script>
            <script src="../../dist/js/bootstrap.min.js"></script>
        </body>
    </html>