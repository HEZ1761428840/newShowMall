package com.yc.shoesMall.web.backManage;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.yc.shoesMall.bean.User;
import com.yc.shoesMall.biz.BizException;
import com.yc.shoesMall.biz.backManage.AdminBiz;
import com.yc.shoesMall.result.Result;
/**
 *后台管理: 管理员的对用户的管理
 * @author helanying
 *
 */
@SessionAttributes("loginedAdmin")
@Controller
public class AdminAction {
	
	/**
	 * 引用 服务层 （与用户表交互）
	 */
	@Resource
	private AdminBiz abiz;
	
	/**
	 * 修改用户状态
	 * @param user
	 * @return
	 */
	@PostMapping("updateUserStatus")
	@ResponseBody
	public Result updateUserStatus(User user, int status) {
		return new Result(1, "OK", abiz.updateUserStatus(user, status));
	}
	
	/**
	 * 对管理员登录做校验
	 * @param user 用户信息
	 * @param userType 用户类型
	 * @param model
	 * @return
	 */
	@RequestMapping("adminLogin")
	public String adminLogin(User user,String userType, Model model){
		try {
			//登录
			abiz.adminLogin(user, userType);
			model.addAttribute("loginedAdmin", user);
			return "redirect:backIndex";
		} catch (BizException e) {
			//登录失败，返回登录界面
			e.printStackTrace();
			model.addAttribute("msg", e.getMessage());
			return "backManage/adminLogin";
		}
		
	}
	
	/**
	 *ajax异步刷新 用户管理的分页查询
	 * @param page  页面获取的 第几页
	 * @param limit 页面获取的 每页多少条记录
	 * @return
	 */
	@RequestMapping("showTable")
	@ResponseBody
	public Result showTable(int page, int limit, User user) {
		return abiz.queryAllUser(page, limit, user);
	}
	
	/**
	 * 登录界面
	 * @return
	 */
	@RequestMapping("toAdminLogin")
	public String toAdminLogin() {
		return "backManage/adminLogin";
	}
	
	@RequestMapping("backIndex")
	public String backIndex(
			@SessionAttribute(name = "loginedAdmin", required = false) User user, Model model) {
		model.addAttribute("user", user);
		return "backManage/index";
	}
	
	/**
	 * 用户管理界面
	 * @return
	 */
	@RequestMapping("userManage")
	public String queryAllUser() {
		return "backManage/userManage";
	}
	
	
}
