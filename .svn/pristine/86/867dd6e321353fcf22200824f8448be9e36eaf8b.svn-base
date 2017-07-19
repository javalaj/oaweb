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
 * 我的日志整体外部，不包含工作记录细节Entity
 * 
 * @author liuxin
 * @version 2016-11-02
 */
public class UserWorklog extends DataEntity<UserWorklog> {

	private static final long serialVersionUID = 1L;
	private Date workdate; // 日志日期
	private String isdraft; // 是否为草稿(0是,1否)

	// 用于查询分页时的字段
	private Date begindate;// 日志开始日期
	private Date enddate;// 日志结束日期
	private Date end;
	private String users;// 查询他人日志，人id字符串","数组

	public String getUsers() {
		return users;
	}

	public void setUsers(String users) {
		this.users = users;
	}

	public Date getEnd() {
		return end;
	}

	public void setEnd(Date end) {
		this.end = end;
	}

	public Date getBegindate() {
		return begindate;
	}

	public void setBegindate(Date begindate) {
		this.begindate = begindate;
	}

	public Date getEnddate() {
		return enddate;
	}

	public void setEnddate(Date enddate) {
		this.enddate = enddate;
	}

	public UserWorklog() {
		super();
	}

	public UserWorklog(String id) {
		super(id);
	}

	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	@NotNull(message = "日志日期不能为空")
	public Date getWorkdate() {
		return workdate;
	}

	public void setWorkdate(Date workdate) {
		this.workdate = workdate;
	}

	@Length(min = 1, max = 1, message = "是否为草稿(0是,1否)长度必须介于 1 和 1 之间")
	public String getIsdraft() {
		return isdraft;
	}

	public void setIsdraft(String isdraft) {
		this.isdraft = isdraft;
	}

}