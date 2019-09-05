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
						<div class="layui-input-inline">
							<input type="text" name="name" id = "name" placeholder="输入用户名" autocomplete="off" class="layui-input">
						</div>
						<div class="layui-input-inline">
		                    <select name="type" id="typeName" lay-filter="type">
		                    	<option value="">全部</option>
		                        <option value="普通用户">普通用户</option>
								<option value="管理员">管理员</option>
		                    </select>
		                </div>
		                <div class="layui-input-inline">
		                    <select name="status" id="status" lay-filter="tostatus">
		                    	<option value="">全部</option>
		                        <option value="1">在线</option>
								<option value="2">下线</option>
								<option value="0">停用</option>
		                    </select>
		                </div>
						<a class="layui-btn"  data-type="reload">搜索</a>
					</div>
				</form>
			</div>
		
	<table class="layui-hide" id="UserTable" lay-filter="user"></table>
 
	<script type="text/html" id="checkboxTpl">
 	 	<!-- 这里的 checked 的状态只是演示 -->
  		<input type="checkbox" name="lock" value="{{d.id}}" title="禁用" lay-filter="lockDemo" {{ d.status == 0 ? 'checked' : '' }} />
	</script>
 
	<script>
		layui.use('table', function(){
			var table = layui.table;
			var form = layui.form;
			var tableIns = table.render({
				elem: '#UserTable'
			    ,url:'showTable'
			    ,page: true
			    ,id: 'doReload'
			    ,cols: [[
			      {type:'numbers'}
			      ,{field:'headPictrue', title:'头像', templet:function(val){
			    	  return val.headPictrue == null ? '头像未上传' : 
			    		  '<img src="'+val.headPictrue+'" width="20" height="20" onmouseenter="imgBig(this)" onmouseleave="imgSmall(this)"/>';
			      }}
			      ,{field:'id', title:'ID', unresize: true, sort: true}
			      ,{field:'name', title:'用户名'}
			      ,{field:'status', title:'状态', templet:function(val){
			    	  if(val.status == 1){
			    		  return '<em class="layui-bg-green">在线<em>';
			    	  }else if(val.status == 2){
			    		  return '<em class="layui-bg-cyan">离线<em>';
			    	  }else if(val.status == 0){
			    		  return '<em class="layui-bg-red">禁用<em>';
			    	  }
			      }}
			      ,{field:'createTime', title:'注册时间'}
			      ,{field:'type', title:'用户类型'}
			      ,{field:'phone', title:'手机'}
			      ,{field:'email', title:'邮箱'}
			      ,{title:'是否禁用', width:110, templet: '#checkboxTpl', unresize: true}
			    ]]
		});
			
		
 		var $ = layui.$, active = {
		    reload: function(){
		    	var name = $(" input[ name='name' ] ").val();
				var type = $('#typeName').val();
				var status = $('#status').val();
		      
		      //执行重载
		      table.reload('doReload', {
		        page: {
		          curr: 1 //重新从第 1 页开始
		        }
		        ,where: {
		            name: name
		            ,type: type
		            ,status:status
		        }
		      }, 'data');
		    }
		 };
		  
 		 $('.console .layui-btn').on('click', function () {
             var type = $(this).data('type');
             active[type] ? active[type].call(this) : '';
         });
			
		  //监听锁定操作
	  	form.on('checkbox(lockDemo)', function(obj){
			var status = 2;
		    if(obj.elem.checked){
		    	status = 0;
		    }
		    $.post('updateUserStatus',{id:this.value, status:status},function(data){
		    	if(data.code == 1){
		    		tableIns.reload();
		    		layer.msg('修改成功');
		    	}
		    });
	  	});
	});
		
	</script>
	</div>
</body>
</html>