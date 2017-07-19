/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.entity.contract;

import org.hibernate.validator.constraints.Length;
import java.util.Date;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.google.common.collect.Lists;
import com.thinkgem.jeesite.modules.oa.entity.project.OaProject;
import com.thinkgem.jeesite.modules.sys.entity.User;

import com.thinkgem.jeesite.common.persistence.DataEntity;
import com.thinkgem.jeesite.common.utils.excel.annotation.ExcelField;

/**
 * 销售合同管理Entity
 * @author 李廷龙
 * @version 2016-12-12
 */
public class OaContractSales extends DataEntity<OaContractSales> {
	
	private static final long serialVersionUID = 1L;
	private String contractNo;		// 合同编号
	private String contractName;		// 合同名称
	private String contractStatus;		// 合同状态
	private OaProject project;		// 关联的项目
	private String projectOldName;		// 项目名称（旧）
	private String contractType;		// 合同类别
	private Double contractMoney;		// 合同金额
	private Date contractTime;		// 合同签订日期
	private String serviceType;		// 服务内容
	private String custumerType;		// 客户类别
	private String contractPartya;		// 合同甲方
	private String partyaTicket;		// 甲方开票信息
	private Date warrantyStartTime;		// 合同保修开始时间
	private Date warrantyEndTime;		// 合同保修结束日期
	private User projectLeader;		// 项目负责人
	private Double guaranteeMoney;		// 质保金金额
	private Date guaranteeMoneyChargeTime;		// 质保金收取时间
	private String isCounterPointContract;		// 是否是反点合同
	private String isBiddingOff;		// 是否经过招投标
	private String contractElectronicVersion;		// 合同电子版
	private String contractScanAttachment;		// 合同扫描件
	private String punishment;		// 违约惩罚
	private Date beginContractTime;		// 开始 合同签订日期
	private Date endContractTime;		// 结束 合同签订日期
	private Integer warrantyMonth;		// 质保期
	
	private List<OaContractSalesStage> oaContractSalesStageList = Lists.newArrayList();		// 子表列表
	
	private String isOverdue;		// 是否已过期（0：未过期；1：已过期）
	private Date currentTime;		// 当前时间
	public OaContractSales() {
		super();
	}

	public OaContractSales(String id){
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
	@ExcelField(title = "合同名称", align = 1, sort = 1)
	public String getContractName() {
		return contractName;
	}

	public void setContractName(String contractName) {
		this.contractName = contractName;
	}
	
	@Length(min=0, max=1, message="合同状态长度必须介于 0 和 1 之间")
	//@ExcelField(title = "合同状态", align = 1, sort = 5,dictType="oa_contract_sales_status")
	public String getContractStatus() {
		return contractStatus;
	}

	public void setContractStatus(String contractStatus) {
		this.contractStatus = contractStatus;
	}
	
	@ExcelField(title = "关联的项目", align = 1, sort = 2)
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
	@ExcelField(title = "合同金额", align = 3, sort = 4)
	public Double getContractMoney() {
		return contractMoney;
	}

	public void setContractMoney(Double contractMoney) {
		this.contractMoney = contractMoney;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	@ExcelField(title = "合同签订日期", align = 1, sort = 5)
	public Date getContractTime() {
		return contractTime;
	}

	public void setContractTime(Date contractTime) {
		this.contractTime = contractTime;
	}
	
	public String getServiceType() {
		return serviceType;
	}

	public void setServiceType(String serviceType) {
		this.serviceType = serviceType;
	}
	
	public String getCustumerType() {
		return custumerType;
	}

	public void setCustumerType(String custumerType) {
		this.custumerType = custumerType;
	}
	
	@Length(min=0, max=64, message="合同甲方长度必须介于 0 和 64 之间")
	@ExcelField(title = "合同甲方", align = 1, sort = 3)
	public String getContractPartya() {
		return contractPartya;
	}

	public void setContractPartya(String contractPartya) {
		this.contractPartya = contractPartya;
	}
	
	@Length(min=0, max=1000, message="甲方开票信息长度必须介于 0 和 1000 之间")
	public String getPartyaTicket() {
		return partyaTicket;
	}

	public void setPartyaTicket(String partyaTicket) {
		this.partyaTicket = partyaTicket;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	@ExcelField(title = "合同保修开始时间", align = 1, sort = 6)
	public Date getWarrantyStartTime() {
		return warrantyStartTime;
	}

	public void setWarrantyStartTime(Date warrantyStartTime) {
		this.warrantyStartTime = warrantyStartTime;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	@ExcelField(title = "合同保修结束时间", align = 1, sort = 7)
	public Date getWarrantyEndTime() {
		return warrantyEndTime;
	}

	public void setWarrantyEndTime(Date warrantyEndTime) {
		this.warrantyEndTime = warrantyEndTime;
	}
	@ExcelField(title = "项目负责人", align = 1, sort = 8 )
	public User getProjectLeader() {
		return projectLeader;
	}

	public void setProjectLeader(User projectLeader) {
		this.projectLeader = projectLeader;
	}
	
	public Double getGuaranteeMoney() {
		return guaranteeMoney;
	}

	public void setGuaranteeMoney(Double guaranteeMoney) {
		this.guaranteeMoney = guaranteeMoney;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getGuaranteeMoneyChargeTime() {
		return guaranteeMoneyChargeTime;
	}

	public void setGuaranteeMoneyChargeTime(Date guaranteeMoneyChargeTime) {
		this.guaranteeMoneyChargeTime = guaranteeMoneyChargeTime;
	}
	
	@Length(min=0, max=1, message="是否是反点合同长度必须介于 0 和 1 之间")
	public String getIsCounterPointContract() {
		return isCounterPointContract;
	}

	public void setIsCounterPointContract(String isCounterPointContract) {
		this.isCounterPointContract = isCounterPointContract;
	}
	
	@Length(min=0, max=1, message="是否经过招投标长度必须介于 0 和 1 之间")
	public String getIsBiddingOff() {
		return isBiddingOff;
	}

	public void setIsBiddingOff(String isBiddingOff) {
		this.isBiddingOff = isBiddingOff;
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
	
	@Length(min=0, max=1000, message="违约惩罚长度必须介于 0 和 1000 之间")
	public String getPunishment() {
		return punishment;
	}

	public void setPunishment(String punishment) {
		this.punishment = punishment;
	}
	
	public Date getBeginContractTime() {
		return beginContractTime;
	}

	public void setBeginContractTime(Date beginContractTime) {
		this.beginContractTime = beginContractTime;
	}
	
	public Date getEndContractTime() {
		return endContractTime;
	}

	public void setEndContractTime(Date endContractTime) {
		this.endContractTime = endContractTime;
	}

	public List<OaContractSalesStage> getOaContractSalesStageList() {
		return oaContractSalesStageList;
	}

	public void setOaContractSalesStageList(List<OaContractSalesStage> oaContractSalesStageList) {
		this.oaContractSalesStageList = oaContractSalesStageList;
	}

	public String getIsOverdue() {
		return isOverdue;
	}

	public void setIsOverdue(String isOverdue) {
		this.isOverdue = isOverdue;
	}

	public Date getCurrentTime() {
		currentTime=new Date();
		return currentTime;
	}

	public void setCurrentTime(Date currentTime) {
		this.currentTime = currentTime;
	}

	public Integer getWarrantyMonth() {
		return warrantyMonth;
	}

	public void setWarrantyMonth(Integer warrantyMonth) {
		this.warrantyMonth = warrantyMonth;
	}
		
}