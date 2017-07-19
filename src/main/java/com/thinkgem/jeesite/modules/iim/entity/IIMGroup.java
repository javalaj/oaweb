package com.thinkgem.jeesite.modules.iim.entity;

public class IIMGroup {
	
	private String id;
	private String groupname;		// 群主名称
	private String avatar;		// 群头像
	private Integer maxpeople;		// 最大容纳人数
	private String sign;		// 标题
	
	private Integer nowpeople;//群现在人数

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getGroupname() {
		return groupname;
	}

	public void setGroupname(String groupname) {
		this.groupname = groupname;
	}

	public String getAvatar() {
		return avatar;
	}

	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}

	public Integer getMaxpeople() {
		return maxpeople;
	}

	public void setMaxpeople(Integer maxpeople) {
		this.maxpeople = maxpeople;
	}

	public String getSign() {
		return sign;
	}

	public void setSign(String sign) {
		this.sign = sign;
	}

	public Integer getNowpeople() {
		return nowpeople;
	}

	public void setNowpeople(Integer nowpeople) {
		this.nowpeople = nowpeople;
	}
	
	

}
