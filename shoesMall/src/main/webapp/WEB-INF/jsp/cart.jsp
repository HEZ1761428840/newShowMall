<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>  
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
<!--                         <button class="search-btn"><i class="fa fa-search"></i>search</button>
 -->                    </form>
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
                                <h3 class="breadcrumb-title">SHOP</h3>
                                <ul class="breadcrumb justify-content-center">
                                    <li class="breadcrumb-item"><a href="index.html"><i class="fa fa-home"></i></a></li>
                                    <li class="breadcrumb-item"><a href="shop.html">Shop</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">Cart</li>
                                </ul>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- breadcrumb area end -->

        <!-- cart main wrapper start -->
        <div class="cart-main-wrapper section-padding">
            <div class="container">
                <div class="section-bg-color">
                    <div class="row">
                        <div class="col-lg-12">
                            <!-- Cart Table Area -->
                            <div class="cart-table table-responsive">
                                <table class="table table-bordered" id="table">
                                    <thead>
                                        <tr>
                                            <th class="pro-thumbnail">图片</th>
                                            <th class="pro-title">产品</th>
                                            <th class="pro-price">数量</th>
                                            <th class="pro-quantity">价格</th>
                                            <th class="pro-subtotal">总价</th>
                                            <th class="pro-remove">操作</th>
                                        </tr>
                                    </thead>
                                    
                                    
                                    <!--查询数据库展示已经购买的购物车  -->
                                     <c:forEach items="${carts}" var="c" >
                                   
                                   
            <tr id="Cart${c.id}">
            <td class="pro-thumbnail" ><a href="#"><img class="img-fluid" src="img/${c.productImage }" alt="Product" /></a></td>
				<td>${c.product.name}</td>
				<td><button value="${c.id}">-</button>&nbsp;<span class="num">${c.productCount}</span>&nbsp;<button value="${c.id}">+</button></td>
				<td>￥<span class="price">${c.product.price}</span></td>
				<td>￥<span class="prices">${c.product.price}</span></td>
				<td class="pro-remove"><a href="javascript:delectCart(${c.id})"><i class="fa fa-trash-o"></i></a></td>
			</tr>
			</c:forEach> 
			
                                        
                                   
                                </table>
                            </div>
                            <!-- Cart Update Option -->
                            <div class="cart-update-option d-block d-md-flex justify-content-between">
                                <div class="apply-coupon-wrapper">
                                    
                                </div>
                                <div class="cart-update">
                                    <a href="" class="btn btn-sqr">刷新购物车</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-5 ml-auto">
                            <!-- Cart Calculation Area -->
                            <div class="cart-calculator-wrapper">
                                <div class="cart-calculate-items">
                                    <h6>购物车结算</h6>
                                    <div class="table-responsive">
                                        <table class="table">
                                          
       										<tr>
				                              <td colspan="5">商品一共<span id="number">${fn:length(carts)}</span>件，共计花费<span id="prices-num"></span>元</td>
			                                 </tr>  
                                               
                                           
                                        </table>
                                    </div>
                                </div>
                                <form  method="post" action="../pay/index.jsp" id ="passForm">
                                <a href="checkout" class="btn btn-sqr d-block">提交订单</a>
                               <input id = 'test2' type = 'hidden' name="test2"> 
    							</form>  
                              
                            </div>
                        </div>
                    </div>
                    
                    
                    
                </div>
            </div>
        </div>
        <!-- cart main wrapper end -->
    </main>

    <!-- Scroll to top start -->
    <div class="scroll-top not-visible">
        <i class="fa fa-angle-up"></i>
    </div>
    <!-- Scroll to Top End -->
 
 



   <jsp:include page="common/footer.jsp"></jsp:include>

	<jsp:include page="common/js.jsp"></jsp:include>
	
