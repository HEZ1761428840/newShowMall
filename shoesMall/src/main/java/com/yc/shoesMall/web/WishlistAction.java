package com.yc.shoesMall.web;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yc.shoesMall.bean.Wishlist;
import com.yc.shoesMall.biz.WishlistBiz;
import com.yc.shoesMall.result.Result;

@Controller
public class WishlistAction {
	@Resource
	private WishlistBiz wishlistBiz;
	
	@RequestMapping("addWishlist")
	@ResponseBody
	public Result addWishlist(Wishlist wishlist) {
		return new Result(wishlistBiz.addWishlist(wishlist), "");
	}
}
