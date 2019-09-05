<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>shop</title>
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
	<style type="text/css">

	</style>
</head>

<body id="bodys">
	<jsp:include page="common/header.jsp"></jsp:include>
    <jsp:include page="common/main.jsp"></jsp:include>
        <!-- page main wrapper start -->
        <div class="shop-main-wrapper section-padding">
            <div class="container">
                <div class="row">
                    <!-- sidebar area start -->
                    <div class="col-lg-3 order-2 order-lg-1">
                        <aside class="sidebar-wrapper">

                            <!-- single sidebar start -->
                            <div class="sidebar-single">
                                <h6 class="sidebar-title">Brand</h6>
                                <div class="sidebar-body">
                                    <ul class="checkbox-container search-list">
                                         <c:forEach items="${pblist}" var="p">
	                                    	 <li>
	                                            <div class="custom-control custom-checkbox">
	                                                <input type="checkbox" class="custom-control-input pb"  id="customCheck${p.id+4}" value="${p.id}" >
	                                                <label class="custom-control-label" for="customCheck${p.id+4}">${p.brandName}</label>
	                                            </div>
	                                         </li>
                                   		 </c:forEach>
                                    </ul>
                                </div>
                            </div>
                            <!-- single sidebar end -->

                            <!-- single sidebar start -->
                            <div class="sidebar-single">
                                <h6 class="sidebar-title">Categories</h6>
                                <div class="sidebar-body">
                                    <ul class="radio-container search-list">
                                        <li>
                                            <div class="custom-control custom-radio">
                                                <input type="radio" class="custom-control-input" id="customCheck50" name="price" onclick="a(70,90)">
                                                <label class="custom-control-label" for="customCheck50">$70.00 - $90.00 </label>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="custom-control custom-radio">
                                                <input type="radio" class="custom-control-input" id="customCheck51" onclick="a(90,170)" name="price">
                                                <label class="custom-control-label" for="customCheck51" >$90.00 - $170.00 </label>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="custom-control custom-radio">
                                                <input type="radio" class="custom-control-input" id="customCheck52" name="price" onclick="a(170,250)">
                                                <label class="custom-control-label" for="customCheck52"> $170.00 - $250.00 </label>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="custom-control custom-radio">
                                                <input type="radio" class="custom-control-input" id="customCheck53" name="price" onclick="a(250,350)">
                                                <label class="custom-control-label" for="customCheck53"> $250.00 - $350.00 </label>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="custom-control custom-radio">
                                                <input type="radio" class="custom-control-input" id="customCheck54" name="price" onclick="a(350,0)">
                                                <label class="custom-control-label" for="customCheck54">$350.00 - $~~</label>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <!-- single sidebar end -->

                            <!-- single sidebar start -->
                            <div class="sidebar-banner">
                                <div class="banner-thumb">
                                    <a href="#">
                                        <img src="assets/img/banner/sidebar-banner.jpg" alt="">
                                    </a>
                                </div>
                            </div>
                            <!-- single sidebar end -->
                        </aside>
                    </div>
                    <!-- sidebar area end -->

                    <!-- shop main wrapper start -->
                    <div class="col-lg-9 order-1 order-lg-2">
                        <div class="shop-product-wrapper">
                            <!-- shop product top wrap start -->
                            <div class="shop-top-bar">
                                <div class="row align-items-center">
                                    <div class="col-lg-7 col-md-6 order-2 order-md-1">
                                        <div class="top-bar-left">
                                            <div class="product-view-mode">
                                                <a href="#" data-target="grid-view" data-toggle="tooltip" title="Grid View"><i class="fa fa-th"></i></a>
                                                <a class="active" href="#" data-target="list-view" data-toggle="tooltip" title="List View"><i class="fa fa-list"></i></a>
                                            </div>
                                            <div class="product-amount">
                                                <p>Showing 1–6  results</p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-5 col-md-6 order-1 order-md-2">
                                        <div class="top-bar-right">
                                            <div class="product-short">
                                                <p>Sort By : </p>
                                                <select class="nice-select" name="sortby">
                                                    <option value="trending">Relevance</option>
                                                    <option value="sales">Name (A - Z)</option>
                                                    <option value="sales">Name (Z - A)</option>
                                                    <option value="rating">Price (Low &gt; High)</option>
                                                    <option value="date">Rating (Lowest)</option>
                                                    <option value="price-asc">Model (A - Z)</option>
                                                    <option value="price-asc">Model (Z - A)</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- shop product top wrap start -->

                            <!-- product item list wrapper start -->
                            <div class="shop-product-wrap list-view row mbn-30" id="product">
                        	<c:forEach items="${plist}" var="p">
                                <!-- product single item start -->
                                <div class="col-md-4 col-sm-6">
                                    <!-- product grid start -->
                                    <div class="product-item">
                                        <div class="product-thumb">
                                            <a href="" data-toggle="modal" data-target="#quick_view${p.id}">
                                                <img src="img/${p.images[0].imagePath}" alt="product thumb" style="height: 200px">
                                            </a>
                                            <div class="button-group">
                                                <a href="wishlist.html" data-toggle="tooltip" title="Add to Wishlist"><i class="fa fa-heart-o"></i></a>
                                                <a href="#" data-toggle="modal" data-target="#quick_view${p.id}"><span data-toggle="tooltip"  title="Quick View"><i class="fa fa-eye"></i></span></a>
                                            </div>
                                            <div class="product-label">
                                                <span>new</span>
                                            </div>
                                        </div>
                                        <div class="product-content">
                                            <div class="product-caption">
                                                <h6 class="product-name">
                                                    <a href="" data-toggle="modal" data-target="#quick_view${p.id}">${p.name}</a>
                                                </h6>
                                                <div class="price-box">
                                                    <span class="price-regular">${p.price}</span>
                                                </div>
                                                <a class="add-to-cart" href="cart"><i class="fa fa-shopping-cart"></i></a>
                                            </div>
                                            <div class="ratings">
                                            	<c:forEach  begin="1" end="${p.score}"> 
                                                	<span><i class="fa fa-star"></i></span>
                                                </c:forEach>
                                             
                                            </div>
                                        </div>
                                    </div>
                                    <!-- product grid end -->

                                    <!-- product list item end -->
                                    <div class="product-list-item">
                                        <div class="product-thumb">
                                            <a href="" data-toggle="modal" data-target="#quick_view${p.id}">
                                                <img src="img/${p.images[0].imagePath}" alt="product thumb" style="height: 300px">
                                            </a>
                                            <div class="button-group">
                                                <a href="wishlist.html" data-toggle="tooltip" title="Add to Wishlist"><i class="fa fa-heart-o"></i></a>
                                                <a href="#" data-toggle="modal" data-target="#quick_view${p.id}"><span data-toggle="tooltip"  title="Quick View"><i class="fa fa-eye"></i></span></a>
                                            </div>
                                            <div class="product-label">
                                                <span>new</span>
                                            </div>
                                        </div>
                                        <div class="product-content-list">
                                            <h4 class="product-name"><a href="" data-toggle="modal" data-target="#quick_view${p.id}">${p.name}</a></h4>
                                          
                                             <div class="ratings">
                                            	<c:forEach  begin="1" end="${p.score}"> 
                                                	<span><i class="fa fa-star"></i></span>
                                                </c:forEach>
                                            </div>
                                            <div class="price-box">
                                                <span class="price-regular">${p.price}</span>
                                            </div>
                                            <p>${p.descs}
                                            </p>
                                            <a href="" class="btn btn-large hover-color" data-toggle="modal" data-target="#quick_view${p.id}">直接够买</a>
                                            <a href="" class="btn btn-large hover-color" data-toggle="modal" data-target="#quick_view${p.id}">加入购物车</a>
                                        </div>
                                    </div>
                                    <!-- product list item end -->
                                </div>
                                <!-- product single item start -->
                            </c:forEach>
                                
                            </div>
                            <!-- product item list wrapper end -->

                            <!-- start pagination area -->
                            <div class="paginatoin-area text-center">
                                <ul class="pagination-box" id="pageSizeSel">
                                    <li><a class="previous" href="javascript:fenye(1)"><i class="fa fa-angle-left"></i></a></li>
                                    	<c:if test="${pagesize>6}">
                                    		<li class="active" ><a href="javascript:fenye(1)">1</a></li>
		                                    <li ><a href="javascript:fenye(2)">2</a></li>
		                                    <li ><a href="javascript:fenye(3)">3</a></li>
		                                    <li ><a href="javascript:fenye(4)">4</a></li>
		                                    <li ><a href="javascript:fenye(5)">5</a></li>
		                                    <li ><a>...</a></li>                                    
		                                    <li ><a href="javascript:fenye(${pagesize}")>${pagesize}</a></li>
                                    	</c:if>
                                    	<c:if test="${pagesize<=6}">
                                    		<li class="active" ><a href="javascript:fenye(1)">1</a></li>
                                    		<c:forEach begin="2" end="${pagesize}" varStatus="status">
                                    		<li ><a href="javascript:fenye(${status.index})">${status.index}</a></li>
                                    		</c:forEach>
                                    	</c:if>
                                    <li><a class="next" href="javascript:fenye(${pagesize})"><i class="fa fa-angle-right"></i></a></li>
                                </ul>
                            </div>
                            <!-- end pagination area -->
                        </div>
                    </div>
                    <!-- shop main wrapper end -->
                </div>
            </div>
        </div>
        <!-- page main wrapper end -->
    </main>

    <!-- Scroll to top start -->
    <div class="scroll-top not-visible">
        <i class="fa fa-angle-up"></i>
    </div>
    <!-- Scroll to Top End -->





