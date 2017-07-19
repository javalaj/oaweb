/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.entity.contract;

import org.hibernate.validator.constraints.Length;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 采购合同阶段信息管理Entity
 * @author 李廷龙
 * @version 2016-12-13
 */
public class OaContractPurchaseStage extends DataEntity<OaContractPurchaseStage> {
	
	private static final long serialVersionUID = 1L;
	private OaContractPurchase contractPurchase;		// 关联的采购合同
	private String payStage;		// 合同付款阶段
	private String isGoodsArrived;		// 是否已全部到货
	private String isInspectionSheetReady;		// 验货单是否备齐
	private Date payTime;		// 付款时间
	private Double payMoney;		// 付款金额
	private Double billingMoney;		// 发票金额
	private String billingNo;		// 发票号
	private String billingType;		// 票种
	private Date billingTime;		// 开票日期
	private String billingContent;		// 开票内容
	private String billingFile;		// 发票扫描件
	private String isWorkProgressCompleted;		// 进度对应工作是否完成
	private String workProgressFile;		// 进度文档
	
	private Integer payStageIndex;		// 阶段序号
	
	private String payStageName;		// 阶段名称
	private String payStageStatus;		// 阶段状态
	
	private OaContractPurchasePayApproval oaContractPurchasePayApproval; //关联的流程
	public OaContractPurchaseStage() {
		super();
	}

	public OaContractPurchaseStage(String id){
		super(id);
	}
	
	public OaContractPurchaseStage(OaContractPurchase oaContractPurchase){
		this.contractPurchase=oaContractPurchase;
	}

	
	public OaContractPurchase getContractPurchase() {
		return contractPurchase;
	}

	public void setContractPurchase(OaContractPurchase contractPurchase) {
		this.contractPurchase = contractPurchase;
	}

	@Length(min=0, max=1, message="合同付款阶段长度必须介于 0 和 1 之间")
	public String getPayStage() {
		return payStage;
	}

	public void setPayStage(String payStage) {
		this.payStage = payStage;
	}
	
	@Length(min=0, max=1, message="是否已全部到货长度必须介于 0 和 1 之间")
	public String getIsGoodsArrived() {
		return isGoodsArrived;
	}

	public void setIsGoodsArrived(String isGoodsArrived) {
		this.isGoodsArrived = isGoodsArrived;
	}
	
	@Length(min=0, max=1, message="验货单是否备齐长度必须介于 0 和 1 之间")
	public String getIsInspectionSheetReady() {
		return isInspectionSheetReady;
	}

	public void setIsInspectionSheetReady(String isInspectionSheetReady) {
		this.isInspectionSheetReady = isInspectionSheetReady;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getPayTime() {
		return payTime;
	}

	public void setPayTime(Date payTime) {
		this.payTime = payTime;
	}
	
	public Double getPayMoney() {
		return payMoney;
	}

	public void setPayMoney(Double payMoney) {
		this.payMoney = payMoney;
	}
	
	public Double getBillingMoney() {
		return billingMoney;
	}

	public void setBillingMoney(Double billingMoney) {
		this.billingMoney = billingMoney;
	}
	
	@Length(min=0, max=64, message="发票号长度必须介于 0 和 64 之间")
	public String getBillingNo() {
		return billingNo;
	}

	public void setBillingNo(String billingNo) {
		this.billingNo = billingNo;
	}
	
	@Length(min=0, max=1, message="票种长度必须介于 0 和 1 之间")
	public String getBillingType() {
		return billingType;
	}

	public void setBillingType(String billingType) {
		this.billingType = billingType;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getBillingTime() {
		return billingTime;
	}

	public void setBillingTime(Date billingTime) {
		this.billingTime = billingTime;
	}
	
	@Length(min=0, max=200, message="开票内容长度必须介于 0 和 200 之间")
	public String getBillingContent() {
		return billingContent;
	}

	public void setBillingContent(String billingContent) {
		this.billingContent = billingContent;
	}
	
	@Length(min=0, max=1000, message="发票扫描件长度必须介于 0 和 1000 之间")
	public String getBillingFile() {
		return billingFile;
	}

	public void setBillingFile(String billingFile) {
		this.billingFile = billingFile;
	}
	
	@Length(min=0, max=1, message="进度对应工作是否完成长度必须介于 0 和 1 之间")
	public String getIsWorkProgressCompleted() {
		return isWorkProgressCompleted;
	}

	public void setIsWorkProgressCompleted(String isWorkProgressCompleted) {
		this.isWorkProgressCompleted = isWorkProgressCompleted;
	}
	
	@Length(min=0, max=1000, message="进度文档长度必须介于 0 和 1000 之间")
	public String getWorkProgressFile() {
		return workProgressFile;
	}

	public void setWorkProgressFile(String workProgressFile) {
		this.workProgressFile = workProgressFile;
	}

	public Integer getPayStageIndex() {
		return payStageIndex;
	}

	public void setPayStageIndex(Integer payStageIndex) {
		this.payStageIndex = payStageIndex;
	}

	public String getPayStageName() {
		return payStageName;
	}

	public void setPayStageName(String payStageName) {
		this.payStageName = payStageName;
	}

	public String getPayStageStatus() {
		return payStageStatus;
	}

	public void setPayStageStatus(String payStageStatus) {
		this.payStageStatus = payStageStatus;
	}

	public OaContractPurchasePayApproval getOaContractPurchasePayApproval() {
		return oaContractPurchasePayApproval;
	}

	public void setOaContractPurchasePayApproval(OaContractPurchasePayApproval oaContractPurchasePayApproval) {
		this.oaContractPurchasePayApproval = oaContractPurchasePayApproval;
	}
	
	
}