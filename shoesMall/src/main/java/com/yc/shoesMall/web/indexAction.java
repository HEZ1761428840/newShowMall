package com.yc.shoesMall.web;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.yc.shoesMall.bean.User;
import com.yc.shoesMall.biz.MyorderBiz;
import com.yc.shoesMall.biz.UserBiz;

@Controller
@SessionAttributes("orders")
public class indexAction {
	
	@Resource
	private UserBiz ubiz;
	
	@Resource
	private MyorderBiz obiz;
	
	
	@RequestMapping("index")
	public String index(
			@SessionAttribute(name = "loginUser", required = false) User user, Model model) {
		model.addAttribute("user", user);
		if(user != null){
			int id=ubiz.queryId(user);
			 model.addAttribute("orders", obiz.queryMyOrder(id));
			//model.addAttribute("orders", obiz.selectOrdersName(692));
			 
			 
			 return "index";
		}else{
			return "index";
		}
		
		
	
		
		
	}

}
