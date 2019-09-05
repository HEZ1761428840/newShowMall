<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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

        <!-- page main wrapper start -->
        <div class="shop-main-wrapper section-padding pb-0">
            <div class="container">
                <div class="row">
                    <!-- product details wrapper start -->
                    <div class="col-lg-12 order-1 order-lg-2">
                        <!-- product details inner end -->
                        <div class="product-details-inner">
                            <div class="row">
                                <div class="col-lg-5">
                                    <div class="product-large-slider">
                                        <c:forEach items="${product.images}" var="image">
                                        	 <div class="pro-large-img img-zoom">
                                            	<img src="img/${image.imagePath}" alt="product-details"  style="height: 420px"/>
                                      		  </div>
                                        </c:forEach>
                                       
                                    </div>
                                    <div class="pro-nav slick-row-10 slick-arrow-style">
                                    	<c:forEach items="${product.images}" var="image">
                                        	 <div class="pro-nav-thumb">
                                            	<img src="img/${image.imagePath}" alt="product-details" />
                                       		 </div>
                                        </c:forEach>
                                    </div>
                                </div>
                                <div class="col-lg-7">
                                    <div class="product-details-des">
                                        <h3 class="product-name">${product.name}</h3>
                                        <div class="ratings d-flex">
											<c:forEach begin="1" end="${product.score}">
											  <span><i class="fa fa-star"></i></span>
											</c:forEach>     
                                            <div class="pro-review">
                                                <span>1 Reviews</span>
                                            </div>
                                        </div>
                                        <div class="price-box">
                                            <span class="price-regular">$${product.price}</span>
                                        </div>
                                        <div class="availability">
                                            <i class="fa fa-check-circle"></i>
                                            <span>200 in stock</span>
                                        </div>
                                        <p class="pro-desc">${product.descs}</p>
                                        <div class="quantity-cart-box d-flex align-items-center">
                                            <h6 class="option-title">qty:</h6>
                                            <div class="quantity">
                                                <div class="pro-qty"><input type="text" value="1"></div>
                                            </div>
                                            <div class="action_link">
                                                <a class="btn btn-cart2" href="#">Add To Cart</a>
                                            </div>
                                        </div>
                                        <div class="pro-size">
                                            <h6 class="option-title">size :</h6>
                                            <select class="nice-select">
                                            	<c:forEach items="${product.productSizes}" var="c">
                                            	<option>${c.size}</option>
                                            	</c:forEach>
                                                
                                            </select>
                                            
                                        </div>
                                        <div class="color-option">
                                            <h6 class="option-title">color :</h6>
                                            <ul class="color-categories">
                                                <li>
                                                    <a class="c-lightblue" href="#" title="LightSteelblue"></a>
                                                </li>
                                                <li>
                                                    <a class="c-darktan" href="#" title="Darktan"></a>
                                                </li>
                                                <li>
                                                    <a class="c-grey" href="#" title="Grey"></a>
                                                </li>
                                                <li>
                                                    <a class="c-brown" href="#" title="Brown"></a>
                                                </li>
                                            </ul>
                                        </div>
                                        <div class="useful-links">
                                            <a href="#" data-toggle="tooltip" title="Compare"><i
                                                class="fa fa-refresh"></i>compare</a>
                                            <a href="#" data-toggle="tooltip" title="Wishlist"><i
                                                class="fa fa-heart-o"></i>wishlist</a>
                                        </div>
                                        <div class="like-icon">
                                            <a class="facebook" href="#"><i class="fa fa-facebook"></i>like</a>
                                            <a class="twitter" href="#"><i class="fa fa-twitter"></i>tweet</a>
                                            <a class="pinterest" href="#"><i class="fa fa-pinterest"></i>save</a>
                                            <a class="google" href="#"><i class="fa fa-google-plus"></i>share</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- product details inner end -->

                        <!-- product details reviews start -->
                        <div class="product-details-reviews section-padding pb-0">
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="product-review-info">
                                        <ul class="nav review-tab">
                                            <li>
                                                <a class="active" data-toggle="tab" href="#tab_one">description</a>
                                            </li>
                                            <li>
                                                <a data-toggle="tab" href="#tab_two">information</a>
                                            </li>
                                            <li>
                                                <a data-toggle="tab" href="#tab_three">reviews (1)</a>
                                            </li>
                                        </ul>
                                        <div class="tab-content reviews-tab">
                                            <div class="tab-pane fade show active" id="tab_one">
                                                <div class="tab-one">
                                                    <p>${product.descs}
                                                    </p>
                                                </div>
                                            </div>
                                            <div class="tab-pane fade" id="tab_two">
                                                <table class="table table-bordered">
                                                    <tbody>
                                                        <tr>
                                                            <td>color</td>
                                                            <td>black, blue, red</td>
                                                        </tr>
                                                        <tr>
                                                            <td>size</td>
                                                            <td>L, M, S</td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                            <div class="tab-pane fade" id="tab_three">
                                                <form action="#" class="review-form">
                                                    <h5>1 review for <span>Chaz Kangeroo</span></h5>
                                                    <div class="total-reviews">
                                                        <div class="rev-avatar">
                                                            <img src="assets/img/about/avatar.jpg" alt="">
                                                        </div>
                                                        <div class="review-box">
                                                            <div class="ratings">
                                                                <span class="good"><i class="fa fa-star"></i></span>
                                                                <span class="good"><i class="fa fa-star"></i></span>
                                                                <span class="good"><i class="fa fa-star"></i></span>
                                                                <span class="good"><i class="fa fa-star"></i></span>
                                                                <span><i class="fa fa-star"></i></span>
                                                            </div>
                                                            <div class="post-author">
                                                                <p><span>admin -</span> 30 Mar, 2019</p>
                                                            </div>
                                                            <p>Aliquam fringilla euismod risus ac bibendum. Sed sit
                                                                amet sem varius ante feugiat lacinia. Nunc ipsum nulla,
                                                                vulputate ut venenatis vitae, malesuada ut mi. Quisque
                                                                iaculis, dui congue placerat pretium, augue erat
                                                                accumsan lacus</p>
                                                        </div>
                                                    </div>
                                                    <div class="form-group row">
                                                        <div class="col">
                                                            <label class="col-form-label"><span class="text-danger">*</span>
                                                                Your Name</label>
                                                            <input type="text" class="form-control" required>
                                                        </div>
                                                    </div>
                                                    <div class="form-group row">
                                                        <div class="col">
                                                            <label class="col-form-label"><span class="text-danger">*</span>
                                                                Your Email</label>
                                                            <input type="email" class="form-control" required>
                                                        </div>
                                                    </div>
                                                    <div class="form-group row">
                                                        <div class="col">
                                                            <label class="col-form-label"><span class="text-danger">*</span>
                                                                Your Review</label>
                                                            <textarea class="form-control" required></textarea>
                                                            <div class="help-block pt-10"><span
                                                                    class="text-danger">Note:</span>
                                                                HTML is not translated!
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="form-group row">
                                                        <div class="col">
                                                            <label class="col-form-label"><span class="text-danger">*</span>
                                                                Rating</label>
                                                            &nbsp;&nbsp;&nbsp; Bad&nbsp;
                                                            <input type="radio" value="1" name="rating">
                                                            &nbsp;
                                                            <input type="radio" value="2" name="rating">
                                                            &nbsp;
                                                            <input type="radio" value="3" name="rating">
                                                            &nbsp;
                                                            <input type="radio" value="4" name="rating">
                                                            &nbsp;
                                                            <input type="radio" value="5" name="rating" checked>
                                                            &nbsp;Good
                                                        </div>
                                                    </div>
                                                    <div class="buttons">
                                                        <button class="btn btn-sqr" type="submit">Continue</button>
                                                    </div>
                                                </form> <!-- end of review-form -->
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- product details reviews end -->
                    </div>
                    <!-- product details wrapper end -->
                </div>
            </div>
        </div>
        <!-- page main wrapper end -->

        <!-- Related product area start -->
        <section class="product-gallery section-padding">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <div class="section-title text-center">
                            <h3 class="title">RELATED PRODUCT</h3>
                            <h4 class="sub-title">Investigationes demonstraverunt lectores legere me lius quod ii legunt saepius claritas est etiam processus dynamicus, qui sequitur mutationem.</h4>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-12">
                        <div class="product-carousel--4 slick-row-5 slick-arrow-style">
                            <!-- product single item start -->
                            <div class="product-item">
                                <div class="product-thumb">
                                    <a href="product-details.html">
                                        <img src="assets/img/product/product-1.jpg" alt="product thumb">
                                    </a>
                                    <div class="button-group">
                                        <a href="wishlist.html" data-toggle="tooltip" title="Add to Wishlist"><i class="fa fa-heart-o"></i></a>
                                        <a href="#" data-toggle="modal" data-target="#quick_view"><span data-toggle="tooltip"  title="Quick View"><i class="fa fa-eye"></i></span></a>
                                    </div>
                                    <div class="product-label">
                                        <span>new</span>
                                    </div>
                                    <div class="discount-label">
                                        <span>-10% Off</span>
                                    </div>
                                </div>
                                <div class="product-content">
                                    <div class="product-caption">
                                        <h6 class="product-name">
                                            <a href="product-details.html">Quickiin Mens shoes</a>
                                        </h6>
                                        <div class="price-box">
                                            <span class="price-old"><del>$90.00</del></span>
                                            <span class="price-regular">$70.00</span>
                                        </div>
                                        <a class="add-to-cart" href="cart.html"><i class="fa fa-shopping-cart"></i></a>
                                    </div>
                                    <div class="ratings">
                                        <span><i class="fa fa-star"></i></span>
                                        <span><i class="fa fa-star"></i></span>
                                        <span><i class="fa fa-star"></i></span>
                                        <span><i class="fa fa-star"></i></span>
                                        <span><i class="fa fa-star"></i></span>
                                    </div>
                                </div>
                            </div>
                            <!-- product single item end -->

                            <!-- product single item start -->
                            <div class="product-item">
                                <div class="product-thumb">
                                    <a href="product-details.html">
                                        <img src="assets/img/product/product-2.jpg" alt="product thumb">
                                    </a>
                                    <div class="button-group">
                                        <a href="wishlist.html" data-toggle="tooltip" title="Add to Wishlist"><i class="fa fa-heart-o"></i></a>
                                        <a href="#" data-toggle="modal" data-target="#quick_view"><span data-toggle="tooltip"  title="Quick View"><i class="fa fa-eye"></i></span></a>
                                    </div>
                                    <div class="product-label">
                                        <span>new</span>
                                    </div>
                                </div>
                                <div class="product-content">
                                    <div class="product-caption">
                                        <h6 class="product-name">
                                            <a href="product-details.html">Womens High Hills</a>
                                        </h6>
                                        <div class="price-box">
                                            <span class="price-old"><del>$80.00</del></span>
                                            <span class="price-regular">$60.00</span>
                                        </div>
                                        <a class="add-to-cart" href="cart.html"><i class="fa fa-shopping-cart"></i></a>
                                    </div>
                                    <div class="ratings">
                                        <span><i class="fa fa-star"></i></span>
                                        <span><i class="fa fa-star"></i></span>
                                        <span><i class="fa fa-star"></i></span>
                                        <span><i class="fa fa-star"></i></span>
                                        <span><i class="fa fa-star"></i></span>
                                    </div>
                                </div>
                            </div>
                            <!-- product single item end -->

                            <!-- product single item start -->
                            <div class="product-item">
                                <div class="product-thumb">
                                    <a href="product-details.html">
                                        <img src="assets/img/product/product-3.jpg" alt="product thumb">
                                    </a>
                                    <div class="button-group">
                                        <a href="wishlist.html" data-toggle="tooltip" title="Add to Wishlist"><i class="fa fa-heart-o"></i></a>
                                        <a href="#" data-toggle="modal" data-target="#quick_view"><span data-toggle="tooltip"  title="Quick View"><i class="fa fa-eye"></i></span></a>
                                    </div>
                                    <div class="product-label">
                                        <span>new</span>
                                    </div>
                                </div>
                                <div class="product-content">
                                    <div class="product-caption">
                                        <h6 class="product-name">
                                            <a href="product-details.html">Leather Mens slippers</a>
                                        </h6>
                                        <div class="price-box">
                                            <span class="price-old"><del>$60.00</del></span>
                                            <span class="price-regular">$50.00</span>
                                        </div>
                                        <a class="add-to-cart" href="cart.html"><i class="fa fa-shopping-cart"></i></a>
                                    </div>
                                    <div class="ratings">
                                        <span><i class="fa fa-star"></i></span>
                                        <span><i class="fa fa-star"></i></span>
                                        <span><i class="fa fa-star"></i></span>
                                        <span><i class="fa fa-star"></i></span>
                                        <span><i class="fa fa-star"></i></span>
                                    </div>
                                </div>
                            </div>
                            <!-- product single item end -->

                            <!-- product single item start -->
                            <div class="product-item">
                                <div class="product-thumb">
                                    <a href="product-details.html">
                                        <img src="assets/img/product/product-4.jpg" alt="product thumb">
                                    </a>
                                    <div class="button-group">
                                        <a href="wishlist.html" data-toggle="tooltip" title="Add to Wishlist"><i class="fa fa-heart-o"></i></a>
                                        <a href="#" data-toggle="modal" data-target="#quick_view"><span data-toggle="tooltip"  title="Quick View"><i class="fa fa-eye"></i></span></a>
                                    </div>
                                    <div class="product-label">
                                        <span>new</span>
                                    </div>
                                    <div class="discount-label">
                                        <span>-15% Off</span>
                                    </div>
                                </div>
                                <div class="product-content">
                                    <div class="product-caption">
                                        <h6 class="product-name">
                                            <a href="product-details.html">Rexpo Womens shoes</a>
                                        </h6>
                                        <div class="price-box">
                                            <span class="price-old"><del>$100.00</del></span>
                                            <span class="price-regular">$85.00</span>
                                        </div>
                                        <a class="add-to-cart" href="cart.html"><i class="fa fa-shopping-cart"></i></a>
                                    </div>
                                    <div class="ratings">
                                        <span><i class="fa fa-star"></i></span>
                                        <span><i class="fa fa-star"></i></span>
                                        <span><i class="fa fa-star"></i></span>
                                        <span><i class="fa fa-star"></i></span>
                                        <span><i class="fa fa-star"></i></span>
                                    </div>
                                </div>
                            </div>
                            <!-- product single item end -->

                            <!-- product single item start -->
                            <div class="product-item">
                                <div class="product-thumb">
                                    <a href="product-details.html">
                                        <img src="assets/img/product/product-5.jpg" alt="product thumb">
                                    </a>
                                    <div class="button-group">
                                        <a href="wishlist.html" data-toggle="tooltip" title="Add to Wishlist"><i class="fa fa-heart-o"></i></a>
                                        <a href="#" data-toggle="modal" data-target="#quick_view"><span data-toggle="tooltip"  title="Quick View"><i class="fa fa-eye"></i></span></a>
                                    </div>
                                    <div class="product-label">
                                        <span>new</span>
                                    </div>
                                </div>
                                <div class="product-content">
                                    <div class="product-caption">
                                        <h6 class="product-name">
                                            <a href="product-details.html">Primitive Mens shoes</a>
                                        </h6>
                                        <div class="price-box">
                                            <span class="price-old"><del>$75.00</del></span>
                                            <span class="price-regular">$55.00</span>
                                        </div>
                                        <a class="add-to-cart" href="cart.html"><i class="fa fa-shopping-cart"></i></a>
                                    </div>
                                    <div class="ratings">
                                        <span><i class="fa fa-star"></i></span>
                                        <span><i class="fa fa-star"></i></span>
                                        <span><i class="fa fa-star"></i></span>
                                        <span><i class="fa fa-star"></i></span>
                                        <span><i class="fa fa-star"></i></span>
                                    </div>
                                </div>
                            </div>
                            <!-- product single item end -->
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Related product area end -->
    </main>

    <!-- Scroll to top start -->
    <div class="scroll-top not-visible">
        <i class="fa fa-angle-up"></i>
    </div>
    <!-- Scroll to Top End -->


   <jsp:include page="common/footer.jsp"></jsp:include>



    <!-- Quick view modal start -->
    <div class="modal" id="quick_view">
        <div class="modal-dialog modal-lg modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
                <div class="modal-body">
                    <!-- product details inner end -->
                    <div class="product-details-inner">
                        <div class="row">
                            <div class="col-lg-5">
                                <div class="product-large-slider">
                                    <div class="pro-large-img">
                                        <img src="assets/img/product/product-details-img1.jpg" alt="product-details" />
                                    </div>
                                    <div class="pro-large-img">
                                        <img src="assets/img/product/product-details-img2.jpg" alt="product-details" />
                                    </div>
                                    <div class="pro-large-img">
                                        <img src="assets/img/product/product-details-img3.jpg" alt="product-details" />
                                    </div>
                                    <div class="pro-large-img">
                                        <img src="assets/img/product/product-details-img4.jpg" alt="product-details" />
                                    </div>
                                </div>
                                <div class="pro-nav slick-row-10 slick-arrow-style">
                                    <div class="pro-nav-thumb">
                                        <img src="assets/img/product/product-details-img1.jpg" alt="product-details" />
                                    </div>
                                    <div class="pro-nav-thumb">
                                        <img src="assets/img/product/product-details-img2.jpg" alt="product-details" />
                                    </div>
                                    <div class="pro-nav-thumb">
                                        <img src="assets/img/product/product-details-img3.jpg" alt="product-details" />
                                    </div>
                                    <div class="pro-nav-thumb">
                                        <img src="assets/img/product/product-details-img4.jpg" alt="product-details" />
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-7">
                                <div class="product-details-des">
                                    <h3 class="product-name">Premium Mens Sports Lather Keds</h3>
                                    <div class="ratings d-flex">
                                        <span><i class="fa fa-star"></i></span>
                                        <span><i class="fa fa-star"></i></span>
                                        <span><i class="fa fa-star"></i></span>
                                        <span><i class="fa fa-star"></i></span>
                                        <span><i class="fa fa-star"></i></span>
                                        <div class="pro-review">
                                            <span>1 Reviews</span>
                                        </div>
                                    </div>
                                    <div class="price-box">
                                        <span class="price-old"><del>$90.00</del></span>
                                        <span class="price-regular">$70.00</span>
                                    </div>
                                    <h5 class="offer-text"><strong>Hurry up</strong>! offer ends in:</h5>
                                    <div class="product-countdown" data-countdown="2019/09/20"></div>
                                    <p class="pro-desc">Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy
                                        eirmod tempor invidunt ut labore et dolore magna aliquyam erat.</p>
                                    <div class="quantity-cart-box d-flex align-items-center">
                                        <h6 class="option-title">qty:</h6>
                                        <div class="quantity">
                                            <div class="pro-qty"><input type="text" value="1"></div>
                                        </div>
                                        <div class="action_link">
                                            <a class="btn btn-cart2" href="#">Add To Cart</a>
                                        </div>
                                    </div>
                                    <div class="useful-links">
                                        <a href="#" data-toggle="tooltip" title="Compare"><i
                                        class="fa fa-refresh"></i>compare</a>
                                        <a href="#" data-toggle="tooltip" title="Wishlist"><i
                                        class="fa fa-heart-o"></i>wishlist</a>
                                    </div>
                                    <div class="like-icon">
                                        <a class="facebook" href="#"><i class="fa fa-facebook"></i>like</a>
                                        <a class="twitter" href="#"><i class="fa fa-twitter"></i>tweet</a>
                                        <a class="pinterest" href="#"><i class="fa fa-pinterest"></i>save</a>
                                        <a class="google" href="#"><i class="fa fa-google-plus"></i>share</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div> <!-- product details inner end -->
                </div>
            </div>
        </div>
    </div>
  <jsp:include page="common/js.jsp"></jsp:include>
</body>

</html>