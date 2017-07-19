/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.entity.computersubsidy;

import org.hibernate.validator.constraints.Length;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;

import com.thinkgem.jeesite.common.persistence.DataEntity;
import com.thinkgem.jeesite.modules.act.entity.Act;

/**
 * 电脑补贴申请Entity
 * @author zf
 * @version 2016-12-01
 */
public class ComputerSubsidy extends DataEntity<ComputerSubsidy> {
	
	private static final long serialVersionUID = 1L;
	private String proposer;		// 姓名
	private Date entryTime;		// 入职日期
	private Date formalTime;		// 转正日期
	private Date purchaseTime;		// 购买电脑日期
	private Date applyTime;		// 申请补贴日期
	private String computerConfigure;		// 电脑配置
	private String personnelSignature;		// 人事行政部签字
	private String deputyManagerSignature;		// 人事行政部副总签字
	private String invoiceDuplicate;		// 发票扫描件
	private String dept;		// 部门
	private String procInsId;		// 流程相关id
	
	private String title;
	
	private Act act;
	
	public ComputerSubsidy() {
		super();
	}

	public ComputerSubsidy(String id){
		super(id);
	}

	@Length(min=0, max=10, message="姓名长度必须介于 0 和 10 之间")
	public String getProposer() {
		return proposer;
	}

	public void setProposer(String proposer) {
		this.proposer = proposer;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getEntryTime() {
		return entryTime;
	}

	public void setEntryTime(Date entryTime) {
		this.entryTime = entryTime;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getFormalTime() {
		return formalTime;
	}

	public void setFormalTime(Date formalTime) {
		this.formalTime = formalTime;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getPurchaseTime() {
		return purchaseTime;
	}

	public void setPurchaseTime(Date purchaseTime) {
		this.purchaseTime = purchaseTime;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getApplyTime() {
		return applyTime;
	}

	public void setApplyTime(Date applyTime) {
		this.applyTime = applyTime;
	}
	
	@Length(min=0, max=50, message="电脑配置长度必须介于 0 和 50 之间")
	public String getComputerConfigure() {
		return computerConfigure;
	}

	public void setComputerConfigure(String computerConfigure) {
		this.computerConfigure = computerConfigure;
	}
	
	@Length(min=0, max=10, message="人事行政部签字长度必须介于 0 和 10 之间")
	public String getPersonnelSignature() {
		return personnelSignature;
	}

	public void setPersonnelSignature(String personnelSignature) {
		this.personnelSignature = personnelSignature;
	}
	
	@Length(min=0, max=10, message="人事行政部副总签字长度必须介于 0 和 10 之间")
	public String getDeputyManagerSignature() {
		return deputyManagerSignature;
	}

	public void setDeputyManagerSignature(String deputyManagerSignature) {
		this.deputyManagerSignature = deputyManagerSignature;
	}
	
	@Length(min=0, max=255, message="发票扫描件长度必须介于 0 和 255 之间")
	public String getInvoiceDuplicate() {
		return invoiceDuplicate;
	}

	public void setInvoiceDuplicate(String invoiceDuplicate) {
		this.invoiceDuplicate = invoiceDuplicate;
	}
	
	@Length(min=0, max=10, message="部门长度必须介于 0 和 10 之间")
	public String getDept() {
		return dept;
	}

	public void setDept(String dept) {
		this.dept = dept;
	}
	
	@Length(min=0, max=255, message="流程相关id长度必须介于 0 和 255 之间")
	public String getProcInsId() {
		return procInsId;
	}

	public void setProcInsId(String procInsId) {
		this.procInsId = procInsId;
	}

	public Act getAct() {
		return act;
	}

	public void setAct(Act act) {
		this.act = act;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}
	
}