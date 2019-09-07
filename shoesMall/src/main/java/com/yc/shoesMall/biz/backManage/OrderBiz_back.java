package com.yc.shoesMall.biz.backManage;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.yc.shoesMall.bean.OrderDetail;
import com.yc.shoesMall.bean.OrderDetailExample;
import com.yc.shoesMall.bean.Orders;
import com.yc.shoesMall.bean.OrdersExample;
import com.yc.shoesMall.dao.OrderDetailMapper;
import com.yc.shoesMall.dao.OrdersMapper;
import com.yc.shoesMall.result.Result;

@Service
public class OrderBiz_back {

	@Resource
	private OrdersMapper om;
	
	@Resource
	private OrderDetailMapper odm;
	
	/**
	 * 查看订单详情
	 * @param oid
	 * @return
	 */
	public List<OrderDetail> queryOrderDetailByOrderId(int oid){
		OrderDetailExample example = new OrderDetailExample();
		example.createCriteria().andOidEqualTo(oid);
		List<OrderDetail> list = odm.selectByExample(example);
		return list;
	}
	
	/**
	 * 修改订单状态
	 * @param orders
	 * @return
	 */
	public Orders updateOrderStatus(Orders orders) {
		om.updateByPrimaryKeySelective(orders);
		return orders;
	}
	
	/**
	 * 分页查询查询 订单
	 * @return
	 */
	public Result queryProduct(int page, int limit, Orders orders){
		Page<Object> startPage = PageHelper.startPage(page, limit);
		List<Orders> list = new ArrayList<Orders>();
		
		//首次如果状态为0 或者， 为null 则查询全部订单，其它状态根据订单状态查询
		if(orders.getStatus() != null) {
			if("0".equals(orders.getStatus())){
				list = om.selectByExample(null);
			}else {
				OrdersExample example = new OrdersExample();
				example.createCriteria().andStatusEqualTo(orders.getStatus());
				list = om.selectByExample(example);
			}
		}else {
			list = om.selectByExample(null);
		}
		//统计总页数
		long total = startPage.getTotal();
		return new Result(0, "OK",(int) total, list);
	}
}
