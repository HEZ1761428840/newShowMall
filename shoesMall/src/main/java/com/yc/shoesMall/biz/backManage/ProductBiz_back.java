package com.yc.shoesMall.biz.backManage;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.yc.shoesMall.bean.Product;
import com.yc.shoesMall.bean.ProductBrand;
import com.yc.shoesMall.dao.ProductBrandMapper;
import com.yc.shoesMall.dao.ProductMapper;
import com.yc.shoesMall.result.Result;

@Service
public class ProductBiz_back {

	@Resource
	private ProductMapper pm;
	
	@Resource 
	private ProductBrandMapper pbm;
	/**
	 * 商品分页查询
	 * @param page
	 * @param limit
	 * @param product
	 * @return
	 */
	public Result queryProduct(int page, int limit, Product product) {
		
		Page<Object> startPage = PageHelper.startPage(page, limit);
		List<Product> list = pm.selectProductByList(product);
		long total = startPage.getTotal();
		return new Result(0, "OK",(int) total, list);
	}
	
	/**
	 * 查询所有商品品牌
	 * @return
	 */
	public List<ProductBrand> queryProductBrand() {
		return pbm.selectByExample(null);
	}
	
}