<script type="text/javascript"> 

	$(document).ready(function(){
		let getprices=document.getElementsByClassName("prices");
		let oGetprices=0;
		for(let i=0;i<getprices.length;i++){
			oGetprices+=Number(getprices[i].innerHTML)
		}
		let getPricesNum=document.getElementById("prices-num");
		getPricesNum.innerHTML=oGetprices;
			
		
	});

	let table=document.getElementById("table");
	class caret{
		constructor() {
		    
		}
		//先获取总数量
		getpricesSum(){
			//将表格中的数量以数组形式返回出来
			let pricesNum=document.getElementsByClassName("num");
			//创建一个变量,初始值为0,用来统计总数
			let getPricesNumber=0;
			//遍历小计数组
			for(let i=0;i<pricesNum.length;i++){
				console.log(pricesNum[i]);
				getPricesNumber+=Number(pricesNum[i].innerHTML);
			}
			let Numbers=document.getElementById("number");
			Numbers.innerHTML=getPricesNumber;
		}
		//获取总花费
		consume(){
			//与总数量同理,把表格中的小计以数组形式返回
			let getprices=document.getElementsByClassName("prices");
			let oGetprices=0;
			for(let i=0;i<getprices.length;i++){
				oGetprices+=Number(getprices[i].innerHTML)
			}
			let getPricesNum=document.getElementById("prices-num");
			getPricesNum.innerHTML=oGetprices;
			
			
		}
		//计算每个商品的小计
		getpricesNum(num,price){
			return num*price;
		}
		//点击按钮,增加一个货物
		Addbtn(btn){
			//将+和+前面的button关联previousElementSibling--->上一个节点
			let priceSum=btn.previousElementSibling;
			priceSum.innerHTML=(Number(priceSum.innerHTML))+1;
			//关联数量
			let getpriceSum=btn.parentNode.nextElementSibling.firstElementChild ;//btn的父节点的下一个兄弟节点的第一个子节点
			//小计
			let ogetpricesNum=this.getpricesNum(priceSum.innerHTML,getpriceSum.innerHTML);
			let ogetpricesNumes=btn.parentNode.nextElementSibling.nextElementSibling.firstElementChild;
			ogetpricesNumes.innerHTML=ogetpricesNum;
			this.getpricesSum();
			this.consume();
			updateCartCount(btn.value,Number(priceSum.innerHTML));
		}
		//减少一个货物
		reducebtn(btn){
			let priceSum=btn.nextElementSibling;
			if(priceSum.innerHTML>0){
				priceSum.innerHTML=(Number(priceSum.innerHTML))-1;
				updateCartCount(btn.value,Number(priceSum.innerHTML));
			}
			
			//关联数量
			let getpriceSum=btn.parentNode.nextElementSibling.firstElementChild ;//btn的父节点的下一个兄弟节点的第一个子节点
			//小计
			let ogetpricesNum=this.getpricesNum(priceSum.innerHTML,getpriceSum.innerHTML);
			let ogetpricesNumes=btn.parentNode.nextElementSibling.nextElementSibling.firstElementChild;
			ogetpricesNumes.innerHTML=ogetpricesNum;
			this.getpricesSum();
			this.consume();
			
		}
	
		
		
		
		eventBd(){
			let btn=document.getElementsByTagName("button");
			let delbtn=document.getElementsByClassName("del");
			let that=this;
			for(let i=0;i<btn.length;i++){
				if(i%2==0){
					btn[i].onclick=function(){
						that.reducebtn(this);
					}
				}
				else{
					btn[i].onclick=function(){
						that.Addbtn(this);
					}
				}
			}
			for(let i=0;i<delbtn.length;i++){
				delbtn[i].onclick=function(){
					that.removecargo(this);
				}
			}
		}
	}
	let c=new caret();
	c.eventBd();
	
	
	
	function delectCart(cid){
		$.post("delectCart",{id:cid},function(data){
			if(data.code==1){
				 toastr.options = {
			              "positionClass": "toast-top-center",//弹出窗的位置
			          };
				toastr.success('删除成功');
			}
			
		});
	}
	function updateCartCount(id,count){
		$.post("updateCartCount",{id:id,productCount:count},function(data){
			if(data.code!=1){
				alert("操作异常,请售后再试");
			}
		});
	}
</script>

	

</body>

</html>
