<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!--        <link href="css/header.css" rel="stylesheet">-->
        <!--        <link rel="stylesheet" href="assets/css/all.min.css">
                <link rel="stylesheet" href="assets/css/reset-min.css">
                <link rel="stylesheet" href="assets/css/algolia-min.css">-->
        <!--        <link rel="stylesheet" href="assets/css/header.css">
                <link rel="stylesheet" href="assets/css/docs.min.css">
                <link rel="stylesheet" href="assets/css/index.css">
                <link rel="stylesheet" href="assets/css/customstyle.css" >-->
        <link rel="icon" href="favicon.ico" type="image/x-icon"> <!-- Favicon-->
        <!-- project css file  -->
        <link rel="stylesheet" href="assets/css/men.css">
        <!--
                <link href="assets/vendor/aos/aos.css" rel="stylesheet">-->
        <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
        <!--        <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
                <link href="assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
                <link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">-->
        <!--        <link href="assets/css/style.css" rel="stylesheet">-->
        <title>Result Page</title>
        <style>
            #table {
                /*                display: block;*/
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
            .sidebar .menu-list .m-link:hover,.sidebar .menu-list .m-link.active,.sidebar .menu-list .ms-link:hover,.sidebar .menu-list .ms-link.active{
                color:#f19828;
            }
            .flip-card {
                margin-left: 445px;
                align-content: center;
                width: 320px;
                height: 320px;
                border: 1px solid #f1f1f1;
                perspective: 1000px; /* Remove this if you don't want the 3D effect */
            }

            /* This container is needed to position the front and back side */
            .flip-card-inner {
                position: relative;
                width: 100%;
                height: 100%;
                text-align: center;
                transition: transform 0.8s;
                transform-style: preserve-3d;
            }

            /* Do an horizontal flip when you move the mouse over the flip box container */
            .flip-card:hover .flip-card-inner {
                transform: rotateY(180deg);
            }

            /* Position the front and back side */
            .flip-card-front, .flip-card-back {
                position: absolute;
                width: 100%;
                height: 100%;
                -webkit-backface-visibility: hidden; /* Safari */
                backface-visibility: hidden;
            }

            /* Style the front side (fallback if image is missing) */
            .flip-card-front {
                /*                background-color: #bbb;*/
                border: 2px solid black;
                color: black;
            }

            /* Style the back side */
            .flip-card-back {
                background-color: dodgerblue;
                color: white;
                transform: rotateY(180deg);
            }
            /* flipping class and key frames*/
            .flipX {
                animation: 1s anim-flipX ease infinite;
            }
            @keyframes anim-flipX {
                0% {
                    opacity: 0;
                    transform: rotateX(90def);
                }
                50% {
                    opacity: 1;
                    transform: rotateX(720deg);
                }
                100% {
                    /* animate nothing to pause animation at the end */
                    opacity: 1;
                    transform: rotateX(720deg);
                }
            }

            /* lineup class and keyframes */
            .lineUp {
                animation: 2s anim-lineUp ease-out infinite;
            }
            @keyframes anim-lineUp {
                0% {
                    opacity: 0;
                    transform: translateY(80%);
                }
                20% {
                    opacity: 0;
                }
                50% {
                    opacity: 1;
                    transform: translateY(0%);
                }
                100% {
                    opacity: 1;
                    transform: translateY(0%);
                }
            }
            /* flipY class and keyframes*/
            .flipY {
                animation-name: spin, depth;
                animation-timing-function: linear;
                animation-iteration-count: infinite;
                animation-duration: 6s;
            }
            @keyframes spin {
                0% {
                    transform: rotateY(0deg);
                }
                100% {
                    transform: rotateY(-360deg);
                }
            }
            @keyframes depth {
                0% {
                    text-shadow: 0 0 black;
                }
                25% {
                    text-shadow: 1px 0 black, 2px 0 black, 3px 0 black, 4px 0 black, 5px 0 black;
                }
                50% {
                    text-shadow: 0 0 black;
                }
                75% {
                    text-shadow: -1px 0 black, -2px 0 black, -3px 0 black, -4px 0 black,
                        -5px 0 black;
                }
                100% {
                    text-shadow: 0 0 black;
                }
            }

            /* subtle zoom to attention and then back */
            .pop-outin {
                animation: 2s anim-popoutin ease infinite;
            }

            @keyframes anim-popoutin {
                0% {
                    color: black;
                    transform: scale(0);
                    opacity: 0;
                    text-shadow: 0 0 0 rgba(0, 0, 0, 0);
                }
                25% {
                    color: red;
                    transform: scale(2);
                    opacity: 1;
                    text-shadow: 3px 10px 5px rgba(0, 0, 0, 0.5);
                }
                50% {
                    color: black;
                    transform: scale(1);
                    opacity: 1;
                    text-shadow: 1px 0 0 rgba(0, 0, 0, 0);
                }
                100% {
                    /* animate nothing to add pause at the end of animation */
                    transform: scale(1);
                    opacity: 1;
                    text-shadow: 1px 0 0 rgba(0, 0, 0, 0);
                }
            }

            .fromtop {
                animation: 2s anim-fromtop linear infinite;
            }
            @keyframes anim-fromtop {
                0% {
                    opacity: 0;
                    transform: translateY(-100%);
                }
                25% {
                    opacity: 1;
                    transform: translateY(0%);
                }
                50% {
                }
                100% {
                }
            }
            .confetti {
                display: flex;
                justify-content: center;
                align-items: center;
                position: absolute;
                width: 100%;
                height: 100%;
                overflow: hidden;
                z-index: 1000;
            }
            .confetti-piece {
                position: absolute;
                width: 10px;
                height: 30px;
                background: #ffd300;
                top: 0;
                opacity: 0;
            }
            .confetti-piece:nth-child(1) {
                left: 7%;
                -webkit-transform: rotate(-40deg);
                -webkit-animation: makeItRain 1000ms infinite ease-out;
                -webkit-animation-delay: 182ms;
                -webkit-animation-duration: 1116ms;
            }
            .confetti-piece:nth-child(2) {
                left: 14%;
                -webkit-transform: rotate(4deg);
                -webkit-animation: makeItRain 1000ms infinite ease-out;
                -webkit-animation-delay: 161ms;
                -webkit-animation-duration: 1076ms;
            }
            .confetti-piece:nth-child(3) {
                left: 21%;
                -webkit-transform: rotate(-51deg);
                -webkit-animation: makeItRain 1000ms infinite ease-out;
                -webkit-animation-delay: 481ms;
                -webkit-animation-duration: 1103ms;
            }
            .confetti-piece:nth-child(4) {
                left: 28%;
                -webkit-transform: rotate(61deg);
                -webkit-animation: makeItRain 1000ms infinite ease-out;
                -webkit-animation-delay: 334ms;
                -webkit-animation-duration: 708ms;
            }
            .confetti-piece:nth-child(5) {
                left: 35%;
                -webkit-transform: rotate(-52deg);
                -webkit-animation: makeItRain 1000ms infinite ease-out;
                -webkit-animation-delay: 302ms;
                -webkit-animation-duration: 776ms;
            }
            .confetti-piece:nth-child(6) {
                left: 42%;
                -webkit-transform: rotate(38deg);
                -webkit-animation: makeItRain 1000ms infinite ease-out;
                -webkit-animation-delay: 180ms;
                -webkit-animation-duration: 1168ms;
            }
            .confetti-piece:nth-child(7) {
                left: 49%;
                -webkit-transform: rotate(11deg);
                -webkit-animation: makeItRain 1000ms infinite ease-out;
                -webkit-animation-delay: 395ms;
                -webkit-animation-duration: 1200ms;
            }
            .confetti-piece:nth-child(8) {
                left: 56%;
                -webkit-transform: rotate(49deg);
                -webkit-animation: makeItRain 1000ms infinite ease-out;
                -webkit-animation-delay: 14ms;
                -webkit-animation-duration: 887ms;
            }
            .confetti-piece:nth-child(9) {
                left: 63%;
                -webkit-transform: rotate(-72deg);
                -webkit-animation: makeItRain 1000ms infinite ease-out;
                -webkit-animation-delay: 149ms;
                -webkit-animation-duration: 805ms;
            }
            .confetti-piece:nth-child(10) {
                left: 70%;
                -webkit-transform: rotate(10deg);
                -webkit-animation: makeItRain 1000ms infinite ease-out;
                -webkit-animation-delay: 351ms;
                -webkit-animation-duration: 1059ms;
            }
            .confetti-piece:nth-child(11) {
                left: 77%;
                -webkit-transform: rotate(4deg);
                -webkit-animation: makeItRain 1000ms infinite ease-out;
                -webkit-animation-delay: 307ms;
                -webkit-animation-duration: 1132ms;
            }
            .confetti-piece:nth-child(12) {
                left: 84%;
                -webkit-transform: rotate(42deg);
                -webkit-animation: makeItRain 1000ms infinite ease-out;
                -webkit-animation-delay: 464ms;
                -webkit-animation-duration: 776ms;
            }
            .confetti-piece:nth-child(13) {
                left: 91%;
                -webkit-transform: rotate(-72deg);
                -webkit-animation: makeItRain 1000ms infinite ease-out;
                -webkit-animation-delay: 429ms;
                -webkit-animation-duration: 818ms;
            }
            .confetti-piece:nth-child(odd) {
                background: #7431e8;
            }
            .confetti-piece:nth-child(even) {
                z-index: 1;
            }
            .confetti-piece:nth-child(4n) {
                width: 5px;
                height: 12px;
                -webkit-animation-duration: 2000ms;
            }
            .confetti-piece:nth-child(3n) {
                width: 3px;
                height: 10px;
                -webkit-animation-duration: 2500ms;
                -webkit-animation-delay: 1000ms;
            }
            .confetti-piece:nth-child(4n-7) {
                background: red;
            }
            @-webkit-keyframes makeItRain {
                from {
                    opacity: 0;
                }
                50% {
                    opacity: 1;
                }
                to {
                    -webkit-transform: translateY(350px);
                }
            }
        </style>
        <script src="https://code.jquery.com/jquery-3.6.3.js" integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM=" crossorigin="anonymous">
        </script>
        <script>
            function fetchContent(urls) {
//                alert(urls+'?firstName='+document.getElementById("nameC").value);
                $.ajax({
                    url: urls + '?firstName=' + document.getElementById("nameC").value,
                    success: function (responseText) {
                        //                    alert(responseText);
                        $("#" + 'displayResult').html(responseText);
                    }
                });
            }

            function newfetchContent(urls)
            {
                alert(urls + '?firstName=' + document.getElementById("nameC").value);
                alert(urls + '?firstName=' + document.getElementById("nameC").value);
                var xmlhttp = new XMLHttpRequest();
                xmlhttp.onreadystatechange = function ()
                {
                    document.getElementById("displayResult").innerHTML = xmlhttp.responseText;
                };


                xmlhttp.open("POST", urls, true);
                xmlhttp.send();
            }
            function observeSections() {
                const observer = new IntersectionObserver(entries => {
                    entries.forEach(entry => {
                        const id = entry.target.getAttribute('id');
                        if (entry.intersectionRatio > 0) {
                            document.querySelector(`nav li a[href="#${id}"]`).parentElement.classList.add('active');
                        } else {
                            document.querySelector(`nav li a[href="#${id}"]`).parentElement.classList.remove('active');
                        }
                    });
                });

                // Track all sections that have an `id` applied
                document.querySelectorAll('section[id]').forEach((section) => {
                    observer.observe(section);
                });
            }

