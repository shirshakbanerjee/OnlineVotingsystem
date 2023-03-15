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

        <style>

        </style>
        <meta charset="utf-8">
        <meta content="width=device-width, initial-scale=1.0" name="viewport">

        <title>ONLINE VOTING SYSTEM </title>
        <meta content="" name="description">
        <meta content="" name="keywords">       
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
        <link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

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
    <style>
        .icon-box:hover .title {
            color: #fff;
        }
    </style>


    <body>

        <c:set var='voter' value='${Voter}'/>
        <c:if test = "${voter == null}">  
            <c:redirect url = "login.jsp"/>
        </c:if>

        <!-- ======= Header ======= -->

        <header id="header" class="d-flex align-items-center" style="color:blue">       

            <jsp:include page="menu.jsp"/>

        </header><!-- End Header -->

        <div class="bg-container">


            <section id="featured-services" class="featured-services">

                <c:set var="error" value="${VoteMsg}"/>
                <c:if test="${error!=null}">
                    <div class="error-message" style="color: blue">
                        <h3>${error}</h3>
                    </div>
                </c:if>
                <c:if test="${error==null && voter.getVotingStatus()==1}">
                    <div class="alert-danger text-center btn-outline-dark bg-danger" style="color: #ccffff; border-radius: 10px; margin: 0 40%; font-size: 24px; animation: move 12s linear infinite;">
                        You have already Voted!!
                    </div>

                    <style>
                        @keyframes move {
                            0% {
                                transform: translateX(-100%);
                            }
                            50% {
                                transform: translateX(100%);
                            }
                            100% {
                                transform: translateX(-100%);
                            }
                        }
                    </style>
                </c:if>
                <div class="container" data-aos="fade-up" style="margin-top: 50px;">
                    <div class="row">
                        <c:forEach var="candidate" items="${CandidateList}">
                            <!--<div class="row">-->  
                            <div class="col">
                                <div class="col-md-6 col-lg-12 d-flex align-items-stretch mb-5 mb-lg-0">
                                    <div class="icon-box" data-aos="fade-up" data-aos-delay="400">
                                        <img src="data:image/png;base64,${candidate.imageData}" style="max-width: 150px; max-height: 150px;">
                                        <h4 class="title">${candidate.getFirstName()} ${candidate.getLastName()}</h4>
                                        <h4 class="title">Party: ${candidate.getPartyName()}</h4>
                                        <button type="button" class="btn btn-danger"<c:if test="${voter.getVotingStatus()==1}">disabled</c:if>>

                                                <a href="VoteAction?voterId=${voter.getVoterId()}&candidateId=${candidate.getCandidateId()}&state=${voter.getState()}">VOTE</a>
                                        </button>
                                    </div>
                                    <br>
                                </div>
                                <!--</div>-->
                            </div>
                        </c:forEach>

                        <div style="margin-top: 50px; font-size: 17px">
                            <h4>Instructions for Voter</h4>
                            <ul>
                                <li><p>You can vote only once. So choose your vote wisely.</p></li>
                                <li><p>After your vote has been casted, the voting button will be disabled.</p></li>
                                <li><p>We appreciate that you understand the power of one vote can make the difference.</p></li>
                                <li><p>After voting you need to wait for the results. Don't worry you will be notified by email when the
                                        results are declared.</p></li>
                            </ul>

                        </div>

                        </section><!-- End Featured Services Section -->

                    </div>
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