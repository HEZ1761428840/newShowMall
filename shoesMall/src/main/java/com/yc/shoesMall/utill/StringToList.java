package com.yc.shoesMall.utill;

import java.util.ArrayList;
import java.util.List;

public class StringToList {
	
	
	public static List<Integer>  StringSpilt(String str) {
		String[] split = str.split(",");
		List<Integer> list = new ArrayList<>();
		for (String string : split) {
			list.add(Integer.parseInt(string));
		}
		return list;
	}
	

}
