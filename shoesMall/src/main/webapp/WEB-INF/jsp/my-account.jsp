<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>Pullman - eCommerce Bootstrap 4 Template</title>
<meta name="robots" content="noindex, follow" />
<meta name="description" content="">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Favicon -->
<link rel="shortcut icon" type="image/x-icon"
	href="assets/img/favicon.ico">

<!-- CSS
	============================================ -->
<!-- google fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Nunito+Sans:300,300i,400,400i,600,700,800,900%7CPoppins:300,400,500,600,700,800,900"
	rel="stylesheet">
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
<link href="assets/css/toastr.min.css" rel="stylesheet">
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
						<button class="search-btn">
							<i class="fa fa-search"></i>search
						</button>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- offcanvas search form end -->

	<main> <!-- breadcrumb area start -->
	<div class="breadcrumb-area breadcrumb-img bg-img"
		data-bg="assets/img/banner/shop.jpg">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<div class="breadcrumb-wrap">
						<nav aria-label="breadcrumb">
							<h3 class="breadcrumb-title">MY ACCOUNT</h3>
							<ul class="breadcrumb justify-content-center">
								<li class="breadcrumb-item"><a href="index"><i
										class="fa fa-home"></i></a></li>
								<li class="breadcrumb-item active" aria-current="page">My
									Account</li>
							</ul>
						</nav>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- breadcrumb area end --> <!-- my account wrapper start -->
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
										<a href="#dashboad" class="active" data-toggle="tab"><i
											class="fa fa-dashboard"></i> 仪表板</a> <a href="#orders"
											data-toggle="tab"><i class="fa fa-cart-arrow-down"></i>
											订单</a> <a href="#address-edit" data-toggle="tab"><i
											class="fa fa-map-marker"></i> 地址</a> <a href="#account-info"
											data-toggle="tab"><i class="fa fa-user"></i> 账户详细资料</a> <a
											href="#password-change" data-toggle="tab"><i
											class="fa fa-user"></i> 修改密码</a> <a href="CheckOut"><i
											class="fa fa-sign-out"></i> 退出</a>
									</div>
								</div>
								<!-- My Account Tab Menu End -->

								<!-- My Account Tab Content Start -->
								<div class="col-lg-9 col-md-8">
									<div class="tab-content" id="myaccountContent">
										<!-- Single Tab Content Start -->
										<div class="tab-pane fade show active" id="dashboad"
											role="tabpanel">
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
																	<td><fmt:formatDate value="${order.createTime}"
																			pattern="yyyy-MM-dd" /> <%-- ${order.createTime} --%>


																	</td>
																	<td>${order.status == 1? "未支付" : (order.status == 4 ? '正在派送' : "")}</td>
																	<td id="e">${order.countPrice}</td>
																	<td><a href="showOrders?orderId=${order.id}"
																		class="btn btn-sqr">查看</a></td>
																</tr>
															</c:forEach>

														</tbody>
													</table>
												</div>
											</div>
										</div>
										<!-- Single Tab Content End -->


										<!-- Single Tab Content Start -->
										<div class="tab-pane fade" id="password-change"
											role="tabpanel">
											<fieldset>
												<legend>修改密码</legend>

												<div class="row">
													<div class="col-lg-6">
														<div class="single-input-item">
															<label for="new-pwd" class="required">新密码</label> <input
																type="password" name="new-pwd" id="newpassword"
																placeholder="New Password" />
														</div>
													</div>
													<div class="col-lg-6">
														<div class="single-input-item">
															<label for="confirm-pwd" class="required">确认密码</label> <input
																type="password" name="confirm-pwd" id="confirmpassword"
																placeholder="Confirm Password" />
														</div>
													</div>
												</div>
											</fieldset>
											<div class="single-input-item">
												<button onclick="updatePassword()" class="btn btn-sqr">修改</button>

											</div>
										</div>
										<!-- Single Tab Content End -->

										<!-- Single Tab Content Start -->
										<div class="tab-pane fade" id="address-edit" role="tabpanel">
											<div class="myaccount-content">
												<h5>地址</h5>
												<div class="row">
													<div class="col-lg-12">
														<div class="single-input-item">
															<label for="new-pwd" class="required">地址</label> <input
																type="text" name="address" id="address"
																placeholder="地址" />
														</div>
													</div>
													<div class="col-lg-5">
														<div class="single-input-item">
															<label for="confirm-pwd" class="required">收货人</label> <input
																type="text" name="name" id="name"
																placeholder="收货人" />
														</div>
													</div>
													<div class="col-lg-5">
														<div class="single-input-item">
															<label for="confirm-pwd" class="required">收货人电话</label> <input
																type="text" name="phone" id="phone"
																placeholder="收货人电话" />
														</div>
													</div>
													<div class="col-lg-2" >
										
													<a href="javascript:addAddress()"
														class="btn btn-sqr" style="margin-top: 55px" id="update">保存</a>
														
													</div>
												</div>
												<br>
												<hr>
												<br>
												<table class="table table-bordered">
														<thead class="thead-light">
															<tr>
																<th style="width: 300px;">地址</th>
																<th style="width: 100px;">收货人</th>
																<th style="width: 100px;">收货人电话</th>
																<th style="width: 200px;">操作</th>
															</tr>
														</thead>
														<tbody id="addresstb">
															<c:forEach items="${Address}" var="a">
																<tr id="addresstr${a.id}">
																	<td id="address${a.id}">${a.address}</td>
																	<td id="name${a.id}">${a.name}</td>
																	<td id="phone${a.id}">${a.phone}</td>
																	<td><a href="javascript:update(${a.id})"
																		class="btn btn-sqr">修改</a>
																		&nbsp;
																	<a href="javascript:delectAddress(${a.id})"
																		class="btn btn-sqr">删除</a>
																	</td>
																</tr>
															
															</c:forEach>

														</tbody>
													</table>
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
															<label for="display-name" class="required">姓名</label> <input
																type="text" name="name" placeholder="${loginUser.name} " />
														</div>

														<div class="single-input-item">
															<label for="display-name" class="required">联系电话</label> <input
																type="text" name="phone"
																placeholder="${loginUser.phone} " />
														</div>

														<div class="single-input-item">
															<label for="phone" class="required">邮箱</label> <input
																type="text" name="email"
																placeholder="${loginUser.email}" />
														</div>

														<div class="single-input-item">
															<button onclick="save()" class="btn btn-sqr">保存</button>
														</div>
													</form>
												</div>
											</div>
										</div>
										<!-- Single Tab Content End -->
									</div>
								</div>
								<!-- My Account Tab Content End -->
							</div>
						</div>
						<!-- My Account Page End -->
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- my account wrapper end --> </main>
	<script type="text/javascript">
		/* var news  = document.getElementsByName('new-pwd');
		var old  = document.getElementsByName('confirm-pwd');
		 */
		function save() {

			alert("修改成功");

		}
		
		 function delectAddress(id){
			 $.post("delectAddress",{id:id},function(data){
				if(data.code==1){
					$('#addresstr'+id).remove();
				}
			 });
		 }
		 function update(id){
			$('#address').val( $('#address'+id).text());
			$('#name').val( $('#name'+id).text());
			$('#phone').val( $('#phone'+id).text());
			$('#update').attr("href",'javascript:updateAddress('+id+')'); 
			$('#update').text("修改");
		 }
		 
		 function updateAddress(id){
			 var address= $('#address').val();
			 var name = $('#name').val();
			 var phone = $('#phone').val()
			 $.post("updateAddress",{id:id,address:address,name:name,phone:phone},function(data){
					if(data.code==1){
						 $('#address'+id).text(address);
						 $('#name'+id).text(name);
						 $('#phone'+id).text(phone);
						 $('#address').val('');
						 $('#name').val('');
						 $('#phone').val('');
						 $('#update').text("保存");
						 toastr.options = {
					              "positionClass": "toast-top-center",//弹出窗的位置
					          };
						toastr.success('修改成功');
					}else{
						alert("系统繁忙 请售后再试");	
					}
				 });
		 }
		 
		 function addAddress(){
			 var address= $('#address').val();
			 var name = $('#name').val();
			 var phone = $('#phone').val();
			 if(address==''||name==''||phone==''){
				 alert("请正确填写信息");
				 return;
			 }
			 
			  $.post("addAddress",{address:address,name:name,phone:phone},function(data){
				  if(data.code==1){
					  toastr.options = {
				              "positionClass": "toast-top-center",//弹出窗的位置
				          };
					window.location.href ="my-account";
					toastr.success('添加成功');
				  }
				  
			  });
		 }
		 
		 function updatePassword(){
			 var confirmpassword = $('#confirmpassword').val();
			 var newpassword = $('#newpassword').val();
			 if(confirmpassword!=newpassword){
				  toastr.options = {
			              "positionClass": "toast-top-center",//弹出窗的位置
			          };
				toastr.warning('密码错误');
				return;
			 }
			 $.post("updatePassword",{password:newpassword},function(data){
				 if(data.code==1){
					 window.location.href ="tologin";
				 }
			 });
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