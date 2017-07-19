/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.entity.loan;

import org.hibernate.validator.constraints.Length;
import com.thinkgem.jeesite.modules.sys.entity.User;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 借支还款管理Entity
 * @author 李廷龙
 * @version 2017-01-16
 */
public class OaLoanRepayment extends DataEntity<OaLoanRepayment> {
	
	private static final long serialVersionUID = 1L;
	private Double repaymentMoney;		// 金额
	private String repaymentType;		// 销账类型
	private OaLoanMain loanMain;		// 关联的借支单ID
	private User loanUser;		// 借支人
	private String billingNo;		// 报销单号
	private User dealUser;		// 经办人
	
	private Double hasRepaymentMoney;		// 已还款金额
	
	private Double notRepaymentMoney;		// 已还款金额
	
	private String currentUserId;
	
	public String getCurrentUserId() {
		return currentUserId;
	}

	public void setCurrentUserId(String currentUserId) {
		this.currentUserId = currentUserId;
	}

	public Double getHasRepaymentMoney() {
		return hasRepaymentMoney;
	}

	public void setHasRepaymentMoney(Double hasRepaymentMoney) {
		this.hasRepaymentMoney = hasRepaymentMoney;
	}

	public Double getNotRepaymentMoney() {
		return notRepaymentMoney;
	}

	public void setNotRepaymentMoney(Double notRepaymentMoney) {
		this.notRepaymentMoney = notRepaymentMoney;
	}

	public OaLoanRepayment() {
		super();
	}

	public OaLoanRepayment(String id){
		super(id);
	}

	public Double getRepaymentMoney() {
		return repaymentMoney;
	}

	public void setRepaymentMoney(Double repaymentMoney) {
		this.repaymentMoney = repaymentMoney;
	}
	
	@Length(min=0, max=1, message="销账类型长度必须介于 0 和 1 之间")
	public String getRepaymentType() {
		return repaymentType;
	}

	public void setRepaymentType(String repaymentType) {
		this.repaymentType = repaymentType;
	}
	
	public OaLoanMain getLoanMain() {
		return loanMain;
	}

	public void setLoanMain(OaLoanMain loanMain) {
		this.loanMain = loanMain;
	}
	
	public User getLoanUser() {
		return loanUser;
	}

	public void setLoanUser(User loanUser) {
		this.loanUser = loanUser;
	}
	
	@Length(min=0, max=64, message="报销单号长度必须介于 0 和 64 之间")
	public String getBillingNo() {
		return billingNo;
	}

	public void setBillingNo(String billingNo) {
		this.billingNo = billingNo;
	}
	
	public User getDealUser() {
		return dealUser;
	}

	public void setDealUser(User dealUser) {
		this.dealUser = dealUser;
	}
	
}