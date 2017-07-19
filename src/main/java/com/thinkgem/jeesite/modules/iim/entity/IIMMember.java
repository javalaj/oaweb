package com.thinkgem.jeesite.modules.iim.entity;

public class IIMMember {
	// code=0 表示成功，其余表示失败
	private int code;
	// 失败信息,成功则为空
	private String msg;

	private IIMMData data;
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

	public IIMMData getData() {
		return data;
	}

	public void setData(IIMMData data) {
		this.data = data;
	}
	
}