// Call the function to start observing sections
            observeSections();

        </script>
    </head>



    <!-- I want to check my session before showing any content to the user -->

    <body style="overflow: visible">

        <jsp:include page="menu.jsp" ></jsp:include>

            <nav class="section-nav">
                <div class="sidebar px-4 py-4 py-md-5 me-0" style="background-color:#191970; height: 650px; position:fixed;justify-content: left;align-self: start; margin-top: 10px;">
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
                                <a class="m-link" data-bs-toggle="collapse" data-bs-target="#dashboard-Components" href="#winner">
                                    <i class="icofont-home fs-5"></i> <span>Winning Candidate</span></a>
                                <!-- Menu: Sub menu ul -->
                                <ul class="sub-menu collapse show" id="dashboard-Components">

                                </ul>
                            </li>
                            <li class="collapsed">
                                <a class="m-link" data-bs-toggle="collapse" data-bs-target="#dashboard-Components" href="#partyVote">
                                    <i class="icofont-home fs-5"></i> <span>Party Based Analysis</span></a>
                                <!-- Menu: Sub menu ul -->
                                <ul class="sub-menu collapse show" id="dashboard-Components">

                                </ul>
                            </li>
                            <li class="collapsed">
                                <a class="m-link" data-bs-toggle="collapse" data-bs-target="#dashboard-Components" href="#candidateVote">
                                    <i class="icofont-home fs-5"></i> <span>Candidate Vote Chart</span></a>
                                <!-- Menu: Sub menu ul -->
                                <ul class="sub-menu collapse show" id="dashboard-Components">

                                </ul>
                            </li>
                            <li class="collapsed">
                                <a class="m-link" data-bs-toggle="collapse" data-bs-target="#dashboard-Components" href="#stateVote" >
                                    <i class="icofont-home fs-5"></i> <span>State Vote Chart</span></a>
                                <!-- Menu: Sub menu ul -->
                                <ul class="sub-menu collapse show" id="dashboard-Components">

                                </ul>
                            </li>
                            <li class="collapsed">
                                <a class="m-link" data-bs-toggle="collapse" data-bs-target="#dashboard-Components" href="#timebasedVote">
                                    <i class="icofont-home fs-5"></i> <span>Time Based Analysis</span></a>
                                <!--                                 Menu: Sub menu ul -->
                                <ul class="sub-menu collapse show" id="dashboard-Components">

                                </ul>
                            </li>
                            <li class="collapsed">
                                <a class="m-link" data-bs-toggle="collapse" data-bs-target="#dashboard-Components" href="#stateAnalysis">
                                    <i class="icofont-home fs-5"></i> <span>Candidate Specific Analysis</span></a>
                                <!-- Menu: Sub menu ul -->
                                <ul class="sub-menu collapse show" id="dashboard-Components">

                                </ul>
                            </li>

                        </ul>
                    </div>
                </div>
            </nav>

            <!--            <div class="align-content-center bg-light" style="padding: 50px">
                            <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>-->



            <div class="align-content-center bg-light" style="margin-top: 10px;">
                <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>

                <section id="winner" style="padding:0px;margin-top: 10px;">
                    <div class="card" style="padding-bottom: 20px;margin-left: 300px;">
                        
                        <div><h3 style="text-align: center; padding: 20px">Winning Candidate</h3></div>
                        <div class="flip-card col-md-3">
                            <div class="flip-card-inner">
                                <div class="flip-card-front">
                                    <div class="text-center align-items-center">
                                        <img src="data:image/png;base64,${WinnerCandidate.imageData}" style="margin-top: 10px;margin-bottom: 10px;max-width: 200px; max-height: 200px;">
                                    <div style="font-size:20px; font-weight: bold">
                                        ${WinnerCandidate.firstName} won the election!!<br>
                                    </div>
                                    <div style="font-size:17px; font-weight: bold">
                                        Party: ${WinnerCandidate.partyName}
                                    </div>
                                </div>
                            </div>
                                    <div class="flip-card-back"><img src="assets/img/17924.jpg" alt="alt" style="width: 320px;
                height: 320px;"/></div>
                        </div>
                    </div>
                    <div class='line' style="color:blue">
                        <h1 style=" text-align: center; padding: 16px;"class='pop-outin'>CONGRATULATIONS</h1>
                    </div>
                                    <div class="confetti col-md-3">
                            <div class="confetti-piece"></div>
                            <div class="confetti-piece"></div>
                            <div class="confetti-piece"></div>
                            <div class="confetti-piece"></div>
                            <div class="confetti-piece"></div>
                            <div class="confetti-piece"></div>
                            <div class="confetti-piece"></div>
                            <div class="confetti-piece"></div>
                            <div class="confetti-piece"></div>
                            <div class="confetti-piece"></div>
                            <div class="confetti-piece"></div>
                            <div class="confetti-piece"></div>
                            <div class="confetti-piece"></div>
                        </div>
                                    <div class="confetti col-md-3" style="margin-left: 800px;">
                            <div class="confetti-piece"></div>
                            <div class="confetti-piece"></div>
                            <div class="confetti-piece"></div>
                            <div class="confetti-piece"></div>
                            <div class="confetti-piece"></div>
                            <div class="confetti-piece"></div>
                            <div class="confetti-piece"></div>
                            <div class="confetti-piece"></div>
                            <div class="confetti-piece"></div>
                            <div class="confetti-piece"></div>
                            <div class="confetti-piece"></div>
                            <div class="confetti-piece"></div>
                            <div class="confetti-piece"></div>
                        </div>
                </div>

                <p></p>
            </section>

            <section id="partyVote">
                <div class="card" style="padding-bottom: 20px;margin-left: 300px;">
                    <div><h3 style="text-align: center; padding: 50px">Party Based Analysis Chart</h3></div>
                    <div class="text-center d-flex align-items-center">
                        <canvas id="lineChart" style="width: 800px"></canvas>
                    </div>
                </div>

                <p></p>
            </section>

            <section id="candidateVote">
                <div class="card" style="padding-bottom: 20px;margin-left: 300px;">
                    <div><h3 class="card-title" style="text-align: center; padding: 50px">Candidate Vote Chart</h3></div>
                    <div class="text-center d-flex align-items-center">
                        <canvas style="width: 800px" id="myChart"></canvas>
                    </div>
                </div>

            </section>

            <section id="stateVote">
                <div class="card" style="padding-bottom: 20px;margin-left: 300px;">
                    <div><h3 style="text-align: center; padding: 50px">State Vote Chart</h3></div>
                    <div class="text-center d-flex align-items-center">
                        <canvas id="pieChart"></canvas>
                    </div>
                </div>
            </section>
            <section id="timebasedVote">
                <div class="card" style="padding-bottom: 20px;margin-left: 300px;">
                    <div><h3 style="text-align: center; padding: 50px">Time Based Analysis Chart</h3></div>
                    <div class="text-center d-flex align-items-center">
                        <canvas id="timeLineChart" style="width: 800px"></canvas>
                    </div>
                </div>
            </section>

            <section id="stateAnalysis">  
                <div class="card" style="padding-bottom: 20px;margin-left: 300px;">
                    <div>
                        <h3 style="text-align: center; padding: 20px">State Analysis Of Particular Candidate</h3>
                        <select class="form-control text-center" id="nameC" onchange="fetchContent('CandidateResult')" style="width: 500px; margin: 0 auto">
                            <option value="">Select Candidate</option>
                            <c:forEach var="results" items="${ResultList}">                            
                                <option value="${results.getFirstName()}">
                                    ${results.getFirstName()} ${results.getLastName()}
                                </option>
                            </c:forEach>
                        </select>
                    </div>
                    <div id="displayResult">

                    </div>
                </div>
            </section>
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
            const times = [];
            <c:forEach items='${TimeList}' var='time'>
            times.push("${time}");
            </c:forEach>
            const btlt = document.getElementById('timeLineChart');
            new Chart(btlt, {
                type: 'line',
                data: {
                    labels: ["6am - 7am", "7am - 8am", "8am - 9pm", "9pm - 10pm", "10am - 11am", "11am - 12pm", "12pm - 1pm", "1pm - 2pm", "2pm - 3pm", "3pm - 4pm", "4pm - 5pm", "5pm - 6pm"],
                    datasets: [{
                            label: 'Number of Votes to States',
                            data: times,
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
        <script>
            const parties = [];
            const countss = [];
            <c:forEach items='${PartyList}' var='party'>
            parties.push("${party.getPartyName()}");
            countss.push("${party.getCount()}");
            </c:forEach>
            const btl = document.getElementById('lineChart');
            new Chart(btl, {
                type: 'bar',
                data: {
                    labels: parties,
                    datasets: [{
                            label: 'Number of Votes to States',
                            data: countss,
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
                    responsive: true,
                    scales: {
                        y: {
                            beginAtZero: true

                        }
                    }
                }
            });
        </script>
    </div>
</body>
