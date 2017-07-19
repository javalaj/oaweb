/**
 * Copyright &copy; 2012-2025 <a href="https://www.chuyutech.com">JeeCY</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.iim.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;
import com.thinkgem.jeesite.common.utils.excel.annotation.ExcelField;
/**
 * 群信息Entity
 * @author HLZ
 * @version 2017-03-06
 */
public class IimChatGroup extends DataEntity<IimChatGroup> {
	
	private static final long serialVersionUID = 1L;
	private String groupname;		// 群主名称
	private String avatar;		// 群头像
	private Integer maxpeople;		// 最大容纳人数
	private String sign;		// 标题
	
	public IimChatGroup() {
		super();
	}

	public IimChatGroup(String id){
		super(id);
	}

	@Length(min=1, max=64, message="群主名称长度必须介于 1 和 64 之间")
			
	@ExcelField(title="群主名称", align=2, sort=1)
	
	public String getGroupname() {
		return groupname;
	}

	public void setGroupname(String groupname) {
		this.groupname = groupname;
	}
	
	@Length(min=0, max=255, message="avatar长度必须介于 0 和 255 之间")
			
	@ExcelField(title="avatar", align=2, sort=2)
	
	public String getAvatar() {
		return avatar;
	}

	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}
	
			
	@ExcelField(title="maxpeople", align=2, sort=3)
	
	public Integer getMaxpeople() {
		return maxpeople;
	}

	public void setMaxpeople(Integer maxpeople) {
		this.maxpeople = maxpeople;
	}
	
	@Length(min=0, max=255, message="sign长度必须介于 0 和 255 之间")
			
	@ExcelField(title="sign", align=2, sort=4)
	
	public String getSign() {
		return sign;
	}

	public void setSign(String sign) {
		this.sign = sign;
	}
	
}