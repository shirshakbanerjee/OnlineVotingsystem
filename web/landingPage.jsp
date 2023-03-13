<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta content="width=device-width, initial-scale=1.0" name="viewport">

        <title>ONLINE VOTING SYSTEM </title>
        <meta content="" name="description">
        <meta content="" name="keywords">

        <!-- Favicons -->
        <!--<link href="assets/img/favicon1.png" rel="icon">-->
        <!--        <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">-->
        <link rel="shortcut icon" type="image/x-icon" href="assets/img/vote-icon.png">


        <!-- Google Fonts -->
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Roboto:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

        <!-- Vendor CSS Files -->
        <link href="assets/vendor/aos/aos.css" rel="stylesheet">
        <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
        <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
        <link href="assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
        <link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

        <!-- Template Main CSS File -->
        <link href="assets/css/style.css" rel="stylesheet">

        <!-- =======================================================
        * Template Name: BizLand - v3.10.0
        * Template URL: https://bootstrapmade.com/bizland-bootstrap-business-template/
        * Author: BootstrapMade.com
        * License: https://bootstrapmade.com/license/
        ======================================================== -->
    </head>
    <header>
        <jsp:include page="menu.jsp"></jsp:include>
    </header>
    <script>
        function fetchContent(urls) {

//                alert(selectedId);
            $.ajax({
                url: urls,
                success: function (responseText) {
                    //                    alert(responseText);
                    $("#" + 'landingPage').html(responseText);
                }
            });
        }
        function content(method)
                {
            $.ajax({
                url: method,
                                success: function (responseText) {
                                    $("#landingPage").html(responseText);
                            }
                    });
        }
    </script>

    <div id="landingPage">
        <body>
            <!-- ======= Top Bar ======= -->
            <!--  <section id="topbar" class="d-flex align-items-center">
                <div class="container d-flex justify-content-center justify-content-md-between">
                  <div class="contact-info d-flex align-items-center">
                    <i class="bi bi-envelope d-flex align-items-center"><a href="mailto:contact@example.com">contact@example.com</a></i>
                    <i class="bi bi-phone d-flex align-items-center ms-4"><span>+1 5589 55488 55</span></i>
                  </div>
                  <div class="social-links d-none d-md-flex align-items-center">
                    <a href="#" class="twitter"><i class="bi bi-twitter"></i></a>
                    <a href="#" class="facebook"><i class="bi bi-facebook"></i></a>
                    <a href="#" class="instagram"><i class="bi bi-instagram"></i></a>
                    <a href="#" class="linkedin"><i class="bi bi-linkedin"></i></i></a>
                  </div>
                </div>-->


            <!-- ======= Header ======= -->



            <!-- ======= Hero Section ======= -->
            <section id="hero" class="d-flex align-items-center">
                <div class="container" data-aos="zoom-out" data-aos-delay="100">
                    <h1>Welcome </h1>     
                </div>

            </section><!-- End Hero -->

            <main id="main">

                <!-- ======= Featured Services Section ======= -->
                <section id="featured-services" class="featured-services">
                    <div class="container" data-aos="fade-up">

                        <div class="row">
                            <div class="col-md-6 col-lg-3 d-flex align-items-stretch mb-5 mb-lg-0">
                                <div class="icon-box" data-aos="fade-up" data-aos-delay="400">
                                    <div class="icon"><i class="bx bx-world"></i></div>
                                    <h4 class="title"><a href=""></a></h4>
                                    <p class="description">
                                        "All of us may have been created equal. But we'll never actually be equal until we all vote. So don't wait." 
                                    </p>
                                </div>
                            </div>

                            <div class="col-md-6 col-lg-3 d-flex align-items-stretch mb-5 mb-lg-0">
                                <div class="icon-box" data-aos="fade-up" data-aos-delay="400">
                                    <div class="icon"><i class="bx bx-world"></i></div>
                                    <h4 class="title"><a href=""></a></h4>
                                    <p class="description">
                                        "The vote is precious. It is the most powerful non-violent tool we have in a democratic society, and we must use it."
                                    </p>
                                </div>
                            </div>


                            <div class="col-md-6 col-lg-3 d-flex align-items-stretch mb-5 mb-lg-0">
                                <div class="icon-box" data-aos="fade-up" data-aos-delay="400">
                                    <div class="icon"><i class="bx bx-world"></i></div>
                                    <h4 class="title"><a href=""></a></h4>
                                    <p class="description">
                                        "Our political leaders will know our priorities only if we tell them, again and again, and if those priorities begin to show up in the polls."
                                    </p>
                                </div>
                            </div>
                            <div class="col-md-6 col-lg-3 d-flex align-items-stretch mb-5 mb-lg-0">
                                <div class="icon-box" data-aos="fade-up" data-aos-delay="400">
                                    <div class="icon"><i class="bx bx-world"></i></div>
                                    <h4 class="title"><a href=""></a></h4>
                                    <p class="description">
                                        "Democracy is about voting and it?s about a majority vote. And it?s time that we started exercising the Democratic process."
                                    </p>
                                </div>
                            </div>


                        </div>

                    </div>
                </section><!-- End Featured Services Section -->
                <section id="about" class="about section-bg">
                    <div class="container" data-aos="fade-up">

                        <div class="section-title">
                            <h2>About</h2>


                        </div>

                        <div class="row">
                            <div class="col-lg-6" data-aos="fade-right" data-aos-delay="100">
                                <img src="assets/img/votePicz.jpg" class="img-fluid" alt="">
                            </div>
                            <div class="col-lg-6 pt-4 pt-lg-0 content d-flex flex-column justify-content-center" data-aos="fade-up" data-aos-delay="100">


                                <ul>
                                    <li>
                                        <i class="bx bx-store-alt"></i>
                                        <div>

                                            <p>Voting is a process that takes place in various forms, depending on the country and its election system. In most cases, citizens are required to register to vote before they can participate in an election. Once registered, they are given the opportunity to cast their vote on the day of the election or during an early voting period.</p>
                                        </div>
                                    </li>
                                    <li>
                                        <i class="bx bx-images"></i>
                                        <div>

                                            <p>Voting is a fundamental right that is essential for democracy. It is a process that allows citizens to express their opinions and participate in the selection of government officials. The right to vote is a privilege that many people in the world do not have, and it is important to exercise this right to ensure that our voices are heard.</p>
                                        </div>
                                    </li>
                                </ul>

                            </div>
                        </div>

                    </div>
                </section><!-- End About Section -->

                <!-- ======= Skills Section ======= -->
                <section id="skills" class="skills">
                    <div class="container" data-aos="fade-up">

                        <div class="row skills-content">

                            <div class="col-lg-6">

                                <div class="progress">
                                    <span class="skill">EFFICIENCY <i class="val">100%</i></span>
                                    <div class="progress-bar-wrap">
                                        <div class="progress-bar" role="progressbar" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100"></div>
                                    </div>
                                </div>

                                <div class="progress">
                                    <span class="skill">TIME SAVING <i class="val">90%</i></span>
                                    <div class="progress-bar-wrap">
                                        <div class="progress-bar" role="progressbar" aria-valuenow="90" aria-valuemin="0" aria-valuemax="100"></div>
                                    </div>
                                </div>



                                <div class="col-lg-6">

                                    <div class="progress">
                                        <span class="skill">ADVANCE <i class="val">80%</i></span>
                                        <div class="progress-bar-wrap">
                                            <div class="progress-bar" role="progressbar" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100"></div>
                                        </div>
                                    </div>

                                    <div class="progress">
                                        <span class="skill">RELIABLE <i class="val">75%</i></span>
                                        <div class="progress-bar-wrap">
                                            <div class="progress-bar" role="progressbar" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100"></div>
                                        </div>
                                    </div>

                                </div>

                            </div>

                        </div>

                    </div>
                </section><!-- End Skills Section -->

                <!-- ======= Counts Section ======= -->
                <section id="counts" class="counts">
                    <div class="container" data-aos="fade-up">

                        <div class="row">

                            <div class="col-lg-3 col-md-6">
                                <div class="count-box">
                                    <i class="bi bi-emoji-smile"></i>
                                    <span data-purecounter-start="0" data-purecounter-end="6" data-purecounter-duration="1" class="purecounter"></span>
                                    <p>VOTE STARTS(Hrs)</p>
                                </div>
                            </div>

                            <div class="col-lg-3 col-md-6 mt-5 mt-md-0">
                                <div class="count-box">
                                    <i class="bi bi-journal-richtext"></i>
                                    <span data-purecounter-start="0" data-purecounter-end="18" data-purecounter-duration="1" class="purecounter"></span>
                                    <p>VOTING END(Hrs)</p>
                                </div>
                            </div>

                            <div class="col-lg-3 col-md-6 mt-5 mt-lg-0">
                                <div class="count-box">
                                    <i class="bi bi-headset"></i>
                                    <span data-purecounter-start="0" data-purecounter-end="12" data-purecounter-duration="1" class="purecounter"></span>
                                    <p>Hours Of VOTING</p>
                                </div>
                            </div>

                            <div class="col-lg-3 col-md-6 mt-5 mt-lg-0">
                                <div class="count-box">
                                    <i class="bi bi-people"></i>
                                    <span data-purecounter-start="0" data-purecounter-end="2023" data-purecounter-duration="1" class="purecounter"></span>
                                    <p>STARTED IN</p>
                                </div>
                            </div>

                        </div>

                    </div>
                </section><!-- End Counts Section -->



                <!-- ======= Services Section ======= -->
                <section id="services" class="services">
                    <div class="container" data-aos="fade-up">

                        <!--                <div class="section-title">
                                            <h2>Services</h2>
                                            <h3>Check our <span>Services</span></h3>
                                            <p>We can create simple and user friendly website for various organization who wants to take action democratically </p>
                                        </div>-->

                        <!--                <div class="row">
                                            <div class="col-lg-4 col-md-6 d-flex align-items-stretch" data-aos="zoom-in" data-aos-delay="100">
                                                <div class="icon-box">
                                                    <div class="icon"><i class="bx bxl-dribbble"></i></div>
                                                    <h4><a href="">Lorem Ipsum</a></h4>
                                                    <p>Voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi</p>
                                                </div>
                                            </div>
                        
                                            <div class="col-lg-4 col-md-6 d-flex align-items-stretch mt-4 mt-md-0" data-aos="zoom-in" data-aos-delay="200">
                                                <div class="icon-box">
                                                    <div class="icon"><i class="bx bx-file"></i></div>
                                                    <h4><a href="">Sed ut perspiciatis</a></h4>
                                                    <p>Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore</p>
                                                </div>
                                            </div>
                        
                                            <div class="col-lg-4 col-md-6 d-flex align-items-stretch mt-4 mt-lg-0" data-aos="zoom-in" data-aos-delay="300">
                                                <div class="icon-box">
                                                    <div class="icon"><i class="bx bx-tachometer"></i></div>
                                                    <h4><a href="">Magni Dolores</a></h4>
                                                    <p>Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia</p>
                                                </div>
                                            </div>
                        
                                            <div class="col-lg-4 col-md-6 d-flex align-items-stretch mt-4" data-aos="zoom-in" data-aos-delay="100">
                                                <div class="icon-box">
                                                    <div class="icon"><i class="bx bx-world"></i></div>
                                                    <h4><a href="">Nemo Enim</a></h4>
                                                    <p>At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis</p>
                                                </div>
                                            </div>-->
                        <!--
                                            <div class="col-lg-4 col-md-6 d-flex align-items-stretch mt-4" data-aos="zoom-in" data-aos-delay="200">
                                                <div class="icon-box">
                                                    <div class="icon"><i class="bx bx-slideshow"></i></div>
                                                    <h4><a href="">Dele cardo</a></h4>
                                                    <p>Quis consequatur saepe eligendi voluptatem consequatur dolor consequuntur</p>
                                                </div>
                                            </div>
                        
                                            <div class="col-lg-4 col-md-6 d-flex align-items-stretch mt-4" data-aos="zoom-in" data-aos-delay="300">
                                                <div class="icon-box">
                                                    <div class="icon"><i class="bx bx-arch"></i></div>
                                                    <h4><a href="">Divera don</a></h4>
                                                    <p>Modi nostrum vel laborum. Porro fugit error sit minus sapiente sit aspernatur</p>
                                                </div>
                                            </div>-->
                        <!--
                                        </div>
                        
                                    </div>-->
                </section><!-- End Services Section -->

                <!-- ======= Testimonials Section ======= -->
                <section id="testimonials" class="testimonials" style="height: 400px; width: 100%;">
                    <div class="container" data-aos="zoom-in">

                        <div class="testimonials-slider swiper" data-aos="fade-up" data-aos-delay="100">
                            <div class="swiper-wrapper">

                                <div class="swiper-slide">
                                    <div class="swiper-slide">
                                        <div class="testimonial-item">
                                            <img src="assets/img/nitish.jpeg" class="testimonial-img" alt="">
                                            <h3>Nitish Kumar Sah</h3>
                                            <h4>Developer</h4>
                                        </div>
                                    </div>

                                </div> 
                               

                                <div class="swiper-slide">
                                    <div class="testimonial-item">
                                        <img src="assets/img/ankit.jpeg" class="testimonial-img" alt="">
                                        <h3>Ankit Raj</h3>
                                        <h4>Developer</h4>

                                    </div>
                                </div><!-- End testimonial item -->
                                <div class="swiper-slide">
                                    <div class="testimonial-item">
                                        <img src="assets/img/shouvik.jpeg" class="testimonial-img" alt="">
                                        <h3>Shouvik Samadder</h3>
                                        <h4>Developer</h4>

                                    </div>
                                </div><!-- End testimonial item -->

                                <!-- End testimonial item -->

                                <div class="swiper-slide">
                                    <div class="testimonial-item">
                                        <img src="assets/img/priyanka.jpeg" class="testimonial-img" alt="">
                                        <h3>Priyanka Jiaswal</h3>
                                        <h4>Developer</h4>

                                    </div>
                                </div><!-- End testimonial item -->

                                <div class="swiper-slide">
                                    <div class="testimonial-item">
                                        <img src="assets/img/shirshak.jpeg" class="testimonial-img" alt="">
                                        <h3>Shirshak Banerjee</h3>
                                        <h4>Developer</h4>

                                    </div>
                                </div>
                                <div class="swiper-slide">
                                    <div class="testimonial-item">
                                        <img src="assets/img/anjali.jpeg" class="testimonial-img" alt="">
                                        <h3>Anjali Kumari</h3>
                                        <h4>Developer</h4>

                                    </div><!-- comment -->
                                </div>

                            </div>
                            <div class="swiper-pagination"></div>
                        </div>

                    </div>
                </section><!-- End Testimonials Section -->

                <!-- ======= Portfolio Section ======= -->
                <!--        <section id="portfolio" class="portfolio">
                            <div class="container" data-aos="fade-up">
                
                                <div class="section-title">
                                    <h2>Portfolio</h2>
                                    <h3>Check our <span>Portfolio</span></h3>
                                    <p>Ut possimus qui ut temporibus culpa velit eveniet modi omnis est adipisci expedita at voluptas atque vitae autem.</p>
                                </div>
                
                                <div class="row" data-aos="fade-up" data-aos-delay="100">
                                    <div class="col-lg-12 d-flex justify-content-center">
                                        <ul id="portfolio-flters">
                                            <li data-filter="*" class="filter-active">All</li>
                                            <li data-filter=".filter-app">App</li>
                                            <li data-filter=".filter-card">Card</li>
                                            <li data-filter=".filter-web">Web</li>
                                        </ul>
                                    </div>
                                </div>
                
                                <div class="row portfolio-container" data-aos="fade-up" data-aos-delay="200">
                
                                    <div class="col-lg-4 col-md-6 portfolio-item filter-app">
                                        <img src="assets/img/portfolio/portfolio-1.jpg" class="img-fluid" alt="">
                                        <div class="portfolio-info">
                                            <h4>App 1</h4>
                                            <p>App</p>
                                            <a href="assets/img/portfolio/portfolio-1.jpg" data-gallery="portfolioGallery" class="portfolio-lightbox preview-link" title="App 1"><i class="bx bx-plus"></i></a>
                                            <a href="portfolio-details.html" class="details-link" title="More Details"><i class="bx bx-link"></i></a>
                                        </div>
                                    </div>
                
                                    <div class="col-lg-4 col-md-6 portfolio-item filter-web">
                                        <img src="assets/img/portfolio/portfolio-2.jpg" class="img-fluid" alt="">
                                        <div class="portfolio-info">
                                            <h4>Web 3</h4>
                                            <p>Web</p>
                                            <a href="assets/img/portfolio/portfolio-2.jpg" data-gallery="portfolioGallery" class="portfolio-lightbox preview-link" title="Web 3"><i class="bx bx-plus"></i></a>
                                            <a href="portfolio-details.html" class="details-link" title="More Details"><i class="bx bx-link"></i></a>
                                        </div>
                                    </div>
                
                                    <div class="col-lg-4 col-md-6 portfolio-item filter-app">
                                        <img src="assets/img/portfolio/portfolio-3.jpg" class="img-fluid" alt="">
                                        <div class="portfolio-info">
                                            <h4>App 2</h4>
                                            <p>App</p>
                                            <a href="assets/img/portfolio/portfolio-3.jpg" data-gallery="portfolioGallery" class="portfolio-lightbox preview-link" title="App 2"><i class="bx bx-plus"></i></a>
                                            <a href="portfolio-details.html" class="details-link" title="More Details"><i class="bx bx-link"></i></a>
                                        </div>
                                    </div>
                
                                    <div class="col-lg-4 col-md-6 portfolio-item filter-card">
                                        <img src="assets/img/portfolio/portfolio-4.jpg" class="img-fluid" alt="">
                                        <div class="portfolio-info">
                                            <h4>Card 2</h4>
                                            <p>Card</p>
                                            <a href="assets/img/portfolio/portfolio-4.jpg" data-gallery="portfolioGallery" class="portfolio-lightbox preview-link" title="Card 2"><i class="bx bx-plus"></i></a>
                                            <a href="portfolio-details.html" class="details-link" title="More Details"><i class="bx bx-link"></i></a>
                                        </div>
                                    </div>
                
                                    <div class="col-lg-4 col-md-6 portfolio-item filter-web">
                                        <img src="assets/img/portfolio/portfolio-5.jpg" class="img-fluid" alt="">
                                        <div class="portfolio-info">
                                            <h4>Web 2</h4>
                                            <p>Web</p>
                                            <a href="assets/img/portfolio/portfolio-5.jpg" data-gallery="portfolioGallery" class="portfolio-lightbox preview-link" title="Web 2"><i class="bx bx-plus"></i></a>
                                            <a href="portfolio-details.html" class="details-link" title="More Details"><i class="bx bx-link"></i></a>
                                        </div>
                                    </div>
                
                                    <div class="col-lg-4 col-md-6 portfolio-item filter-app">
                                        <img src="assets/img/portfolio/portfolio-6.jpg" class="img-fluid" alt="">
                                        <div class="portfolio-info">
                                            <h4>App 3</h4>
                                            <p>App</p>
                                            <a href="assets/img/portfolio/portfolio-6.jpg" data-gallery="portfolioGallery" class="portfolio-lightbox preview-link" title="App 3"><i class="bx bx-plus"></i></a>
                                            <a href="portfolio-details.html" class="details-link" title="More Details"><i class="bx bx-link"></i></a>
                                        </div>
                                    </div>
                
                                    <div class="col-lg-4 col-md-6 portfolio-item filter-card">
                                        <img src="assets/img/portfolio/portfolio-7.jpg" class="img-fluid" alt="">
                                        <div class="portfolio-info">
                                            <h4>Card 1</h4>
                                            <p>Card</p>
                                            <a href="assets/img/portfolio/portfolio-7.jpg" data-gallery="portfolioGallery" class="portfolio-lightbox preview-link" title="Card 1"><i class="bx bx-plus"></i></a>
                                            <a href="portfolio-details.html" class="details-link" title="More Details"><i class="bx bx-link"></i></a>
                                        </div>
                                    </div>
                
                                    <div class="col-lg-4 col-md-6 portfolio-item filter-card">
                                        <img src="assets/img/portfolio/portfolio-8.jpg" class="img-fluid" alt="">
                                        <div class="portfolio-info">
                                            <h4>Card 3</h4>
                                            <p>Card</p>
                                            <a href="assets/img/portfolio/portfolio-8.jpg" data-gallery="portfolioGallery" class="portfolio-lightbox preview-link" title="Card 3"><i class="bx bx-plus"></i></a>
                                            <a href="portfolio-details.html" class="details-link" title="More Details"><i class="bx bx-link"></i></a>
                                        </div>
                                    </div>
                
                                    <div class="col-lg-4 col-md-6 portfolio-item filter-web">
                                        <img src="assets/img/portfolio/portfolio-9.jpg" class="img-fluid" alt="">
                                        <div class="portfolio-info">
                                            <h4>Web 3</h4>
                                            <p>Web</p>
                                            <a href="assets/img/portfolio/portfolio-9.jpg" data-gallery="portfolioGallery" class="portfolio-lightbox preview-link" title="Web 3"><i class="bx bx-plus"></i></a>
                                            <a href="portfolio-details.html" class="details-link" title="More Details"><i class="bx bx-link"></i></a>
                                        </div>
                                    </div>
                
                                </div>
                
                            </div>
                        </section> End Portfolio Section -->

                <!-- ======= Team Section ======= -->
                <section id="team" class="team section-bg">
                    <div class="container" data-aos="fade-up">

                        <div class="section-title">
                            <h2></h2>
                            <h3> <span></span></h3>
                        </div>

                        <div class="row">

                            <div class="col-lg-3 col-md-6 d-flex align-items-stretch" data-aos="fade-up" data-aos-delay="100">
                                <div class="member">
                                    <div class="member-img">
                                        <img src="assets/img/bjp.png" class="img-fluid" alt="">
                                        <div class="social">
                                            <a href=""><i class="bi bi-twitter"></i></a>
                                            <a href="https://www.facebook.com/BJP4India"><i class="bi bi-facebook"></i></a>

                                        </div>
                                    </div>
                                    <div class="member-info">
                                        <h4>BJP</h4>
                                        <span>Bhartiya Janta Party</span>
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-3 col-md-6 d-flex align-items-stretch" data-aos="fade-up" data-aos-delay="200">
                                <div class="member">
                                    <div class="member-img">
                                        <img src="assets/img/aap.jpg" class="img-fluid" alt="">
                                        <div class="social">
                                            <a href=""><i class="bi bi-twitter"></i></a>
                                            <a href="https://www.facebook.com/AamAadmiPart"><i class="bi bi-facebook"></i></a>

                                        </div>
                                    </div>
                                    <div class="member-info">
                                        <h4>AAP</h4>
                                        <span>Aam Aadmi Party</span>
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-3 col-md-6 d-flex align-items-stretch" data-aos="fade-up" data-aos-delay="300">
                                <div class="member">
                                    <div class="member-img">
                                        <img src="assets/img/inc.png" class="img-fluid" alt="">
                                        <div class="social">
                                            <a href=""><i class="bi bi-twitter"></i></a>
                                            <a href="https://www.facebook.com/congressfans/"><i class="bi bi-facebook"></i></a>

                                        </div>
                                    </div>
                                    <div class="member-info">
                                        <h4>INC</h4>
                                        <span>Indian Natinoal Congress</span>
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-3 col-md-6 d-flex align-items-stretch" data-aos="fade-up" data-aos-delay="400">
                                <div class="member">
                                    <div class="member-img">
                                        <img src="assets/img/tmc.jpg" class="img-fluid" alt="">
                                        <div class="social">
                                            <a href=""><i class="bi bi-twitter"></i></a>
                                            <a href="https://www.facebook.com/AITCofficial"><i class="bi bi-facebook"></i></a>

                                        </div>
                                    </div>
                                    <div class="member-info">
                                        <h4>TMC</h4>
                                        <span>Trinamool Congress</span>
                                    </div>
                                </div>
                            </div>

                        </div>

                    </div>
                </section><!-- End Team Section -->



                <!-- ======= Frequently Asked Questions Section ======= -->
                <!--        <section id="faq" class="faq section-bg">
                            <div class="container" data-aos="fade-up">
                
                                <div class="section-title">
                                    <h2>F.A.Q</h2>
                                    <h3>Frequently Asked <span>Questions</span></h3>
                                    <p>Ut possimus qui ut temporibus culpa velit eveniet modi omnis est adipisci expedita at voluptas atque vitae autem.</p>
                                </div>
                
                                <div class="row justify-content-center">
                                    <div class="col-xl-10">
                                        <ul class="faq-list">
                
                                            <li>
                                                <div data-bs-toggle="collapse" class="collapsed question" href="#faq1">Non consectetur a erat nam at lectus urna duis? <i class="bi bi-chevron-down icon-show"></i><i class="bi bi-chevron-up icon-close"></i></div>
                                                <div id="faq1" class="collapse" data-bs-parent=".faq-list">
                                                    <p>
                                                        Feugiat pretium nibh ipsum consequat. Tempus iaculis urna id volutpat lacus laoreet non curabitur gravida. Venenatis lectus magna fringilla urna porttitor rhoncus dolor purus non.
                                                    </p>
                                                </div>
                                            </li>
                
                                            <li>
                                                <div data-bs-toggle="collapse" href="#faq2" class="collapsed question">Feugiat scelerisque varius morbi enim nunc faucibus a pellentesque? <i class="bi bi-chevron-down icon-show"></i><i class="bi bi-chevron-up icon-close"></i></div>
                                                <div id="faq2" class="collapse" data-bs-parent=".faq-list">
                                                    <p>
                                                        Dolor sit amet consectetur adipiscing elit pellentesque habitant morbi. Id interdum velit laoreet id donec ultrices. Fringilla phasellus faucibus scelerisque eleifend donec pretium. Est pellentesque elit ullamcorper dignissim. Mauris ultrices eros in cursus turpis massa tincidunt dui.
                                                    </p>
                                                </div>
                                            </li>
                
                                            <li>
                                                <div data-bs-toggle="collapse" href="#faq3" class="collapsed question">Dolor sit amet consectetur adipiscing elit pellentesque habitant morbi? <i class="bi bi-chevron-down icon-show"></i><i class="bi bi-chevron-up icon-close"></i></div>
                                                <div id="faq3" class="collapse" data-bs-parent=".faq-list">
                                                    <p>
                                                        Eleifend mi in nulla posuere sollicitudin aliquam ultrices sagittis orci. Faucibus pulvinar elementum integer enim. Sem nulla pharetra diam sit amet nisl suscipit. Rutrum tellus pellentesque eu tincidunt. Lectus urna duis convallis convallis tellus. Urna molestie at elementum eu facilisis sed odio morbi quis
                                                    </p>
                                                </div>
                                            </li>
                
                                            <li>
                                                <div data-bs-toggle="collapse" href="#faq4" class="collapsed question">Ac odio tempor orci dapibus. Aliquam eleifend mi in nulla? <i class="bi bi-chevron-down icon-show"></i><i class="bi bi-chevron-up icon-close"></i></div>
                                                <div id="faq4" class="collapse" data-bs-parent=".faq-list">
                                                    <p>
                                                        Dolor sit amet consectetur adipiscing elit pellentesque habitant morbi. Id interdum velit laoreet id donec ultrices. Fringilla phasellus faucibus scelerisque eleifend donec pretium. Est pellentesque elit ullamcorper dignissim. Mauris ultrices eros in cursus turpis massa tincidunt dui.
                                                    </p>
                                                </div>
                                            </li>
                
                                            <li>
                                                <div data-bs-toggle="collapse" href="#faq5" class="collapsed question">Tempus quam pellentesque nec nam aliquam sem et tortor consequat? <i class="bi bi-chevron-down icon-show"></i><i class="bi bi-chevron-up icon-close"></i></div>
                                                <div id="faq5" class="collapse" data-bs-parent=".faq-list">
                                                    <p>
                                                        Molestie a iaculis at erat pellentesque adipiscing commodo. Dignissim suspendisse in est ante in. Nunc vel risus commodo viverra maecenas accumsan. Sit amet nisl suscipit adipiscing bibendum est. Purus gravida quis blandit turpis cursus in
                                                    </p>
                                                </div>
                                            </li>
                
                                            <li>
                                               
                                            </li>
                
                                        </ul>
                                    </div>
                                </div>
                
                            </div>
                        </section> End Frequently Asked Questions Section -->

                <!-- ======= Contact Section ======= -->
                <section id="contact" class="contact">
                    <div class="container" data-aos="fade-up">

                        <div class="section-title">

                            <h3><span>Contact Us</span></h3>

                        </div>

                        <div class="row" data-aos="fade-up" data-aos-delay="100">
                            <div class="col-lg-6">
                                <div class="info-box mb-4">
                                    <i class="bx bx-map"></i>
                                    <h3>Our Address</h3>
                                    <p>Kolkata</p>
                                </div>
                            </div>

                            <div class="col-lg-3 col-md-6">
                                <div class="info-box  mb-4">
                                    <i class="bx bx-envelope"></i>
                                    <h3>Email Us</h3>
                                    <p>nitishsah02@example.com</p>
                                </div>
                            </div>

                            <div class="col-lg-3 col-md-6">
                                <div class="info-box  mb-4">
                                    <i class="bx bx-phone-call"></i>
                                    <h3>Call Us</h3>
                                    <p>8777258104</p>
                                </div>
                            </div>

                        </div>

                        <div class="row" data-aos="fade-up" data-aos-delay="100">

                            <div class="col-lg-6 ">
                                <iframe class="mb-4 mb-lg-0"  src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3684.103998600543!2d88.42524581446229!3d22.575213338565156!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3a02750014d7f12f%3A0xba88c52b0fa7f529!2sExavalu!5e0!3m2!1sen!2sin!4v1677083105279!5m2!1sen!2sin" frameborder="0" style="border:0; width: 100%; height: 384px;" allowfullscreen></iframe>
                            </div>

                            <div class="col-lg-6">
                                <form action="https://formspree.io/f/xknabjna" method="POST">
                                    <div class="row g-3">
                                        <div class="col-12 col-sm-6">
                                            <input name="name" type="text" class="form-control bg-light border-0" placeholder="Your Name" style="height: 55px;" required>
                                        </div>
                                        <div class="col-12 col-sm-6">
                                            <input name="email" type="email" class="form-control bg-light border-0" placeholder="Your Email" style="height: 55px;" required>
                                        </div>
                                        <div class="col-12">
                                            <input name="subject" type="text" class="form-control bg-light border-0" placeholder="Subject" style="height: 55px;" required>
                                        </div>
                                        <div class="col-12">
                                            <textarea name="message" class="form-control bg-light border-0" rows="5" placeholder="Message" required></textarea>
                                        </div>
                                        <div class="col-12">
                                            <button class="btn btn-primary w-100 py-3" type="submit">Send Message</button>

                                        </div>

                                    </div>
                                </form>

                            </div>
                            </section><!-- End Contact Section -->

                            </main><!-- End #main -->

                            <!-- ======= Footer ======= -->


                            <div id="preloader"></div>
                            <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

                            <!-- Vendor JS Files -->
                            <script src="https://cpwebassets.codepen.io/assets/common/stopExecutionOnTimeout-1b93190375e9ccc259df3a57c1abc0e64599724ae30d7ea4c6877eb615f89387.js"></script>
                            <script src="assets/vendor/purecounter/purecounter_vanilla.js"></script>
                            <script src="assets/vendor/aos/aos.js"></script>
                            <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
                            <script src="assets/vendor/glightbox/js/glightbox.min.js"></script>
                            <script src="assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
                            <script src="assets/vendor/swiper/swiper-bundle.min.js"></script>
                            <script src="assets/vendor/waypoints/noframework.waypoints.js"></script>
                            <script src="assets/vendor/php-email-form/validate.js"></script>

                            <!-- Template Main JS File -->
                            <script src="assets/js/main.js"></script>

                            </body>
                        </div>

                        </html>