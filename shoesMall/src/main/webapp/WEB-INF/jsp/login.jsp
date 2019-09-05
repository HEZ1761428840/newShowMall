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

        <!-- login register wrapper start -->
        <div class="login-register-wrapper section-padding">
            <div class="container">
                <div class="member-area-from-wrap">
                    <div class="row">
                        <!-- Login Content Start -->
                        <div class="col-lg-6">
                            <div class="login-reg-form-wrap">
                                <h4>用户登录</h4>
         
                                    <div class="single-input-item">
                                       <label for="loginModalUserNmae">用户名</label>
            							<input type="text" class="form-control" id="loginModalUserNmae" name="name"
            							placeholder="请输入用户名" autofocus maxlength="15" autocomplete="off" required>
                                    </div>
                                    <div class="single-input-item">
                                         <label for="loginModalUserPwd">密码</label>
          							  <input type="password" class="form-control" id="loginModalUserPwd" name="password"
          							   placeholder="请输入密码" maxlength="18" autocomplete="off" required>
                                    </div>
                                    <div class="single-input-item">
                                    <label for="loginModalUserPwd">验证码</label>
									  <div class="form-group">
									   <input class="form-control" type="tel" id="verify_input" placeholder="请输入验证码" maxlength="4">
									  </div>
									 </div>
									 <div class="single-input-item">
									  <a href="javascript:void(0);" rel="external nofollow" title="点击更换验证码">
									   <img id="imgVerify" src="" alt="更换验证码" height="36" width="100%" onclick="getVerify(this);">
									  </a>
									 </div>
                                    
                                    
                                    <div class="single-input-item">
                                        <div class="login-reg-form-meta d-flex align-items-center justify-content-between">
                                            <div class="remember-meta">
                                                <div class="custom-control custom-checkbox">
                                                    <input type="checkbox" class="custom-control-input" id="rememberMe">
                                                    <label class="custom-control-label" for="rememberMe">Remember Me</label>
                                                </div>
                                            </div>
                                            <a href="#" class="forget-pwd">忘记密码?</a>
                                        </div>
                                    </div>
                                    <div class="single-input-item">
                                        <button  onclick="login()" class="btn btn-sqr">登录</button>
                                    </div>
                            </div>
                        </div>
                        <!-- Login Content End -->

                    </div>
                </div>
            </div>
        </div>
        <!-- login register wrapper end -->
    </main>
    
<script type="text/javascript">
		//获取验证码
		function getVerify(obj){
		 obj.src = url+ "getVerify?"+Math.random();
		}
    
	function login() {

		// ajax 登录
		var url = "login";
		var name = loginModalUserNmae.value;
		var pwd = loginModalUserPwd.value;
		var param = {
			name : name,
			password : pwd
		};
		//匿名函数
		
		$.post(url, param, function(result) {
			console.log(result);
			if (result.code == 1) {
				alert("登录成功");
				window.location.href="index";
			} else {
				alert("账号或者密码错误，请重新登录");
			}
		}); 
		
	}
</script>

    <!-- Scroll to top start -->
    <div class="scroll-top not-visible">
        <i class="fa fa-angle-up"></i>
    </div>
    <!-- Scroll to Top End -->

<script src="js/jquery-2.1.4.min.js"></script>
<jsp:include page="common/js.jsp"></jsp:include>
</body>
</html>