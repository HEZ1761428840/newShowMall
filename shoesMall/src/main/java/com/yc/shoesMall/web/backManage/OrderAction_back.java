package com.yc.shoesMall.web.backManage;

import javax.annotation.Resource;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.yc.shoesMall.bean.Orders;
import com.yc.shoesMall.biz.backManage.OrderBiz_back;
import com.yc.shoesMall.result.Result;

@RestController
public class OrderAction_back {
	
	@Resource
	private OrderBiz_back ob;
	
	@PostMapping("queryOrderDetail")
	public Result queryOrderDetail(int oid) {
		return new Result(1, "OK", ob.queryOrderDetailByOrderId(oid));
	}
	
	/**
	 * 分页 ＋ 条件查询  订单表
	 * @param page  第几页
	 * @param limit 每页多少条记录
	 * @param orders  条件
	 * @return
	 */
	@GetMapping("queryOrder")
	public Result queryProduct(int page, int limit, Orders orders) {
		return ob.queryProduct(page, limit, orders);
	}
	
	/**
	 * 修改订单状态
	 * @param orders
	 * @return
	 */
	@PostMapping("updateOrderStatus")
	public Result updateOrderStatus(Orders orders) {
		return new Result(1, "OK", ob.updateOrderStatus(orders));
	}
	
}
