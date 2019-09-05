package com.yc.shoesMall.web.backManage;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.yc.shoesMall.bean.Order;
import com.yc.shoesMall.biz.backManage.OrderBiz_back;
import com.yc.shoesMall.result.Result;

@Controller
public class OrderAction_back {
	
	@Resource
	private OrderBiz_back ob;
	
	@GetMapping("queryOrder")
	public Result queryProduct(int page, int limit, Order order) {
		
		return ob.queryProduct(page, limit, order);
	}
	
}
