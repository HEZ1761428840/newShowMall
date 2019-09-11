package com.yc.shoesMall.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;
import com.yc.shoesMall.bean.Cart;
import com.yc.shoesMall.bean.User;
import com.yc.shoesMall.biz.CartBiz;
import com.yc.shoesMall.biz.OrderDetailBiz;
import com.yc.shoesMall.biz.OrdersBiz;
import com.yc.shoesMall.utill.OrderUtill;

@Controller
public class ordersAction {

	@Resource
	private CartBiz cartbiz;
	
	@Resource
	private OrdersBiz ordersBiz;
	
	@Resource
	private OrderDetailBiz orderDetailBiz;
	
	@RequestMapping("checkout")
	public String checkout(@SessionAttribute(name = "loginUser", required = false) User user,
			Model model) {
		List<Cart> list = cartbiz.queryMyOrder(user.getId());
			if(list==null||list.size()<=0) {
				return "redirect:shop";
			}
			model.addAttribute("carts", cartbiz.queryMyCart(user.getId()));
			String orderid = OrderUtill.getOrderid();
			 model.addAttribute("OrderDetails",ordersBiz.addOrders(orderid,user, list));
			 model.addAttribute("orders", ordersBiz.selectOrders(orderid)) ;
		return "checkout";
	}
	
	@RequestMapping("showOrders")
	public String showOrders(int orderId,Model model) {
		 model.addAttribute("orders", ordersBiz.selectOrders(orderId)) ;
		model.addAttribute("OrderDetails", orderDetailBiz.showOrderDetail(orderId));
		return "checkout";
	}
	
	
}