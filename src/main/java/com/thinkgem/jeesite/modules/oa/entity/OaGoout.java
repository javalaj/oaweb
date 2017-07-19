/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.entity;

import java.util.Date;

import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.Length;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.thinkgem.jeesite.common.persistence.ActEntity;

/**
 * 外出申请流程业务Entity
 * @author liuxin
 * @version 2016-11-18
 */
public class OaGoout extends ActEntity<OaGoout> {
	
	private static final long serialVersionUID = 1L;
	private String procInsId;		// 流程关联id
	private String officename;		// 部门名称
	private Date starttime;		// 外出开始时间
	private Date endtime;		// 外出结束时间
	private String time;		// 外出时长
	private String reason;		// 外出理由
	private String examname;		// 上级签字
	private String examtext;		// 上级意见
	
	public OaGoout() {
		super();
	}

	public OaGoout(String id){
		super(id);
	}

	@Length(min=0, max=64, message="流程关联id长度必须介于 0 和 64 之间")
	public String getProcInsId() {
		return procInsId;
	}

	public void setProcInsId(String procInsId) {
		this.procInsId = procInsId;
	}
	
	@Length(min=0, max=100, message="部门名称长度必须介于 0 和 100 之间")
	public String getOfficename() {
		return officename;
	}

	public void setOfficename(String officename) {
		this.officename = officename;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	@NotNull(message="外出开始时间不能为空")
	public Date getStarttime() {
		return starttime;
	}

	public void setStarttime(Date starttime) {
		this.starttime = starttime;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	@NotNull(message="外出结束时间不能为空")
	public Date getEndtime() {
		return endtime;
	}

	public void setEndtime(Date endtime) {
		this.endtime = endtime;
	}
	
	@Length(min=1, max=64, message="外出时长长度必须介于 1 和 64 之间")
	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}
	
	@Length(min=0, max=255, message="外出理由长度必须介于 0 和 255 之间")
	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}
	
	@Length(min=0, max=100, message="上级签字长度必须介于 0 和 100 之间")
	public String getExamname() {
		return examname;
	}

	public void setExamname(String examname) {
		this.examname = examname;
	}
	
	@Length(min=0, max=255, message="上级意见长度必须介于 0 和 255 之间")
	public String getExamtext() {
		return examtext;
	}

	public void setExamtext(String examtext) {
		this.examtext = examtext;
	}
	
}