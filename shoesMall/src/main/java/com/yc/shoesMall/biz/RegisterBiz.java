package com.yc.shoesMall.biz;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yc.shoesMall.bean.User;
import com.yc.shoesMall.bean.UserExample;
import com.yc.shoesMall.dao.UserMapper;
import com.yc.shoesMall.result.Result;

@Service
public class RegisterBiz {

	@Autowired
	private UserMapper um;

	public Result register(User user, String password1) {
		String password = user.getPassword();
		Date date = new Date();
		if (password.equals(password1)) {
		UserExample example = new UserExample();
		example.createCriteria().andNameEqualTo(user.getName());
		List<User> list = um.selectByExample(example);
		System.out.println(user.getHeadPictrue()+"00");
		if (list.size() == 0) {
			user.setCreateTime(date);
			user.setStatus(2);
			user.setType("普通用户");
			um.insert(user);
			System.out.println(user.getHeadPictrue()+"11");
			return new Result(1, "用户名可用", user);
		} else {
			return new Result(0, "用户名不可用", user);
		}
		}else {
			return new Result(-1, "密码一致", user);
		}
	}
}