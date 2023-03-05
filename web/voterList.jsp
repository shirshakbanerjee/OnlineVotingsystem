<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!--        <link href="css/header.css" rel="stylesheet">-->
        <link rel="stylesheet" href="assets/css/all.min.css">
        <link rel="stylesheet" href="assets/css/reset-min.css">
        <link rel="stylesheet" href="assets/css/algolia-min.css">
        <link rel="stylesheet" href="assets/css/header.css">
        <link rel="stylesheet" href="assets/css/docs.min.css">
        <link rel="stylesheet" href="assets/css/index.css">
        <link rel="stylesheet" href="assets/css/customstyle.css" >

        <link href="assets/vendor/aos/aos.css" rel="stylesheet">
        <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
        <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
        <link href="assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
        <link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">
        <link href="assets/css/style.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" 
              integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" 
        integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
        <title>VOTER LIST</title>
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
                background-color: #BDCDD6;
            }
            #tableId{

                width: 100%;

            }
            div.scroll {

                width: 100%;
                height: 200px;
                overflow-x: hidden;
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
                alert(voterId);
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

        </script>
    </head>



    <!-- I want to check my session before showing any content to the user -->


    <c:set var='admin' value='${Admin}'/>
    <c:if test = "${admin == null && voter == null}">  
        <c:redirect url = "login.jsp"/>
    </c:if>

    <jsp:include page="menu.jsp"></jsp:include>
<!--        <div id="adminLanding">
            <div>-->

            <c:if test="${UpdateMsg != null}">
                <div class="alert alert-success" role="alert">
                    ${UpdateMsg}
                </div>
            </c:if>


<!--        </div><div class="columns columns-right btn-group float-right"><div class="keep-open btn-group" title="Columns">
                <div class="dropdown-menu dropdown-menu-right" style=""><label class="dropdown-item dropdown-item-marker"><input type="checkbox" data-field="id" value="0" checked="checked"> <span>ID</span></label><label class="dropdown-item dropdown-item-marker"><input type="checkbox" data-field="name" value="1" checked="checked"> <span>Item Name</span></label><label class="dropdown-item dropdown-item-marker"><input type="checkbox" data-field="price" value="2" checked="checked"> <span>Item Price</span></label></div></div></div></div>
    <div>-->
        <div class="table-wrapper-scroll-y"> 
            <table class="table table-responsive table-striped " id="example" data-virtual-scroll="true" style="background-color:#DDFBFE">
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
                    <tr style="background-color:#B4F8E6">
                        <th>VOTER ID</th>
                        <th>Email ADDRESS</th>
                        <th>FIRST NAME</th>
                        <th>LAST NAME</th>
                        <th>AGE</th>
                        <th>DOB</th>
                        <th>GENDER</th>
                        <th>STATE</th>
                        <th>VOTING STATUS</th>
                        <th>ADMIN STATUS</th>
                        <th>Action</th>
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
                                    <p  style="color:#13F048">Voted</p></c:if>
                                <c:if test="${voterList.getVotingStatus()==0}">
                                    <p  style="color:#AD1FE8">Not Voted</p></c:if></td>
                                <td>
                                <c:if test="${voterList.getAdminStatus()==1}">
                                    <p  style="color:blue">Approved</p></c:if>
                                <c:if test="${voterList.getAdminStatus()==2}">
                                    <p  style="color:red">Rejected </p></c:if>
                                <c:if test="${voterList.getAdminStatus()==0}">
                                    <p  style="color:blue">Pending</p></c:if>
                                </td>
                                <td>
<!--                                            <button type="button" class="btn btn-warning" onclick="fetchContent(${voterList.voterId})">View</button>-->
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
                                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                                <!--                                                        <button type="button" class="btn btn-primary">Save changes</button>-->
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
    <!-- Button trigger modal -->

    <!--<div class="scroll">-->

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
                                            "pageLength": 10,
                                            "lengthMenu": [[5, 10, 25, -1], [5, 10, 25, "All"]]
                                        });
                                    });
    </script>
</div>

</div>
</div>
</html>

<!--<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Employee Details</title>
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.24/css/jquery.dataTables.min.css">
        <script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script type="text/javascript" src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.min.js"></script>
        <script type="text/javascript">
                                    $(document).ready(function () {
                                        $('#employeeTable').DataTable({
                                            "paging": true,
                                            "pageLength": 10,
                                            "lengthMenu": [[5, 10, 25, -1], [5, 10, 25, "All"]]
                                        });
                                    });
        </script>
    </head>
    <body>
        <table id="employeeTable">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Salary</th>
                </tr>
            </thead>
            <tbody>
                
                <tr>
                    
                </tr>
                
            </tbody>
        </table>
    </body>
</html>-->

