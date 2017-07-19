/**
 * Copyright &copy; 2012-2025 <a href="https://www.chuyutech.com">JeeCY</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.iim.entity;

import com.thinkgem.jeesite.modules.iim.entity.IimChatGroup;

import java.util.Date;

import javax.validation.constraints.NotNull;
import com.thinkgem.jeesite.modules.sys.entity.User;
import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;
import com.thinkgem.jeesite.common.utils.excel.annotation.ExcelField;
/**
 * 群成员关系Entity
 * @author HLZ
 * @version 2017-03-06
 */
public class IimChatGroupUser extends DataEntity<IimChatGroupUser> {
	
	private static final long serialVersionUID = 1L;
	private IimChatGroup group; // 群主ID
	private User user; // 群主成员ID
	private String state; // 状态

	private Date in_date;// 进群时间、申请群时间

	private Date out_date;

	public IimChatGroupUser() {
		super();
	}

	public IimChatGroupUser(String id) {
		super(id);
	}

	@NotNull(message = "群主ID不能为空")

	@ExcelField(title = "群主ID", align = 2, sort = 1)

	public IimChatGroup getGroup() {
		return group;
	}

	public void setGroup(IimChatGroup group) {
		this.group = group;
	}

	@NotNull(message = "群主成员ID不能为空")

	@ExcelField(title = "群主成员ID", fieldType = User.class, value = "user.name", align = 2, sort = 2)

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	@Length(min = 1, max = 64, message = "状态长度必须介于 1 和 64 之间")

	@ExcelField(title = "状态", align = 2, sort = 3)

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public Date getIn_date() {
		return in_date;
	}

	public void setIn_date(Date in_date) {
		this.in_date = in_date;
	}

	public Date getOut_date() {
		return out_date;
	}

	public void setOut_date(Date out_date) {
		this.out_date = out_date;
	}

	
}