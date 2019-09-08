<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 

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

    <!-- offcanvas search form start -->
    <div class="offcanvas-search-wrapper">
        <div class="offcanvas-search-inner">
            <div class="offcanvas-close">
                <i class="fa fa-close"></i>
            </div>
            <div class="container">
                <div class="offcanvas-search-box">
                    <form class="d-flex bdr-bottom w-100">
                        <input type="text" placeholder="Search entire storage here...">
                        <button class="search-btn"><i class="fa fa-search"></i>search</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <!-- offcanvas search form end -->

    <main>
        <!-- breadcrumb area start -->
        <div class="breadcrumb-area breadcrumb-img bg-img" data-bg="assets/img/banner/shop.jpg">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <div class="breadcrumb-wrap">
                            <nav aria-label="breadcrumb">
                                <h3 class="breadcrumb-title">MY ACCOUNT</h3>
                                <ul class="breadcrumb justify-content-center">
                                    <li class="breadcrumb-item"><a href="index"><i class="fa fa-home"></i></a></li>
                                    <li class="breadcrumb-item active" aria-current="page">My Account</li>
                                </ul>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- breadcrumb area end -->

        <!-- my account wrapper start -->
        <div class="my-account-wrapper section-padding">
            <div class="container">
                <div class="section-bg-color">
                    <div class="row">
                        <div class="col-lg-12">
                            <!-- My Account Page Start -->
                            <div class="myaccount-page-wrapper">
                                <!-- My Account Tab Menu Start -->
                                <div class="row">
                                    <div class="col-lg-3 col-md-4">
                                        <div class="myaccount-tab-menu nav" role="tablist">
                                            <a href="#dashboad" class="active" data-toggle="tab"><i class="fa fa-dashboard"></i>
                                                仪表板</a>
                                            <a href="#orders" data-toggle="tab"><i class="fa fa-cart-arrow-down"></i>
                                                订单</a>
                                           
                                            <a href="#payment-method" data-toggle="tab"><i class="fa fa-credit-card"></i>
                                                支付方式
                                                </a>
                                            <a href="#address-edit" data-toggle="tab"><i class="fa fa-map-marker"></i>
                                                地址</a>
                                            <a href="#account-info" data-toggle="tab"><i class="fa fa-user"></i> 
                                                账户详细资料</a>
                                            <a href="tologin"><i class="fa fa-sign-out"></i> 退出</a>
                                        </div>
                                    </div>
                                    <!-- My Account Tab Menu End -->

                                    <!-- My Account Tab Content Start -->
                                    <div class="col-lg-9 col-md-8">
                                        <div class="tab-content" id="myaccountContent">
                                            <!-- Single Tab Content Start -->
                                            <div class="tab-pane fade show active" id="dashboad" role="tabpanel">
                                                <div class="myaccount-content">
                                                    <h5>仪表板</h5>
                                                    <div class="welcome">
                                                        <p>${loginUser==null? 'Hello, Erik Jhonson' : 'Hello,'.concat(loginUser.name)}
                                                            </p>
                                                    </div>
                                                    <p class="mb-0">从你的账户仪表板。您可以很容易地检查和查看您最近的订单，管理您的发货和账单地址，并编辑您的密码和帐户细节。</p>
                                                </div>
                                            </div>
                                            <!-- Single Tab Content End -->

                                            <!-- Single Tab Content Start -->
                                            <div class="tab-pane fade" id="orders" role="tabpanel">
                                                <div class="myaccount-content">
                                                    <h5>订单表</h5>
                                                    <div class="myaccount-table table-responsive text-center">
                                                        <table class="table table-bordered">
                                                            <thead class="thead-light">
                                                                <tr>
                                                                    <th>订单编号</th>
                                                                    <th>下单时间</th>
                                                                    <th>状态</th>
                                                                    <th>总额</th>
                                                                    <th>操作</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                            	<c:forEach items="${orderLists }" var="order">
                                                                <tr>
                                                                    <td>${order.orderNum}</td>
                                                                    <td>
                                                                     <fmt:formatDate value="${order.createTime}" pattern="yyyy-MM-dd"/>
                                                                    <%-- ${order.createTime} --%>
                                                                    
                                                                    
                                                                    </td>
                                                                    <td>${order.status == 1? "未支付" : (order.status == 4 ? '正在派送' : "")}</td>
                                                                    <td id="e">${order.countPrice}</td>
                                                                    <td><a href="cart.html" class="btn btn-sqr">查看</a>
                                                                    </td>
                                                                </tr>
                                                              </c:forEach> 
                                                                
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- Single Tab Content End -->

                                           
                                            <!-- Single Tab Content Start -->
                                            <div class="tab-pane fade" id="payment-method" role="tabpanel">
                                                <div class="myaccount-content">
                                                    <h5>支付方式</h5>
                                                    
                                                    <a href="../pay/index.jsp" class="btn btn-sqr">
                                                                            支付宝支付</a>
                                                </div>
                                            </div>
                                            <!-- Single Tab Content End -->

                                            <!-- Single Tab Content Start -->
                                            <div class="tab-pane fade" id="address-edit" role="tabpanel">
                                                <div class="myaccount-content">
                                                    <h5>账单地址</h5>
                                                                                                            
                                                    <address>
                                                        <p><strong>欢迎：${loginUser.name}</strong></p>
                                                        <p>${account_details.get(0).address} 
                                                         </p>
                                                            <p>联系电话:${account_details.get(0).phone}</p>
                                                    </address>
                                                </div>
                                            </div>
                                            <!-- Single Tab Content End -->

                                            <!-- Single Tab Content Start -->
                                            <div class="tab-pane fade" id="account-info" role="tabpanel">
                                                <div class="myaccount-content">
                                                    <h5>账户详细资料</h5>
                                                    <div class="account-details-form">
                                                        <form action="account">
                                                            
                                                            <div class="single-input-item">
                                                                <label for="display-name" class="required">姓名</label>
                                                                <input type="text" name="display-name" placeholder="${loginUser.name} " />
                                                            </div>
                                                            
                                                            <div class="single-input-item">
                                                                <label for="display-name" class="required">联系电话</label>
                                                                <input type="text" name="phone" placeholder="${loginUser.phone} " />
                                                            </div>
                                                            
                                                            <div class="single-input-item" >
                                                                <label for="phone" class="required">邮箱</label>
                                                                <input type="text" name="email" placeholder="${loginUser.email}" />
                                                            </div>
                                                            <div class="single-input-item">
                                                                <label for="display-name" class="required">地址</label>
                                                                <input type="text" name="address" placeholder="${account_details.get(0).address} " />
                                                            </div>
                                                            
                                                            <fieldset>
                                                                <legend>修改密码</legend>
                                                                
                                                                <div class="row">
                                                                    <div class="col-lg-6">
                                                                        <div class="single-input-item">
                                                                            <label for="new-pwd" class="required">新密码</label>
                                                                            <input type="password" name="new-pwd" placeholder="New Password" />
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-lg-6">
                                                                        <div class="single-input-item">
                                                                            <label for="confirm-pwd" class="required">确认密码</label>
                                                                            <input type="password" name="confirm-pwd" placeholder="Confirm Password" />
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </fieldset>
                                                            <div class="single-input-item">
                                                                <button  onclick="save()" class="btn btn-sqr">保存</button>
                                                                
                                                            </div>
                                                        </form>
                                                    </div>
                                                </div>
                                            </div> <!-- Single Tab Content End -->
                                        </div>
                                    </div> <!-- My Account Tab Content End -->
                                </div>
                            </div> <!-- My Account Page End -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- my account wrapper end -->
    </main>
<script type="text/javascript">
   /* var news  = document.getElementsByName('new-pwd');
   var old  = document.getElementsByName('confirm-pwd');
    */
	function save() {
	         
			alert("修改成功");
		
	}
</script>    
 
 
    
 

    <!-- Scroll to top start -->
    <div class="scroll-top not-visible">
        <i class="fa fa-angle-up"></i>
    </div>
    <!-- Scroll to Top End -->


  
<jsp:include page="common/footer.jsp"></jsp:include>

   <jsp:include page="common/js.jsp"></jsp:include>
</body>

</html>