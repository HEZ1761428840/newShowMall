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
			.layui-form-label{
				width: 100px;
			}
			.layui-input-block{
				margin-left: 130px;
			}
			.layui-form{
				margin-right: 30%;
			}
		</style>

	</head>

	<body>
		<div class="cBody">
			<form id="addForm" enctype="multipart/form-data" class="layui-form" method="post" action="insertProduct">
				<div class="layui-form-item">
					<label class="layui-form-label">商品名称</label>
					<div class="layui-input-block">
						<input type="text" name="name" required lay-verify="required" autocomplete="off" class="layui-input">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">商品图片</label>
					<div class="layui-upload-drag" id="pictrue">
					  	<input type="file" name="imagePath" id="imagePath" class="layui-input">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">颜色</label>
					<div class="layui-input-block">
						<input type="text" name="color" required lay-verify="required" autocomplete="off" class="layui-input">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">参考价格</label>
					<div class="layui-input-block">
						<input type="text" name="price" required lay-verify="required|number" autocomplete="off" class="layui-input">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">库存</label>
					<div class="layui-input-block">
						<input type="text" name="stock" lay-verify="required|number" autocomplete="off" class="layui-input">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">商品尺寸</label>
					<div class="layui-input-block">
						<input type="text" name="Lstock" placeholder="L尺寸库存"   class="layui-input">
						<input type="text" name="Mstock" placeholder="M尺寸库存" style="margin-top: 10px; margin-bottom: 10px;" class="layui-input">
						<input type="text" name="Sstock" placeholder="S尺寸库存"   class="layui-input">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">描述</label>
					<div class="layui-input-block">
						<textarea name="descs" class="layui-textarea"></textarea>
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">商品品牌</label>
	                <div class="layui-input-inline">
	                    <select name="pbid" id="pbid" lay-filter="cityid">
	                    	<option value=""></option>
	                    	<c:forEach items="${pbList }" var="p">
	                       		<option value="${p.id }">${p.brandName }</option>
	                    	</c:forEach>
					        
	                    </select>
	                </div>
				</div>
				<div class="layui-form-item">
					<div class="layui-input-block">
						<button class="layui-btn" lay-submit lay-filter="submitBut">立即提交</button>
						<button type="reset" class="layui-btn layui-btn-primary">重置</button>
					</div>
				</div>
			</form>
			
			
			<script>
				layui.use(['upload','form'], function() {
					var form = layui.form;
					var upload = layui.upload;
					var layer = layui.layer;
					
					form.verify({
						//数组的两个值分别代表：[正则匹配、匹配不符时的提示文字]
					  	ZHCheck: [
						    /^[\u0391-\uFFE5]+$/
						    ,'只允许输入中文'
					  	] 
					});
					
				});
			</script>

		</div>
	</body>

</html>