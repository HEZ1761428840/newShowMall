package com.yc.shoesMall.web;


import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.yc.shoesMall.bean.Cart;
import com.yc.shoesMall.bean.OrderDetail;
import com.yc.shoesMall.bean.User;
import com.yc.shoesMall.biz.CartBiz;
import com.yc.shoesMall.biz.OrdersBiz;
import com.yc.shoesMall.biz.UserBiz;
import com.yc.shoesMall.result.Result;
import com.yc.shoesMall.utill.OrderUtill;

@Controller
@SessionAttributes("carts")
public class cartAction {
	
	@Resource
	private UserBiz ubiz;
	
	@Resource
	private CartBiz cartbiz;
	
	@Resource
	private OrdersBiz ordersBiz;
	
	@RequestMapping("cart")
	public String cart(@SessionAttribute(name = "loginUser", required = false) User user,
			Model model) {
			 model.addAttribute("carts", cartbiz.queryMyOrder(user.getId()));
		return "cart";
	}
	
	@RequestMapping("addCart")
	@ResponseBody
	public Result addCart(Cart cart) {
		return new Result(cartbiz.addToCart(cart), "",cartbiz.selectCart(cart));
		
	}
	
	@RequestMapping("delectCart")
	@ResponseBody
	public Result delectCart(Cart cart) {
		return new Result(cartbiz.delectCart(cart), "");
	}
	
	@RequestMapping("updateCartCount")
	@ResponseBody
	public Result updateCartCount(Cart cart) {
		return new Result(cartbiz.updateCartCount(cart), "  ");
	}
}
