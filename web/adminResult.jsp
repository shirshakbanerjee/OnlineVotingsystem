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
        <title>VOTER LIST</title>
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
        </style>
        <script src="https://code.jquery.com/jquery-3.6.3.js" integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM=" crossorigin="anonymous">
        </script>
        <script>
            function newfetchContent(urls)
            {
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
                                <a class="m-link" data-bs-toggle="collapse" data-bs-target="#dashboard-Components" href="#partyVote">
                                    <i class="icofont-home fs-5"></i> <span>Party Based Analysis</span></a>
                                <!-- Menu: Sub menu ul -->
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


        </tr>
    </table>

    <div class="align-content-center bg-light" style="margin-top: 10px;">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
        <section id="candidateVote" style="padding:0px">
            <div class="card" style="padding-bottom: 20px;margin-left: 300px;margin-top: 10px;">
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
        <section id="partyVote">
            <div class="card" style="padding-bottom: 20px;margin-left: 300px;">
                <div><h3 style="text-align: center; padding: 50px">Party Based Analysis Chart</h3></div>
                <div class="text-center d-flex align-items-center">
                    <canvas id="lineChart" style="width: 800px"></canvas>
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
        type: 'line',
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
