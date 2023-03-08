<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    
    <head>
        <link href="assets/css/resultNotDeclare.css" rel="stylesheet" type="text/css">
        <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
        <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
        <link href="assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
        <link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">
        <link rel="shortcut icon" type="image/x-icon" href="assets/img/vote-icon.png">
        <meta name="viewport" content="width=device-width,initial-scale=1.0">
        <title>Coming Soon</title>
    <nav><button class="btn btn-secondary" ><a href="landingPage.jsp" style="color: white">Back</a></button></nav>
    </head>
    <body>
        <div class="container" >            

            <div class="waviy" style="-webkit-text-stroke: 2px black;">
                <span style="--i:1">R</span>
                <span style="--i:2">E</span>
                <span style="--i:3">S</span>
                <span style="--i:4">U</span>
                <span style="--i:5">L</span>  
                <span style="--i:6">T</span>
                <br>
                <span style="--i:7">C</span>
                <span style="--i:8">O</span>
                <span style="--i:9">M</span>
                <span style="--i:10">E</span>
                <span style="--i:10">S</span>
                <br>
                <span style="--i:10">I</span>
                <span style="--i:10">N</span>
                <span style="--i:10".E</span>
                    <span style="--i:10">.</span>

                    <span style="--i:10">.</span>

            </div>

            <div class="launch-time" >
                <div>
                    <p id="days" style="-webkit-text-stroke: 2px black;"><b>00</b></p>
                    <span style="color:ghostwhite">
                        <b>Days</b>
                    </span>
                </div>

                <div>
                    <p id="hours" style="-webkit-text-stroke: 2px black;"><b>00</b></p>
                    <span style="color:ghostwhite">
                        <b>HOURS</b>
                    </span>

                </div>

                <div>
                    <p id="minutes" style="-webkit-text-stroke: 2px black;"><b>00</b></p>
                    <span style="color:ghostwhite">
                        <b>DAYS</b>
                    </span>

                </div>

                <div>
                    <p id="seconds" style="-webkit-text-stroke: 2px black;"><b>00</b></p>
                    <span style="color:ghostwhite">
                        <b>SECONDS</b>
                    </span>

                </div>
            </div>       

        </div>
        <img src="assets/img/rocket1.png" class="rocket">
    </body>
    
    <style>
            @import url('https://fonts.googleapis.com/css2?family=Alfa+Slab+One&display=swap');
            * {
                padding: 0;
                margin: 0;
                box-sizing: border-box;
            }

            body {
                background-color:  #151719;
                height: 100%;
/*                display: flex;*/
                justify-content: center;
                align-items: center;
                min-height: 100vh;
            }
            .waviy {
                
                position: relative;
                -webkit-box-reflect: below -20px linear-gradient(transparent, rgba(0,0,0,.2));
                font-size: 60px;
            }
            
            .waviy span {
                font-family: 'Alfa Slab One', cursive;
                position: relative;
                display: inline-block;
                color: yellow;
                text-transform: uppercase;
                animation: waviy 1s infinite;
                animation-delay: calc(.1s * var(--i));

            }
            @keyframes waviy {
                0%,40%,100% {
                    transform: translateY(0)
                }
                20% {
                    transform: translateY(-20px)
                }
            }
        </style>

    <script>
        var countDownDate = new Date("MAR 04, 2023 00:00:00").getTime();
        var x = setInterval(function () {
            var now = new Date().getTime();
            var distance = countDownDate - now;
            var days = Math.floor(distance / (1000 * 60 * 60 * 24));
            var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
            var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
            var seconds = Math.floor((distance % (1000 * 60)) / 1000);
            document.getElementById("days").innerHTML = days;
            document.getElementById("hours").innerHTML = hours;
            document.getElementById("minutes").innerHTML = minutes;
            document.getElementById("seconds").innerHTML = seconds;
            if (distance < 0) {
                clearInterval(x);
                document.getElementById("days").innerHTML = "00";
                document.getElementById("hours").innerHTML = "00";
                document.getElementById("minutes").innerHTML = "00";
                document.getElementById("seconds").innerHTML = "00";
            }
        }, 1000);
    </script>

</html>