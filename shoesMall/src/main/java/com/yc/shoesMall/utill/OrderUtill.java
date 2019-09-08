package com.yc.shoesMall.utill;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

public class OrderUtill {
		public static String getOrderid() {
				Date date = new Date();
				DateFormat format = new SimpleDateFormat("yyyyMMddHHmmss");
				String str = format.format(date);
				int r= new Random().nextInt(100);
				
			return str+r;
		}
}
