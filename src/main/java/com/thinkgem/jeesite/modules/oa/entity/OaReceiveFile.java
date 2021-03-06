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
 * 公司收文登记流程Entity
 * 
 * @author liuxin
 * @version 2016-12-20
 */
public class OaReceiveFile extends ActEntity<OaReceiveFile> {

	private static final long serialVersionUID = 1L;
	private String procInsId; // 流程关联id
	private String officename; // 登记部门
	private String code; // 字号
	private String unitcode; // 收文字号
	private Date date; // 收文日期
	private String unitname; // 来文单位
	private String title; // 文件标题
	private String content; // 内容摘要
	private String mainfile; // 正文
	private String otherfiles; // 附件
	private String examname; // 主办部门领导签字
	private String examtext; // 主办部门领导意见
	private String examname2; // 总经理签名
	private String examtext2; // 总经理意见
	private String examname3; // 主办人员签名
	private String examtext3; // 主办人员意见
	private String isdraft;// 是否为草稿 ，0是1否,2已完结
	private String hostUpperOfficeId;// 主办id
	private String hostUpperOfficeName;// 主办name

	public String getIsdraft() {
		return isdraft;
	}

	public String getHostUpperOfficeId() {
		return hostUpperOfficeId;
	}

	public void setHostUpperOfficeId(String hostUpperOfficeId) {
		this.hostUpperOfficeId = hostUpperOfficeId;
	}

	public String getHostUpperOfficeName() {
		return hostUpperOfficeName;
	}

	public void setHostUpperOfficeName(String hostUpperOfficeName) {
		this.hostUpperOfficeName = hostUpperOfficeName;
	}

	public void setIsdraft(String isdraft) {
		this.isdraft = isdraft;
	}

	public OaReceiveFile() {
		super();
	}

	public OaReceiveFile(String id) {
		super(id);
	}

	@Length(min = 0, max = 64, message = "流程关联id长度必须介于 0 和 64 之间")
	public String getProcInsId() {
		return procInsId;
	}

	public void setProcInsId(String procInsId) {
		this.procInsId = procInsId;
	}

	@Length(min = 0, max = 100, message = "登记部门长度必须介于 0 和 100 之间")
	public String getOfficename() {
		return officename;
	}

	public void setOfficename(String officename) {
		this.officename = officename;
	}

	@Length(min = 0, max = 100, message = "字号长度必须介于 0 和 100 之间")
	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	@Length(min = 0, max = 100, message = "收文字号长度必须介于 0 和 100 之间")
	public String getUnitcode() {
		return unitcode;
	}

	public void setUnitcode(String unitcode) {
		this.unitcode = unitcode;
	}

	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	@NotNull(message = "收文日期不能为空")
	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	@Length(min = 1, max = 100, message = "来文单位长度必须介于 1 和 100 之间")
	public String getUnitname() {
		return unitname;
	}

	public void setUnitname(String unitname) {
		this.unitname = unitname;
	}

	@Length(min = 1, max = 100, message = "文件标题长度必须介于 1 和 100 之间")
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	@Length(min = 0, max = 2000, message = "正文长度必须介于 0 和 2000之间")
	public String getMainfile() {
		return mainfile;
	}

	public void setMainfile(String mainfile) {
		this.mainfile = mainfile;
	}

	@Length(min = 0, max = 2000, message = "附件长度必须介于 0 和 2000 之间")
	public String getOtherfiles() {
		return otherfiles;
	}

	public void setOtherfiles(String otherfiles) {
		this.otherfiles = otherfiles;
	}

	@Length(min = 0, max = 100, message = "主办部门领导签字长度必须介于 0 和 100 之间")
	public String getExamname() {
		return examname;
	}

	public void setExamname(String examname) {
		this.examname = examname;
	}

	@Length(min = 0, max = 255, message = "主办部门领导意见长度必须介于 0 和 255 之间")
	public String getExamtext() {
		return examtext;
	}

	public void setExamtext(String examtext) {
		this.examtext = examtext;
	}

	@Length(min = 0, max = 100, message = "总经理签名长度必须介于 0 和 100 之间")
	public String getExamname2() {
		return examname2;
	}

	public void setExamname2(String examname2) {
		this.examname2 = examname2;
	}

	@Length(min = 0, max = 255, message = "总经理意见长度必须介于 0 和 255 之间")
	public String getExamtext2() {
		return examtext2;
	}

	public void setExamtext2(String examtext2) {
		this.examtext2 = examtext2;
	}

	@Length(min = 0, max = 100, message = "主办人员签名长度必须介于 0 和 100 之间")
	public String getExamname3() {
		return examname3;
	}

	public void setExamname3(String examname3) {
		this.examname3 = examname3;
	}

	@Length(min = 0, max = 255, message = "主办人员意见长度必须介于 0 和 255 之间")
	public String getExamtext3() {
		return examtext3;
	}

	public void setExamtext3(String examtext3) {
		this.examtext3 = examtext3;
	}

}