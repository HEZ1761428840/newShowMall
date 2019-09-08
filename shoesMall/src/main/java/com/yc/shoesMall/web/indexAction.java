package com.yc.shoesMall.web;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.yc.shoesMall.bean.User;
import com.yc.shoesMall.biz.CartBiz;
import com.yc.shoesMall.biz.UserBiz;

@Controller
@SessionAttributes({"orders","carts"})
public class indexAction {
	
	@Resource
	private UserBiz ubiz;
	
	@Resource
	private CartBiz cartBiz;
	
	
	@RequestMapping("index")
	public String index(
			@SessionAttribute(name = "loginUser", required = false) User user, Model model) {
		if(user != null){
			 model.addAttribute("carts", cartBiz.queryMyCart(user.getId()));
			 return "index";
		}else{
			return "index";
		}
		
		
	
		
		
	}

}
