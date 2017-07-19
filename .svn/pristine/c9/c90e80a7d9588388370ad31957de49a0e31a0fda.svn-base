/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.entity.perishableproducts;

import org.hibernate.validator.constraints.Length;
import com.thinkgem.jeesite.modules.sys.entity.User;
import javax.validation.constraints.NotNull;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 易耗品增删改查Entity
 * @author zf
 * @version 2016-11-08
 */
public class Apply extends DataEntity<Apply> {
	
	private static final long serialVersionUID = 1L;
	private String aid;		// 编号
	private String aname;		// 名称
	private User user;		// user_id
	
	public Apply() {
		super();
	}

	public Apply(String id){
		super(id);
	}

	@Length(min=1, max=64, message="编号长度必须介于 1 和 64 之间")
	public String getAid() {
		return aid;
	}

	public void setAid(String aid) {
		this.aid = aid;
	}
	
	@Length(min=1, max=100, message="名称长度必须介于 1 和 100 之间")
	public String getAname() {
		return aname;
	}

	public void setAname(String aname) {
		this.aname = aname;
	}
	
	@NotNull(message="user_id不能为空")
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	
}