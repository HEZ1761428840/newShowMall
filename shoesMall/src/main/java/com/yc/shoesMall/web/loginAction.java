package com.yc.shoesMall.web;

import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.yc.shoesMall.bean.User;
import com.yc.shoesMall.biz.BizException;
import com.yc.shoesMall.biz.CartBiz;
import com.yc.shoesMall.biz.UserBiz;
import com.yc.shoesMall.result.Result;
import com.yc.shoesMall.utill.ImageUtil;


@Controller
@SessionAttributes({"loginUser","carts"})
public class loginAction {
	
	/**
	 * @param name
	 * @param password
	 * @param model
	 * @return
	 */
	@Resource
	private CartBiz cartBiz;
	
	@Resource
	private UserBiz ub;
	
	/**
	 * 跳转登录页面
	 * @return
	 * @throws IOException 
	 */
	@RequestMapping("tologin")
	public String tologin() throws IOException {

		
		
		return "login";
	}
	
	@RequestMapping("imagecode")
	@ResponseBody
	public String imagecode(HttpServletRequest request, HttpServletResponse response) throws IOException {
		//验证码
				response.setContentType("image/jpeg");
		        //禁止图像缓存
		        response.setHeader("Pragma","no-cache");

		        response.setHeader("Cache-Control", "no-cache");

		        response.setDateHeader("Expires", 0);

		        HttpSession session = request.getSession();

		        ImageUtil imageUtil = new ImageUtil(120, 40, 5,30);

		        session.setAttribute("code", imageUtil.getCode());

		        imageUtil.write(response.getOutputStream());
				return null;
		        
	}
	
	/**
	 * 用户登录
	 * @param name
	 * @param password
	 * @param model
	 * @return
	 * @throws IOException 
	 */
	@PostMapping("login")
	@ResponseBody
	public Result login(String name,String password,String inputCode,Model model,HttpSession session) throws IOException {
	try{
		String  cod = (String)session.getAttribute("code");
		if(!inputCode.equalsIgnoreCase(cod)) {
			return new Result(4, "验证码错误");
		}
		User user = ub.login(name, password);
		model.addAttribute("loginUser",user);//添加到session
		model.addAttribute("carts", cartBiz.queryMyCart(user.getId()));
		return new Result(1, "OK",user);
	}catch(BizException e){
		return new Result(0,e.getMessage());
	}catch( RuntimeException e) {
		e.printStackTrace();
		return new Result(0,"业务繁忙，请稍后再试");
		}
	}
	
	
	
	@RequestMapping("updatePassword")
	@ResponseBody
	public Result updatePassword(@SessionAttribute(name = "loginUser", required = false) User user,String password) {
		user.setPassword(password);
		return new Result(ub.updatePassword(user), "");
	}
	
	
	
	
}
