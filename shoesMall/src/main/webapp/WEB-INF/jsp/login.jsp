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
	<link href="assets/css/toastr.min.css" rel="stylesheet">
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
									   <input class="form-control" type="tel" id="inputCode" placeholder="请输入验证码" maxlength="4">
									  </div>
									 </div>
									 <div class="single-input-item">
									 <div id="checkCode" class="code"  onclick="createCode(4)" style="width: 60px;float: left;margin-left: 15px;background-color:white;"></div>
           							<div onclick="createCode(4)" style="width: 60px;float: left;margin-left: 15px;">换一张</div>
									
									 </div>
									 
                                          <a href="#" class="forget-pwd" style="margin-left:100px">忘记密码?</a>
                                       
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
    
	function login() {
		
			

		// ajax 登录
		var url = "login";
		var name = loginModalUserNmae.value;
		var pwd = loginModalUserPwd.value;
		if(name==''){
			toastr.options = {
		              "positionClass": "toast-top-center",//弹出窗的位置
		          };
			toastr.warning('请输入用户名');
			 return;
		}else if(pwd == ''){
			toastr.options = {
		              "positionClass": "toast-top-center",//弹出窗的位置
		          };
			toastr.warning('请输入密码');
			 return;
		}
		
		var param = {
			name : name,
			password : pwd
		};
		//匿名函数
		if(validateCode()==false){
			 return;
		 }	
		$.post(url, param, function(result) {
			console.log(result);
			if (result.code == 1) {
				alert("登录成功");
				window.location.href="index";
			} else {
				createCode(4);
				alert("账号或者密码错误，请重新登录");
			}
		}); 
		
	}
	
	window.onload=function(){
	     createCode(4);    
	    }

	//生成验证码的方法
   function createCode(length) {
       var code = "";
       var codeLength = parseInt(length); //验证码的长度
       var checkCode = document.getElementById("checkCode");
       ////所有候选组成验证码的字符，当然也可以用中文的
       var codeChars = new Array(0, 1, 2, 3, 4, 5, 6, 7, 8, 9,
       'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z',
       'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'); 
       //循环组成验证码的字符串
       for (var i = 0; i < codeLength; i++)
       {
           //获取随机验证码下标
           var charNum = Math.floor(Math.random() * 62);
           //组合成指定字符验证码
           code += codeChars[charNum];
       }
       if (checkCode)
       {
           //为验证码区域添加样式名
           checkCode.className = "code";
           //将生成验证码赋值到显示区
           checkCode.innerHTML = code;
       }
   }
 //检查验证码是否正确
   function validateCode()
   {
       //获取显示区生成的验证码
       var checkCode = document.getElementById("checkCode").innerHTML;
       //获取输入的验证码
       var inputCode = document.getElementById("inputCode").value;
       console.log(checkCode);
       console.log(inputCode);
       if (inputCode.length <= 0)
       {
       	toastr.options = {
		              "positionClass": "toast-top-center",//弹出窗的位置
		          };
			toastr.warning('请输入验证码');
			return false;
       }
       else if (inputCode.toUpperCase() != checkCode.toUpperCase())
       {
       	toastr.options = {
		              "positionClass": "toast-top-center",//弹出窗的位置
		          };
			toastr.warning('验证码有误');
			$('#inputCode').val("");
           createCode(4);
           return false;
       }    
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