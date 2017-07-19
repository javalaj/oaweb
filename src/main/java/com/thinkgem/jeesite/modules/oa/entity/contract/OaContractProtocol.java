/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.entity.contract;

import org.hibernate.validator.constraints.Length;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;

import com.thinkgem.jeesite.common.persistence.DataEntity;
import com.thinkgem.jeesite.modules.oa.entity.project.OaProject;

/**
 * 协议框架合同管理Entity
 * @author 李廷龙
 * @version 2017-01-04
 */
public class OaContractProtocol extends DataEntity<OaContractProtocol> {
	
	private static final long serialVersionUID = 1L;
	private String contractNo;		// 合同编号
	private String contractName;		// 合同名称
	private String contractStatus;		// 合同状态
	private OaProject project;		// 关联的项目
	private String projectOldName;		// 项目名称（旧）
	private String contractType;		// 合同类别
	private String contractMoney;		// 合同金额
	private Date contractTime;		// 合同签订日期
	private String cooperationUnits;		// 合作单位
	private String cooperationContents;		// 合作内容
	private String contact;		// 联系人
	private String contactNumber;		// 联系电话
	private Date contractEndTime;		// 合同截止日期
	private String filingStatus;		// 合同归档情况
	private String contractElectronicVersion;		// 合同电子版
	private String contractScanAttachment;		// 合同扫描件
	
	public OaContractProtocol() {
		super();
	}

	public OaContractProtocol(String id){
		super(id);
	}

	@Length(min=0, max=64, message="合同编号长度必须介于 0 和 64 之间")
	public String getContractNo() {
		return contractNo;
	}

	public void setContractNo(String contractNo) {
		this.contractNo = contractNo;
	}
	
	@Length(min=0, max=64, message="合同名称长度必须介于 0 和 64 之间")
	public String getContractName() {
		return contractName;
	}

	public void setContractName(String contractName) {
		this.contractName = contractName;
	}
	
	@Length(min=0, max=1, message="合同状态长度必须介于 0 和 1 之间")
	public String getContractStatus() {
		return contractStatus;
	}

	public void setContractStatus(String contractStatus) {
		this.contractStatus = contractStatus;
	}
	
	
	public OaProject getProject() {
		return project;
	}

	public void setProject(OaProject project) {
		this.project = project;
	}

	@Length(min=0, max=64, message="项目名称（旧）长度必须介于 0 和 64 之间")
	public String getProjectOldName() {
		return projectOldName;
	}

	public void setProjectOldName(String projectOldName) {
		this.projectOldName = projectOldName;
	}
	
	@Length(min=0, max=1, message="合同类别长度必须介于 0 和 1 之间")
	public String getContractType() {
		return contractType;
	}

	public void setContractType(String contractType) {
		this.contractType = contractType;
	}
	
	public String getContractMoney() {
		return contractMoney;
	}

	public void setContractMoney(String contractMoney) {
		this.contractMoney = contractMoney;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getContractTime() {
		return contractTime;
	}

	public void setContractTime(Date contractTime) {
		this.contractTime = contractTime;
	}
	
	@Length(min=0, max=64, message="合作单位长度必须介于 0 和 64 之间")
	public String getCooperationUnits() {
		return cooperationUnits;
	}

	public void setCooperationUnits(String cooperationUnits) {
		this.cooperationUnits = cooperationUnits;
	}
	
	@Length(min=0, max=1000, message="合作内容长度必须介于 0 和 1000 之间")
	public String getCooperationContents() {
		return cooperationContents;
	}

	public void setCooperationContents(String cooperationContents) {
		this.cooperationContents = cooperationContents;
	}
	
	@Length(min=0, max=64, message="联系人长度必须介于 0 和 64 之间")
	public String getContact() {
		return contact;
	}

	public void setContact(String contact) {
		this.contact = contact;
	}
	
	@Length(min=0, max=64, message="联系电话长度必须介于 0 和 64 之间")
	public String getContactNumber() {
		return contactNumber;
	}

	public void setContactNumber(String contactNumber) {
		this.contactNumber = contactNumber;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getContractEndTime() {
		return contractEndTime;
	}

	public void setContractEndTime(Date contractEndTime) {
		this.contractEndTime = contractEndTime;
	}
	
	@Length(min=0, max=100, message="合同归档情况长度必须介于 0 和 100 之间")
	public String getFilingStatus() {
		return filingStatus;
	}

	public void setFilingStatus(String filingStatus) {
		this.filingStatus = filingStatus;
	}
	
	@Length(min=0, max=1000, message="合同电子版长度必须介于 0 和 1000 之间")
	public String getContractElectronicVersion() {
		return contractElectronicVersion;
	}

	public void setContractElectronicVersion(String contractElectronicVersion) {
		this.contractElectronicVersion = contractElectronicVersion;
	}
	
	@Length(min=0, max=1000, message="合同扫描件长度必须介于 0 和 1000 之间")
	public String getContractScanAttachment() {
		return contractScanAttachment;
	}

	public void setContractScanAttachment(String contractScanAttachment) {
		this.contractScanAttachment = contractScanAttachment;
	}
	
}