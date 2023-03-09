<%-- 
    Document   : VoterFeedback
    Created on : 03-Mar-2023, 8:54:26 am
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <jsp:include page="menu.jsp"></jsp:include>
        <title>Feedback</title>
        <link rel="shortcut icon" type="image/x-icon" href="assets/img/vote-icon.png">
        <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700" rel="stylesheet">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.1/css/all.css" integrity="sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz" crossorigin="anonymous">
        <style>
            html, body {
                height: 100%;
            }
            body, h1, h3, input {
                padding: 0;
                margin: 0;
                outline: none;
                font-family: Roboto, Arial, sans-serif;
                font-size: 16px;
                color: #666;
            }
            h1, h3 {
                padding: 12px 0;
                font-weight: 400;
            }
            h1 {
                font-size: 28px;
            }
            .main-block, .info {
                display: flex;
                flex-direction: column;
            }
            .main-block {
                justify-content: center;
                width: 100%;
                align-items: center;

                min-height: 100%;
                background: url("assets/img/feedback1.jpg") no-repeat center;
                background-size: cover;
            }
            form {
                width: 30%;
                padding: 20px;
                margin-bottom: 20px;
                border-radius: 5px;
                border: solid 1px #ccc;
                box-shadow: 1px 2px 5px rgba(0,0,0,.31);
                background: #ebebeb;
                opacity: 0.9;
            }
            .info-item {
                width: 100%;
            }
            input {
                width: calc(100% - 57px);
                height: 36px;
                padding-left: 10px;
                margin: 0 0 12px -5px;
                border-radius: 0 5px 5px 0;
                border: solid 1px #cbc9c9;
                box-shadow: 1px 2px 5px rgba(0,0,0,.09);
                background: #fff;
            }
            .icon {
                padding: 9px 15px;
                margin-top: -1px;
                border-radius: 5px 0 0 5px;
                border: solid 0px #cbc9c9;
                background: #666;
                color: #fff;
            }
            input[type=radio] {
                display: none;
            }
            label.radio {
                position: relative;
                display: inline-block;
                text-indent: 32px;
                cursor: pointer;
            }
            label.radio:before {
                content: "";
                position: absolute;
                left: 0;
                width: 18px;
                height: 18px;
                border-radius: 50%;
                border: 0.5px solid #8ebf42;
                background: #fff;
            }
            label.radio:after {
                content: "";
                position: absolute;
                width: 8px;
                height: 4px;
                top: 5px;
                left: 4px;
                border-bottom: 3px solid #8ebf42;
                border-left: 3px solid #8ebf42;
                transform: rotate(-45deg);
                opacity: 0;
            }
            input[type=radio]:checked + label:after {
                opacity: 1;
            }
            textarea {
                width: 99%;
                margin-bottom: 12px;
            }
            button {
                width: 100%;
                padding: 8px;
                border-radius: 5px;
                border: none;
                background: #8ebf42;
                font-size: 14px;
                font-weight: 600;
                color: #fff;
            }
            button:hover {
                background: #82b534;
            }
            .grade-type div {
                display: flex;
                margin: 6px 0;
            }
            @media (min-width: 568px) {
                .info {
                    flex-flow: row wrap;
                    justify-content: space-between;
                }
                .info-item {
                    width: 48%;
                }
            }
        </style>
    </head>
    <body>
        <div class="main-block">
            <h1 style="color: black"><b>Please Rate Us!!</b></h1>
            <form action="https://formspree.io/f/xknabjna" method="POST">
                <div class="info">
                    <div class="info-item">
                        <label class="icon" for="name"><i class="fas fa-user"></i></label>
                        <input type="text" name="name" id="name" placeholder="Name" required/>
                    </div>
                    <div  class="info-item">
                        <label class="icon" for="age"><i class="fas fa-calendar"></i></i></label>
                        <input type="text" name="age" id="age" placeholder="Age" required/>
                    </div>
                    <div  class="info-item">
                        <label class="icon" for="email"><i class="fas fa-envelope"></i></label>
                        <input type="text" name="email" id="email" placeholder="Email" required/>
                    </div>
                    <div  class="info-item">
                        <label class="icon" for="phone"><i class="fas fa-phone"></i></label>
                        <input type="text" name="phone" id="phone" placeholder="Phone" required/>
                    </div>
                </div>
                <div class="grade-type">
                    <h3>Rate Our Website</h3>
                    <div> 
                        <input type="radio" value="Excellent" id="radioOne" name="grade" checked/>
                        <label for="radioOne" class="radio">Excellent</label>
                    </div>
                    <div>
                        <input type="radio" value="Very Good" id="radioTwo" name="grade" />
                        <label for="radioTwo" class="radio">Very Good</label>
                    </div>
                    <div>
                        <input type="radio" value="Good" id="radioThree" name="grade" />
                        <label for="radioThree" class="radio">Good</label>
                    </div>
                    <div>
                        <input type="radio" value="Bad" id="radioFour" name="grade" />
                        <label for="radioFour" class="radio">Bad</label>
                    </div>
                    <div>
                        <input type="radio" value="Very Bad" id="radioFive" name="grade" />
                        <label for="radioFive" class="radio">Very Bad</label>
                    </div>
                </div>
                <h3>Please Comment on Your Rating</h3>
                <textarea rows="4"></textarea>

                <button type="submit" href="landingPage.jsp">Submit</button>    


            </form>
        </div>
    </body>
</html>