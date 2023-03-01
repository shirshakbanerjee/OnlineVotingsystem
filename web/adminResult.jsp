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
            canvas{
                margin: 0 auto;
                width: 500px;
            }
        </style>
        <script>
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

    <body style="overflow: visible">
        <c:set var='admin' value='${Admin}'/>
        <c:if test = "${admin == null && voter == null}">  
            <c:redirect url = "login.jsp"/>
        </c:if>

        <jsp:include page="menu.jsp"></jsp:include>
            <!--            <div><h3 style="text-align: center; padding: 50px;text-decoration: underline">Voting Data</h3></div>
                        <div>
                            <table class="table table-bordered table-hover" id="example">
                                <thead>
                                    <tr class="table-primary">
                                        <th>
                                            Candidate Id
                                        </th>
                                        <th>
                                            Candidate Name
                                        </th>
                                        <th>
                                            Votes
                                        </th>
            
                                    </tr>
                                </thead>
        <c:forEach items='${ResultList}' var='result'>
            <tr>


                <td>
            ${result.getCandidateId()}
        </td>
        <td>

            <c:out value='${result.getCandidateName()}'/>
        </td>
        <td>
            <c:out value='${result.getVotes()}'/>

        </td>
        </c:forEach>
    </tr>
</table>
</div>-->
            <div class="align-content-center bg-light" style="padding: 50px">
            <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>

            <div><h3 style="text-align: center; padding: 50px;text-decoration: underline">Candidate Vote Chart</h3></div>
            <div class="text-center d-flex align-items-center">
                <canvas style="width: 800px" id="myChart"></canvas>
            </div>

            <div><h3 style="text-align: center; padding: 50px;text-decoration: underline">State Vote Chart</h3></div>
            <div class="text-center d-flex align-items-center">
                <canvas id="pieChart"></canvas>
            </div>

            <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

            <script>
            Chart.defaults.font.size = 17;
            const names = [];
            const votes = [];
                <c:forEach items='${ResultList}' var='results'>
            names.push("${results.getCandidateName()}");
            votes.push("${results.getVotes()}");
                </c:forEach>
            let delayed;
            const ctx = document.getElementById('myChart');
            new Chart(ctx, {
                type: 'bar',
                data: {
                    labels: names,
                    datasets: [{
                            label: 'Number of Votes to candidates',
                            data: votes,
                            backgroundColor: [
                                'rgba(255, 99, 132, 0.2)',
                                'rgba(255, 159, 64, 0.2)',
                                'rgba(255, 205, 86, 0.2)',
                                'rgba(75, 192, 192, 0.2)',
                                'rgba(54, 162, 235, 0.2)',
                                'rgba(153, 102, 255, 0.2)',
                                'rgba(201, 203, 207, 0.2)'
                            ],
                            borderColor: [
                                'rgb(255, 99, 132)',
                                'rgb(255, 159, 64)',
                                'rgb(255, 205, 86)',
                                'rgb(75, 192, 192)',
                                'rgb(54, 162, 235)',
                                'rgb(153, 102, 255)',
                                'rgb(201, 203, 207)'
                            ],
                            borderWidth: 2,
                            borderRadius: 20
                        }]
                },
                options: {
                    responsive: true,
                    animation: {
                        onComplete: () => {
                            delayed = true;
                        },
                        delay: (context) => {
                            let delay = 0;
                            if (context.type === 'data' && context.mode === 'default' && !delayed) {
                                delay = context.dataIndex * 300 + context.datasetIndex * 100;
                            }
                            return delay;
                        }
                    },
                    scales: {
                        y: {
                            beginAtZero: true
                        }
                    }
                }
            });
            </script>
            <script>
                const states = [];
                const counts = [];
                <c:forEach items='${StateList}' var='states'>
                states.push("${states.getStates()}");
                counts.push("${states.getCount()}");
                </c:forEach>
                const btx = document.getElementById('pieChart');
                new Chart(btx, {
                    type: 'pie',
                    data: {
                        labels: states,
                        datasets: [{
                                label: 'Number of Votes to States',
                                data: counts,
                                backgroundColor: [
                                    'rgba(255, 99, 132, 0.2)',
                                    'rgba(255, 159, 64, 0.2)',
                                    'rgba(255, 205, 86, 0.2)',
                                    'rgba(75, 192, 192, 0.2)',
                                    'rgba(54, 162, 235, 0.2)',
                                    'rgba(153, 102, 255, 0.2)',
                                    'rgba(201, 203, 207, 0.2)'
                                ],
                                borderColor: [
                                    'rgb(255, 99, 132)',
                                    'rgb(255, 159, 64)',
                                    'rgb(255, 205, 86)',
                                    'rgb(75, 192, 192)',
                                    'rgb(54, 162, 235)',
                                    'rgb(153, 102, 255)',
                                    'rgb(201, 203, 207)'
                                ],
                                borderWidth: 2,
                                borderRadius: 10
                            }]
                    },
                    options: {
                        responsive: true
                    }
                });
            </script>
        </div>
    </body>
