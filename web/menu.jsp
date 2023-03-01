<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html lang="en">

    <head>
        <!-- Favicons -->
        <link href="assets/img/favicon.png" rel="icon">
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
                        <li><a class="nav-link scrollto text-white" href="candidateInput.jsp">ADD CANDIDATE</a></li>   
                        <li><a class="nav-link scrollto text-white" href="candidateDetails.jsp">SHOW CANDIDATES</a></li>   
                        <li><a class="nav-link scrollto text-white" href="ShowResult">DECLARE RESULT</a></li>                    
                        <!--<li><a class="nav-link scrollto text-white" onclick="newfetchContent('ShowResult')">Declare Result</a></li>--> 

                        <li><a class="nav-link scrollto text-white" href="logout.jsp">Logout</a></li>                
                    </ul>
                    <i class="bi bi-list mobile-nav-toggle"></i>
                </c:if>    

            </nav><!-- .navbar -->
        </header><!-- End Header -->
    </body>
</html>
