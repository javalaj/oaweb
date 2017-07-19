/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.entity.loan;

import org.hibernate.validator.constraints.Length;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;

import com.thinkgem.jeesite.common.persistence.DataEntity;
import com.thinkgem.jeesite.modules.sys.entity.User;

/**
 * 借支单管理Entity
 * @author 李廷龙
 * @version 2017-01-16
 */
public class OaLoanMain extends DataEntity<OaLoanMain> {
	
	private static final long serialVersionUID = 1L;
	private String loanType;		// 借支单类型
	private String loanStatus;		// 借支单状态
	private User loanUser;		// 借支人
	private String loanNo;		// 借支单号
	private Date approvalTime;		// 申请日期
	private Double loanMoney;		// 借支金额
	private Date loanTime;		// 借支日期
	private Date writeOffTime;		// 销账日期
	
	/**
	 * 日常借支
	 */
	public static final String loanType_0="0";
	
	/**
	 * 专项借支
	 */
	public static final String loanType_1="1";
	
	/**
	 * 未销账
	 */
	public static final String loanStatus_0="0";
	
	/**
	 * 已销账
	 */
	public static final String loanStatus_1="1";
	
	public OaLoanMain() {
		super();
	}

	public OaLoanMain(String id){
		super(id);
	}

	@Length(min=0, max=1, message="借支单类型长度必须介于 0 和 1 之间")
	public String getLoanType() {
		return loanType;
	}

	public void setLoanType(String loanType) {
		this.loanType = loanType;
	}
	
	@Length(min=0, max=1, message="借支单状态长度必须介于 0 和 1 之间")
	public String getLoanStatus() {
		return loanStatus;
	}

	public void setLoanStatus(String loanStatus) {
		this.loanStatus = loanStatus;
	}
	
	public User getLoanUser() {
		return loanUser;
	}

	public void setLoanUser(User loanUser) {
		this.loanUser = loanUser;
	}
	
	@Length(min=0, max=64, message="借支单号长度必须介于 0 和 64 之间")
	public String getLoanNo() {
		return loanNo;
	}

	public void setLoanNo(String loanNo) {
		this.loanNo = loanNo;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getApprovalTime() {
		return approvalTime;
	}

	public void setApprovalTime(Date approvalTime) {
		this.approvalTime = approvalTime;
	}
	
	public Double getLoanMoney() {
		return loanMoney;
	}

	public void setLoanMoney(Double loanMoney) {
		this.loanMoney = loanMoney;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getLoanTime() {
		return loanTime;
	}

	public void setLoanTime(Date loanTime) {
		this.loanTime = loanTime;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getWriteOffTime() {
		return writeOffTime;
	}

	public void setWriteOffTime(Date writeOffTime) {
		this.writeOffTime = writeOffTime;
	}
	
}