/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.entity.qualificationb;

import org.hibernate.validator.constraints.Length;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import javax.validation.constraints.NotNull;

import com.thinkgem.jeesite.common.persistence.ActEntity;
import com.thinkgem.jeesite.common.persistence.DataEntity;
import com.thinkgem.jeesite.modules.oa.entity.OaSealUse;

/**
 * 资质借用流程Entity
 * @author niting
 * @version 2017-01-09
 */
public class OaQualificationb extends ActEntity<OaQualificationb> {
	
	private static final long serialVersionUID = 1L;
	private String procInsId; // 流程实例ID
	private String officename;		// 借用人部门
	private Date date;		// 借用日期
	private String licensename;		// 证照名称
	private String type;		// 类别（原件，复印件）
	private String reason;		// 使用事由
	private String textname;		// 审批人
	private String textexam;		// 审批人意见
	private String textname1;		// 登记人
	private String textexam1;		// 登记人签字
	private String fileId;			//编号
	private String name;            //申请人
	
	
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getFileId() {
		return fileId;
	}

	public void setFileId(String fileId) {
		this.fileId = fileId;
	}

	public OaQualificationb() {
		super();
	}

	public OaQualificationb(String id){
		super(id);
	}

	public String getProcInsId() {
		return procInsId;
	}

	public void setProcInsId(String procInsId) {
		this.procInsId = procInsId;
	}

	@Length(min=1, max=50, message="借用人部门长度必须介于 1 和 50 之间")
	public String getOfficename() {
		return officename;
	}

	public void setOfficename(String officename) {
		this.officename = officename;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}
	
	@Length(min=1, max=50, message="证照名称长度必须介于 1 和 50 之间")
	public String getLicensename() {
		return licensename;
	}

	public void setLicensename(String licensename) {
		this.licensename = licensename;
	}
	
	@Length(min=0, max=50, message="类别（原件，复印件）长度必须介于 0 和 50 之间")
	@NotNull(message="印章类型不能为空")
	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}
	
	@Length(min=0, max=200, message="使用事由长度必须介于 0 和 200 之间")
	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}
	
	@Length(min=0, max=50, message="审批人长度必须介于 0 和 50 之间")
	public String getTextname() {
		return textname;
	}

	public void setTextname(String textname) {
		this.textname = textname;
	}
	
	@Length(min=0, max=1000, message="审批人意见长度必须介于 0 和 1000 之间")
	public String getTextexam() {
		return textexam;
	}

	public void setTextexam(String textexam) {
		this.textexam = textexam;
	}
	
	@Length(min=0, max=50, message="登记人长度必须介于 0 和 50 之间")
	public String getTextname1() {
		return textname1;
	}

	public void setTextname1(String textname1) {
		this.textname1 = textname1;
	}
	
	@Length(min=0, max=1000, message="登记人签字长度必须介于 0 和 1000 之间")
	public String getTextexam1() {
		return textexam1;
	}

	public void setTextexam1(String textexam1) {
		this.textexam1 = textexam1;
	}
	
}