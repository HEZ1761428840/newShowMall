package com.yc.shoesMall.web.backManage;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yc.shoesMall.bean.Product;
import com.yc.shoesMall.biz.backManage.ProductBiz_back;
import com.yc.shoesMall.result.Result;

@Controller
public class ProductAtion_back {
	
	@Resource
	private ProductBiz_back pb;
	
	
	@GetMapping("queryProduct")
	@ResponseBody
	public Result queryProduct(int page, int limit, Product product) {
		
		return pb.queryProduct(page, limit, product);
	}
}
