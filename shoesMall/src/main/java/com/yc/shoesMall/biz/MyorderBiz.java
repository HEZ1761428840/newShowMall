package com.yc.shoesMall.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.yc.shoesMall.bean.Address;
import com.yc.shoesMall.bean.Orders;
import com.yc.shoesMall.bean.OrdersExample;
import com.yc.shoesMall.bean.User;
import com.yc.shoesMall.bean.UserExample;
import com.yc.shoesMall.dao.AddressMapper;
import com.yc.shoesMall.dao.OrdersMapper;
import com.yc.shoesMall.dao.UserMapper;

@Service
@JsonIgnoreProperties(value = {"handler"})
public class MyorderBiz {
	
	@Autowired
	private  OrdersMapper om;
	
	@Autowired
	private AddressMapper am;
	
	/**
	 * 用户与订单表查询
	 * @param id
	 * @return
	 */
	public List<Orders> queryMyOrder(int id) {
		
		return (List<Orders>) om.selectByPrimaryKey(id);
		
		
		
	}

	/**
	 * 用户与地址簿查询
	 * @param id
	 * @return
	 */
	public List<Address> queryAddress(int id) {
		
		return am.selectAll(id);
	}
	
	/**
	 * cart界面的删除指定商品操作
	 * 
	 * @param id
	 */
	public void deleteById(int id) {
		om.deleteByPrimaryKey(id);
		
	}



	public int update(Orders order) {
		
		return om.updateByPrimaryKeySelective(order);
	}
	
	

}
