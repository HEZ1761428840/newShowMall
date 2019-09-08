package com.yc.shoesMall.web;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yc.shoesMall.bean.Product;
import com.yc.shoesMall.biz.ProductBiz;

@Controller
public class productDetailsAction {
	@Resource
	private ProductBiz productBiz; 
	
	@RequestMapping("toDetails")
	public String toDetails(int id,Model Model) {
		Product product = productBiz.selectId(id);
		Model.addAttribute("product",product);
		return "product-details";
	}
}
