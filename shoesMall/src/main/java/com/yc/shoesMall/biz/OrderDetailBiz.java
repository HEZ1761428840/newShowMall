package com.yc.shoesMall.biz;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;

import com.yc.shoesMall.bean.OrderDetail;
import com.yc.shoesMall.bean.OrderDetailExample;
import com.yc.shoesMall.bean.OrdersExample;
import com.yc.shoesMall.dao.OrderDetailMapper;
import com.yc.shoesMall.dao.OrdersMapper;

@Controller
public class OrderDetailBiz {
	@Resource
	private OrderDetailMapper orderDetailMapper;
	
	
	public List<OrderDetail> showOrderDetail(int orderId) {
		OrderDetailExample example = new OrderDetailExample();
		example.createCriteria().andOidEqualTo(orderId);
		return orderDetailMapper.selectByExample(example);
	}
	
}
