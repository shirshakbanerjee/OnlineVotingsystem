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
                overflow-y: auto;
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
                //alert(fnolId);
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
                alert(voterId);
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
                <table class="table table-responsive table-striped "  data-virtual-scroll="true">
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
                        <tr>
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
                    <tbody>

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
                                        <p  style="color:green">Voted</p></c:if>
                                    <c:if test="${voterList.getVotingStatus()==0}">
                                        <p  style="color:red">Not Voted</p></c:if></td>
                                    <td>
                                    <c:if test="${voterList.getAdminStatus()==1}">
                                        <p  style="color:green">Approved</p></c:if>
                                    <c:if test="${voterList.getAdminStatus()==2}">
                                        <p  style="color:red">Rejected </p></c:if>
                                    <c:if test="${voterList.getAdminStatus()==0}">
                                        <p  style="color:blue">Pending</p></c:if>
                                    </td>
                                    <td>
                                        <button type="button" class="btn btn-dark" onclick="fetchContent(${voterList.voterId})">View</button>
                                </td>
                            </tr>
                        </c:forEach>

                    </tbody>
                </table>
            </div>
                        <!--<div class="scroll">-->
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

