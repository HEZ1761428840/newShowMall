package com.yc.shoesMall.biz;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.yc.shoesMall.bean.Address;
import com.yc.shoesMall.bean.AddressExample;
import com.yc.shoesMall.bean.Cart;
import com.yc.shoesMall.bean.CartExample;
import com.yc.shoesMall.dao.AddressMapper;
import com.yc.shoesMall.dao.CartMapper;

@Service
public class CartBiz {
	@Resource
	private CartMapper cartMapper;
	
	@Resource
	private AddressMapper addressMapper;
	
	
	public List<Cart> queryMyOrder(int id) {
		CartExample example = new CartExample();
		example.createCriteria().andUidEqualTo(id);
		return cartMapper.selectByExample(example);
	}
	
	@Transactional
	public int addToCart(Cart cart) {
			int i ;
			CartExample example = new CartExample();
			example.createCriteria().andUidEqualTo(cart.getUid()).andPidEqualTo(cart.getPid())
			.andProductSizeEqualTo(cart.getProductSize()).andProductImageEqualTo(cart.getProductImage());
			List<Cart> list = cartMapper.selectByExample(example);
			if(list.size()>0) {
					list.get(0).setProductCount(list.get(0).getProductCount()+cart.getProductCount());
				 i = cartMapper.updateByPrimaryKey(list.get(0));
			}else {
				i = cartMapper.insert(cart);
			}
			return i;
	}
	
	public List<Cart> selectCart(Cart cart) {
		CartExample example = new CartExample();
		example.createCriteria().andUidEqualTo(cart.getUid());
		return cartMapper.selectByExample(example);
	}
	
	public int delectCart(Cart cart) {
		
		return cartMapper.deleteByPrimaryKey(cart.getId());
	}
	
	public int updateCartCount(Cart cart) {
	     
		return cartMapper.updateByPrimaryKeySelective(cart);
	}
	
	/**
	 * 用户与订单表查询
	 * @param id
	 * @return
	 */
	public List<Cart> queryMyCart(int uid) {
		CartExample example = new CartExample();
		example.createCriteria().andUidEqualTo(uid);
		return cartMapper.selectByExample(example);
	}

	public List<Address> queryAddress(Integer id) {
		AddressExample example = new AddressExample();
		example.createCriteria().andUidEqualTo(id);
		
		return addressMapper.selectByExample(example);
	}

	
}
