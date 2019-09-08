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
                        <!-- Register Content Start -->
                        <div class="col-lg-6" moth=post>
                            <div class="login-reg-form-wrap sign-up-form">
                                <h4>注册</h4>
                                	<form action="register" name="myForm" onsubmit="return validate_form(this);"
                                	method="post" enctype="multipart/form-data">
                                    <div class="single-input-item">
                                       	名字：  <input type="text" placeholder="Full Name"  name ="name" required />
                                    </div>
                                    
                                    <div class="single-input-item">
     									头像：   <input type="file" name="head_pictrue" required>
                                    </div>
                                    <div class="single-input-item">
                                        	邮箱： <input type="email" placeholder="Enter your Email"  name="email" required />
                                    </div>
                                    <div class="single-input-item">
                                        	电话号码： <input type="text" placeholder="Enter your phone"  name="phone" required />
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-6">
                                            <div class="single-input-item">
                                                <input type="password" placeholder="Enter your Password" name="password" required />
                                            </div>
                                        </div>
                                        <div class="col-lg-6">
                                            <div class="single-input-item">
                                                <input type="password" placeholder="Repeat your Password" name="password1" required />
                                            </div>
                                        </div>
                                    </div>
                                   
                                    <div class="single-input-item">
                                        <button type="submit" class="btn btn-sqr">注册</button>
                                    </div>
                                    </form>
                            </div>
                        </div>
                        <!-- Register Content End -->
                    </div>
                </div>
            </div>
        </div>
        <!-- login register wrapper end -->
    </main>
    <script type="text/javascript">
   					//邮箱的表单验证
					function validate_email(field, alerttxt) {
						with (field) {
							apos = value.indexOf("@")
							dotpos = value.lastIndexOf(".")
							if (apos < 1 || dotpos - apos < 2) {
								alert(alerttxt);
								return false
							} else {
								return true
							}
						}
					}
					function validate_form(thisform){
					with (thisform){
					if (validate_email(email,"Not a valid e-mail address!")==false)
					  {email.focus();return false}
					}
					}
					
					//密码和确定密码的一致性验证
					function validate_form(){
						var x = document.forms["myForm"]["password"].value;
						var y = document.forms["myForm"]["password1"].value;
						var reg = /^[0-9]+$/; 
						var phone = document.forms["myForm"]["phone"].value;
						alert(phone);
						if(x != y){
							alert("密码请一致");
							return false;
						}
						//电话号码的长度验证11位
						if(phone.length!=11){
							alert("请输入正确的电话号码");
							return false;
						}
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