package com.yc.shoesMall.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yc.shoesMall.bean.Address;
import com.yc.shoesMall.dao.AddressMapper;

@Service
public class AddressBiz {
	
	@Autowired
	private AddressMapper am;

	public int update(Address a) {
		return am.updateByPrimaryKeySelective(a);
		
	}

	public Address queryAddress(int id) {
		
		return am.selectAddress(id);
	}
	
	
}


