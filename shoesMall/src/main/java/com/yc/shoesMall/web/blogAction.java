package com.yc.shoesMall.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class blogAction {

	@RequestMapping("blog")
	public String blog() {
		return "blog";
	}
}
