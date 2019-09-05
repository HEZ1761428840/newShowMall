package com.yc.shoesMall.web;


import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.yc.shoesMall.bean.User;
import com.yc.shoesMall.biz.MyorderBiz;
import com.yc.shoesMall.biz.UserBiz;
import com.yc.shoesMall.result.Result;

@Controller
public class cartAction {
	
	@Resource
	private UserBiz ubiz;
	
	@Resource
	private MyorderBiz obiz;
	
	

	
}
