/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.user.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 月度总结记录的细节内容，与月度总结一对多关联关系Entity
 * @author liuxin
 * @version 2016-11-04
 */
public class UserMonthrecord extends DataEntity<UserMonthrecord> {
	
	private static final long serialVersionUID = 1L;
	private String finish;		// 完成事宜
	private String unfinish;		// 待处理事宜
	private String monthsumId;		// 一对多关联月度表
	
	public UserMonthrecord() {
		super();
	}

	public UserMonthrecord(String id){
		super(id);
	}

	@Length(min=1, max=255, message="完成事宜长度必须介于 1 和 255 之间")
	public String getFinish() {
		return finish;
	}

	public void setFinish(String finish) {
		this.finish = finish;
	}
	
	@Length(min=1, max=255, message="待处理事宜长度必须介于 1 和 255 之间")
	public String getUnfinish() {
		return unfinish;
	}

	public void setUnfinish(String unfinish) {
		this.unfinish = unfinish;
	}
	
	@Length(min=1, max=64, message="一对多关联月度表长度必须介于 1 和 64 之间")
	public String getMonthsumId() {
		return monthsumId;
	}

	public void setMonthsumId(String monthsumId) {
		this.monthsumId = monthsumId;
	}
	
}