<jsp:include page="common/footer.jsp"></jsp:include>
<div id="modals">
	<c:forEach items="${plist}" var="product" varStatus="status1">
	 <!-- Quick view modal start -->
    <div class="modal" id="quick_view${product.id}">
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
                                            	<img src="img/${product.images[0].imagePath}" alt="product-details"  style="height: 420px" id="image${product.id}"/>
                                      		  </div>
                                    </div>
                                    <div >
                                    	<c:forEach items="${product.images}" var="image" varStatus="status2" >
                                    		<input type="hidden" value="${image.imagePath}" id="image${status1.index}${status2.index}">
                                        	 <div >
                                        	 <a href="javascript:ChoiceImage(${product.id},${status1.index},${status2.index})">
                                            	<img src="img/${image.imagePath}"  style="width: 90px; float: left;margin:2px;;border:0;padding:0" />
                                            </a>	
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
                                                <span>${product.score} Reviews</span>
                                            </div>
                                        </div>
                                        <div class="price-box">
                                            <span class="price-regular" id="price${product.id}">$${product.price}</span>
                                        </div>
                                        <div class="availability">
                                            <i class="fa fa-check-circle"></i>
                                            <span>200 in stock</span>
                                        </div>
                                        <p class="pro-desc">${product.descs}</p>
                                        <div class="quantity-cart-box d-flex align-items-center">
                                            <h6 class="option-title">qty:</h6>
                                            <div class="quantity">
                                                <div class="pro-qty"><input type="text" value="1" id="count${product.id}"></div>
                                            </div>
                                           
                                        </div>
                                        <div class="pro-size" id ="size${product.id}">
                                            <h6 class="option-title">size :</h6>
                                            <select class="nice-select" >
                                            	<c:forEach items="${product.productSizes}" var="c">
                                            	<option>${c.size}</option>
                                            	</c:forEach>
                                            </select>
                                            
                                        </div>
                                      
                                        <div class="action_link">
                                                <a class="btn btn-cart2" href="#">直接购买</a>
                                                 <a class="btn btn-cart2" href="javascript:toCart(${product.id})">加入购物车</a>
                                         </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- product details inner end -->
                   </div>
            </div>
        </div>
    </div>
    <!-- Quick view modal end -->
	</c:forEach>
  </div> 
    
    
