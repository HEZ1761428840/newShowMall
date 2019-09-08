package com.yc.shoesMall.biz;

import java.math.BigDecimal;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.yc.shoesMall.bean.Cart;
import com.yc.shoesMall.bean.CartExample;
import com.yc.shoesMall.bean.OrderDetail;
import com.yc.shoesMall.bean.OrderDetailExample;
import com.yc.shoesMall.bean.Orders;
import com.yc.shoesMall.bean.OrdersExample;
import com.yc.shoesMall.bean.User;
import com.yc.shoesMall.dao.CartMapper;
import com.yc.shoesMall.dao.OrderDetailMapper;
import com.yc.shoesMall.dao.OrdersMapper;
import com.yc.shoesMall.utill.OrderUtill;

@Service
public class OrdersBiz {
	@Autowired
	private OrdersMapper ordersMapper;
	
	@Autowired
	private OrderDetailMapper orderDetailMapper;
	
	@Autowired
	private CartMapper cartMapper;
	@Transactional
	public List<OrderDetail> addOrders(String orderid,User user,List<Cart> list) {
		Long countPrice = (long) 0;
		
		Orders orders = new Orders();
		orders.setOrderNum(orderid);
		orders.setUid(user.getId());
		orders.setCreateTime(new Date());
		orders.setStatus("1");
		
		for (Cart cart : list) {
			countPrice += cart.getProduct().getPrice()*cart.getProductCount();
		}
		orders.setCountPrice(countPrice);
		ordersMapper.insertSelective(orders);
			
		OrdersExample example = new OrdersExample();
		example.createCriteria().andOrderNumEqualTo(orderid);
		Orders orders2 = ordersMapper.selectByExample(example).get(0);
		
		for (Cart cart : list) {
			OrderDetail record = new OrderDetail();
			record.setNumber(cart.getProductCount());
			record.setOid(orders2.getId());
			record.setPid(cart.getPid());
			Long price = cart.getProduct().getPrice(); 
			record.setPrice(price);
			orderDetailMapper.insert(record);
			
		}
		
		CartExample example2 = new CartExample();
		example2.createCriteria().andUidEqualTo(user.getId());		
		
		cartMapper.deleteByExample(example2);
		OrderDetailExample example3 = new OrderDetailExample();
		example3.createCriteria().andOidEqualTo(orders2.getId());
	
		return  orderDetailMapper.selectByExample(example3);
	}
	
	public List<Orders> selectOrders(User user) {
		OrdersExample example = new OrdersExample();
		example.createCriteria().andUidEqualTo(user.getId());
		return ordersMapper.selectByExample(example);
	}
	
	public List<Orders> selectOrders(String Orderid) {
		OrdersExample example = new OrdersExample();
		example.createCriteria().andOrderNumEqualTo(Orderid);
		return ordersMapper.selectByExample(example);
	}
	
}
