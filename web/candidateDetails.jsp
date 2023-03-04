<%-- 
    Document   : voterLanding
    Created on : 23-Feb-2023, 11:01:17 am
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>

     
        <meta charset="utf-8">
        <meta content="width=device-width, initial-scale=1.0" name="viewport">

        <title>ONLINE VOTING SYSTEM </title>
        <meta content="" name="description">
        <meta content="" name="keywords">

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
        <link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <!-- Template Main CSS File -->
        <link href="assets/css/style.css" rel="stylesheet">
        <link href="assets/css/voterLanding.css" rel="stylesheet">

        <!-- =======================================================
        * Template Name: BizLand - v3.10.0
        * Template URL: https://bootstrapmade.com/bizland-bootstrap-business-template/
        * Author: BootstrapMade.com
        * License: https://bootstrapmade.com/license/
        ======================================================== -->
    </head>


    <body>



        <!-- ======= Header ======= -->

        <header id="header" class="d-flex align-items-center" style="color:blue">       

            <jsp:include page="menu.jsp"/>

        </header><!-- End Header -->

        <div class="bg-container">


            <section id="featured-services" class="featured-services">


                <div class="container" data-aos="fade-up" style="margin-top: 50px;">



                    <div class="row">
                        <c:forEach var="candidate" items="${CandidateList}">
                            <!--<div class="row">-->  
                            <div class="col">
                                <div class="col-md-6 col-lg-12 d-flex align-items-stretch mb-5 mb-lg-0">
                                    <div class="icon-box" data-aos="fade-up" data-aos-delay="400">
                                        <h4 class="title">Candidate ID: ${candidate.getCandidateId()}</h4>
                                        
                                        <img src="data:image/png;base64,${candidate.imageData}" style="max-width: 150px; max-height: 150px;">
                                        
                                        <h4 class="title">${candidate.getFirstName()} ${candidate.getLastName()}</h4>
                                        
                                        <h5 class="title">Party: ${candidate.getPartyName()}</h5>
                                        
                                        <h5 class="title">Gender: ${candidate.getGender()}</h5>
                                        
                                        <h5 class="title">State: ${candidate.getRegion()}</h5>                                                                                                                    
                                        
                                        <button class="btn btn-info" onclick="editCandidate(${candidate.getCandidateId()})"><i class="fa fa-pencil"></i></button>
                                        <button class="btn btn-danger" onclick="deleteCandidate(${candidate.getCandidateId()})"><i class="fa fa-trash"></i></button>
                                        <!--<button type="button" class="btn btn-info" > <i class="fa fa-pencil"></i></button>-->
                                        <!--<button type="button" class="btn btn-danger" ><i class="fa fa-trash"></i></button>-->

                                    </div>
                                    <br>
                                </div>
                                <!--</div>-->
                            </div>
                        </c:forEach>
                    </div>
                    <!--                        <div class="col">
                                                <div class="col-md-6 col-lg-3 d-flex align-items-stretch mb-5 mb-lg-0">
                    
                                                    <div class="icon-box" data-aos="fade-up" data-aos-delay="400">
                    
                                                        <img src="assets/img/nm-1177027-1672590352.jpg"> comment 
                                                        <h4 class="title"><a href="">CANDIDATE-1</a></h4>
                    
                                                        <button type="button" class="btn btn-danger">VOTE</button>
                                                    </div>
                                                    <br>
                    
                                                </div>
                                            </div>
                    
                    
                                            <div class="col">
                                                <div class="col-md-6 col-lg-3 d-flex align-items-stretch mb-5 mb-lg-0">
                                                    <div class="icon-box" data-aos="fade-up" data-aos-delay="400">
                                                        <img src="assets/img/nm-1177027-1672590352.jpg"> comment 
                                                        <h4 class="title"><a href="">CANDIDATE-2</a></h4>
                                                        <button type="button" class="btn btn-danger">VOTE</button>
                    
                    
                                                </div>
                                            </div>
                                            </div>
                                        </div>
                    
                    
                    
                                            <div class="col"> 
                                                <div class="col-md-6 col-lg-3 d-flex align-items-stretch mb-5 mb-lg-0">
                                                    <div class="icon-box" data-aos="fade-up" data-aos-delay="400">                                    
                                                        <img src="assets/img/nm-1177027-1672590352.jpg"> comment 
                                                        <h4 class="title"><a href="">CANDIDATE-3</a></h4>
                                                        <button type="button" class="btn btn-danger">VOTE</button>
                    
                                                    </div>
                                                </div>
                                            </div>
                    
                                            <div class="col"> 
                                                <div class="col-md-6 col-lg-3 d-flex align-items-stretch mb-5 mb-lg-0">
                                                    <div class="icon-box" data-aos="fade-up" data-aos-delay="400">
                                                        <img src="assets/img/nm-1177027-1672590352.jpg"> comment 
                                                        <h4 class="title"><a href="">CANDIDATE-4</a></h4>
                                                        <button type="button" class="btn btn-danger">VOTE</button>
                                                    </div>
                                                </div>  
                                            </div>     -->



            </section><!-- End Featured Services Section -->

        </div>
        <script>
        function editCandidate(candidateId) {
            alert(candidateId);
        window.location.href = `EditCandidate?candidateId=`+candidateId;
        }
        function deleteCandidate(candidateId) {
            alert(candidateId);
        window.location.href = `DeleteCandidate?candidateId=`+candidateId;
        }
    </script>
   





</body>
<script src="assets/vendor/purecounter/purecounter_vanilla.js"></script>
<script src="assets/vendor/aos/aos.js"></script>
<script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="assets/vendor/glightbox/js/glightbox.min.js"></script>
<script src="assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
<script src="assets/vendor/swiper/swiper-bundle.min.js"></script>
<script src="assets/vendor/waypoints/noframework.waypoints.js"></script>
<script src="assets/vendor/php-email-form/validate.js"></script>


<script src="assets/js/main.js"></script>

</html>