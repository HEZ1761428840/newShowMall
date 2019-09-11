package com.yc.shoesMall.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yc.shoesMall.bean.Address;
import com.yc.shoesMall.bean.User;
import com.yc.shoesMall.dao.AddressMapper;
import com.yc.shoesMall.dao.UserMapper;

@Service
public class AddressBiz {
	
	@Autowired
	private AddressMapper addressMapper;

	public int update(Address address) {
		return addressMapper.updateByPrimaryKeySelective(address);
		
	}

	public int delect(int id) {
		return addressMapper.deleteByPrimaryKey(id);
		
	}
	
	public int add(Address address) {
		return addressMapper.insert(address);
		
	}

	
	
}


