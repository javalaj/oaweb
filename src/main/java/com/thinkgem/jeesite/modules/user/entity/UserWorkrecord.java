/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.user.entity;

import java.util.Date;

import org.hibernate.validator.constraints.Length;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 我的日志具体工作记录Entity
 * 
 * @author liuxin
 * @version 2016-11-02
 */
public class UserWorkrecord extends DataEntity<UserWorkrecord> {

	private static final long serialVersionUID = 1L;
	private Date begintime; // 开始时间
	private Date endtime; // 结束时间
	private String type;// 类型 0上班，1请假，2调休，3出差
	private String content; // 工作内容
	private String isdone; // 是否解决(0是,1否)
	private String worklogId; // 对应的日志

	public UserWorkrecord() {
		super();
	}

	public UserWorkrecord(String id) {
		super(id);
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getBegintime() {
		return begintime;
	}

	public void setBegintime(Date begintime) {
		this.begintime = begintime;
	}

	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getEndtime() {
		return endtime;
	}

	public void setEndtime(Date endtime) {
		this.endtime = endtime;
	}

	@Length(min = 1, max = 1230, message = "工作内容长度必须介于 1 和 1230 之间")
	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	@Length(min = 1, max = 1, message = "是否解决(0是,1否)长度必须介于 1 和 1 之间")
	public String getIsdone() {
		return isdone;
	}

	public void setIsdone(String isdone) {
		this.isdone = isdone;
	}

	@Length(min = 1, max = 64, message = "对应的日志长度必须介于 1 和 64 之间")
	public String getWorklogId() {
		return worklogId;
	}

	public void setWorklogId(String worklogId) {
		this.worklogId = worklogId;
	}

}