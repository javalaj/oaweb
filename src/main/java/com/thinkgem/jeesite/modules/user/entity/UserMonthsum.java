/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.user.entity;

import java.util.Date;

import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.Length;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 月度总计集合类，没有包括月度总结具体细节内容Entity
 * 
 * @author liuxin
 * @version 2016-11-04
 */
public class UserMonthsum extends DataEntity<UserMonthsum> {

	private static final long serialVersionUID = 1L;
	private Date sumdate; // 哪个月份的总计
	private String isdraft; // 是否为草稿(0是,1否)

	public UserMonthsum() {
		super();
	}

	public UserMonthsum(String id) {
		super(id);
	}

	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	@NotNull(message = "哪个月份的总计不能为空")
	public Date getSumdate() {
		return sumdate;
	}

	public void setSumdate(Date sumdate) {
		this.sumdate = sumdate;
	}

	@Length(min = 1, max = 1, message = "是否为草稿(0是,1否)长度必须介于 1 和 1 之间")
	public String getIsdraft() {
		return isdraft;
	}

	public void setIsdraft(String isdraft) {
		this.isdraft = isdraft;
	}

}