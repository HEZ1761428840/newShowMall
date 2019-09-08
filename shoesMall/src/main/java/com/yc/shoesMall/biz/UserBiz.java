package com.yc.shoesMall.biz;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.yc.shoesMall.bean.User;
import com.yc.shoesMall.bean.UserExample;
import com.yc.shoesMall.dao.UserMapper;


@Service
public class UserBiz {
		
		@Resource
		private UserMapper um;
		
		/*
		 * 用户登录
		 */
		
		public User login(String name, String password) throws BizException {
			UserExample ue =new UserExample();
			ue.createCriteria().andNameEqualTo(name).andPasswordEqualTo(password);
			List<User> list = um.selectByExample(ue);
			if(list.size()==0) {
				throw new BizException("用户名或者密码错误！！！");
			}
			return list.get(0);
		}

		/**
		 * 
		 * @param user
		 * @return
		 */
		public List<User> queryId(User user) {
			UserExample example = new UserExample();
			example.createCriteria().andNameEqualTo(user.getName());
			return um.selectByExample(example);
		}
		
		
		/**
		 * myaccount信息修改
		 * @param user
		 * @return
		 */
		public int update(User user){
			UserExample example=new UserExample();
			return um.updateByPrimaryKeySelective(user);
			
		}
		
		/**
		 * 通过id查出用户
		 * @param id
		 * @return
		 */
		public User queryByKey(int id) {
			
			return um.selectByPrimaryKey(id);
		}
		
		
}
