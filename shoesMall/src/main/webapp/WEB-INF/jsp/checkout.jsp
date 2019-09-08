<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>  
<!DOCTYPE html>
<html>
<head> 
	<meta charset="utf-8">
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

        <!-- checkout main wrapper start -->
        <div class="checkout-page-wrapper section-padding">
            <div class="container">
                
                <div class="row">
                    <!-- Checkout Billing Details -->
                    <div class="col-lg-6">
                        <div class="checkout-billing-details-wrap">
                            <h5 class="checkout-title">Billing Details</h5>
                            <div class="billing-form-wrap">
                                <form action="#">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="single-input-item">
                                                <label for="f_name" class="required">用户</label>
                                                <input type="text" id="f_name" placeholder="First Name" value="${loginUser.name }" />
                                            </div>
                                        </div>
                                 
                                    </div>

                                    <div class="single-input-item">
                                        <label for="email" class="required">Email邮箱</label>
                                        <input type="email" id="email" placeholder="Email Address" value="${loginUser.email }" />
                                    </div>

                                    <div class="single-input-item">
                                        <label for="com-name">地址</label>
                                        <input type="text" id="com-name" placeholder="" value="${loginUser.address.address}" />
                                    </div>

                                    

                                    <div class="single-input-item">
                                        <label for="phone">Phone</label>
                                        <input type="text" id="phone" placeholder="Phone" value="${loginUser.phone}" />
                                    </div>

                            

                                    <div class="single-input-item">
                                        <label for="ordernote">订单备注</label>
                                        <textarea name="ordernote" id="ordernote" cols="30" rows="3" placeholder="Notes about your order, e.g. special notes for delivery."></textarea>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>

                    <!-- Order Summary Details -->
                    <div class="col-lg-6">
                        <div class="order-summary-details">
                            <h5 class="checkout-title">Your Order Summary</h5>
                            <div class="order-summary-content">
                                <!-- Order Summary Table -->
                                <div class="order-summary-table table-responsive text-center">
                                    <table class="table table-bordered">
                                        <thead>
                                            <tr>
                                                <th><b>商品</b></th>
                                                <th><b>价格</b></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${OrderDetails}" var="o">
                                            <tr>
                                                <td><a href="#">${o.product.name} <strong> × ${o.number}</strong></a>
                                                </td>
                                                <td>${o.number*o.price}</td>
                                            </tr>
                                          </c:forEach>
                                        
                                        </tbody>
                                        <tfoot>
                                            <tr>
                                                <td>小计</td>
                                                <td id="countPrice">${orders[0].countPrice}</td>
                                            </tr>
                                           
                                                
                                        </tfoot>
                                    </table>
                                </div>
                                <!-- Order Payment Method -->
                                <div class="order-payment-method">
                                    <div class="single-payment-method show">
                                        <div class="payment-method-name">
                                            <div class="custom-control custom-radio">
                                                <input type="radio" id="cashon" name="paymentmethod" value="cash" class="custom-control-input" checked />
                                                <label class="custom-control-label" for="cashon">支付宝支付</label>
                                            </div>
                                        </div>
                                        <div class="payment-method-details" data-method="cash">
                                            <p>扫二维码</p>
                                        </div>
                                    </div>
                                 
                                   
                                   
                                    <div class="summary-footer-area">
                                        
                                        <a href="javascript:pay()"> <button type="button"  class="btn btn-sqr">支付</button></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- checkout main wrapper end -->
    </main>

    <!-- Scroll to top start -->
    <div class="scroll-top not-visible">
        <i class="fa fa-angle-up"></i>
    </div>
    <!-- Scroll to Top End -->


    <!-- footer area start -->
    <footer class="black-bg">
        <!-- newsletter area start -->
        <section class="newsletter-area">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <div class="newsletter-wrapper text-center">
                            <h3 class="title text-white">JOIN OUR NEWSLETTER</h3>
                            <form class="newsletter-inner" id="mc-form">
                                <input type="email" class="news-field" id="mc-email" autocomplete="off" placeholder="Enter your email address">
                                <button class="news-btn" id="mc-submit">Subscribe</button>
                            </form>
                            <h6 class="newsletter-subtitle">To get the latest news from us please subscribe your email.</h6>
                            <!-- mailchimp-alerts Start -->
                            <div class="mailchimp-alerts">
                                <div class="mailchimp-submitting"></div><!-- mailchimp-submitting end -->
                                <div class="mailchimp-success"></div><!-- mailchimp-success end -->
                                <div class="mailchimp-error"></div><!-- mailchimp-error end -->
                            </div>
                            <!-- mailchimp-alerts end -->
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- newsletter area end -->
        <div class="footer-widget-area">
            <div class="container">
                <div class="row mtn-30">
                    <div class="col-lg-3 col-sm-6">
                        <div class="footer-widget-item mt-30">
                            <h6 class="widget-title">CUSTOM LINKS</h6>
                            <ul class="usefull-links">
                                <li><a href="#">Privacy Policy</a></li>
                                <li><a href="#">Order Status</a></li>
                                <li><a href="#">Returns & Exchanges</a></li>
                                <li><a href="#">Size Guide</a></li>
                                <li><a href="#">Cart</a></li>
                                <li><a href="#">FAQ</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-3 col-sm-6">
                        <div class="footer-widget-item mt-30">
                            <h6 class="widget-title">PRODUCTS</h6>
                            <ul class="usefull-links">
                                <li><a href="#">Prices drop</a></li>
                                <li><a href="#">New products</a></li>
                                <li><a href="#">Best sales</a></li>
                                <li><a href="#">Contact us</a></li>
                                <li><a href="#">Sitemap</a></li>
                                <li><a href="#">Stores</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-3 col-sm-6">
                        <div class="footer-widget-item mt-30">
                            <h6 class="widget-title">OUR COMPANY</h6>
                            <ul class="usefull-links">
                                <li><a href="#">Delivery</a></li>
                                <li><a href="#">Legal Notice</a></li>
                                <li><a href="#">About us</a></li>
                                <li><a href="#">Secure payment</a></li>
                                <li><a href="#">Contact us</a></li>
                                <li><a href="#">Sitemap</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-3 col-sm-6">
                        <div class="footer-widget-item mt-30">
                            <h6 class="widget-title">YOUR ACCOUNT</h6>
                            <ul class="usefull-links">
                                <li><a href="#">Personal info</a></li>
                                <li><a href="#">Orders</a></li>
                                <li><a href="#">Credit slips</a></li>
                                <li><a href="#">Addresses</a></li>
                                <li><a href="#">Stores</a></li>
                                <li><a href="#">FAQ</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="footer-middle-area">
            <div class="container">
                <div class="row mtn-30">
                    <div class="col-lg-6 col-sm-12">
                        <div class="address-block mt-30">
                            <div class="footer-logo">
                                <a href="index.html">
                                    <img src="assets/img/logo/logo.png" alt="Brand Logo">
                                </a>
                            </div>
                            <address class="address-info d-flex align-items-center">
                                <i class="fa fa-map-marker"></i>
                                <p><span>ADDRESS : </span> No 40 Baria Sreet 15/2 NewYork City, NY, United States.</p>
                            </address>
                        </div>
                    </div>
                    <div class="col-lg-3 col-sm-6">
                        <address class="address-info email mt-30">
                            <i class="fa fa-envelope"></i>
                            <p><span>EMAIL : </span><a href="emailto:demo@yoursite.com">demo@yoursite.com</a></p>
                        </address>
                    </div>
                    <div class="col-lg-3 col-sm-6">
                        <address class="address-info email mt-30">
                            <i class="fa fa-phone"></i>
                            <p><span>PHONE : </span><a href="tel:+880123456789">+880123456789</a></p>
                        </address>
                    </div>
                </div>
            </div>
        </div>
        <div class="footer-bottom-area text-center">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <div class="payment-method-list">
                            <img src="assets/img/payment-2.png" alt="payment method">
                        </div>
                        <div class="footer-link">
                            <a href="#">SITE MAP</a>
                            <a href="#">SEARCH TERMS</a>
                            <a href="#">ADVANCED SEARCH</a>
                            <a href="#">ORDERS AND RETURNS</a>
                            <a href="#">CONTACT US</a>
                        </div>
                        <p class="copyright">
                            Copyright <a href="http://www.17sucai.com/">Pullman</a>. All Rights Reserved
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </footer>
    <!-- footer area end -->
	<jsp:include page="common/js.jsp"></jsp:include>
	
	<script type="text/javascript">
	function pay(){
			var price = $('#countPrice').text();
			var url = "../pay/index.jsp?pay="+price;
			window.location.href =  url ;
		}
	
	</script>

</body>
</body>
</html>