<jsp:include page="common/js.jsp"></jsp:include>

<script type="text/javascript">
	var maxPrice = 0;
	var minPrice = 0;
	var productBrands = ""; 
	var productSizes ="" ;
	$(function(){
		$('.clicksize').click(function(){
			if(true == $(this).prop('checked')){
				productSizes += $(this).val()+",";
			}else{
				productBrands ="";
				var obj = $('.clicksize');
				for(var i = 0; i < obj.length; i ++){
					if(true == $(obj[i]).prop('checked')){
						productSizes += $(obj[i]).val()+",";
					}
				}
			}
		});
		$('.pb').click(function(){
			if(true == $(this).prop('checked')){
				productBrands += $(this).val()+",";
			}else{
				productBrands = "";
				var obj = $('.pb');
				for(var i = 0; i < obj.length; i ++){
					if(true == $(obj[i]).prop('checked')){
						productBrands+=$(obj[i]).val()+",";
					}
				}
			}
			ajaxput();
		});
		
	});		
	
	function a(a,b){
		maxPrice = b;
		minPrice = a;
		 ajaxput();
		}
	function ajaxput(){
		$.post("fuzzySelect",{maxPrice:maxPrice,minPrice:minPrice,productBrands:productBrands},function(data){
			var str="";
				if(data.code==1){
					var size = data.count%6>0 ? data.count/6+1 :data.count/6;
					$('#pageSizeSel').empty();
					
					 var  string = '<li><a class="previous" href="javascript:fenye('+1+')"><i class="fa fa-angle-left"></i></a></li>';
					if(size<9){
						for(var i = 1 ;i<=size;i++){
							if(i==1){
								string += ' <li class="active"><a href="javascript:fenye('+i+')">'+i+'</a></li>';
							}else{
							string += ' <li ><a href="javascript:fenye('+i+')">'+i+'</a></li>';
							}
						}
					}else{
						for(var i = 1 ;i<=6;i++){
							string += ' <li ><a href="javascript:fenye('+i+')">'+i+'</a></li>';
						}
						string += '<li ><a href="#">...</a></li>';
						string +='<li ><a href="javascript:fenye('+size+')">'+size+'</a></li>';
					}
					string += '<li><a class="next" href="javascript:fenye('+size+')"><i class="fa fa-angle-right"></i></a></li>';
					
					 
					$('#pageSizeSel').html(string); 
					
					showComm(data);
					
				}else{
					alert("未找到");
				}
			});
	}
	
	function fenye(page){
		$.post("pageSelect",{maxPrice:maxPrice,minPrice:minPrice,productBrands:productBrands,page:page},function(data){
			if(data.code==1){
				var size = data.count%6>0 ? data.count/6+1 :data.count/6;
				$('#pageSizeSel').empty();
				 var  string = '<li><a class="previous" href="javascript:fenye('+i+')"><i class="fa fa-angle-left"></i></a></li>';
				 if(size<=8){
					 for(var i = 1 ;i<=size;i++){
						 if(i==data.page){
								string += ' <li class="active"><a href="javascript:fenye('+i+')">'+i+'</a></li>';	
							}else{
								string += ' <li ><a href="javascript:fenye('+i+')">'+i+'</a></li>';	
							} 
					 }
				 }else{
					if(page+3<5){
						for(var i = 1 ;i<=size;i++){
							if(size==page){
								string += ' <li class="active"><a href="javascript:fenye('+i+')">'+i+'</a></li>';	
							}else{
								string += ' <li ><a href="javascript:fenye('+i+')">'+i+'</a></li>';	
							}
						}
					}else if(size-page<3){
						string += ' <li ><a href="javascript:fenye(1)">'+1+'</a></li>';
						string += '<li ><a href="#">...</a></li>';
						for(var i = size-5 ;i<=size;i++){
								if(size==page){
									string += ' <li class="active"><a href="javascript:fenye('+i+')">'+i+'</a></li>';	
								}else{
									string += ' <li ><a href="javascript:fenye('+i+')">'+i+'</a></li>';	
								}
						}
					}else{
						string += ' <li ><a href="javascript:fenye(1)">'+1+'</a></li>';
						string += '<li ><a href="#">...</a></li>';
						string += '<li ><a href="javascript:fenye('+page-1+')">'+page-1+'</a></li>';
						string += '<li ><a href="javascript:fenye('+page+')">'+page+'</a></li>';
						string += '<li ><a href="javascript:fenye('+page+1+')">'+page+1+'</a></li>';
						string += '<li ><a href="#">...</a></li>';
						string += '<li ><a href="javascript:fenye('+size+')">'+size+'</a></li>';
					} 
				} 
				string += '<li><a class="next" href="javascript:fenye('+size+')"><i class="fa fa-angle-right"></i></a></li>';
				$('#pageSizeSel').html(string); 
				
				
				showComm(data);	
				models(data);
			}else{
				alert("未找到");
			}
		});
	}
	/* 显示商品 */
	function showComm (data){
		$('#product').empty();
		for(var i = 0;i<data.data.length;i++){
			var str="";
			 for(var x=0;x<data.data[i].score;x++){
                str+='<span><i class="fa fa-star"></i></span>';	
                } 
			 var path = data.data[i].images[0]==null ? '' : data.data[i].images[0].imagePath ;
			$('#product').append(' <DIV class="col-md-4 col-sm-6"><DIV class="product-item"> <DIV class="product-thumb">'
					+'<a href="product-details-variable"><img src="img/'+path+'" alt="product thumb" style="height: 200px"></a><DIV class="button-group">'
	                +'<a href="wishlist.html" DATA-toggle="tooltip" title="Add to Wishlist"><i class="fa fa-heart-o"></i></a>'
	                +'<a href="#" DATA-toggle="modal" DATA-target="#quick_view'+data.data[i].id+'"><span DATA-toggle="tooltip"  title="Quick View"><i class="fa fa-eye"></i></span></a>'
	                +'</DIV> <DIV class="product-label"><span>NEW</span></DIV></DIV><DIV class="product-content"><DIV class="product-caption">'
	                +'<h6 class="product-name"><a href="product-details.html">'+data.data[i].name+'</a></h6><DIV class="price-box">'
	                +'<span class="price-regular">'+data.data[i].price+'</span></DIV>'
	             	+'<a class="add-to-cart" href="cart"><i class="fa fa-shopping-cart"></i></a>'
	                +'</DIV><DIV class="ratings">'
	               	+str
	                +'</DIV></DIV></DIV>'
	                +'<DIV class="product-list-item"><DIV class="product-thumb">'
	                +'<a href="#" data-toggle="modal" data-target="#quick_view'+data.data[i].id+'" ><img src="img/'+path+'" alt="product thumb" style="height: 300px">'
	                +'</a><DIV class="button-group">'
	                +'<a href="wishlist.html" DATA-toggle="tooltip" title="Add to Wishlist"><i class="fa fa-heart-o"></i></a>'
	                +'<a href="#" DATA-toggle="modal" DATA-target="#quick_view'+data.data[i].id+'"><span DATA-toggle="tooltip"  title="Quick View"><i class="fa fa-eye"></i></span></a>'
	                +'</DIV><DIV class="product-label"><span>NEW</span>'
	                +'</DIV></DIV><DIV class="product-content-list">'
	                +'<h4 class="product-name"><a href="product-details.html">'+data.data[i].name+'</a></h4>'  
	                +'<DIV class="ratings">'
	               	+str
	                +' </DIV><DIV class="price-box"><span class="price-regular">'+data.data[i].price+'</span></DIV>'
	                +'<p>'+data.data[i].descs+'</p> <a class="btn btn-large hover-color" href="#">直接购买</a>'
	                +'<a href="cart.html" class="btn btn-large hover-color">加入购物车</a>'
	                +'</DIV></DIV></DIV>');
		}
	}
	
	function models (data){
		var str = '';
		$('#modals').empty();
		for(var i = 0;i<data.data.length;i++){
			var image2='';
			var score='';
			var productSizes='';
			for(var y = 0;y<data.data[i].images.length;y++){
				image2 +=' <a href="javascript:ChoiceImage('+data.data[i].id+','+i+','+y+')">'
				+'<div class="pro-nav-thumb"><img src="img/'+data.data[i].images[y].imagePath+'" style="width: 90px; float: left;margin:2px;;border:0;padding:0"/></div>'
				+'</a><input type="hidden" value="'+data.data[i].images[y].imagePath+'" id="image'+i+''+y+'">';
			}
			for(var x=0;x<data.data[i].score;x++){
                score+='<span><i class="fa fa-star"></i></span>';	
                }
			for(var x=0;x<data.data[i].productSizes.length;x++){
				productSizes+='<option>'+data.data[i].productSizes[x].size+'</option>';	
                }
			
			  str += '<div class="modal" id="quick_view'+data.data[i].id+'">'
			        +'<div class="modal-dialog modal-lg modal-dialog-centered">'
		        	+'<div class="modal-content"><div class="modal-header">'
		            +'<button type="button" class="close" data-dismiss="modal">&times;</button>'
		          	+'</div><div class="modal-body"><div class="product-details-inner">'
		            +'<div class="row"><div class="col-lg-5">'
		            +'<div class="product-large-slider" >'
		           	+'<div class="pro-large-img "><img src="img/'+data.data[i].images[0].imagePath+'" alt="product-details"  style="height: 420px" id="image'+data.data[i].id+'"/></div></div>'
		            +'<div class="pro-nav slick-row-10 slick-arrow-style"  id="image2">'
		            +image2+'</div></div>'
		            +'<div class="col-lg-7"><div class="product-details-des">'
		            +'<h3 class="product-name">'+data.data[i].name+'</h3> <div class="ratings d-flex">'
					+score+'<div class="pro-review"><span>'+data.data[i].score+' Reviews</span> </div></div>'
		            +'<div class="price-box"><span class="price-regular">$'+data.data[i].price+'</span></div>'
		            +'<div class="availability"><i class="fa fa-check-circle"></i>'
		            +'<span> 200 in stock</span></div>'
		            +'<p class="pro-desc">'+data.data[i].descs+'</p> <div class="quantity-cart-box d-flex align-items-center">'
		            +'<h6 class="option-title">qty:</h6><div class="quantity">'
		            +'<div class="pro-qty"><input type="text" value="1"></div></div></div>'
		            +'<div class="pro-size"><h6 class="option-title">size :</h6><select class="nice-select">'
		            +productSizes
		            +'</select> </div>'
		            +'<div class="action_link"> <a class="btn btn-cart2" href="#">直接购买</a>'
		            +'<a class="btn btn-cart2" href="#">加入购物车</a>'
		            +'</div></div> </div>  </div>  </div> </div></div></div></div>';	
		            
		       
		}
		$('#modals').append(str);
		
	}
	function ChoiceImage(id,index1,index2){
		var a = $('#image'+index1+''+index2).val();
		$('#image'+id).attr('src','img/'+a);
	}
	function toCart(id){
		
		var  size = $('#size'+id+' span').text();
		var price = $('#price'+id).text()
		var count = $('#count'+id).val();
		var image = $('#image'+id).attr("src").substring(4);
		price = parseInt(price.substring(1));
		count = parseInt(count);
		var countPrice = price*count;
		
		$.post("toCart",{orderSize:size,orderImage:image},function(data){
			
		});
		
		
		$("#quick_view"+id).removeClass("show");
		$("#quick_view"+id).removeAttr("style");
		$("#bodys").removeClass();
		$("#bodys").removeAttr("style");
		$('.modal-backdrop').remove();
		
		
	}
	
</script>
</body>
</html>