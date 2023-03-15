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
        <link rel="shortcut icon" type="image/x-icon" href="assets/img/vote-icon.png">
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
    </head>

    <body style="overflow: visible">
        <div class="text-center d-flex align-items-center">
            <canvas id="pieChart2" style="width: 750px"></canvas>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

        <script>
            Chart.defaults.font.size = 17;
        </script>
        <script>
            var candiStates = [];
            var candiVotes = [];
            <c:forEach items='${CandidateResults.stateNames}' var='sresults'>
            candiStates.push("${sresults}");
            </c:forEach>
            <c:forEach items='${CandidateResults.stateVote}' var='vresults'>
            candiVotes.push("${vresults}");
            </c:forEach>
            var btxz = document.getElementById('pieChart2');
            new Chart(btxz, {
                type: 'pie',
                data: {
                    labels: candiStates,
                    datasets: [{
                            label: 'Number of Votes to States',
                            data: candiVotes,
                            backgroundColor: [
                                'rgb(255, 0, 0,0.5)',
                                'rgb(0, 255, 0,0.5)',
                                'rgb(0, 0, 255,0.5)',
                                'rgb(255, 255, 0,0.5)',
                                'rgb(255, 0, 255,0.5)',
                                'rgb(0, 255, 255,0.5)',
                                'rgb(128, 0, 0,0.5)',
                                'rgb(0, 128, 0,0.5)',
                                'rgb(0, 0, 128,0.5)',
                                'rgb(128, 128, 0,0.5)',
                                'rgb(128, 0, 128,0.5)',
                                'rgb(0, 128, 128,0.5)',
                                'rgb(128, 128, 128,0.5)',
                                'rgb(255, 128, 0,0.5)',
                                'rgb(255, 0, 128,0.5)',
                                'rgb(128, 255, 0,0.5)',
                                'rgb(0, 128, 255,0.5)',
                                'rgb(255, 128, 128,0.5)',
                                'rgb(128, 255, 128,0.5)',
                                'rgb(128, 128, 255,0.5)',
                                'rgb(255, 255, 128,0.5)',
                                'rgb(255, 128, 255,0.5)',
                                'rgb(128, 255, 255,0.5)',
                                'rgb(192, 0, 0,0.5)',
                                'rgb(0, 192, 0,0.5)',
                                'rgb(0, 0, 192,0.5)',
                                'rgb(192, 192, 0,0.5)',
                                'rgb(192, 0, 192,0.5)',
                                'rgb(0, 192, 192,0.5)',
                                'rgb(192, 192, 192,0.5)',
                                'rgb(255, 192, 0,0.5)',
                                'rgb(255, 0, 192,0.5)',
                                'rgb(192, 255, 0,0.5)',
                                'rgb(0, 192, 255,0.5)',
                                'rgb(255, 192, 192,0.5)',
                                'rgb(192, 255, 192,0.5)',
                                'rgb(192, 192, 255,0.5)',
                                'rgb(255, 255, 192,0.5)',
                            ],
                            borderColor: [
                                'rgb(255, 0, 0)',
                                'rgb(0, 255, 0)',
                                'rgb(0, 0, 255)',
                                'rgb(255, 255, 0)',
                                'rgb(255, 0, 255)',
                                'rgb(0, 255, 255)',
                                'rgb(128, 0, 0)',
                                'rgb(0, 128, 0)',
                                'rgb(0, 0, 128)',
                                'rgb(128, 128, 0)',
                                'rgb(128, 0, 128)',
                                'rgb(0, 128, 128)',
                                'rgb(128, 128, 128)',
                                'rgb(255, 128, 0)',
                                'rgb(255, 0, 128)',
                                'rgb(128, 255, 0)',
                                'rgb(0, 128, 255)',
                                'rgb(255, 128, 128)',
                                'rgb(128, 255, 128)',
                                'rgb(128, 128, 255)',
                                'rgb(255, 255, 128)',
                                'rgb(255, 128, 255)',
                                'rgb(128, 255, 255)',
                                'rgb(192, 0, 0)',
                                'rgb(0, 192, 0)',
                                'rgb(0, 0, 192)',
                                'rgb(192, 192, 0)',
                                'rgb(192, 0, 192)',
                                'rgb(0, 192, 192)',
                                'rgb(192, 192, 192)',
                                'rgb(255, 192, 0)',
                                'rgb(255, 0, 192)',
                                'rgb(192, 255, 0)',
                                'rgb(0, 192, 255)',
                                'rgb(255, 192, 192)',
                                'rgb(192, 255, 192)',
                                'rgb(192, 192, 255)',
                                'rgb(255, 255, 192)',
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
