/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.entity.contract;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.modules.oa.entity.project.OaProject;
import com.thinkgem.jeesite.modules.sys.entity.User;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.thinkgem.jeesite.common.persistence.ActEntity;

/**
 * 采购合同付款申请审批管理Entity
 * @author 李廷龙
 * @version 2016-12-16
 */
public class OaContractPurchasePayApproval extends ActEntity<OaContractPurchasePayApproval> {
	
	private static final long serialVersionUID = 1L;
	private String payApprovalNo;		// 付款申请编号
	private User applicant;		// 申请人
	private Date applyDate;		// 申请日期
	private OaProject project;		// 关联的项目
	private String contractPurchaseTargetedFor;		// 采购合同面向对象（0：与甲方；1：与合作方）
	private OaContractPurchase contractPurchase;		// 关联的采购合同
	private String payPercentMoney;		// 付款比例金额
	private String contentDescription;		// 内容概括
	private String file;		// 附件
	private String accountmanageropinion;		// 客户经理意见
	private String businessDeptLinkmanOpinion;		// 商务部联系人意见
	private String projectManagerOpinion;		// 项目经理意见
	private String financeDeptPaymentRequest;		// 财务部付款要求
	private String leaderOpinion;		// 领导意见
	private String generalManagerOpinion;		// 总经理意见
	private String status;		// 审批状态（0：未送审；1：部门副总审批；2：人力资源审批；3：行政人事副总审批；x：已结案；y：已销毁）
	private String isStart;		// 是否已进入流程（0：未开启；1：已开启）
	private String engineeringDeptManagerOpinion;		// 工程部经理意见
	private String techDeptVicePresidentOpinion;		// 技术部副总意见
	private String businessManagerOpinion;		// 商务经理意见
	private String businessDeptVicePresidentOpinion;		// 市场部副总意见
	private String financeDeptVicePresidentOpinion;		// 财务部副总意见
	
	private OaContractPurchaseStage oaContractPurchaseStage;		// 关联的采购合同付款阶段
	private Double payMoney;		// 付款金额
	/**
	 * 标题
	 */
	private String title;
	
	
	public OaContractPurchasePayApproval() {
		super();
	}

	public OaContractPurchasePayApproval(String id){
		super(id);
	}

	@Length(min=0, max=64, message="付款申请编号长度必须介于 0 和 64 之间")
	public String getPayApprovalNo() {
		return payApprovalNo;
	}

	public void setPayApprovalNo(String payApprovalNo) {
		this.payApprovalNo = payApprovalNo;
	}
	
	public User getApplicant() {
		return applicant;
	}

