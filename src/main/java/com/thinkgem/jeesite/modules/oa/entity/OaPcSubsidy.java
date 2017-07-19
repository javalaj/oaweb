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
 * 个人电脑补贴申请流程业务表Entity
 * 
 * @author liuxin
 * @version 2016-11-30
 */
public class OaPcSubsidy extends ActEntity<OaPcSubsidy> {

	private static final long serialVersionUID = 1L;
	private String procInsId; // 流程关联id
	private String officeName; // 部门名称
	private Date beginDate; // 入职日期
	private Date endDate; // 转正日期
	private Date buyPcDate; // 购买电脑日期
	private String pcConf; // 电脑配置
	private String imgUrl; // 发票扫描件
	private String examname; // 人事行政部签字
	private String examtext; // 人事行政部意见
	private String examname2; // 人事行政部副总签字
	private String examtext2; // 人事行政部副总意见

	public OaPcSubsidy() {
		super();
	}

	public OaPcSubsidy(String id) {
		super(id);
	}

	@Length(min = 0, max = 64, message = "流程关联id长度必须介于 0 和 64 之间")
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
	@NotNull(message = "入职日期不能为空")
	public Date getBeginDate() {
		return beginDate;
	}

	public void setBeginDate(Date beginDate) {
		this.beginDate = beginDate;
	}

	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	@NotNull(message = "转正日期不能为空")
	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	@NotNull(message = "购买电脑日期不能为空")
	public Date getBuyPcDate() {
		return buyPcDate;
	}

	public void setBuyPcDate(Date buyPcDate) {
		this.buyPcDate = buyPcDate;
	}

	@Length(min = 1, max = 255, message = "电脑配置长度必须介于 1 和 255 之间")
	public String getPcConf() {
		return pcConf;
	}

	public void setPcConf(String pcConf) {
		this.pcConf = pcConf;
	}

	@Length(min = 0, max = 2000, message = "发票扫描件长度必须介于 0 和 2000 之间")
	public String getImgUrl() {
		return imgUrl;
	}

	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}

	@Length(min = 0, max = 100, message = "人事行政部签字长度必须介于 0 和 100 之间")
	public String getExamname() {
		return examname;
	}

	public void setExamname(String examname) {
		this.examname = examname;
	}

	@Length(min = 0, max = 255, message = "人事行政部意见长度必须介于 0 和 255 之间")
	public String getExamtext() {
		return examtext;
	}

	public void setExamtext(String examtext) {
		this.examtext = examtext;
	}

	@Length(min = 0, max = 100, message = "人事行政部副总签字长度必须介于 0 和 100 之间")
	public String getExamname2() {
		return examname2;
	}

	public void setExamname2(String examname2) {
		this.examname2 = examname2;
	}

	@Length(min = 0, max = 255, message = "人事行政部副总意见长度必须介于 0 和 255 之间")
	public String getExamtext2() {
		return examtext2;
	}

	public void setExamtext2(String examtext2) {
		this.examtext2 = examtext2;
	}

}