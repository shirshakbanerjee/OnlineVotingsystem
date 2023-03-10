<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html class="no-js" lang="en" dir="ltr">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=Edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Voter List</title>
        <link rel="icon" href="favicon.ico" type="image/x-icon"> <!-- Favicon-->
        <!-- project css file  -->
        <link rel="stylesheet" href="assets/css/men.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" 
              integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" 
        integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>

        <jsp:include page="menu.jsp"></jsp:include>
        </head>
    <c:if test="${UpdateMsg != null}">
        <div class="alert alert-success" role="alert">
            ${UpdateMsg}
        </div>
    </c:if>
    <body>

        <div id="mytask-layout" class="theme-indigo">

            <!-- sidebar -->
            <div class="sidebar px-4 py-4 py-md-5 me-0" style="background-color:#191970; height: 600px">
                <div class="d-flex flex-column h-100">
                    <a href="index.html" class="mb-0 brand-icon">
                        <span class="logo-icon">
                            <svg  width="35" height="35" fill="currentColor" class="bi bi-clipboard-check" viewBox="0 0 16 16">
                            <path fill-rule="evenodd" d="M10.854 7.146a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708 0l-1.5-1.5a.5.5 0 1 1 .708-.708L7.5 9.793l2.646-2.647a.5.5 0 0 1 .708 0z"/>
                            <path d="M4 1.5H3a2 2 0 0 0-2 2V14a2 2 0 0 0 2 2h10a2 2 0 0 0 2-2V3.5a2 2 0 0 0-2-2h-1v1h1a1 1 0 0 1 1 1V14a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1V3.5a1 1 0 0 1 1-1h1v-1z"/>
                            <path d="M9.5 1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-3a.5.5 0 0 1-.5-.5v-1a.5.5 0 0 1 .5-.5h3zm-3-1A1.5 1.5 0 0 0 5 1.5v1A1.5 1.5 0 0 0 6.5 4h3A1.5 1.5 0 0 0 11 2.5v-1A1.5 1.5 0 0 0 9.5 0h-3z"/>
                            </svg>
                        </span>
                        <span class="logo-text">Summary</span>
                    </a>
                    <!-- Menu: main ul -->

                    <ul class="menu-list flex-grow-1 mt-3">
                        <li class="collapsed">
                            
                            <a class="m-link" data-bs-toggle="collapse" data-bs-target="#dashboard-Components" >
                                <i class="icofont-home fs-5"></i> <span>Voters Summary</span></a>
                            <!-- Menu: Sub menu ul -->
                            <ul class="sub-menu collapse show" id="dashboard-Components">

                                <li><a class="ms-link" > <span>Total Voters - ${totalVoters}</span></a></li>
                                <li><a class="ms-link" > <span>Approved - ${Verification}</span></a></li>
                                <li><a class="ms-link" > <span>Pending - ${Pending}</span></a></li>
                                <li><a class="ms-link" > <span>Rejected - ${Rejected}</span></a></li>
                            </ul>
                        </li>
                        <li class="collapsed">
                            <a class="m-link" data-bs-toggle="collapse" data-bs-target="#dashboard-Components" >
                                <i class="icofont-home fs-5"></i> <span>Election Summary</span></a>
                            <!-- Menu: Sub menu ul -->
                            <ul class="sub-menu collapse show" id="dashboard-Components">
                                <li><a class="ms-link" > <span>Voted - ${Voted}</span></a></li>
                                <li><a class="ms-link" > <span>Not Voted - ${NotVoted}</span></a></li>
                            </ul>
                        </li>

                    </ul>
                </div>
            </div>

            <!-- main body area -->
            <div class="main px-lg-4 px-md-4">

                <!-- Body: Header -->
                <div class="header">
                    <nav class="navbar py-4">
                        <div class="container-xxl">

                            <!-- header rightbar icon -->
                            <div class="h-right d-flex align-items-center mr-5 mr-lg-0 order-1">
                                <!--                                <div class="container-xxl">
                                                                    <div class="row clearfix g-3">
                                                                        <div class="col-xl-8 col-lg-12 col-md-12 flex-column">
                                                                            <div class="row g-3" style="width: 1000px;">
                                
                                                                                <div class="col-lg-12" style="height: 20px">
                                                                                    <div class="card">
                                                                                        <div class="card-header py-3 d-flex justify-content-between bg-transparent border-bottom-0">
                                                                                            <h6 class="mb-0 fw-bold ">Voter Summary</h6>
                                                                                            <h6 class="mb-0 fw-bold ">Total Voters</h6>
                                                                                            <h4 class="mb-0 fw-bold ">423</h4>
                                                                                        </div>
                                                                                        <div class="card-body" >
                                                                                            <div class="row g-2 row-deck">
                                                                                                <div class="col-md-6 col-sm-6">
                                                                                                    <div class="card">
                                                                                                        <div class="card-body ">
                                                                                                            <h6 class="mt-3 mb-0 fw-bold small-14">Approved</h6>
                                                                                                            <span class="text-muted">400</span>
                                                                                                        </div>
                                                                                                    </div>
                                                                                                </div>
                                                                                                <div class="col-md-6 col-sm-6">
                                                                                                    <div class="card">
                                                                                                        <div class="card-body ">
                                                                                                            <h6 class="mt-3 mb-0 fw-bold small-14">Rejected</h6>
                                                                                                            <span class="text-muted">17</span>
                                                                                                        </div>
                                                                                                    </div>
                                                                                                </div>
                                
                                
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                
                                                                            </div>
                                                                        </div>
                                                                    </div> Row End 
                                                                </div>-->

                                

                                <div class="dropdown user-profile ml-2 ml-sm-3 d-flex align-items-end zindex-popover" style="margin-left:1000px">
                                    <div class="u-info me-2">
                                        <p class="mb-0 text-end line-height-sm "><span class="font-weight-bold">Admin</span></p>
                                        <small>Admin Profile</small>
                                    </div>
                                    <a class="nav-link dropdown-toggle pulse p-0" href="#" role="button" data-bs-toggle="dropdown" data-bs-display="static">
                                        <img class="avatar lg rounded-circle img-thumbnail" src="assets/img/profile_av.png" alt="profile">
                                    </a>
                                    <div class="dropdown-menu rounded-lg shadow border-0 dropdown-animation dropdown-menu-end p-0 m-0">
                                        <div class="card border-0 w280">
                                            <div class="card-body pb-0">
                                                <div class="d-flex py-1">
                                                    <img class="avatar rounded-circle" src="assets/img/profile_av.png" alt="profile">
                                                    <div class="flex-fill ms-3">
                                                        <p class="mb-0"><span class="font-weight-bold">Admin </span></p>
                                                        <small class="">admin@gmail.com</small>
                                                    </div>
                                                </div>

                                            </div>

                                        </div>
                                    </div>

                                </div>

                            </div>
                        </div>
                    </nav>
                </div>

                <!-- Body: Body -->

                <div class="card" >
                    <div class="table-wrapper-scroll-y"> 
                        <table class="table table-responsive table-striped " id="example" data-virtual-scroll="true">
                            <thead>
                                <c:choose>
                                    <c:when test = "${requestScope.noData != null}">
                                        <tr>
                                            <td colspan="5">
                                                <h2 style="border:2px solid rgb(255, 99, 71); background-color:rgba(255, 99, 71, 0.5); font-size:15px;">
                                                    <c:out value="${requestScope.noData}"> </c:out>
                                                    </h2>
                                                </td>
                                            </tr>
                                    </c:when>
                                </c:choose>
                                <tr style="background-color:#191970;">
                                    <th style="color: white">VOTER ID</th>
                                    <th style="color: white">Email ADDRESS</th>
                                    <th style="color: white">FIRST NAME</th>
                                    <th style="color: white">LAST NAME</th>
                                    <th style="color: white">AGE</th>
                                    <th style="color: white">DOB</th>
                                    <th style="color: white">GENDER</th>
                                    <th style="color: white">STATE</th>
                                    <th style="color: white">VOTING STATUS</th>
                                    <th style="color: white">ADMIN STATUS</th>
                                    <th style="color: white">Action</th>
                                </tr>
                            </thead>
                            <tbody style="font-family:verdana"">

                                <c:forEach items="${VoterList}" var="voterList">

                                    <tr data-index="0">
                                        <td>${voterList.voterId}</td>
                                        <td>${voterList.emailAddress}</td>
                                        <td>${voterList.firstName}</td>
                                        <td>${voterList.lastName}</td>
                                        <td>${voterList.age}</td>
                                        <td>${voterList.dob }</td>
                                        <td>${voterList.gender}</td>
                                        <td>${voterList.state}</td>
                                        <td><c:if test="${voterList.getVotingStatus()==1}">
                                                <p  style="color:#50B450">Voted</p></c:if>
                                            <c:if test="${voterList.getVotingStatus()==0}">
                                                <p  style="color:red">Not Voted</p></c:if></td>
                                            <td>
                                            <c:if test="${voterList.getAdminStatus()==1}">
                                                <p  style="color:maroon">Approved</p></c:if>
                                            <c:if test="${voterList.getAdminStatus()==2}">
                                                <p  style="color:red">Rejected </p></c:if>
                                            <c:if test="${voterList.getAdminStatus()==0}">
                                                <p  style="color:blue">Pending</p></c:if>
                                            </td>
                                            <td>
                                                <button type="button" class="btn btn-warning" data-bs-toggle="modal" data-bs-target="#exampleModal" onclick="fetchContent(${voterList.voterId})">
                                                View
                                            </button>

                                            <!-- Modal -->
                                            <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                                <div class="modal-dialog modal-lg">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <h5 class="modal-title" id="exampleModalLabel">Details of Voter</h5>
                                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                        </div>
                                                        <div class="modal-body">
                                                            <table id="tableId" class="table-borderless">
                                                                <td>
                                                                    <div id="onclickViewVoter">

                                                                    </div>
                                                                </td>
                                                                <td>
                                                                    <div id="voterIdentityDetails">


                                                                    </div>
                                                                </td></table>

                                                        </div>
                                                        <div class="modal-footer">
                                                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" onclick="refreshModal()">Close</button>
                                                            
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                </c:forEach>


                            </tbody>
                        </table>


                    </div>
                </div>
            </div>
        </div>

        <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
        <script src="https://cdn.datatables.net/1.13.1/js/jquery.dataTables.min.js"></script>
        <script src="https://cdn.datatables.net/1.13.1/js/dataTables.bootstrap5.min.js"></script>
        <script>
                                                    //                                    $(document).ready(function () {
                                                    //                                        $('#example').DataTable();
                                                    //                                    });

                                                    $(document).ready(function () {
                                                        $('#example').DataTable({
                                                            "paging": true,
                                                            "pageLength": 5,
                                                            "lengthMenu": [[5, 10, 25, -1], [5, 10, 25, "All"]]
                                                        });
                                                    });
        </script>
        <style>
            #table {
                display: block;
                height: 400px;
                width: 100%;
                overflow-y: scroll;
                outline: 1px solid black;
                outline-color: gray
            }
            #table > thead > tr > th{
                background-color:#191970;
            }
            #tableId{

                width: 100%;

            }
            div.scroll {

                width: 100%;
                height: 200px;
                overflow-x: hidden;
                /*                overflow-y: auto;*/
                /*                overflow-y: auto;*/
                text-align: justify-all;
                padding: 20px;
            }

            .my-custom-scrollbar {
                position: relative;
                height: 300px;
                overflow: auto;
            }
            .table-wrapper-scroll-y {
                display: block;
            }

        </style>
        <script>

            function fetchContent(voterId)
            {
//                alert(voterId);
                var xmlhttp = new XMLHttpRequest();
                xmlhttp.onreadystatechange = function ()
                {
                    document.getElementById("onclickViewVoter").innerHTML = xmlhttp.responseText;
                };


                xmlhttp.open("POST", "FetchParticularVoter?voterId=" + voterId, true);
                xmlhttp.send();
            }

            function fetchVapi(voterId)
            {
                //alert(voterId);
                var xmlhttp = new XMLHttpRequest();
                xmlhttp.onreadystatechange = function ()
                {
                    document.getElementById("voterIdentityDetails").innerHTML = xmlhttp.responseText;
                };


                xmlhttp.open("POST", "FetchApi?voterId=" + voterId, true);
                xmlhttp.send();
                //FetchApi
            }

            function functionApprove(voterId)
            {
                //alert(fnolId);
                var xmlhttp = new XMLHttpRequest();
                xmlhttp.onreadystatechange = function ()
                {
                    document.getElementById("onclickViewVoter").innerHTML = xmlhttp.responseText;
                };


                xmlhttp.open("POST", "AdminVerified?voterId=" + voterId, true);
                xmlhttp.send();
            }
            function functionReject(voterId)
            {
                //alert(fnolId);
                var xmlhttp = new XMLHttpRequest();
                xmlhttp.onreadystatechange = function ()
                {
                    document.getElementById("onclickViewVoter").innerHTML = xmlhttp.responseText;
                };


                xmlhttp.open("POST", "AdminRejected?voterId=" + voterId, true);
                xmlhttp.send();
            }
            function newfetchContent(urls)
            {
//                alert("Triggered");
                var xmlhttp = new XMLHttpRequest();
                xmlhttp.onreadystatechange = function ()
                {
                    document.getElementById("adminLanding").innerHTML = xmlhttp.responseText;
                };


                xmlhttp.open("POST", urls, true);
                xmlhttp.send();
            }
            
            function refreshModal(){
                location.reload(true);
            }

        </script>

        <!-- Jquery Core Js -->
        <script src="assets/bundles/libscripts.bundle.js"></script>

        <!-- Plugin Js-->
        <script src="assets/bundles/apexcharts.bundle.js"></script>

        <!-- Jquery Page Js -->
        <script src="../js/template.js"></script>
        <script src="../js/page/hr.js"></script>
    </body>
</html> 