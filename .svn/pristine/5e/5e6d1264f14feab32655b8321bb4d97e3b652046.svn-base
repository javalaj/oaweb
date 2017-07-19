/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.entity.contract;

import org.hibernate.validator.constraints.Length;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 销售合同阶段信息管理Entity
 * @author 李廷龙
 * @version 2016-12-13
 */
public class OaContractSalesStage extends DataEntity<OaContractSalesStage> {
	
	private static final long serialVersionUID = 1L;
	private OaContractSales contractSales;		// 关联的销售合同
	private String payStage;		// 合同付款阶段
	private Date checkCompleteTime;		// 验收完成时间
	private String checkFile;		// 验收资料
	private String isBilling;		// 是否已开票
	private String billingMoney;		// 开票金额
	private Date billingTime;		// 开票日期
	private String isGathering;		// 是否已收款
	private String billingContent;		// 开票内容
	private String billingNo;		// 发票号
	private String billingReceipt;		// 收票回执
	private String billingType;		// 票种
	private String situationDescription;		// 情况说明
	private Integer payStageIndex;		// 阶段序号
	
	
	public OaContractSalesStage() {
		super();
	}

	public OaContractSalesStage(String id){
		super(id);
	}

	public OaContractSalesStage(OaContractSales oaContractSales){
		this.contractSales=oaContractSales;
	}
	
	public OaContractSales getContractSales() {
		return contractSales;
	}

	public void setContractSales(OaContractSales contractSales) {
		this.contractSales = contractSales;
	}

	@Length(min=0, max=1, message="合同付款阶段长度必须介于 0 和 1 之间")
	public String getPayStage() {
		return payStage;
	}

	public void setPayStage(String payStage) {
		this.payStage = payStage;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getCheckCompleteTime() {
		return checkCompleteTime;
	}

	public void setCheckCompleteTime(Date checkCompleteTime) {
		this.checkCompleteTime = checkCompleteTime;
	}
	
	@Length(min=0, max=1000, message="验收资料长度必须介于 0 和 1000 之间")
	public String getCheckFile() {
		return checkFile;
	}

	public void setCheckFile(String checkFile) {
		this.checkFile = checkFile;
	}
	
	@Length(min=0, max=1, message="是否已开票长度必须介于 0 和 1 之间")
	public String getIsBilling() {
		return isBilling;
	}

	public void setIsBilling(String isBilling) {
		this.isBilling = isBilling;
	}
	
	public String getBillingMoney() {
		return billingMoney;
	}

	public void setBillingMoney(String billingMoney) {
		this.billingMoney = billingMoney;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getBillingTime() {
		return billingTime;
	}

	public void setBillingTime(Date billingTime) {
		this.billingTime = billingTime;
	}
	
	@Length(min=0, max=1, message="是否已收款长度必须介于 0 和 1 之间")
	public String getIsGathering() {
		return isGathering;
	}

	public void setIsGathering(String isGathering) {
		this.isGathering = isGathering;
	}
	
	@Length(min=0, max=200, message="开票内容长度必须介于 0 和 200 之间")
	public String getBillingContent() {
		return billingContent;
	}

	public void setBillingContent(String billingContent) {
		this.billingContent = billingContent;
	}
	
	@Length(min=0, max=64, message="发票号长度必须介于 0 和 64 之间")
	public String getBillingNo() {
		return billingNo;
	}

	public void setBillingNo(String billingNo) {
		this.billingNo = billingNo;
	}
	
	@Length(min=0, max=200, message="收票回执长度必须介于 0 和 200 之间")
	public String getBillingReceipt() {
		return billingReceipt;
	}

	public void setBillingReceipt(String billingReceipt) {
		this.billingReceipt = billingReceipt;
	}
	
	@Length(min=0, max=1, message="票种长度必须介于 0 和 1 之间")
	public String getBillingType() {
		return billingType;
	}

	public void setBillingType(String billingType) {
		this.billingType = billingType;
	}
	
	@Length(min=0, max=200, message="情况说明长度必须介于 0 和 200 之间")
	public String getSituationDescription() {
		return situationDescription;
	}

	public void setSituationDescription(String situationDescription) {
		this.situationDescription = situationDescription;
	}

	public Integer getPayStageIndex() {
		return payStageIndex;
	}

	public void setPayStageIndex(Integer payStageIndex) {
		this.payStageIndex = payStageIndex;
	}
	
}