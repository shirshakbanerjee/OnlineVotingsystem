<%-- 
    Document   : candidateEdit
    Created on : 02-Mar-2023, 9:29:05 pm
    Author     : SHIRSHAK
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

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

            <div class="container">              

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
                                    <a href="logout.jsp">
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
            <footer class="container" style="text-align: center;">
                <p> &copy;Vote india   2017-2018</p>
            </footer>

            <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
            <script>window.jQuery || document.write('<script src="../../assets/js/vendor/jquery-slim.min.js"><\/script>')</script>
            <script src="../../assets/js/vendor/popper.min.js"></script>
            <script src="../../dist/js/bootstrap.min.js"></script>
    </body>
</html>