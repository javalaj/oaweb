/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.entity;

import org.hibernate.validator.constraints.Length;
import java.util.Date;

import javax.validation.constraints.NotNull;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.thinkgem.jeesite.common.persistence.ActEntity;
import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 印章借用流程表Entity
 * @author niting
 * @version 2016-12-13
 */
public class OaSealUse extends ActEntity<OaSealUse> {
	
	private static final long serialVersionUID = 1L;
	private String procInsId;		// 流程关联id
	private String fileId;		// 编号
	private String officeName;		// 所在部门
	private Date date;		// 申请日期
	private String sealType;		// 印章类型
	private String isout;		// 是否携带外出
	private String matter;		// 摘要(事项)
	private String examname;		// 总经理签字
	private String examtext;		// 总经理审批意见
	private String examname2;		// 行政人事部签字
	private String examtext2;		// 行政人事部意见
	
	public OaSealUse() {
		super();
	}

	public OaSealUse(String id){
		super(id);
	}

	@Length(min=0, max=64, message="流程关联id长度必须介于 0 和 64 之间")
	public String getProcInsId() {
		return procInsId;
	}

	public void setProcInsId(String procInsId) {
		this.procInsId = procInsId;
	}
	
	@Length(min=0, max=100, message="编号长度必须介于 0 和 100 之间")
	public String getFileId() {
		return fileId;
	}

	public void setFileId(String fileId) {
		this.fileId = fileId;
	}
	
	@Length(min=0, max=64, message="所在部门长度必须介于 0 和 64 之间")
	public String getOfficeName() {
		return officeName;
	}

	public void setOfficeName(String officeName) {
		this.officeName = officeName;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}
	
	@Length(min=0, max=64, message="印章类型长度必须介于 0 和 64 之间")
	@NotNull(message="印章类型不能为空")
	public String getSealType() {
		return sealType;
	}

	public void setSealType(String sealType) {
		this.sealType = sealType;
	}
	
	@Length(min=0, max=64, message="是否携带外出长度必须介于 0 和 64 之间")
	@NotNull(message="是否携带外出不能为空")
	public String getIsout() {
		return isout;
	}

	public void setIsout(String isout) {
		this.isout = isout;
	}
	
	@Length(min=0, max=1000, message="摘要(事项)长度必须介于 0 和 100 之间")
	public String getMatter() {
		return matter;
	}

	public void setMatter(String matter) {
		this.matter = matter;
	}
	
	@Length(min=0, max=64, message="总经理签字长度必须介于 0 和 64 之间")
	public String getExamname() {
		return examname;
	}

	public void setExamname(String examname) {
		this.examname = examname;
	}
	
	@Length(min=0, max=1000, message="总经理审批意见长度必须介于 0 和 1000 之间")
	public String getExamtext() {
		return examtext;
	}

	public void setExamtext(String examtext) {
		this.examtext = examtext;
	}
	
	@Length(min=0, max=64, message="行政人事部签字长度必须介于 0 和 64 之间")
	public String getExamname2() {
		return examname2;
	}

	public void setExamname2(String examname2) {
		this.examname2 = examname2;
	}
	
	@Length(min=0, max=1000, message="行政人事部意见长度必须介于 0 和 1000之间")
	public String getExamtext2() {
		return examtext2;
	}

	public void setExamtext2(String examtext2) {
		this.examtext2 = examtext2;
	}
	
}