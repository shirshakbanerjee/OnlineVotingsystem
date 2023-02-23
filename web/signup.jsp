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
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <link rel="icon" href="/docs/4.0/assets/img/favicons/favicon.ico">

        <title>Sign up</title>

        <link rel="canonical" href="https://getbootstrap.com/docs/4.0/examples/jumbotron/">

        <!-- Bootstrap core CSS -->
        <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="assets/css/signup.css" rel="stylesheet">
        <link href="assets/vendor/bootstrap/js/bootstrap.min.js" rel="stylesheet">


        <!-- Custom styles for this template -->
        <!--<link href="jumbotron.css" rel="stylesheet">-->
        <!--<link href="" rel="stylesheet">-->
    </head>

    <body style="overflow-x:hidden;">
        <header id="header" class="d-flex align-items-center">
            <jsp:include page="menu.jsp"></jsp:include>
            </header><!-- End Header -->

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

           


                <div class="jumbotron"  ">

                    <div class="container" >  
                        <h1 class="display-3">Welcome! Come Be a Voter!</h1>
                        <p>This is a responsibility.</p>
                    </div>
                </div>

                <div class="container">
                    <!-- Example row of columns -->

                    <div class="row">
                        <div class="col-md-6" style="width: 550px">
                            <h2 class="h2 mb-3 fw-normal" style="text-align: center;">Voter Sign-up</h2>
                            <main class="form-signin w-100 m-auto" >
                                <div class="bordered">
                                    <table>
                                        <tr>
                                        <form action="Signup" method="post"> 
                                            <div class="form-floating">
                                                <input type="text" class="form-control" id="aadhar" placeholder="AadharNumber" name="voterId">
                                                <label for="aadhar">Aadhar Card Number</label>
                                            </div>

                                            <div class="form-floating">
                                                <input type="email" class="form-control" id="floatingInput" placeholder="name@example.com" name="emailAddress">
                                                <label for="floatingInput">Email address</label>
                                            </div>
                                            <div class="form-floating">
                                                <input type="password" class="form-control" id="floatingPassword" placeholder="Password" name="password">
                                                <label for="floatingPassword">Password</label>
                                            </div>
                                            <div class="form-floating">
                                                <input type="text" class="form-control" id="firstName" placeholder="first name" name="firstName" >
                                                <label for="firstName">First Name</label>
                                            </div>
                                            <div class="form-floating">
                                                <input type="text" class="form-control" id="lastName" placeholder="last name" name="lastName" >
                                                <label for="firstName">Last Name</label>
                                            </div>
                                            <div class="form-floating">
                                                <input class="form-control" name="dob" type="date" id="dateofbirth" placeholder="dd/mm/yyyy">
                                                <label for="address">DOB</label>
                                            </div>
                                            <select name="gender" class="form-control" id="gender" required>
                                                <option value="" hidden>Select Gender</option>
                                                <option value="male"> Male  </option>
                                                <option value="female"> Female  </option>
                                            </select>
                                            <div class="form-floating">
                                                <input type="text" class="form-control" id="age" placeholder="Age" name="age">
                                                <label for="age">Age</label>
                                            </div>


                                            <div class="form-floating">
                                                <select name="state" class="form-control " id="stateName">
                                                    <option value="">Select State</option>
                                                <c:forEach var="state" items="${StateList}">
                                                    <option value="${state.getStateName()}">
                                                        ${state.getStateName()}
                                                    </option>
                                                </c:forEach>
                                            </select>
                                            <label for="floatingInput">State Name</label>
                                        </div>

                                        
                                        <button class="w-100 btn btn-lg btn-info mb-2" type="submit">Sign Up</button>
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
                            <img src="assets/img/map.png" style="height: 694px; opacity :0.6;" >
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