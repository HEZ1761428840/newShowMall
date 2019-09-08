package com.yc.shoesMall.web;

import org.springframework.stereotype.Controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.yc.shoesMall.bean.Cart;
import com.yc.shoesMall.bean.User;
import com.yc.shoesMall.biz.BizException;
import com.yc.shoesMall.biz.CartBiz;
import com.yc.shoesMall.biz.UserBiz;
import com.yc.shoesMall.result.Result;


@Controller
@SessionAttributes({"loginUser","carts"})
public class loginAction {
	
	/**
	 * @param name
	 * @param password
	 * @param model
	 * @return
	 */
	@Resource
	private CartBiz cartBiz;
	
	@Resource
	private UserBiz ub;
	
	/**
	 * 跳转登录页面
	 * @return
	 */
	@RequestMapping("tologin")
	public String tologin() {
		return "login";
	}
	
	/**
	 * 用户登录
	 * @param name
	 * @param password
	 * @param model
	 * @return
	 */
	@PostMapping("login")
	@ResponseBody
	public Result login(String name,String password,Model model) {
	try{
		User user = ub.login(name, password);
		System.out.println(user.getAddress().getAddress()+"======================");
		model.addAttribute("loginUser",user);//添加到session
		model.addAttribute("carts", cartBiz.queryMyCart(user.getId()));
		return new Result(1, "OK",user);
	}catch(BizException e){
		return new Result(0,e.getMessage());
	}catch( RuntimeException e) {
		e.printStackTrace();
		return new Result(0,"业务繁忙，请稍后再试");
		}
	}
	
	
	
	
	
	
	
	
	
}
