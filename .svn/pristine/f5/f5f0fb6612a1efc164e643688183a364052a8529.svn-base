/**
 * Copyright &copy; 2012-2025 <a href="https://www.chuyutech.com">JeeCY</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.entity.salarybillsend;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;
import com.thinkgem.jeesite.common.utils.excel.annotation.ExcelField;
/**
 * 工资条发送详情Entity
 * @author zf
 * @version 2017-05-08
 */
public class OaSalaryDetails extends DataEntity<OaSalaryDetails> {
	
	private static final long serialVersionUID = 1L;
	private String user;		// 发送用户id
	private String billId;		// oa_salary_bill主键
	private String sendFlag;		// 发送标记（0。成功1。失败）
	
	public OaSalaryDetails() {
		super();
	}

	public OaSalaryDetails(String id){
		super(id);
	}

			
	//@ExcelField(title="发送用户id", fieldType=User.class, value="user.name", align=2, sort=1)
	
	public String getUser() {
		return user;
	}

	public void setUser(String user) {
		this.user = user;
	}
	
	@Length(min=0, max=64, message="oa_salary_bill主键长度必须介于 0 和 64 之间")
			
	@ExcelField(title="oa_salary_bill主键", align=2, sort=2)
	
	public String getBillId() {
		return billId;
	}

	public void setBillId(String billId) {
		this.billId = billId;
	}
	
	@Length(min=0, max=1, message="发送标记（0。成功1。失败）长度必须介于 0 和 1 之间")
			
	@ExcelField(title="发送标记（0。成功1。失败）", align=2, sort=3)
	
	public String getSendFlag() {
		return sendFlag;
	}

	public void setSendFlag(String sendFlag) {
		this.sendFlag = sendFlag;
	}
	
}