	public void setApplicant(User applicant) {
		this.applicant = applicant;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getApplyDate() {
		return applyDate;
	}

	public void setApplyDate(Date applyDate) {
		this.applyDate = applyDate;
	}
	
	
	public OaProject getProject() {
		return project;
	}

	public void setProject(OaProject project) {
		this.project = project;
	}

	@Length(min=0, max=1, message="采购合同面向对象（0：与甲方；1：与合作方）长度必须介于 0 和 1 之间")
	public String getContractPurchaseTargetedFor() {
		return contractPurchaseTargetedFor;
	}

	public void setContractPurchaseTargetedFor(String contractPurchaseTargetedFor) {
		this.contractPurchaseTargetedFor = contractPurchaseTargetedFor;
	}
	
	
	public OaContractPurchase getContractPurchase() {
		return contractPurchase;
	}

	public void setContractPurchase(OaContractPurchase contractPurchase) {
		this.contractPurchase = contractPurchase;
	}

	@Length(min=0, max=64, message="付款比例金额长度必须介于 0 和 64 之间")
	public String getPayPercentMoney() {
		return payPercentMoney;
	}

	public void setPayPercentMoney(String payPercentMoney) {
		this.payPercentMoney = payPercentMoney;
	}
	
	@Length(min=0, max=400, message="内容概括长度必须介于 0 和 400 之间")
	public String getContentDescription() {
		return contentDescription;
	}

	public void setContentDescription(String contentDescription) {
		this.contentDescription = contentDescription;
	}
	
	@Length(min=0, max=1000, message="附件长度必须介于 0 和 1000 之间")
	public String getFile() {
		return file;
	}

	public void setFile(String file) {
		this.file = file;
	}
	
	@Length(min=0, max=200, message="客户经理意见长度必须介于 0 和 200 之间")
	public String getAccountmanageropinion() {
		return accountmanageropinion;
	}

	public void setAccountmanageropinion(String accountmanageropinion) {
		this.accountmanageropinion = accountmanageropinion;
	}
	
	@Length(min=0, max=200, message="商务部联系人意见长度必须介于 0 和 200 之间")
	public String getBusinessDeptLinkmanOpinion() {
		return businessDeptLinkmanOpinion;
	}

	public void setBusinessDeptLinkmanOpinion(String businessDeptLinkmanOpinion) {
		this.businessDeptLinkmanOpinion = businessDeptLinkmanOpinion;
	}
	
	@Length(min=0, max=200, message="项目经理意见长度必须介于 0 和 200 之间")
	public String getProjectManagerOpinion() {
		return projectManagerOpinion;
	}

	public void setProjectManagerOpinion(String projectManagerOpinion) {
		this.projectManagerOpinion = projectManagerOpinion;
	}
	
	@Length(min=0, max=200, message="财务部付款要求长度必须介于 0 和 200 之间")
	public String getFinanceDeptPaymentRequest() {
		return financeDeptPaymentRequest;
	}

	public void setFinanceDeptPaymentRequest(String financeDeptPaymentRequest) {
		this.financeDeptPaymentRequest = financeDeptPaymentRequest;
	}
	
	@Length(min=0, max=200, message="领导意见长度必须介于 0 和 200 之间")
	public String getLeaderOpinion() {
		return leaderOpinion;
	}

	public void setLeaderOpinion(String leaderOpinion) {
		this.leaderOpinion = leaderOpinion;
	}
	
	@Length(min=0, max=200, message="总经理意见长度必须介于 0 和 200 之间")
	public String getGeneralManagerOpinion() {
		return generalManagerOpinion;
	}

	public void setGeneralManagerOpinion(String generalManagerOpinion) {
		this.generalManagerOpinion = generalManagerOpinion;
	}
	
	
	@Length(min=0, max=1, message="审批状态（0：未送审；1：部门副总审批；2：人力资源审批；3：行政人事副总审批；x：已结案；y：已销毁）长度必须介于 0 和 1 之间")
	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
	@Length(min=0, max=1, message="是否已进入流程（0：未开启；1：已开启）长度必须介于 0 和 1 之间")
	public String getIsStart() {
		return isStart;
	}

	public void setIsStart(String isStart) {
		this.isStart = isStart;
	}
	
	@Length(min=0, max=200, message="工程部经理意见长度必须介于 0 和 200 之间")
	public String getEngineeringDeptManagerOpinion() {
		return engineeringDeptManagerOpinion;
	}

	public void setEngineeringDeptManagerOpinion(String engineeringDeptManagerOpinion) {
		this.engineeringDeptManagerOpinion = engineeringDeptManagerOpinion;
	}
	
	@Length(min=0, max=200, message="技术部副总意见长度必须介于 0 和 200 之间")
	public String getTechDeptVicePresidentOpinion() {
		return techDeptVicePresidentOpinion;
	}

	public void setTechDeptVicePresidentOpinion(String techDeptVicePresidentOpinion) {
		this.techDeptVicePresidentOpinion = techDeptVicePresidentOpinion;
	}
	
	@Length(min=0, max=200, message="商务经理意见长度必须介于 0 和 200 之间")
	public String getBusinessManagerOpinion() {
		return businessManagerOpinion;
	}

	public void setBusinessManagerOpinion(String businessManagerOpinion) {
		this.businessManagerOpinion = businessManagerOpinion;
	}
	
	@Length(min=0, max=200, message="商务部副总意见长度必须介于 0 和 200 之间")
	public String getBusinessDeptVicePresidentOpinion() {
		return businessDeptVicePresidentOpinion;
	}

	public void setBusinessDeptVicePresidentOpinion(String businessDeptVicePresidentOpinion) {
		this.businessDeptVicePresidentOpinion = businessDeptVicePresidentOpinion;
	}
	
	@Length(min=0, max=200, message="财务部副总意见长度必须介于 0 和 200 之间")
	public String getFinanceDeptVicePresidentOpinion() {
		return financeDeptVicePresidentOpinion;
	}

	public void setFinanceDeptVicePresidentOpinion(String financeDeptVicePresidentOpinion) {
		this.financeDeptVicePresidentOpinion = financeDeptVicePresidentOpinion;
	}

	public OaContractPurchaseStage getOaContractPurchaseStage() {
		return oaContractPurchaseStage;
	}

	public void setOaContractPurchaseStage(OaContractPurchaseStage oaContractPurchaseStage) {
		this.oaContractPurchaseStage = oaContractPurchaseStage;
	}

	public Double getPayMoney() {
		return payMoney;
	}

	public void setPayMoney(Double payMoney) {
		this.payMoney = payMoney;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}
	
}