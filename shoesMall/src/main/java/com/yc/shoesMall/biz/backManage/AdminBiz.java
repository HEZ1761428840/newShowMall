package com.yc.shoesMall.biz.backManage;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.yc.shoesMall.bean.User;
import com.yc.shoesMall.bean.UserExample;
import com.yc.shoesMall.bean.UserExample.Criteria;
import com.yc.shoesMall.biz.BizException;
import com.yc.shoesMall.dao.UserMapper;
import com.yc.shoesMall.result.Result;
/**
 * 后台管理：对用户表做增删改操作
 */
@Service
public class AdminBiz {

	@Resource
	private UserMapper um;
	
	/**
	 * 管理员登录
	 * 
	 * @param user     传入对象
	 * @param userType 用户的类型
	 * @return
	 * @throws BizException
	 */
	public User adminLogin(User user, String type) throws BizException {
		// 根据用户的用户名和密码判断用户是否存在
		UserExample example = new UserExample();
		example.createCriteria().andNameEqualTo(user.getName()).andPasswordEqualTo(user.getPassword());
		// 如果users的长度为 > 0 表示存在该用户
		List<User> users = um.selectByExample(example);
		
		if (users.size() == 0) {
			throw new BizException("用户名或密码错误");
		} else {
			user = users.get(0);
			// 判断用户的状态 0 表示该用户被禁用了
			if (user.getStatus() == 0) {
				throw new BizException("用户被禁用，请联系管理员");
			}
			// 判断用户的类型跟传入的类型是否一致
			if (!type.equals(user.getType())) {
				throw new BizException("用户类型错误");
			}
		}
		return users.get(0);
	}
	
	/**
	 * 分页查询查询用户
	 * @return
	 */
	public Result queryAllUser(int page, int limit, User user){
		if(user.getName()!=null&&user.getName().equals("")) {
			user.setName(null);
		}
		if(user.getType()!=null&&user.getType().equals("")) {
			user.setType(null);
		}
		Page<Object> startPage = PageHelper.startPage(page, limit);
		List<User> list = um.queryUserByLike(user);
		long total = startPage.getTotal();
		return new Result(0, "OK",(int) total, list);
	}
	
	/**
	 * 修改用户的staus （1在线，2下线，0禁用）
	 * @param user 获取的前台用户数据
	 * @return
	 */
	public User updateUserStatus(User user, int stauts) {
		user.setStatus(stauts);
		um.updateByPrimaryKeySelective(user);
		return user;
	}
}
