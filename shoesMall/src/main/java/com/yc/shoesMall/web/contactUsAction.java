package com.yc.shoesMall.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class contactUsAction {
	@RequestMapping("contact-us")
	public String contactus() {
		
		return "contact-us";
	}
}
