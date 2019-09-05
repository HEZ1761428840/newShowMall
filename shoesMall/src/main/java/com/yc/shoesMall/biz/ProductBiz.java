package com.yc.shoesMall.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.yc.shoesMall.bean.Product;
import com.yc.shoesMall.bean.ProductBrand;
import com.yc.shoesMall.bean.ProductExample;
import com.yc.shoesMall.bean.ProductSize;
import com.yc.shoesMall.bean.ProductSizeExample;
import com.yc.shoesMall.dao.ProductBrandMapper;
import com.yc.shoesMall.dao.ProductMapper;
import com.yc.shoesMall.dao.ProductSizeMapper;

@Service
public class ProductBiz {
	@Autowired
	private	ProductMapper productMapper;
	@Autowired
	private ProductBrandMapper productBrandMapper;
	@Autowired
	private ProductSizeMapper productSizeMapper;
	
	//分页查询 product
	public List<Product>  selectAll(Integer page) {
		PageHelper.startPage(page,6);
		return productMapper.selectByExample(null);
	}
	
	public Product  selectId(Integer id) {
		return productMapper.selectByPrimaryKey(id);
	}
	
	
	// 分类型查询  判断 是否 有 时间 和 类型
	public List<Product> fuzzyQuery(Long maxPrice,Long minPrice ,List<Integer> productBrands,Integer page) {
		if(page==null) {
			page=1;
		}
		ProductExample example = new ProductExample();
		if(productBrands!=null&&maxPrice==0&&minPrice==0) {
			example.createCriteria().andPbidIn(productBrands);
		} else if(maxPrice!=0&&minPrice!=0&&productBrands!=null) {
			example.createCriteria().andPriceBetween(minPrice,maxPrice).andPbidIn(productBrands);
		} else if(minPrice!=0&&maxPrice==0&&productBrands!=null) {
			example.createCriteria().andPriceNotBetween(maxPrice, minPrice);
		} else if(maxPrice!=0&&minPrice!=0&&productBrands==null) {
			example.createCriteria().andPriceBetween(minPrice,maxPrice);
		}
		PageHelper.startPage(page,6);
		return productMapper.selectByExample(example);
	}
	
	
	//查询分类数量
	public int fuzzySize(Long maxPrice,Long minPrice ,List<Integer> productBrands) {
		ProductExample example = new ProductExample();
		if(productBrands!=null&&maxPrice==0&&minPrice==0) {
			example.createCriteria().andPbidIn(productBrands);
		} else if(maxPrice!=0&&minPrice!=0&&productBrands!=null) {
			example.createCriteria().andPriceBetween(minPrice,maxPrice).andPbidIn(productBrands);
		} else if(minPrice!=0&&maxPrice==0&&productBrands!=null) {
			example.createCriteria().andPriceNotBetween(maxPrice, minPrice);
		} else if(maxPrice!=0&&minPrice!=0&&productBrands==null) {
			example.createCriteria().andPriceBetween(minPrice,maxPrice);
		}
		return (int) productMapper.countByExample(example);
	}
	
	//查询 类型表
	public List<ProductBrand> selectPB(){
		return productBrandMapper.selectByExample(null);
	}
	//查询多少条数据
	public int  selectCount() {
		 int size = (int)productMapper.countByExample(null);
		return size%6>0 ? size/6+1 :size;
	}
	
}
