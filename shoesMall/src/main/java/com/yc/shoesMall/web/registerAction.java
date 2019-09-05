package com.yc.shoesMall.web;


import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.yc.shoesMall.bean.User;
import com.yc.shoesMall.biz.RegisterBiz;

@Controller
public class registerAction {
	
	private static final Logger LOGGER = LoggerFactory.getLogger(registerAction.class);
	
	@Autowired
	private RegisterBiz rbiz;
	
	
	/**
	 * 跳转注册页面
	 * @return
	 */
	@RequestMapping("toregister")
	public String toregister() {
		
		return "register";
	}
	/**
	 * 用户注册
	 * @param request 
	 * @return
	 * @throws IOException 
	 */
	@PostMapping("register")
	public String register(@RequestParam("head_pictrue") MultipartFile file,
			User user, String password1, HttpServletRequest request)
			throws IOException {

		try {	
			// 获取上传的文件
			String fileName = file.getOriginalFilename();
			// 获取文件上传字段
			file.getName();
			// 获取文件大小
			file.getSize();
			// 保存文件
			if(fileName.length() > 0) {
				//把图片存储到项目下
				String realPath = request.getServletContext().getRealPath("/") + "/image";
				
				fileName = System.currentTimeMillis() + fileName;
				file.transferTo(new File(realPath, fileName));
				
				//相对路径存入数据库
				user.setHeadPictrue("image/" + fileName);
			}
			rbiz.register( user,password1);
			return "login";
		} catch (RuntimeException e) {
			e.printStackTrace();
			return "register";
		}
	}
	


}
