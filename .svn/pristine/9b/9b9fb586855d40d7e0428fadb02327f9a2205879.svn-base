/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.entity;

import java.util.Date;

import org.hibernate.validator.constraints.Length;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.thinkgem.jeesite.common.persistence.ActEntity;

/**
 * 专项借支流程业务表Entity
 * 
 * @author liuxin
 * @version 2016-12-08
 */
public class OaSpacialLoan extends ActEntity<OaSpacialLoan> {

	private static final long serialVersionUID = 1L;
	private String procInsId; // 流程关联id
	private Date date; // 借支日期
	private String fileId; // 文件单号
	private String officeName; // 部门名称
	private String job; // 职务
	private String reason; // 借支事由
	private String moneyString; // 人民币（大写）
	private String moneyDouble; // 人民币（小写）
	private String examname; // 上级领导签字
	private String examtext; // 上级领导意见
	private String examname2; // 主管副总签字
	private String examtext2; // 主管副总意见
	private String examname3; // 总经理签字
	private String examtext3; // 总经理意见
	private String examname4; // 会计签字
	private String examtext4; // 会计意见
	private String examname5; // 出纳签字
	private String examtext5; // 出纳意见

	public OaSpacialLoan() {
		super();
	}

	public OaSpacialLoan(String id) {
		super(id);
	}

	@Length(min = 0, max = 64, message = "流程关联id长度必须介于 0 和 64 之间")
	public String getProcInsId() {
		return procInsId;
	}

	public void setProcInsId(String procInsId) {
		this.procInsId = procInsId;
	}

	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	@Length(min = 0, max = 100, message = "文件单号长度必须介于 0 和 100 之间")
	public String getFileId() {
		return fileId;
	}

	public void setFileId(String fileId) {
		this.fileId = fileId;
	}

	@Length(min = 0, max = 100, message = "部门名称长度必须介于 0 和 100 之间")
	public String getOfficeName() {
		return officeName;
	}

	public void setOfficeName(String officeName) {
		this.officeName = officeName;
	}

	@Length(min = 0, max = 100, message = "职务长度必须介于 0 和 100 之间")
	public String getJob() {
		return job;
	}

	public void setJob(String job) {
		this.job = job;
	}

	@Length(min = 1, max = 255, message = "借支事由长度必须介于 1 和 255 之间")
	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

	@Length(min = 0, max = 255, message = "人民币（大写）长度必须介于 0和 255 之间")
	public String getMoneyString() {
		return moneyString;
	}

	public void setMoneyString(String moneyString) {
		this.moneyString = moneyString;
	}

	@Length(min = 1, max = 255, message = "人民币（小写）长度必须介于 1 和 255 之间")
	public String getMoneyDouble() {
		return moneyDouble;
	}

	public void setMoneyDouble(String moneyDouble) {
		this.moneyDouble = moneyDouble;
	}

	@Length(min = 0, max = 100, message = "上级领导签字长度必须介于 0 和 100 之间")
	public String getExamname() {
		return examname;
	}

	public void setExamname(String examname) {
		this.examname = examname;
	}

	@Length(min = 0, max = 255, message = "上级领导意见长度必须介于 0 和 255 之间")
	public String getExamtext() {
		return examtext;
	}

	public void setExamtext(String examtext) {
		this.examtext = examtext;
	}

	@Length(min = 0, max = 100, message = "主管副总签字长度必须介于 0 和 100 之间")
	public String getExamname2() {
		return examname2;
	}

	public void setExamname2(String examname2) {
		this.examname2 = examname2;
	}

	@Length(min = 0, max = 255, message = "主管副总意见长度必须介于 0 和 255 之间")
	public String getExamtext2() {
		return examtext2;
	}

	public void setExamtext2(String examtext2) {
		this.examtext2 = examtext2;
	}

	@Length(min = 0, max = 100, message = "总经理签字长度必须介于 0 和 100 之间")
	public String getExamname3() {
		return examname3;
	}

	public void setExamname3(String examname3) {
		this.examname3 = examname3;
	}

	@Length(min = 0, max = 255, message = "总经理意见长度必须介于 0 和 255 之间")
	public String getExamtext3() {
		return examtext3;
	}

	public void setExamtext3(String examtext3) {
		this.examtext3 = examtext3;
	}

	@Length(min = 0, max = 100, message = "会计签字长度必须介于 0 和 100 之间")
	public String getExamname4() {
		return examname4;
	}

	public void setExamname4(String examname4) {
		this.examname4 = examname4;
	}

	@Length(min = 0, max = 255, message = "会计意见长度必须介于 0 和 255 之间")
	public String getExamtext4() {
		return examtext4;
	}

	public void setExamtext4(String examtext4) {
		this.examtext4 = examtext4;
	}

	@Length(min = 0, max = 100, message = "出纳签字长度必须介于 0 和 100 之间")
	public String getExamname5() {
		return examname5;
	}

	public void setExamname5(String examname5) {
		this.examname5 = examname5;
	}

	@Length(min = 0, max = 255, message = "出纳意见长度必须介于 0 和 255 之间")
	public String getExamtext5() {
		return examtext5;
	}

	public void setExamtext5(String examtext5) {
		this.examtext5 = examtext5;
	}

}