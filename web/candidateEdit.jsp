<%-- 
    Document   : candidateEdit
    Created on : 02-Mar-2023, 9:29:05 pm
    Author     : SHIRSHAK
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
        <!--===============================================================================================-->
    </head>
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




            <!--
               <nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
                 <a class="navbar-brand" href="#">Navbar</a>
                 <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExampleDefault" aria-controls="navbarsExampleDefault" aria-expanded="false" aria-label="Toggle navigation">
                   <span class="navbar-toggler-icon"></span>
                 </button>
           
                 <div class="collapse navbar-collapse" id="navbarsExampleDefault">
                   <ul class="navbar-nav mr-auto">
                     <li class="nav-item active">
                       <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
                     </li>
                     <li class="nav-item">
                       <a class="nav-link" href="#">Link</a>
                     </li>
                     <li class="nav-item">
                       <a class="nav-link disabled" href="#">Disabled</a>
                     </li>
                     <li class="nav-item dropdown">
                       <a class="nav-link dropdown-toggle" href="http://example.com" id="dropdown01" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Dropdown</a>
                       <div class="dropdown-menu" aria-labelledby="dropdown01">
                         <a class="dropdown-item" href="#">Action</a>
                         <a class="dropdown-item" href="#">Another action</a>
                         <a class="dropdown-item" href="#">Something else here</a>
                       </div>
                     </li>
                   </ul>
                   <form class="form-inline my-2 my-lg-0">
                     <input class="form-control mr-sm-2" type="text" placeholder="Search" aria-label="Search">
                     <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
                   </form>
                 </div>
               </nav>
                 Main jumbotron for a primary marketing message or call to action -->




            <!--            <div class="jumbotron"  ">
            
                            <div class="container" >  
                                <h1 class="display-3">Welcome! Come Be a Voter!</h1>
                                <p>This is a responsibility.</p>
                            </div>
                        </div>-->

            <div class="container">
                <!-- Example row of columns -->

                <div class="row">
                    <div class="col-md-6" style="width: 550px">
                    <c:set var="candidate" value="${Candidate}"/>
                    <h2 class="h2 mb-3 fw-normal" style="text-align: center;">Edit Candidate Details</h2>
                    <main class="form-signin w-100 m-auto" >
                        <div class="bordered">
                            <table>
                                <tr>
                                <form enctype="multipart/form-data" action="SaveCandidate" method="post"> 
                                    <div class="form-floating text-center"> 
                                        <img src="data:image/png;base64,${candidate.imageData}" style="max-width: 150px; max-height: 150px;">
                                        <input type="file" id="image-file" name="image" onchange="previewImage(event)" >
                                        <br>
                                        <img id="image-preview" style="max-width: 200px; max-height: 200px;">
                                    </div>

                                    <div class="form-floating">
                                        <input type="text" class="form-control" id="candidateEmail" placeholder="candidateEmail" name="candidateEmail" value="${candidate.getCandidateEmail()}" readonly>
                                        <label for="candidateEmail">Email</label>
                                    </div>

                                    <div class="form-floating">
                                        <input type="text" class="form-control" id="candidateId" placeholder="candidateId" name="candidateId" value="${candidate.getCandidateId()}" readonly>
                                        <label for="aadhar">Candidate Id</label>
                                    </div>


                                    <div class="form-floating">
                                        <input type="text" class="form-control" id="floatingInput" placeholder="firstName" name="firstName" value="${candidate.getFirstName()}" >
                                        <label for="floatingInput">First Name</label>
                                    </div>
                                    <div class="form-floating">
                                        <input type="text" class="form-control" id="floatingInput" placeholder="lastName" name="lastName" value="${candidate.getLastName()}" >
                                        <label for="floatingInput">Last Name</label>
                                    </div>

                                    <div class="form-floating">
                                        <input type="text" class="form-control" id="age" placeholder="age" name="age" value="${candidate.getAge()}" >
                                        <label for="firstName">Age</label>
                                    </div>
                                    <div class="form-floating">
                                        <input type="text" class="form-control" id="gender" placeholder="gender" name="gender" value="${candidate.getGender()}" >
                                        <label for="firstName">Gender</label>
                                    </div>

                                    <div class="form-floating">
                                        <input type="text" class="form-control" id="partyName" placeholder="partyName" name="partyName" value="${candidate.getPartyName()}" >  
                                        <label for="floatingInput">Party Name</label>
                                    </div>


                                    <div class="form-floating">
                                        <input type="text" class="form-control" id="region" placeholder="region" name="region" value="${candidate.getRegion()}" >  
                                        <label for="floatingInput">State Name</label>
                                    </div>





                                    <button class="w-100 btn btn-lg btn-info mb-2" type="submit">Save</button>
                                    <a href="Logout">
                                        <button type="button" class="w-100 btn btn-lg btn-secondary">Cancel</button>
                                    </a>
                                </form>
                                </tr>
                            </table>
                        </div>
                    </main>
                </div>
                <div class="col-md-6" style="padding-left: 50px; background-size: cover; object-fit: none;">
                    <img src="assets/img/map2.jpeg" style="height: 694px; opacity :1;" >
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
            <script>window.jQuery || document.write('<script src="../../assets/js/vendor/jquery-slim.min.js"><\/script>')</script>
            <script src="../../assets/js/vendor/popper.min.js"></script>
            <script src="../../dist/js/bootstrap.min.js"></script>
    </body>
</html>