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
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

        <link href="assets/vendor/aos/aos.css" rel="stylesheet">
        <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
        <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
        <link href="assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
        <link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">
        <link href="assets/css/style.css" rel="stylesheet">
        <title>CANDIDATE LIST</title>
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
                overflow-y: auto;
                text-align: justify-all;
                padding: 20px;
            }

            .my-custom-scrollbar {
                position: relative;
                height: 600px;
                overflow: auto;
            }
            .table-wrapper-scroll-y {
                display: block;
            }

        </style>
        <script>

            function fetchContent(voterId)
            {
                //alert(fnolId);
                var xmlhttp = new XMLHttpRequest();
                xmlhttp.onreadystatechange = function ()
                {
                    document.getElementById("onclickViewVoter").innerHTML = xmlhttp.responseText;
                };


                xmlhttp.open("POST", "FetchParticularVoter?voterId=" + voterId, true);
                xmlhttp.send();
            }

            function fetchVapi()
            {
                alert("check approval");
                var xmlhttp = new XMLHttpRequest();
                xmlhttp.onreadystatechange = function ()
                {
                    document.getElementById("voterIdentityDetails").innerHTML = xmlhttp.responseText;
                };


                xmlhttp.open("POST", "FetchApi", true);
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


        </script>
    
    </head>



    <!-- I want to check my session before showing any content to the user -->




    <jsp:include page="menu.jsp"></jsp:include>

        <div id="example">

        <c:if test="${UpdateMsg != null}">
            <div class="alert alert-success" role="alert">
                ${UpdateMsg}
            </div>
        </c:if>

        <div class="fixed-table-toolbar"><div class="bs-bars float-left">

            </div><div class="columns columns-right btn-group float-right"><div class="keep-open btn-group" title="Columns">
                    <div class="dropdown-menu dropdown-menu-right" style=""><label class="dropdown-item dropdown-item-marker"><input type="checkbox" data-field="id" value="0" checked="checked"> <span>ID</span></label><label class="dropdown-item dropdown-item-marker"><input type="checkbox" data-field="name" value="1" checked="checked"> <span>Item Name</span></label><label class="dropdown-item dropdown-item-marker"><input type="checkbox" data-field="price" value="2" checked="checked"> <span>Item Price</span></label></div></div></div></div>
        <div>
            <div class="table-wrapper-scroll-y my-custom-scrollbar" > 
                <table class="table table-responsive table-striped table-secondary "  data-virtual-scroll="true">
                    <thead class="table-bordered table-dark">
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
                        <tr>
                            <th>Profile Pic</th>
                            <th>First Name</th>
                            <th>Last Name</th>
                            <th>Party Name</th>
                            <th>Age</th>
                            <th>Gender</th>
                            <th>Region</th>
                            <th>Action</th>

                        </tr>
                    </thead>
                    <tbody>

                        <c:forEach items="${CandidateList}" var="candidateList">
                            <tr data-index="0">
                                <td>
                                    <c:if test="${not empty candidateList.imageData}">
                                        <img src="data:image/png;base64,${candidateList.imageData}" style="width: auto; height: auto; max-width: 150px; max-height: 150px;">
                                    </c:if>
                                </td>
                                <td>${candidateList.firstName}</td>                                
                                <td>${candidateList.lastName}</td>
                                <td>${candidateList.partyName}</td>
                                <td>${candidateList.age}</td>
                                <td>${candidateList.gender}</td>
                                <td>${candidateList.region}</td>
                                <td>
                                    <button type="button" class="btn btn-info" onclick="fetchContent(${candidateList.candidateId})"> <i class="fa fa-pencil"></i></button>
                                    <button type="button" class="btn btn-danger" onclick="fetchContent(${candidateList.candidateId})"><i class="fa fa-trash"></i></button>
                                </td>
                            </tr>
                        </c:forEach>


                    </tbody>
                </table>
            </div>
            <!--                        <div class="scroll">-->
            <table id="tableId" class="table-borderless">

                <td rowspan = "2">
                    <div id="onclickViewVoter">

                    </div>
                </td>
                <td>
                    <div id="voterIdentityDetails">


                    </div>

                </td>

            </table>
        </div>

    </div>

</html>

