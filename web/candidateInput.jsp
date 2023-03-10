<%-- 
    Document   : signup.jsp
    Created on : Feb 21, 2023, 7:37:32 PM
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="/struts-tags" prefix="s"%>

<!doctype html>

<c:set var='admin' value='${Admin}'/>
<c:if test = "${admin == null && voter == null}">  
    <c:redirect url = "login.jsp"/>
</c:if>

<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Add Candidate</title>

        <link href="assets/vendor/aos/aos.css" rel="stylesheet">
        <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
        <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
        <link href="assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
        <link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">    
        <!-- Template Main CSS File -->
        <link href="assets/css/style.css" rel="stylesheet">
        <link href="assets/css/signup.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="shortcut icon" type="image/x-icon" href="assets/img/vote-icon.png">
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
    <script>
        function fetchCandidateApi() {
            alert(document.getElementById("candidateEmail").value);
            $.ajax({
                url: "FetchCandidateApi?candidateEmail=" + document.getElementById("candidateEmail").value,
                success: function (responseText) {
//                    alert(responseText);
                    $("#" + "candidateIdentityDetails").html(responseText);
//                    $('#' + "candidateIdentityDetails").replaceWith(responseText);
                }
            });
        }
    </script>

    <script>
        function previewImage(event) {
            var input = event.target;
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    var imagePreview = document.getElementById("image-preview");
                    imagePreview.src = e.target.result;
                };
                reader.readAsDataURL(input.files[0]);
            }
        }
    </script>

    <header>
        <jsp:include page="menu.jsp"></jsp:include>
        </header>
        <body style="overflow-x:hidden;">
            <div class="jumbotron"  >

                <div class="container" >  
                    <h2 class="h2 mb-3 fw-normal" style="text-align: center;">Add new candidates</h2>
                </div>
            </div>

            <div class="container">
                <!-- Example row of columns -->

                <div class="row">
                    <div class="col-md-6" style="width: 550px">

                        <main class="form-signin w-100 m-auto" >
                            <div class="bordered">
                                <div id="candidateIdentityDetails">
                                    <form  enctype="multipart/form-data" action="AddCandidate" method="post" id="formSubmit">
                                        <div class="form-floating position-relative">
                                            <input type="text" class="form-control" id="candidateEmail" placeholder="Email Address" name="candidateEmail">
                                            <label for="floatingInput">Email Address</label>                                            
                                            <button type="button" id="verifyButton" class="btn btn-primary position-absolute end-0 top-50 translate-middle-y btn-danger" onclick="fetchCandidateApi(); document.getElementById('submitButton').disabled = false;"> Verify</button>
                                        </div>

                                        <!--<div id="candidateIdentityDetails">-->
                                        <p></p>
                                        <div class="form-floating">
                                            <input type="text" class="form-control" id="floatingInput" placeholder="First Name" name="firstName">
                                            <label for="floatingInput">First Name</label>
                                        </div>
                                        <p></p>
                                        <div class="form-floating">
                                            <input type="text" class="form-control" id="floatingPassword" placeholder="Last Name" name="lastName">
                                            <label for="floatingPassword">Last Name</label>
                                        </div>
                                        <p></p>
                                        <div class="form-floating">
                                            <select name="partyName" class="form-control" id="partyName" required>
                                                <option value="" hidden> Select your Party</option>
                                            <c:forEach var="party" items="${PartyList}">
                                                <option value="${party.getPartyName()}"> ${party.getPartyName()}  </option>
                                            </c:forEach>
                                        </select><label for="floatingInput">Party Name</label>
                                    </div>
                                    <p></p>
                                    <div class="form-floating">
                                        <input type="text" class="form-control" id="age" placeholder="Age" name="age">
                                        <label for="age">Age</label>
                                    </div>
                                    <p></p>
                                    <div class="form-floating">
                                        <select name="gender" class="form-control" id="gender" required>
                                            <option value="" hidden>Select Gender</option>
                                            <option value="male"> Male  </option>
                                            <option value="female"> Female  </option>
                                        </select><label for="floatingInput">Gender</label>
                                    </div>
                                    <p></p>
                                    <div class="form-floating">
                                        <select name="region" class="form-control " id="stateName">
                                            <option value="">Select State</option>
                                            <c:forEach var="state" items="${StateList}">
                                                <option value="${state.getStateName()}">
                                                    ${state.getStateName()}
                                                </option>
                                            </c:forEach>
                                        </select><label for="floatingInput">State Name</label>
                                    </div>
                                    <!--</div>-->

                                    <p></p>
                                    <div class="form-floating text-center">    
                                        <br>
                                        <input type="file" class="form-control" placeholder="Image" id="image-file" name="image" onchange="previewImage(event)" required>
                                        <label for="floatingInput">Upload photo</label>
                                        <p> </p>
                                        <br>
                                        <img id="image-preview" style="max-width: 200px; max-height: 200px;">
                                    </div>
                                    <p></p>
                                    <p></p>
                                    <button class="w-100 btn btn-lg btn-info mb-2" id="submitButton" type="submit" disabled>Submit</button>


                                    <!--                                    <a href="Logout">
                                                                            <button type="button" class="w-100 btn btn-lg btn-secondary">Cancel</button>
                                                                        </a>-->
                                </form>
                            </div>
                        </div>
                    </main>
                </div>
                <div class="col-md-6" style="width: 55%; float: right;  background-size: cover; object-fit: none; ">                    
                    <img src="https://cdn-eaekd.nitrocdn.com/CxTeoSPKdjdqTSxLEEGaKiGroHlKASqH/assets/mobile/optimized/rev-27fb8ed/6QqafditRy1VJCNIi5OmNgG8MUn6ZnYlaMjbjy1obKuuwxKeb8EVmZ_NiPk3HjjQa8QVbUpdQWaemGSNCMUDHm9IXrUO7FE8lEyZmGnnIltGisKG6ccLV_2xeXo67S2dNm23UlHsIPRGk7zo4FNhEVYraeu68ov1dkL-7i2O3Ju0Wq9gZkfNGrlLGg" 
                         style="height: 727px; opacity :1;" >
                </div>

                </div>
                </div>
    </body>


    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <!--            <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
            <script>window.jQuery || document.write('<script src="../../assets/js/vendor/jquery-slim.min.js"><\/script>')</script>-->
    <script src="../../assets/js/vendor/popper.min.js"></script>
    <script src="../../dist/js/bootstrap.min.js"></script>

    <footer style="text-align: center;">
        <p> &copy;Vote india   2017-2018</p>
    </footer>
</html>