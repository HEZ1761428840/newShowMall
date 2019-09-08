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
		<!-- 仅供所有子页面使用 -->
		<!-- 公共样式 结束 -->

	</head>

	<body>
		<div class="cBody">
			<!-- 工具栏 -->
			<script type="text/html" id="toolbarDemo">
  				<div class="layui-btn-container">
   				<button class="layui-btn layui-btn-sm" lay-event="toDealOrder">待接订单</button>
    			<button class="layui-btn layui-btn-sm" lay-event="notPayOrder">未支付订单</button>
    			<button class="layui-btn layui-btn-sm" lay-event="receivedOrder">已接订单</button>
    			<button class="layui-btn layui-btn-sm" lay-event="sendingOrder">正在派送订单</button>
    			<button class="layui-btn layui-btn-sm" lay-event="completedOrder">已完成订单</button>
				<button class="layui-btn layui-btn-sm" lay-event="allOrder">全部订单</button>
  				</div>
			</script>
			
			
			<!-- 数据表格 -->
			<table class="layui-hide" id="orderTable" lay-filter="orderTable"></table>
			<script>
				layui.use('table', function(){
					var table = layui.table;
					var layer = layui.layer;
					var form = layui.form;
					var tableIns = table.render({
						elem: '#orderTable'
					    ,url:'queryOrder'
					    ,page: true
					    ,toolbar: '#toolbarDemo'
					    ,id: 'doReload'
					    ,totalRow: true
						,defaultToolbar: ['filter']
					    ,cols: [[
					   		{field:'id', title:'ID',hide:true, unresize: true, sort: true}
					      	,{field:'orderNum', title:'订单编号', unresize: true, sort: true}
					      	,{field:'name', title:'购买用户', templet: function(data){
					      		return data.user.name;
					      	}}
					     	,{field:'createTime', title:'下单时间', totalRowText: '合计'}
					     	,{field:'countPrice', title:'金额', totalRow: true}
					     	,{field:'finishTime', title:'完成时间'}
					     	,{field:'status', title:'订单状态', templet:function(data){
					     		if(data.status == 1){
					     			return '<em class="layui-bg-orange">未支付<em>';
					     		}else if(data.status == 2){
					     			return '<em class="layui-bg-red">等待接单<em>';
					     		}else if(data.status == 3){
					     			return '<em class="layui-bg-cyan">已接订单<em>';
					     		}else if(data.status == 4){
					     			return '<em class="layui-bg-blue">正在派送<em>';
					     		}else if(data.status == 5){
					     			return '<em class="layui-bg-green">已完成<em>';
					     		}
					     	}}
					     	,{field:'payMethod', title:'支付方式', templet:function(data){
					     		if(data.payMethod == 1){
					     			return '支付宝';
					     		}else if(data.status == 2){
					     			return '微信支付';
					     		}
					     	}}
					     	,{fixed: 'right', title:'操作', width:120, templet: function(data){
					     		if(data.status == 2){
					     			var barDemo = '<a class="layui-btn layui-btn-xs" lay-event="orderReceiving">接单</a>'+
					     						'<a class="layui-btn layui-btn-warm layui-btn-xs" lay-event="detail">详情</a>';
					     			return barDemo;
					     		}else if(data.status == 3){
					     			var barDemo = '<a class="layui-btn layui-btn-xs" lay-event="sendOrder">派送</a>'+
		     						'<a class="layui-btn layui-btn-warm layui-btn-xs" lay-event="detail">详情</a>';
		     						return barDemo;
		     					}else if(data.status == 4){
					     			var barDemo = '<a class="layui-btn layui-btn-xs" lay-event="completeOrder">完成</a>'+
		     						'<a class="layui-btn layui-btn-warm layui-btn-xs" lay-event="detail">详情</a>';
		     						return barDemo;
		     					}else {
					     			return '<a class="layui-btn layui-btn-warm layui-btn-xs" lay-event="detail">详情</a>';
					     		}
					     	}}
					     	 
					    ]]
					});
					
					//监听行工具事件
					table.on('tool(orderTable)', function(obj){
						var data = obj.data;
						if(obj.event === 'detail'){
							$.post('queryOrderDetail',{oid: data.id},function(result){
						    	if(result.code == 1){
						    		var OrderProduct = '';
						    		for(var i = 0; i < result.data.length; i ++){
						    			OrderProduct += 
						    			'<tr>'+
					    				'<td>商品名字</td>'+
					    				'<td>'+result.data[i].product.name+'</td>'+
					    				'</tr>'+
						    			'<tr>'+
						    				'<td>商品图片</td>'+
						    				'<td><img src="'+result.data[i].product.images[0].imagePath+'" /></td>'+
						    			'</tr>'+
						    			'<tr>'+
						    				'<td>商品数量</td>'+
						    				'<td>'+result.data[i].number+'</td>'+
						    			'</tr>';
						    		}
						    		
						    		var detail = 
						    			'<table border="1" cellspacing="0" >'+
						    			'<tr>'+
						    				'<td>订单编号</td>'+
						    				'<td>'+data.orderNum+'</td>'+
						    			'</tr>'+
						    			'<tr>'+
						    				'<td>购买用户</td>'+
						    				'<td>'+data.user.name+'</td>'+
						    			'</tr>'+
						    			'<tr>'+
						    				'<td>收件人</td>'+
						    				'<td>'+data.address.name+'</td>'+
						    			'</tr>'+
						    			'<tr>'+
						    				'<td>下单时间</td>'+
						    				'<td>'+data.createTime+'</td>'+
						    			'</tr>'+
						    			'<tr>'+
						    				'<td>完成时间</td>'+
						    				'<td>'+data.finishTime+'</td>'+
						    			'</tr>'+
						    			'<tr>'+
						    				'<td>金额</td>'+
						    				'<td>'+data.countPrice+'</td>'+
						    			'</tr>'+ OrderProduct +
						    			
						    			'<tr>'+
						    				'<td>收货地址</td>'+
						    				'<td>'+data.address.address+'</td>'+
						    			'</tr>'+
						    		'</table>';						    		
						    		layer.open({
						    			  title: '订单详细信息',
						    			  area: ['500','70%'],
						    			  content: detail
						    		});
						    	}
						    });
						}else if(obj.event === 'orderReceiving'){
							layer.msg('确定接单?', {
						    	time: 20000, //20s后自动关闭
						        btn: ['确定', '不了']
						        ,yes: function(){
						        	layer.close(layer.index);
						        	$.post('updateOrderStatus',{id: data.id, status: '3'},function(data){
								    	if(data.code == 1){
								    		tableIns.reload();
								    		layer.msg('接单成功');
								    	}
								    });
						        }
						     });
							
						}else if(obj.event === 'sendOrder'){
							layer.msg('确定派送?', {
						    	time: 20000, //20s后自动关闭
						        btn: ['确定', '不送']
						        ,yes: function(){
						        	layer.close(layer.index);
						        	$.post('updateOrderStatus',{id: data.id, status: '4'},function(data){
								    	if(data.code == 1){
								    		tableIns.reload();
								    		layer.msg('派送成功');
								    	}
								    });
						        }
						     });
							
						}else if(obj.event === 'completeOrder'){
							layer.msg('确定订单已经完成了?', {
						    	time: 20000, //20s后自动关闭
						        btn: ['确定', '还没']
						        ,yes: function(){
						        	layer.close(layer.index);
						        	$.post('updateOrderStatus',{id: data.id, status: '5'},function(data){
								    	if(data.code == 1){
								    		tableIns.reload();
								    		layer.msg('完成订单');
								    	}
								    });
						        }
						     });
							
						}
					});
					
					
					//头工具栏事件
				  	table.on('toolbar(orderTable)', function(obj){
					    switch(obj.event){
					      case 'toDealOrder':
						      //执行重载
						      table.reload('doReload', {
						        page: {
						          curr: 1 //重新从第 1 页开始
						        }
						        ,where: {
						           status: '2'
						        }
						      }, 'data');
					      	break;
					      case 'notPayOrder':
					    	//执行重载
						      table.reload('doReload', {
						        page: {
						          curr: 1 //重新从第 1 页开始
						        }
						        ,where: {
						           status: '1'
						        }
						      }, 'data');
						      break;
					      case 'receivedOrder':
					    	//执行重载
						      table.reload('doReload', {
						        page: {
						          curr: 1 //重新从第 1 页开始
						        }
						        ,where: {
						           status: '3'
						        }
						      }, 'data');
						      break;
					      case 'sendingOrder':
					    	//执行重载
						      table.reload('doReload', {
						        page: {
						          curr: 1 //重新从第 1 页开始
						        }
						        ,where: {
						           status: '4'
						        }
						      }, 'data');
						      break;
					      case 'completedOrder':
					    	//执行重载
						      table.reload('doReload', {
						        page: {
						          curr: 1 //重新从第 1 页开始
						        }
						        ,where: {
						           status: '5'
						        }
						      }, 'data');
						      break;
					      case 'allOrder':
					    	//执行重载
						      table.reload('doReload', {
						        page: {
						          curr: 1 //重新从第 1 页开始
						        }
						        ,where: {
						           status: '0'
						        }
						      }, 'data');
						      break;
					    };
				  	});
				});
			</script>
		</div>
	</body>

</html>