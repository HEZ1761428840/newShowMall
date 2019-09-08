package com.yc.shoesMall.web;
import java.io.InputStream;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.yc.shoesMall.bean.Orders;
import com.yc.shoesMall.bean.Product;
import com.yc.shoesMall.bean.ProductBrand;
import com.yc.shoesMall.bean.User;
import com.yc.shoesMall.biz.CartBiz;
import com.yc.shoesMall.biz.ProductBiz;
import com.yc.shoesMall.result.Result;
import com.yc.shoesMall.utill.StringToList;

@Controller
@SessionAttributes("carts")
public class ShopAction {
	@Autowired
	ProductBiz productBiz;
	
	@Resource
	private CartBiz cartBiz;
	/*
	 * 查询商品  和  类型
	 * pagesize 分页总数
	*/
	@RequestMapping("shop")
	public String shop(@SessionAttribute(name = "loginUser", required = false) User user,Model model,Integer page) {
		if(page==null) {
			page=1;
		}
		if(user!=null) {
			 model.addAttribute("carts", cartBiz.queryMyCart(user.getId()));
		}
		model.addAttribute("pagesize", productBiz.selectCount());
		List<Product> selectAll = productBiz.selectAll(page);
		model.addAttribute("plist",selectAll);
		List<ProductBrand> selectPB = productBiz.selectPB();
		model.addAttribute("pblist", selectPB); 
		return "shop";
	}
	
	
	//分类查询
	@RequestMapping("fuzzySelect")
	@ResponseBody
	public Result fuzzySelect(Long maxPrice,Long minPrice,String productBrands,String productSizes,Integer page) {
		List<Integer> stringSpilt = null;
			if(productBrands!="") {
				stringSpilt	 = StringToList.StringSpilt(productBrands);
			}
			List<Product> fuzzyQuery = productBiz.fuzzyQuery(maxPrice,minPrice,stringSpilt,page);
				if(fuzzyQuery!=null&&fuzzyQuery.size()>0) {
					return new Result(1,"查询成功",fuzzyQuery,productBiz.fuzzySize(maxPrice, minPrice, stringSpilt));
				}
			return new Result(0,"没有");
		}
	
	
	@RequestMapping("pageSelect")
	@ResponseBody
	public Result pageSelect(Long maxPrice,Long minPrice,String productBrands,String productSizes,Integer page) {
		List<Integer> stringSpilt = null;
		if(productBrands!="") {
			stringSpilt	 = StringToList.StringSpilt(productBrands);
		}
		if(page==null) {
			page =  1;
		}
		List<Product> fuzzyQuery = productBiz.fuzzyQuery(maxPrice,minPrice,stringSpilt,page);
			if(fuzzyQuery!=null&&fuzzyQuery.size()>0) {
				return new Result(1,"查询成功",fuzzyQuery,productBiz.fuzzySize(maxPrice, minPrice, stringSpilt),page);
			}
		return new Result(0,"没有");
	}
	
	@RequestMapping("product-details-variable")
	public String productDetailsVariable (Integer id,Model model) {
		Product product = productBiz.selectId(id);
		model.addAttribute("product", product);
		return "product-details-variable";
	}
	
}
