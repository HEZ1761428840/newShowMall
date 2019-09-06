package com.yc.shoesMall.web.backManage;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.yc.shoesMall.biz.backManage.ProductBiz_back;

@Controller
public class IndexAction_back {

	@Resource ProductBiz_back pb;
	
	@GetMapping("goodsAdd")
	public String goodsAdd(Model model) {
		model.addAttribute("pbList", pb.queryProductBrand());
		return "backManage/goods_add";
	}
	
	/**
	 * 订单管理界面
	 * @return
	 */
	@GetMapping("orderManage")
	public String orderManage() {
		return "backManage/orderManage";
	}
	
	/**
	 * 商品管理界面
	 * @return
	 */
	@GetMapping("productManage")
	public String ProductManage(Model model) {
		model.addAttribute("pbList", pb.queryProductBrand());
		return "backManage/productManage";
	}	

}
