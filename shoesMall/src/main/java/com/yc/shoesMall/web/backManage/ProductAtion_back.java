package com.yc.shoesMall.web.backManage;

import java.io.File;
import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.yc.shoesMall.bean.Product;
import com.yc.shoesMall.biz.BizException;
import com.yc.shoesMall.biz.backManage.ProductBiz_back;
import com.yc.shoesMall.result.Result;

@Controller
public class ProductAtion_back {

	@Resource
	private ProductBiz_back pb;

	/**
	 * 新增商品
	 * 
	 * @param product
	 * @param Lstock
	 * @param Mstock
	 * @param Sstock
	 * @param pictrue
	 * @param request
	 * @return
	 * @throws IOException 
	 * @throws IllegalStateException 
	 */
	@PostMapping("insertProduct")
	public String insertProduct(Product product, int Lstock, int Mstock, int Sstock,
			@RequestParam("imagePath") MultipartFile file, HttpServletRequest request) throws IllegalStateException, IOException {
		
		// 获取上传的文件
		String fileName = file.getOriginalFilename();
		
		// 保存文件
		if (fileName.length() > 0) {
			// 把图片存储到项目下
			String realPath = request.getServletContext().getRealPath("/") + "img";
			fileName = System.currentTimeMillis() + fileName;
			file.transferTo(new File(realPath, fileName));
			System.out.println("------" + realPath);
			// 相对路径存入数据库
			System.out.println(fileName);
		}
		try {
			pb.insertProduct(product, Lstock, Mstock, Sstock, fileName);
		} catch (BizException e) {
			e.printStackTrace();
			return "backManage/fail";
		}
		return "backManage/success";
	}

	/**
	 * 分页查询 ＋ 条件查询
	 * 
	 * @param page
	 * @param limit
	 * @param product
	 * @return
	 */
	@GetMapping("queryProduct")
	@ResponseBody
	public Result queryProduct(int page, int limit, Product product) {

		return pb.queryProduct(page, limit, product);
	}

	/**
	 * 修改商品
	 * 
	 * @param product
	 * @return
	 */
	@PostMapping("updateProduct")
	@ResponseBody
	public Result updateProduct(Product product) {
		try {
			return new Result(1, "OK", pb.updateUserStatus(product));
		} catch (BizException e) {
			return new Result(0, e.getMessage());
		}

	}
}
