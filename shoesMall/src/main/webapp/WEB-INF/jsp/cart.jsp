<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  

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
        <!-- cart main wrapper start -->
        <div class="cart-main-wrapper section-padding">
            <div class="container">
                <div class="section-bg-color">
                    <div class="row">
                        <div class="col-lg-12">
                            <!-- Cart Table Area -->
                            <div class="cart-table table-responsive">
                                <table class="table table-bordered">
                                    <thead>
                                        <tr>
                                            <th class="pro-thumbnail">图片</th>
                                            <th class="pro-title">产品</th>
                                            <th class="pro-price">价格</th>
                                            <th class="pro-quantity">数量</th>
                                            <th class="pro-subtotal">总价</th>
                                            <th class="pro-remove">操作</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    
                                    <!--查询数据库展示已经购买的购物车  -->
                                    <c:forEach items="${orders }" var="o">
                                    
                                   
                                        <tr>
                                         <%--
                                            <td class="pro-thumbnail"><a href="#"><img class="img-fluid" src="assets/img/product/product-1.jpg" alt="Product" /></a></td>
                                            <td class="pro-title"><a href="#">${o.orderName}</a></td>
                                            <td class="pro-price"><span>${o.countPrice}</span></td>
                                             <td class="pro-quantity">
                                                <div class="pro-qty"><input type="text" value="1" readonly='readonly'></div>
                                            </td>                              
                                            <td class="pro-subtotal"><span>$295.00</span></td>
                                            <td class="pro-remove"><a href="#"><i class="fa fa-trash-o"></i></a></td>
                                         --%>
                                                                              
             <td class="pro-thumbnail"><a href="#"><img class="img-fluid" src="image/${o.orderImage }" alt="Product" /></a></td>                           
            <td class="pro-title"><a href="#">${o.name}</a></td>
           
            <td class="pro-price">
            	¥<input type="text" name="price" value="${o.countPrice}" readonly="readonly">
            </td>
            <td>
            	<input type="button" name="minus" value="-" onclick="minus(0);">
            	<input type="text"  id="amount1" name="amount" value="1">
            	<input type="button" name="plus" value="+" onclick="plus(0);">
 
            </td>
            <td id="price0" >${o.countPrice}</td>
           <td class="pro-remove"><a href="cart?id=${o.id}" ><i class="fa fa-trash-o"></i></a></td>
                                     
            </tr> 
                                   
                                        
                                        
                                    </c:forEach>
                                        
                                    </tbody>
                                </table>
                            </div>
                            <!-- Cart Update Option -->
                            <div class="cart-update-option d-block d-md-flex justify-content-between">
                                <div class="apply-coupon-wrapper">
                                    
                                </div>
                                <div class="cart-update">
                                    <a href="#" class="btn btn-sqr">刷新购物车</a>
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
                                          <li id="totalPrice">商品总计：<span></span></li>
                                          <li id="youhui">优惠券：￥0<span></span></li>
                                         
       										  
                                               
                                           
                                        </table>
                                    </div>
                                </div>
                                <a href="checkout.html" class="btn btn-sqr d-block">支付</a>
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
 
 
 <!--总价随数量变化变动  -->   
<script type="text/javascript" >
//减
function minus(num){
    var prices=document.getElementsByName("price")[num].value;
    var count=parseInt(document.getElementsByName("amount")[num].value)-1;
    if(count<1){
        alert("不能再减了，再减就没有啦！");
    }
    else{
        document.getElementsByName("amount")[num].value=count;
        var totals=parseFloat(prices*count);
        document.getElementById("price"+num).innerHTML="¥" +totals.toFixed(2);//.toFixed(2)表示四舍五入，取2位小数点
        total();
    }
    
  
    
}
//增
function plus(num){	
    var prices=document.getElementsByName("price")[num].value;
    var count=parseInt(document.getElementsByName("amount")[num].value)+1;
    document.getElementsByName("amount")[num].value=count;
    var totals=parseFloat(prices*count);
    document.getElementById("price"+num).innerHTML="¥" +totals.toFixed(2);
    total();
    
    
    // ajax修改数据库
	var url = "AjaxUpdate";
	var amount = amount1.value;
	
	var id=request.getParameter("id");
	var param = {
			orderNum : amount,
			id :id
		};
	
	//匿名函数	
	$.post(url, param, function(result) {
		
		
			//window.location.href="cart";
		
	}); 
	 
    
   
    
    
}
//计算总额
function total(){
    var prices=document.getElementsByName("price");
    var count=document.getElementsByName("amount");
    var sum=0;
    for(var i=0; i<prices.length;i++){
       sum+=prices[i].value*count[i].value;
    }
    document.getElementById("totalPrice").getElementsByTagName("span")[0].innerHTML="¥" +sum.toFixed(2);
   
}
//结算
function accounts(){
var obj=document.getElementById("cartList").nextElementSibling;//.nextElementSibling表示下一个同辈元素

}




</script>


   <jsp:include page="common/footer.jsp"></jsp:include>

	<jsp:include page="common/js.jsp"></jsp:include>
</body>

</html>