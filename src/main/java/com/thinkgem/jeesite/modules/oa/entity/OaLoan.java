/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.modules.sys.entity.Office;
import com.thinkgem.jeesite.common.persistence.ActEntity;


/**
 * 借支Entity
 * @author liaijun
 * @version 2016-11-21
 */
public class OaLoan extends ActEntity<OaLoan> {
	
	private static final long serialVersionUID = 1L;
	private String procInsId;		// 流程实例ID
	private User user;		// 项目经理
	private Office office;		// 归属部门
	private String money;		// 借款金额(大写)
	private String recordId;		// 借支记录id
	private String reason;		// 借款原由
	private String isbuy;		// 是否用于采购:0,是;1,不是
	private String files;		// 附件
	private String uppertext;		// 直属领导意见
	private String protext;		// 项目经理意见
	private String fincinaltext;		// 财务部副总意见
	private String managertext;		// 总经理审批意见
	private String accounttext;		// 会计审核意见
	private String paytext;		// 出纳付款确认
	
	public OaLoan() {
		super();
	}

	public OaLoan(String id){
		super(id);
	}

	@Length(min=0, max=64, message="流程实例ID长度必须介于 0 和 64 之间")
	public String getProcInsId() {
		return procInsId;
	}

	public void setProcInsId(String procInsId) {
		this.procInsId = procInsId;
	}
	
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	
	public Office getOffice() {
		return office;
	}

	public void setOffice(Office office) {
		this.office = office;
	}
	
	@Length(min=0, max=255, message="借款金额(大写)长度必须介于 0 和 255 之间")
	public String getMoney() {
		return money;
	}

	public void setMoney(String money) {
		this.money = money;
	}
	
	@Length(min=0, max=64, message="借支记录id长度必须介于 0 和 64 之间")
	public String getRecordId() {
		return recordId;
	}

	public void setRecordId(String recordId) {
		this.recordId = recordId;
	}
	
	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}
	
	@Length(min=0, max=1, message="是否用于采购:0,是;1,不是长度必须介于 0 和 1 之间")
	public String getIsbuy() {
		return isbuy;
	}

	public void setIsbuy(String isbuy) {
		this.isbuy = isbuy;
	}
	
	@Length(min=0, max=255, message="附件长度必须介于 0 和 255 之间")
	public String getFiles() {
		return files;
	}

	public void setFiles(String files) {
		this.files = files;
	}
	
	@Length(min=0, max=255, message="直属领导意见长度必须介于 0 和 255 之间")
	public String getUppertext() {
		return uppertext;
	}

	public void setUppertext(String uppertext) {
		this.uppertext = uppertext;
	}
	
	@Length(min=0, max=255, message="项目经理意见长度必须介于 0 和 255 之间")
	public String getProtext() {
		return protext;
	}

	public void setProtext(String protext) {
		this.protext = protext;
	}
	
	@Length(min=0, max=255, message="财务部副总意见长度必须介于 0 和 255 之间")
	public String getFincinaltext() {
		return fincinaltext;
	}

	public void setFincinaltext(String fincinaltext) {
		this.fincinaltext = fincinaltext;
	}
	
	@Length(min=0, max=255, message="总经理审批意见长度必须介于 0 和 255 之间")
	public String getManagertext() {
		return managertext;
	}

	public void setManagertext(String managertext) {
		this.managertext = managertext;
	}
	
	@Length(min=0, max=255, message="会计审核意见长度必须介于 0 和 255 之间")
	public String getAccounttext() {
		return accounttext;
	}

	public void setAccounttext(String accounttext) {
		this.accounttext = accounttext;
	}
	
	@Length(min=0, max=255, message="出纳付款确认长度必须介于 0 和 255 之间")
	public String getPaytext() {
		return paytext;
	}

	public void setPaytext(String paytext) {
		this.paytext = paytext;
	}
	
}