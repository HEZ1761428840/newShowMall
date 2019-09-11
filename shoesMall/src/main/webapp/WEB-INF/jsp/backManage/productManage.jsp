<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,Chrome=1">
		<!-- Google Chrome Frame也可以让IE用上Chrome的引擎: -->
		<meta name="renderer" content="webkit">
		<!--国产浏览器高速模式-->
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta name="author" content="穷在闹市" />
		<!-- 作者 -->
		<meta name="revised" content="穷在闹市.v3, 2019/05/01" />
		<!-- 定义页面的最新版本 -->
		<meta name="description" content="网站简介" />
		<!-- 网站简介 -->
		<meta name="keywords" content="搜索关键字，以半角英文逗号隔开" />
		<title>穷在闹市出品</title>

		<!-- 公共样式 开始 -->
		<link rel="stylesheet" type="text/css" href="../../../../../../../../backManage/css/base.css">
		<link rel="stylesheet" type="text/css" href="../../../../../../../../backManage/css/iconfont.css">
		<script type="text/javascript" src="../../../../../../../../backManage/framework/jquery-1.11.3.min.js"></script>
		<link rel="stylesheet" type="text/css" href="../../../../../../../../backManage/layui/css/layui.css">
		<script type="text/javascript" src="../../../../../../../../backManage/layui/layui.js"></script>
		<!-- 滚动条插件 -->
		<link rel="stylesheet" type="text/css" href="../../../../../../../../backManage/css/jquery.mCustomScrollbar.css">
		<script src="../../../../../../../../backManage/framework/jquery-ui-1.10.4.min.js"></script>
		<script src="../../../../../../../../backManage/framework/jquery.mousewheel.min.js"></script>
		<script src="../../../../../../../../backManage/framework/jquery.mCustomScrollbar.min.js"></script>
		<script src="../../../../../../../../backManage/framework/cframe.js"></script><!-- 仅供所有子页面使用 -->
		<!-- 公共样式 结束 -->
		<style>
			.layui-table img {
			    max-width: none;
			}
		</style>

	</head>

	<body>
		<div class="cBody">
			<div class="console">
				<form class="layui-form" id="searchBar">
					
					<div class="layui-form-item">
						 搜索ID：
						<div class="layui-inline">
						    <input class="layui-input" name="id" id="productId" autocomplete="off">
						</div>
						搜索类型：
		                <div class="layui-inline">
		                    <select name="productName" id="productName" lay-filter="tostatus">
		                    	<option value="">全部</option>
		                        <c:forEach items="${pbList}" var="pb">
		                        	<option value="${pb.id }">${pb.brandName}</option>
		                        </c:forEach>
		                    </select>
		                </div>
						<a class="layui-btn"  data-type="reload">搜索</a>
					</div>
				</form>
			</div>
		
	<table class="layui-hide" id="productTable" lay-filter="user"></table>
 	<script type="text/html" id="barDemo">
  		<a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看</a>
  		<a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
	</script>
	
	<!-- 修改商品的弹出框 -->
	<div id = "editProcut" style="display: none">
		<form class="layui-form layui-form-pane" lay-filter="updateFrom">
			<div class="layui-form-item" style="display: none">
				<label class="layui-form-label">商品Id</label>
				<div class="layui-input-block">
					<input type="text" name="id" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">商品名称</label>
				<div class="layui-input-block">
					<input type="text" name="name" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">商品价格</label>
				<div class="layui-input-block">
					<input type="text" name="price" class="layui-input">
				</div>
			</div>
			
			<div class="layui-form-item">
				<label class="layui-form-label">商品颜色</label>
				<div class="layui-input-block">
					<input type="text" name="color" class="layui-input">
				</div>
			</div>
			 
			<div class="layui-form-item">
				<label class="layui-form-label">商品库存</label>
				<div class="layui-input-block">
					<input type="text" name="stock" class="layui-input">
				</div>
			</div>
			
			<div class="layui-form-item">
				<label class="layui-form-label">商品品牌</label>
				<div class="layui-input-block">
					<select name="productBrand" id = "pbName">
						<option value="0"></option>
						<c:forEach items="${pbList}" var="pb">
		                     <option value="${pb.id }">${pb.brandName}</option>
		                </c:forEach>
					</select>
				</div>
			</div>
			
			<div class="layui-form-item">
				<label class="layui-form-label">商品图片</label>
				<div class="layui-upload-drag" id="goodsPic">
				  	<p id="picture" style="float: left;"></p>
				</div>
			</div>
			
			<div class="layui-form-item layui-form-text">
				<label class="layui-form-label">描述</label>
				<div class="layui-input-block">
					<textarea class="layui-textarea" name = "descs" id = "descs"></textarea>
				</div>
			</div>
			<div class="layui-form-item" style="margin-left: 350px;">
				<a class="layui-btn" lay-submit="" lay-filter="productUpdateTabel">修改</a>
			</div>
		</form>
	</div>
	
	<script>
		layui.use(['table', 'form'], function(){
			var table = layui.table
			,form = layui.form, layer = layui.layer;
			
			
			var tableIns = table.render({
				elem: '#productTable'
			    ,url:'queryProduct'
			    ,page: true
			    ,id: 'doReload'
			    ,toolbar:true
			    ,defaultToolbar: ['filter']
				,totalRow: true
				,skin: 'line' //行边框风格
				,even: true //开启隔行背景
			    ,cols: [[
			      {type:'numbers'}
			      ,{field:'id', title:'ID', unresize: true, sort: true}
			      ,{field:'name', title:'商品名称'}
			      ,{field:'price', title:'价格', totalRowText: '合计'}
			      ,{field:'productBrand', title:'品牌', templet:function(val){
			    	  return val.productBrand == null ? '' : val.productBrand.brandName;
			      }}
			      ,{field:'color', title:'颜色', hide: true}
			      ,{field:'descs', title:'描述', hide: true}
			      ,{field:'createTime', title:'添加时间', hide: true }
			      ,{field:'stock', title:'库存', totalRow: true}
			      ,{field:'score', title:'评分', hide: true}
			      ,{field:'commentCount', title:'评论数', hide:true, totalRow: true}
			      ,{field:'status', title:'状态', templet:function(val){
			    	  if(val.status == 1){
			    		  return '<em class="layui-bg-green">售卖中<em>';
			    	  }else if(val.status == 0){
			    		  return '<em class="layui-bg-red">下架<em>';
			    	  }
			      }}
			     ,{fixed: 'right', title:'操作', toolbar: '#barDemo', width:120}
			    ]]
		});
			
		
 		var $ = layui.$, active = {
		    reload: function(){
		    	var pid = $("#productId").val();
				var pbid = $('#productName').val();
		      
		      //执行重载
		      table.reload('doReload', {
		        page: {
		          curr: 1 //重新从第 1 页开始
		        }
		        ,where: {
		            id: pid
		            ,pbid: pbid
		        }
		      }, 'data');
		    }
		 };
		  
 		 $('.console .layui-btn').on('click', function () {
             var type = $(this).data('type');
             active[type] ? active[type].call(this) : '';
         });
 		 
 		//监听工具条
 		  table.on('tool(user)', function(obj){
 		    var data = obj.data;
 		   
 		    if(obj.event === 'detail'){
 		    	//跳转到前台的商品查询
 		    	window.location.href="localhost:8080/toDetails?id=692";
 		    } else if(obj.event === 'edit'){
 		    	layer.open({
	        		//layer提供了5种层类型。可传入的值有：0（信息框，默认）1（页面层）2（iframe层）3（加载层）4（tips层）
		            type: 1,
		            title:"修改商品",
		            area: ['70%','100%'],
		            content: $("#editProcut").html(),
		            success: function(index){
		            	form.val("updateFrom", data);
		            	//设置下拉框的值
		            	var pid = data.pbid;
		            	if(pid == null){
		            		pid = 0;
		            	}
		            	$("#pbName option[value='"+pid+"']").prop("selected", true);
		            	//显示图片
		            	var pic = '<img  src="img/'+data.images[0].imagePath+'">';
		            	$('#editProcut #goodsPic #picture').html(pic);
		                form.render('select'); //熏染
		            }
		           
 		    	});
 		    }
 		  });
 		
 		//监听修改商品
 		form.on('submit(productUpdateTabel)',function(data){
 			var formData = data.field;
 			//id name price color stock productBrand descs
 			var id = formData.id;
 			var name = formData.name;
 			var price = formData.price;
 			var color = formData.color;
 			var stock = formData.stock;
 			var pbid = formData.productBrand;
 			var descs = formData.descs;
 			$.ajax({
 				type: "POST",
 				url: "updateProduct",
 				data: { id: id
 					, name: name
 					, price: price
 					, color: color
 					, stock: stock
 					, pbid: pbid
 					, descs: descs
 				},
 				success: function (data) {
 					if(data.code == 1){
 			    		tableIns.reload();
 			    		layer.msg('修改成功');
 			    	}else if(data.code == 0){
 			    		layer.msg('修改失败');
 			    	}
 				}
 			});
			
 			layer.close(layer.index); 
 			
 		});
 		
			
	});
		
	</script>
	
	</div>
</body>
</html>