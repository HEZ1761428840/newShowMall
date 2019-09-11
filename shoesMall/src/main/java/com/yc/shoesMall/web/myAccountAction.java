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
import org.springframework.web.bind.support.SessionStatus;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.yc.shoesMall.bean.Address;
import com.yc.shoesMall.bean.OrdersExample;
import com.yc.shoesMall.bean.User;
import com.yc.shoesMall.biz.AddressBiz;
import com.yc.shoesMall.biz.BizException;
import com.yc.shoesMall.biz.CartBiz;
import com.yc.shoesMall.biz.OrdersBiz;
import com.yc.shoesMall.biz.UserBiz;
import com.yc.shoesMall.result.Result;


@Controller
@JsonIgnoreProperties(value = {"handler"})
@SessionAttributes("loginUser")
public class myAccountAction {

	@Resource
	private OrdersBiz ordersBiz;
	
	@Resource
	private CartBiz cartBiz;
	
	@Resource
	private UserBiz ubiz;
	
	@Resource
	private AddressBiz abiz;
	
	/**
	 * 
	 * myaccount的查询order/address操作
	 * 修改个人信息
	 * @param user
	 * @param model
	 * @return
	 */
	@RequestMapping("my-account")
	public String myaccount(@SessionAttribute(name = "loginUser", required = false) User user,Model model) {
		
			List<User> list=ubiz.queryId(user);
	        model.addAttribute("orderLists", ordersBiz.selectOrders(user));
	        model.addAttribute("Address", cartBiz.queryAddress(list.get(0).getId()));	
		
       
		return "my-account";
	}
	
	/**
	 * myaccount的修改个人信息操作
	 * @param user
	 * @param model
	 * @return
	 * @throws BizException 
	 */
	@RequestMapping("account")
	public String myaccount1(@SessionAttribute("loginUser") User user,
			Model model,SessionStatus sessionStatus,
			HttpServletRequest request) throws BizException {
		
		String name=request.getParameter("name");
		String email=request.getParameter("email");
		String phone=request.getParameter("phone");
		String address=request.getParameter("address");
		if(!"".equals(name)){
			user.setName(name);
		}
		if(!"".equals(email)){
			user.setEmail(email);
		}
		if(!"".equals(phone)){
			user.setPhone(phone);
		}
		
		ubiz.update(user);
		User user2 = ubiz.login(user.getName(), user.getPassword());
		sessionStatus.setComplete();
		model.addAttribute("loginUser", user2);
		ubiz.update(user);
		
		return myaccount(user, model);
	}
	
	
	/**
	 * 注销退出
	 * @param user
	 * @param model
	 * @return
	 */
	@RequestMapping("CheckOut")
	public String CheckOut(@SessionAttribute("loginUser") User user,Model model,SessionStatus sessionStatus) { 
	   user=null;
	   sessionStatus.setComplete();
       model.addAttribute("loginUser", user);		
		return "index";
	}
	
	
	
	@RequestMapping("delectAddress")
	@ResponseBody
	public Result delectAddress(int id) { 
		
		return new Result(abiz.delect(id),"");
	}
	
	@RequestMapping("addAddress")
	@ResponseBody
	public Result addAddress(@SessionAttribute("loginUser") User user,Address address) { 
		address.setUid(user.getId());
		address.setStatus(1);
		return new Result(abiz.add(address),"");
	}
	
	
	@RequestMapping("updateAddress")
	@ResponseBody
	public Result updateAddress(Address address) {
		return new Result(abiz.update(address), "");
	}
	
	
	
}
	
