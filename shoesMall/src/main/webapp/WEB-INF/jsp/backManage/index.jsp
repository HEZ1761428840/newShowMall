<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		<link rel="shortcut icon" href="images/favicon.ico"/>
		<link rel="bookmark" href="../../../../../../backManage/images/favicon.ico"/>
		<link rel="stylesheet" type="text/css" href="../../../../../../backManage/css/base.css">
		<link rel="stylesheet" type="text/css" href="../../../../../../backManage/css/iconfont.css">
		<script type="text/javascript" src="../../../../../../backManage/framework/jquery-1.11.3.min.js" ></script>
		<link rel="stylesheet" type="text/css" href="../../../../../../backManage/layui/css/layui.css">
	    <!--[if lt IE 9]>
	      	<script src="framework/html5shiv.min.js"></script>
	      	<script src="framework/respond.min.js"></script>
	    <![endif]-->
		<script type="text/javascript" src="../../../../../../backManage/layui/layui.js"></script>
		<!-- 滚动条插件 -->
		<link rel="stylesheet" type="text/css" href="../../../../../../backManage/css/jquery.mCustomScrollbar.css">
		<script src="../../../../../../backManage/framework/jquery-ui-1.10.4.min.js"></script>
		<script src="../../../../../../backManage/framework/jquery.mousewheel.min.js"></script>
		<script src="../../../../../../backManage/framework/jquery.mCustomScrollbar.min.js"></script>
		<script src="../../../../../../backManage/framework/cframe.js"></script><!-- 仅供所有子页面使用 -->
		<!-- 公共样式 结束 -->
		
		<link rel="stylesheet" type="text/css" href="../../../../../../backManage/css/frameStyle.css">
		<script type="text/javascript" src="../../../../../../backManage/framework/frame.js" ></script>
		
	</head>

	<body>
		<!-- 左侧菜单 - 开始 -->
		<div class="frameMenu">
		    <div class="logo">
		        <img src="../../../../../../backManage/images/logo.png"/>
		        <div class="logoText">
		            <h1>穷在闹市出品</h1>
		            <p>qiongzainaoshi</p>
		        </div>
		    </div>
		    <div class="menu">
		        <ul>
		        	<li>
		                <a class="menuFA" href="javascript:void(0)" onclick="menuCAClick('../../../../../../backManage/tgls/qdAPI.html',this)"><i class="iconfont icon-zhishi left"></i>前端API</a>
		            </li>
		        	<li>
		                <a class="menuFA" href="javascript:void(0)"><i class="iconfont icon-liuliangyunpingtaitubiao03 left"></i>订单管理<i class="iconfont icon-dajiantouyou right"></i></a>
		                <dl>
		                	<dt><a href="javascript:void(0)" onclick="menuCAClick('orderManage',this)">订单查询</a></dt>
		                </dl>
		            </li>
		        	<li>
		                <a class="menuFA" href="javascript:void(0)"><i class="iconfont icon-shangpin left"></i>商品管理<i class="iconfont icon-dajiantouyou right"></i></a>
		                <dl>
		                	<dt><a href="javascript:void(0)" onclick="menuCAClick('productManage',this)">基本商品库</a></dt>
		                	<dt><a href="javascript:void(0)" onclick="menuCAClick('goodsAdd',this)">添加商品</a></dt>
		                </dl>
		            </li>
		        	<li>
		                <a class="menuFA" href="javascript:void(0)"><i class="iconfont icon-yunying left"></i>用户管理<i class="iconfont icon-dajiantouyou right"></i></a>
		                <dl>
		                	<dt><a href="javascript:void(0)" onclick="menuCAClick('userManage',this)">用户信息</a></dt>
		                </dl>
		           	</li>
		        	<li>
		                <a class="menuFA" href="javascript:void(0)"><i class="iconfont icon-icon left"></i>打印模板<i class="iconfont icon-dajiantouyou right"></i></a>
		                <dl>
		                	<dt><a href="javascript:void(0)" onclick="menuCAClick('../../../../../../backManage/tgls/print/outPrintData.html',this)">入库单打印模版</a></dt>
		                </dl>
		           	</li>
		        	<li>
		                <a class="menuFA" href="javascript:void(0)"><i class="iconfont icon-caiwu left"></i>财务管理</a>
		           	</li>
		        	<li>
		                <a class="menuFA" href="javascript:void(0)"><i class="iconfont icon-icon left"></i>报表模块<i class="iconfont icon-dajiantouyou right"></i></a>
		                <dl>
		                	<dt><a href="javascript:void(0)" onclick="menuCAClick('../../../../../../backManage/tgls/reportForm/reportForm1.html',this)">订单统计报表</a></dt>
		                </dl>
		           	</li>
		        </ul>
		    </div>
		</div>
		<!-- 左侧菜单 - 结束 -->
		
		<div class="main">
			<!-- 头部栏 - 开始 -->
			<div class="frameTop">
				<img class="jt" src="../../../../../../backManage/images/top_jt.png"/>
				<div class="topMenu">
					<ul>
						<li><a href="javascript:void(0)" onclick="menuCAClick('../../../../../../backManage/tgls/modify_password.html',this)"><i class="iconfont icon-yonghu1"></i>${user.name }</a></li>
						<li><a href="javascript:void(0)" onclick="menuCAClick('../../../../../../backManage/tgls/modify_password.html',this)"><i class="iconfont icon-xiugaimima"></i>修改密码</a></li>
						<li><a href="toAdminLogin"><i class="iconfont icon-084tuichu"></i>注销</a></li>
					</ul>
				</div>
			</div>
			<!-- 头部栏 - 结束 -->
			
			<!-- 核心区域 - 开始 -->
			<div class="frameMain">
				<div class="title" id="frameMainTitle">
					<span><i class="iconfont icon-xianshiqi"></i>后台首页</span>
				</div>
				<div class="con">
					<iframe id="mainIframe" src="../../../../../../backManage/tgls/qdAPI.html" scrolling="no"></iframe>
				</div>
			</div>
			<!-- 核心区域 - 结束 -->
		</div>
	</body>

</html>