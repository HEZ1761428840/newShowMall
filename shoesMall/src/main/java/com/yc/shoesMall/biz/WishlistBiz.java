package com.yc.shoesMall.biz;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yc.shoesMall.bean.Wishlist;
import com.yc.shoesMall.dao.WishlistMapper;

@Service
public class WishlistBiz {
	@Autowired
	private WishlistMapper wishlistMapper;
	
	public int  addWishlist(Wishlist wishlist) {
		return wishlistMapper.insert(wishlist);
	}

}
