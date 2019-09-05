package com.yc.shoesMall.result;
/**
 * 结果对象，一般ajax调用，返回结果对象
 * @author 风雪
 *
 */
public class Result {
	private int code;
	private String msg;
	
	private Object data;
	private int page;
	
	/**
	 * layui用到的格式,加一个字段
	 */
	private int count;
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	
	public Result(int code, String msg,int count, Object data) {
		super();
		this.code = code;
		this.msg = msg;
		this.count = count;
		this.data = data;
	}
	
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public Result(int code, String msg, Object data, int count,int page) {
		super();
		this.code = code;
		this.msg = msg;
		this.data = data;
		this.count = count;
		this.page = page;
	}
	public Result(int code, String msg, Object data, int count) {
		super();
		this.code = code;
		this.msg = msg;
		this.data = data;
		this.count = count;
	}
	
	public Result(int code, String msg, Object data) {
		super();
		this.code = code;
		this.msg = msg;
		this.data = data;
	}
	public Result(int code, String msg) {
		super();
		this.code = code;
		this.msg = msg;
	}
	public int getCode() {
		return code;
	}
	public void setCode(int code) {
		this.code = code;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public Object getData() {
		return data;
	}
	public void setData(Object data) {
		this.data = data;
	}
	
}
