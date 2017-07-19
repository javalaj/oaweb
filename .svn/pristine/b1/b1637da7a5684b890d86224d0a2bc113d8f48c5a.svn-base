/**
 * Copyright &copy; 2012-2025 <a href="https://www.chuyutech.com">JeeCY</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.entity.salarybillsend;

import org.hibernate.validator.constraints.Length;
import java.util.Date;
import java.util.List;

import com.thinkgem.jeesite.common.persistence.DataEntity;
import com.thinkgem.jeesite.common.utils.excel.annotation.ExcelField;
/**
 * 工资条发送Entity
 * @author zf
 * @version 2017-05-08
 */
public class OaSalaryBill extends DataEntity<OaSalaryBill> {
	
	private static final long serialVersionUID = 1L;
	private String salaryMonth;		// 工资月度
	private Integer successCount;		// 邮件发送成功的数目
	private Integer failCount;		// 邮件发送失败的数目
	private Date beginCreateDate;		// 开始 创建时间
	private Date endCreateDate;		// 结束 创建时间
	
	private List<OaSalaryDetails> detailList;  //详情列表
	
	public OaSalaryBill() {
		super();
	}

	public OaSalaryBill(String id){
		super(id);
	}

	@Length(min=0, max=255, message="工资月度长度必须介于 0 和 255 之间")
			
	@ExcelField(title="工资月度", align=2, sort=1)
	
	public String getSalaryMonth() {
		return salaryMonth;
	}

	public void setSalaryMonth(String salaryMonth) {
		this.salaryMonth = salaryMonth;
	}
	
			
	@ExcelField(title="邮件发送成功的数目", align=2, sort=2)
	
	public Integer getSuccessCount() {
		return successCount;
	}

	public void setSuccessCount(Integer successCount) {
		this.successCount = successCount;
	}
	
			
	@ExcelField(title="邮件发送失败的数目", align=2, sort=3)
	
	public Integer getFailCount() {
		return failCount;
	}

	public void setFailCount(Integer failCount) {
		this.failCount = failCount;
	}
	
	public Date getBeginCreateDate() {
		return beginCreateDate;
	}

	public void setBeginCreateDate(Date beginCreateDate) {
		this.beginCreateDate = beginCreateDate;
	}
	
	public Date getEndCreateDate() {
		return endCreateDate;
	}

	public void setEndCreateDate(Date endCreateDate) {
		this.endCreateDate = endCreateDate;
	}

	public List<OaSalaryDetails> getDetailList() {
		return detailList;
	}

	public void setDetailList(List<OaSalaryDetails> detailList) {
		this.detailList = detailList;
	}
		
}