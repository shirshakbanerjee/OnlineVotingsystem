<%-- 
    Document   : resultNotDeclared
    Created on : 02-Mar-2023, 2:26:44 pm
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <style>
            @import url('https://fonts.googleapis.com/css2?family=Alfa+Slab+One&display=swap');
            * {
                padding: 0;
                margin: 0;
                box-sizing: border-box;
            }

            body {
                background-color:  #151719;
                display: flex;
                justify-content: center;
                align-items: center;
                min-height: 100vh;
            }
            .waviy {
                position: relative;
                -webkit-box-reflect: below -20px linear-gradient(transparent, rgba(0,0,0,.2));
                font-size: 60px;
            }
            .waviy span {
                font-family: 'Alfa Slab One', cursive;
                position: relative;
                display: inline-block;
                color: yellow;
                text-transform: uppercase;
                animation: waviy 1s infinite;
                animation-delay: calc(.1s * var(--i));

            }
            @keyframes waviy {
                0%,40%,100% {
                    transform: translateY(0)
                }
                20% {
                    transform: translateY(-20px)
                }
            }
        </style>

        <link href="assets/css/resultNotDeclare.css" rel="stylesheet" type="text/css">
        <meta name="viewport" content="width=device-width,initial-scale=1.0">
        <title>Coming Soon</title>

    </head>
    <header>

        <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

        <!doctype html>
        <html lang="en">

            <head>
                <!-- Favicons -->
                <link href="assets/img/favicon1.png" rel="icon">
                <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

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
            </head>

            <!-- Uncomment below if you prefer to use an image logo -->

            <body>
                <header id="header" class="d-flex align-items-center" >




                    <nav id="navbar" class="navbar">
                        <h1 class="logo"><a href="index.html">Vote<span>India</span></a></h1>
                        <c:set value="${Voter}" var="voter"/>
                        <c:set value="${Admin}" var="admin"/>
                        <c:if test="${voter!=null}">

                            <!--                <h1><b>VOTE<span>INDIA </span>
                                                </b></h1>-->

                            <ul>
                                <li><a class="nav-link scrollto active text-white" href="#hero">Home</a></li>
                                <li><a class="nav-link scrollto text-white" href="#electionresult">Election Result</a></li>
                                <li><a class="nav-link scrollto text-white" href="logout.jsp">Logout</a></li>

                            </ul>
                            <i class="bi bi-list mobile-nav-toggle"></i>
                        </c:if>


                        <c:if test="${voter==null && admin==null}">

                            <ul>
                                <li><a class="nav-link scrollto active text-white" href="landingPage.jsp">Home</a></li>
                                <li><a class="nav-link scrollto text-white" href="login.jsp">Login</a></li>
                                <!--<li><a class="nav-link scrollto text-white" href="PreSignup">Sign-up</a></li>-->
                                <li><a class="nav-link scrollto text-white" href="ShowResult">Declare Result</a></li>  
                                <li class="dropdown text-white"><a href="#"><span class="text-white">About us</span> <i class="bi bi-chevron-down"></i></a>
                                    <ul>
                                        <li><a href="#services">Services</a></li>
                                        <li class="dropdown"><a href="#"><span>Team</span> <i class="bi bi-chevron-right"></i></a>
                                            <ul>
                                                <li><a href="#Anjali">Anjali Kumari</a></li>
                                                <li><a href="#Ankit">Ankit Raj</a></li>
                                                <li><a href="#Nitish">Nitish Sah</a></li>
                                                <li><a href="#Priyanka">Priyanka Jaiswal</a></li>
                                                <li><a href="#Shirshak">Shirshak Banerjee</a></li>
                                                <li><a href="#Shouvik">Shouvik Samaddar</a></li>
                                            </ul>
                                        </li>
                                        <li><a href="#">Portfolio</a></li>              
                                    </ul>
                                </li>
                                <li><a class="nav-link scrollto text-white" href="#contact">Contact</a></li>
                            </ul>
                            <i class="bi bi-list mobile-nav-toggle"></i>
                        </c:if>


                        <c:if test="${Admin!=null}">

                            <ul>

                                <li><a class="nav-link scrollto text-white" href="voterList.jsp">SHOW VOTERS</a></li>
                                <li><a class="nav-link scrollto text-white" href="PreInsertCandidate">ADD CANDIDATE</a></li>   
                                <li><a class="nav-link scrollto text-white" href="candidateDetails.jsp">SHOW CANDIDATES</a></li>
                                <li class="dropdown text-white"><a href="#"><span class="text-white">Election Control</span> <i class="bi bi-chevron-down"></i></a>
                                    <ul>
                                        <li><a href="StartElection">Start Election</a></li>
                                        <li><a href="EndElection">End Election and Declare Result</a></li>              
                                    </ul>
                                </li>

                                <!--<li><a class="nav-link scrollto text-white" onclick="newfetchContent('AddCandidate')">ADD CANDIDATE</a></li>--> 

                                <li><a class="nav-link scrollto text-white" href="logout.jsp">Logout</a></li>                
                            </ul>
                            <i class="bi bi-list mobile-nav-toggle"></i>
                        </c:if>    

                    </nav><!-- .navbar -->
                </header><!-- End Header -->
            </body>
        </html>



    </header>
    <body>
        <div class="container">            

            <div class="waviy">
                <span style="--i:1">R</span>
                <span style="--i:2">E</span>
                <span style="--i:3">S</span>
                <span style="--i:4">U</span>
                <span style="--i:5">L</span>  
                <span style="--i:6">T</span>
                <br>
                <span style="--i:7">C</span>
                <span style="--i:8">O</span>
                <span style="--i:9">M</span>
                <span style="--i:10">E</span>
                <span style="--i:10">S</span>
                <br>
                <span style="--i:10">I</span>
                <span style="--i:10">N</span>
                <span style="--i:10".E</span>
                    <span style="--i:10">.</span>

                    <span style="--i:10">.</span>





            </div>

            <div class="launch-time" >
                <div>
                    <p id="days"><b>00</b></p>
                    <span style="color:ghostwhite">
                        <b>Days</b>
                    </span>
                </div>

                <div>
                    <p id="hours"><b>00</b></p>
                    <span style="color:ghostwhite">
                        <b>HOURS</b>
                    </span>

                </div>

                <div>
                    <p id="minutes"><b>00</b></p>
                    <span style="color:ghostwhite">
                        <b>DAYS</b>
                    </span>

                </div>

                <div>
                    <p id="seconds"><b>00</b></p>
                    <span style="color:ghostwhite">
                        <b>SECONDS</b>
                    </span>

                </div>
            </div>       

        </div>
        <img src="assets/img/rocket1.png" class="rocket">
    </div>   

    <script>
        var countDownDate = new Date("MAR 04, 2023 00:00:00").getTime();
        var x = setInterval(function () {
            var now = new Date().getTime();
            var distance = countDownDate - now;
            var days = Math.floor(distance / (1000 * 60 * 60 * 24));
            var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
            var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
            var seconds = Math.floor((distance % (1000 * 60)) / 1000);
            document.getElementById("days").innerHTML = days;
            document.getElementById("hours").innerHTML = hours;
            document.getElementById("minutes").innerHTML = minutes;
            document.getElementById("seconds").innerHTML = seconds;
            if (distance < 0) {
                clearInterval(x);
                document.getElementById("days").innerHTML = "00";
                document.getElementById("hours").innerHTML = "00";
                document.getElementById("minutes").innerHTML = "00";
                document.getElementById("seconds").innerHTML = "00";
            }
        }, 1000);
    </script>
</body>
</html>
