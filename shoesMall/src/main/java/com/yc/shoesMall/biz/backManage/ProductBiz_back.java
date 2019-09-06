package com.yc.shoesMall.biz.backManage;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.yc.shoesMall.bean.Image;
import com.yc.shoesMall.bean.Product;
import com.yc.shoesMall.bean.ProductBrand;
import com.yc.shoesMall.bean.ProductSize;
import com.yc.shoesMall.biz.BizException;
import com.yc.shoesMall.dao.ImageMapper;
import com.yc.shoesMall.dao.ProductBrandMapper;
import com.yc.shoesMall.dao.ProductMapper;
import com.yc.shoesMall.dao.ProductSizeMapper;
import com.yc.shoesMall.result.Result;

@Service
public class ProductBiz_back {

	@Resource
	private ProductMapper pm;
	
	@Resource 
	private ProductBrandMapper pbm;
	
	@Resource
	private ProductSizeMapper psm;
	
	@Resource 
	private ImageMapper im;
	/**
	 * 新增商品
	 * @param product   商品基本信息
	 * @param Lstock	L尺寸的库存
	 * @param Mstock	M尺寸的库存
	 * @param Sstock	S尺寸的库存
	 * @param imagePath 图片路径
	 * @return
	 * @throws BizException
	 */
	public Product insertProduct(Product product,
			int Lstock, int Mstock,int Sstock, String imagePath) throws BizException {
		if(product != null) {
			//新增商品
			product.setCommentCount(1);
			product.setScore(0);
			product.setStatus(1);
			product.setCreateTime(new Date());
			int i = pm.insert(product);
			if(i == 0) {
				throw new BizException("商品添加失败");
			}
			//新增商品尺寸表
			ProductSize ps = new ProductSize();
			ps.setPid(product.getId());
			if(Lstock > 0) {
				ps.setCount(Lstock);
				ps.setSize("L");
				System.out.println("LLLLLLLLLLLLLLLLLL");
				psm.insert(ps);
			}
			if(Mstock > 0) {
				ps.setCount(Mstock);
				ps.setSize("M");
				System.out.println("MMMMMMMMMMMMMMMMMM");
				psm.insert(ps);
			}
			if(Sstock > 0) {
				ps.setCount(Sstock);
				System.out.println("SSSSSSSSSSSSSSSSSSS");
				ps.setSize("S");
				psm.insert(ps);
			}
			//新增图片表
			if(imagePath != null || imagePath.length() > 0) {
				Image image = new Image();
				image.setPid(product.getId());
				image.setImagePath(imagePath);
				image.setType("0");
				im.insert(image);
			}
			
			return product;
		}
		
		return null;
		
	}
	
	/**
	 * 修改商品表
	 * @param product 获取的前台用户数据
	 * @throws BizException 
	 */
	public Product updateUserStatus(Product product) throws BizException {
		int i = pm.updateByPrimaryKeySelective(product);
		if(i == 0) {
			throw new BizException("修改失败");
		}
		return product;
	}
	
	/**
	 * 商品分页查询 + 条件查询
	 * @param page
	 * @param limit
	 * @param product
	 * @return
	 */
	public Result queryProduct(int page, int limit, Product product) {
		
		Page<Object> startPage = PageHelper.startPage(page, limit);
		List<Product> list = pm.selectProductByList(product);
		//统计总页数
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
