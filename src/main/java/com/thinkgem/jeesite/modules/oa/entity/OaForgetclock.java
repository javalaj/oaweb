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
 * 忘记打卡申请流程Entity
 * 
 * @author liuxin
 * @version 2016-11-21
 */
public class OaForgetclock extends ActEntity<OaForgetclock> {

	private static final long serialVersionUID = 1L;
	private String procInsId; // 工作流关联id
	private String officeName; // 部门名称
	private Date date; // 忘记打卡日期
	private String time; // 忘记打卡时间
	/*
	 * private String witnessName; // 证明人名称 private String witnessOfficeName; //
	 * 证明人所在部门名称
	 */
	private String examname; // 上级签字
	private String examtext; // 上级意见
	private String examname2; // 上级签字
	private String examtext2; // 上级意见

	// 新增加的时间标示
	private String timesign;

	public String getTimesign() {
		return timesign;
	}

	public void setTimesign(String timesign) {
		this.timesign = timesign;
	}

	public OaForgetclock() {
		super();
	}

	public OaForgetclock(String id) {
		super(id);
	}

	@Length(min = 0, max = 64, message = "工作流关联id长度必须介于 0 和 64 之间")
	public String getProcInsId() {
		return procInsId;
	}

	public void setProcInsId(String procInsId) {
		this.procInsId = procInsId;
	}

	@Length(min = 0, max = 100, message = "部门名称长度必须介于 0 和 100 之间")
	public String getOfficeName() {
		return officeName;
	}

	public void setOfficeName(String officeName) {
		this.officeName = officeName;
	}

	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	@NotNull(message = "忘记打卡日期不能为空")
	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	@Length(min = 1, max = 100, message = "忘记打卡时间长度必须介于 1 和 100 之间")
	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	/*
	 * @Length(min = 1, max = 100, message = "证明人名称长度必须介于 1 和 100 之间") public
	 * String getWitnessName() { return witnessName; }
	 * 
	 * public void setWitnessName(String witnessName) { this.witnessName =
	 * witnessName; }
	 * 
	 * @Length(min = 1, max = 100, message = "证明人所在部门名称长度必须介于 1 和 100 之间")
	 * public String getWitnessOfficeName() { return witnessOfficeName; }
	 * 
	 * public void setWitnessOfficeName(String witnessOfficeName) {
	 * this.witnessOfficeName = witnessOfficeName; }
	 */
	@Length(min = 0, max = 100, message = "上级签字长度必须介于 0 和 100 之间")
	public String getExamname() {
		return examname;
	}

	public void setExamname(String examname) {
		this.examname = examname;
	}

	@Length(min = 0, max = 255, message = "上级意见长度必须介于 0 和 255 之间")
	public String getExamtext() {
		return examtext;
	}

	public void setExamtext(String examtext) {
		this.examtext = examtext;
	}

	@Length(min = 0, max = 100, message = "上级签字长度必须介于 0 和 100 之间")
	public String getExamname2() {
		return examname2;
	}

	public void setExamname2(String examname) {
		this.examname2 = examname;
	}

	@Length(min = 0, max = 255, message = "上级意见长度必须介于 0 和 255 之间")
	public String getExamtext2() {
		return examtext2;
	}

	public void setExamtext2(String examtext) {
		this.examtext2 = examtext;
	}
}