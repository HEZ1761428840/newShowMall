<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Pullman - eCommerce Bootstrap 4 Template</title>
    <meta name="robots" content="noindex, follow" />
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Favicon -->
    <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.ico">

    <!-- CSS
	============================================ -->
    <!-- google fonts -->
    <link href="https://fonts.googleapis.com/css?family=Nunito+Sans:300,300i,400,400i,600,700,800,900%7CPoppins:300,400,500,600,700,800,900" rel="stylesheet">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="assets/css/vendor/bootstrap.min.css">
    <!-- Font-awesome CSS -->
    <link rel="stylesheet" href="assets/css/vendor/font-awesome.min.css">
    <!-- Slick slider css -->
    <link rel="stylesheet" href="assets/css/plugins/slick.min.css">
    <!-- animate css -->
    <link rel="stylesheet" href="assets/css/plugins/animate.css">
    <!-- Nice Select css -->
    <link rel="stylesheet" href="assets/css/plugins/nice-select.css">
    <!-- jquery UI css -->
    <link rel="stylesheet" href="assets/css/plugins/jqueryui.min.css">
    <!-- main style css -->
    <link rel="stylesheet" href="assets/css/style.css">

</head>

<body>

	<jsp:include page="common/header.jsp"></jsp:include>

   <jsp:include page="common/main.jsp"></jsp:include>
        <!-- blog main wrapper start -->
        <div class="blog-main-wrapper section-padding">
            <div class="container">
                <div class="row">
                    <div class="col-lg-3 order-2">
                        <aside class="blog-sidebar-wrapper">
                            <div class="blog-sidebar">
                                <h5 class="title">search</h5>
                                <div class="sidebar-serch-form">
                                    <form action="#">
                                        <input type="text" class="search-field" placeholder="search here">
                                        <button type="submit" class="search-btn"><i class="fa fa-search"></i></button>
                                    </form>
                                </div>
                            </div> <!-- single sidebar end -->
                            <div class="blog-sidebar">
                                <h5 class="title">categories</h5>
                                <ul class="blog-archive blog-category">
                                    <li><a href="#">Shoes (10)</a></li>
                                    <li><a href="#">fashion (08)</a></li>
                                    <li><a href="#">handbag (07)</a></li>
                                    <li><a href="#">Jewelry (14)</a></li>
                                    <li><a href="#">Kids (10)</a></li>
                                </ul>
                            </div> <!-- single sidebar end -->
                            <div class="blog-sidebar">
                                <h5 class="title">Blog Archives</h5>
                                <ul class="blog-archive">
                                    <li><a href="#">January (10)</a></li>
                                    <li><a href="#">February (08)</a></li>
                                    <li><a href="#">March (07)</a></li>
                                    <li><a href="#">April (14)</a></li>
                                    <li><a href="#">May (10)</a></li>
                                </ul>
                            </div> <!-- single sidebar end -->
                            <div class="blog-sidebar">
                                <h5 class="title">recent post</h5>
                                <div class="recent-post">
                                    <div class="recent-post-item">
                                        <figure class="product-thumb">
                                            <a href="blog-details.html">
                                                <img src="assets/img/blog/blog-1.jpg" alt="blog image">
                                            </a>
                                        </figure>
                                        <div class="recent-post-description">
                                            <div class="product-name">
                                                <h6><a href="blog-details.html">Auctor gravida enim</a></h6>
                                                <p>Mar 10 2019</p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="recent-post-item">
                                        <figure class="product-thumb">
                                            <a href="blog-details.html">
                                                <img src="assets/img/blog/blog-2.jpg" alt="blog image">
                                            </a>
                                        </figure>
                                        <div class="recent-post-description">
                                            <div class="product-name">
                                                <h6><a href="blog-details.html">gravida auctor dnim</a></h6>
                                                <p>Apr 18 2019</p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="recent-post-item">
                                        <figure class="product-thumb">
                                            <a href="blog-details.html">
                                                <img src="assets/img/blog/blog-3.jpg" alt="blog image">
                                            </a>
                                        </figure>
                                        <div class="recent-post-description">
                                            <div class="product-name">
                                                <h6><a href="blog-details.html">enim auctor gravida</a></h6>
                                                <p>Jun 14 2019</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div> <!-- single sidebar end -->
                            <div class="blog-sidebar">
                                <h5 class="title">Tags</h5>
                                <ul class="blog-tags">
                                    <li><a href="#">Shoes</a></li>
                                    <li><a href="#">Fashion</a></li>
                                    <li><a href="#">Bags</a></li>
                                    <li><a href="#">Watch</a></li>
                                    <li><a href="#">Phone</a></li>
                                    <li><a href="#">Kids</a></li>
                                </ul>
                            </div> <!-- single sidebar end -->
                        </aside>
                    </div>
                    <div class="col-lg-9 order-1">
                        <div class="blog-item-wrapper">
                            <!-- blog item wrapper end -->
                            <div class="row mbn-30">
                                <div class="col-md-6">
                                    <!-- blog post item start -->
                                    <div class="blog-post-item d-block mb-30">
                                        <div class="blog-thumb w-100">
                                            <a href="blog-details.html">
                                                <img src="assets/img/blog/blog-1.jpg" alt="blog thumb">
                                            </a>
                                        </div>
                                        <div class="blog-content w-100 pl-0 mt-20">
                                            <h6 class="blog-title">
                                                <a href="blog-details.html">This is First Post XipBlog</a>
                                            </h6>
                                            <div class="blog-meta">
                                                <span><i class="fa fa-calendar"></i>Aug 05, 2019</span>
                                                <span><i class="fa fa-user"></i>Admin</span>
                                            </div>
                                            <p class="blog-desc">Lorem Ipsum is simply dummy text of the printing and typesetting industry. ...</p>
                                            <a class="btn read-more" href="blog-details.html">Read More</a>
                                        </div>
                                    </div>
                                    <!-- blog post item end -->
                                </div>
                                <div class="col-md-6">
                                    <!-- blog post item start -->
                                    <div class="blog-post-item d-block mb-30">
                                        <div class="blog-thumb w-100">
                                            <div class="blog-carousel-2 slick-row-5 slick-dot-style">
                                                <div class="blog-single-slide">
                                                    <a href="blog-details.html">
                                                        <img src="assets/img/blog/blog-2.jpg" alt="blog image">
                                                    </a>
                                                </div>
                                                <div class="blog-single-slide">
                                                    <a href="blog-details.html">
                                                        <img src="assets/img/blog/blog-3.jpg" alt="blog image">
                                                    </a>
                                                </div>
                                                <div class="blog-single-slide">
                                                    <a href="blog-details.html">
                                                        <img src="assets/img/blog/blog-4.jpg" alt="blog image">
                                                    </a>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="blog-content w-100 pl-0 mt-20">
                                            <h6 class="blog-title">
                                                <a href="blog-details.html">This is Second Post XipBlog</a>
                                            </h6>
                                            <div class="blog-meta">
                                                <span><i class="fa fa-calendar"></i>May 10, 2019</span>
                                                <span><i class="fa fa-user"></i>Admin</span>
                                            </div>
                                            <p class="blog-desc">Lorem Ipsum is simply dummy text of the printing and typesetting industry. ...</p>
                                            <a class="btn read-more" href="blog-details.html">Read More</a>
                                        </div>
                                    </div>
                                    <!-- blog post item end -->
                                </div>
                                <div class="col-md-6">
                                    <!-- blog post item start -->
                                    <div class="blog-post-item d-block mb-30">
                                        <div class="blog-thumb embed-responsive embed-responsive-16by9 w-100">
                                            <iframe src="https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/501298839&color=%23ff5500&auto_play=false&hide_related=true&show_comments=false&show_user=true&show_reposts=false&show_teaser=true&visual=true"></iframe>
                                        </div>
                                        <div class="blog-content w-100 pl-0 mt-20">
                                            <h6 class="blog-title">
                                                <a href="blog-details.html">This is Third Post XipBlog</a>
                                            </h6>
                                            <div class="blog-meta">
                                                <span><i class="fa fa-calendar"></i>Aug 05, 2019</span>
                                                <span><i class="fa fa-user"></i>Admin</span>
                                            </div>
                                            <p class="blog-desc">Lorem Ipsum is simply dummy text of the printing and typesetting industry. ...</p>
                                            <a class="btn read-more" href="blog-details.html">Read More</a>
                                        </div>
                                    </div>
                                    <!-- blog post item end -->
                                </div>
                                <div class="col-md-6">
                                    <!-- blog post item start -->
                                    <div class="blog-post-item d-block mb-30">
                                        <div class="blog-thumb embed-responsive embed-responsive-16by9 w-100">
                                            <iframe src="https://www.youtube.com/embed/WeA7edXsU40" allow="autoplay; encrypted-media" allowfullscreen></iframe>
                                        </div>
                                        <div class="blog-content w-100 pl-0 mt-20">
                                            <h6 class="blog-title">
                                                <a href="blog-details.html">This is Fourth Post XipBlog</a>
                                            </h6>
                                            <div class="blog-meta">
                                                <span><i class="fa fa-calendar"></i>Aug 05, 2019</span>
                                                <span><i class="fa fa-user"></i>Admin</span>
                                            </div>
                                            <p class="blog-desc">Lorem Ipsum is simply dummy text of the printing and typesetting industry. ...</p>
                                            <a class="btn read-more" href="blog-details.html">Read More</a>
                                        </div>
                                    </div>
                                    <!-- blog post item end -->
                                </div>
                                <div class="col-md-6">
                                    <!-- blog post item start -->
                                    <div class="blog-post-item d-block mb-30">
                                        <div class="blog-thumb w-100">
                                            <a href="blog-details.html">
                                                <img src="assets/img/blog/blog-3.jpg" alt="blog thumb">
                                            </a>
                                        </div>
                                        <div class="blog-content w-100 pl-0 mt-20">
                                            <h6 class="blog-title">
                                                <a href="blog-details.html">This is fifth Post XipBlog</a>
                                            </h6>
                                            <div class="blog-meta">
                                                <span><i class="fa fa-calendar"></i>Aug 05, 2019</span>
                                                <span><i class="fa fa-user"></i>Admin</span>
                                            </div>
                                            <p class="blog-desc">Lorem Ipsum is simply dummy text of the printing and typesetting industry. ...</p>
                                            <a class="btn read-more" href="blog-details.html">Read More</a>
                                        </div>
                                    </div>
                                    <!-- blog post item end -->
                                </div>
                                <div class="col-md-6">
                                    <!-- blog post item start -->
                                    <div class="blog-post-item d-block mb-30">
                                        <div class="blog-thumb w-100">
                                            <a href="blog-details.html">
                                                <img src="assets/img/blog/blog-4.jpg" alt="blog thumb">
                                            </a>
                                        </div>
                                        <div class="blog-content w-100 pl-0 mt-20">
                                            <h6 class="blog-title">
                                                <a href="blog-details.html">This is Seventh Post XipBlog</a>
                                            </h6>
                                            <div class="blog-meta">
                                                <span><i class="fa fa-calendar"></i>Aug 05, 2019</span>
                                                <span><i class="fa fa-user"></i>Admin</span>
                                            </div>
                                            <p class="blog-desc">Lorem Ipsum is simply dummy text of the printing and typesetting industry. ...</p>
                                            <a class="btn read-more" href="blog-details.html">Read More</a>
                                        </div>
                                    </div>
                                    <!-- blog post item end -->
                                </div>
                            </div>
                            <!-- blog item wrapper end -->

                            <!-- start pagination area -->
                            <div class="paginatoin-area shadow-bg text-center">
                                <ul class="pagination-box">
                                    <li><a class="previous" href="#"><i class="fa fa-angle-left"></i></a></li>
                                    <li class="active"><a href="#">1</a></li>
                                    <li><a href="#">2</a></li>
                                    <li><a href="#">3</a></li>
                                    <li><a class="next" href="#"><i class="fa fa-angle-right"></i></a></li>
                                </ul>
                            </div>
                            <!-- end pagination area -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- blog main wrapper end -->
    </main>

    <!-- Scroll to top start -->
    <div class="scroll-top not-visible">
        <i class="fa fa-angle-up"></i>
    </div>
    <!-- Scroll to Top End -->


<jsp:include page="common/footer.jsp"></jsp:include>

   <jsp:include page="common/js.jsp"></jsp:include>
</body>
</html>