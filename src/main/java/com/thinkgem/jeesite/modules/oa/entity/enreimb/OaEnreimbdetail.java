/**
 * Copyright &copy; 2012-2025 <a href="https://www.chuyutech.com">JeeCY</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.entity.enreimb;

import org.hibernate.validator.constraints.Length;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import javax.validation.constraints.NotNull;

import com.thinkgem.jeesite.common.persistence.DataEntity;
import com.thinkgem.jeesite.common.utils.excel.annotation.ExcelField;
/**
 * 招待费报销申请从表Entity
 * @author niting
 * @version 2017-04-28
 */
public class OaEnreimbdetail extends DataEntity<OaEnreimbdetail> {
	
	private static final long serialVersionUID = 1L;
	private String oaEnrId;		// oa_enReimb表id
	private Date date;		// 消费日期
	private String currentunit;		// 往来单位
	private String reason;		// 洽谈事由及项目名称
	private String meals;		// 餐费
	private String alcoholtobacco;		// 烟酒费
	private String numOur;		// 我们公司的人数
	private String numCustomers;		// 客户人数
	private String ispriorapproval;		// 是否在事前报批
	
	public OaEnreimbdetail() {
		super();
	}

	public OaEnreimbdetail(String id){
		super(id);
	}

	@Length(min=0, max=100, message="oa_enReimb表id长度必须介于 0 和 100 之间")
			
	@ExcelField(title="oa_enReimb表id", align=2, sort=1)
	
	public String getOaEnrId() {
		return oaEnrId;
	}

	public void setOaEnrId(String oaEnrId) {
		this.oaEnrId = oaEnrId;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	@NotNull(message="消费日期不能为空")
			
	@ExcelField(title="消费日期", align=2, sort=8)
	
	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}
	
	@Length(min=1, max=100, message="往来单位长度必须介于 1 和 100 之间")
			
	@ExcelField(title="往来单位", align=2, sort=9)
	
	public String getCurrentunit() {
		return currentunit;
	}

	public void setCurrentunit(String currentunit) {
		this.currentunit = currentunit;
	}
	
	@Length(min=1, max=100, message="洽谈事由及项目名称长度必须介于 1 和 100 之间")
			
	@ExcelField(title="洽谈事由及项目名称", align=2, sort=10)
	
	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}
	
			
	@ExcelField(title="餐费", align=2, sort=11)
	
	public String getMeals() {
		return meals;
	}

	public void setMeals(String meals) {
		this.meals = meals;
	}
	
			
	@ExcelField(title="烟酒费", align=2, sort=12)
	
	public String getAlcoholtobacco() {
		return alcoholtobacco;
	}

	public void setAlcoholtobacco(String alcoholtobacco) {
		this.alcoholtobacco = alcoholtobacco;
	}
	
	@Length(min=1, max=10, message="我们公司的人数长度必须介于 1 和 10 之间")
			
	@ExcelField(title="我们公司的人数", align=2, sort=13)
	
	public String getNumOur() {
		return numOur;
	}

	public void setNumOur(String numOur) {
		this.numOur = numOur;
	}
	
	@Length(min=0, max=10, message="客户人数长度必须介于 0 和 10 之间")
			
	@ExcelField(title="客户人数", align=2, sort=14)
	
	public String getNumCustomers() {
		return numCustomers;
	}

	public void setNumCustomers(String numCustomers) {
		this.numCustomers = numCustomers;
	}
	
	@Length(min=0, max=10, message="是否在事前报批长度必须介于 0 和 10 之间")
			
	@ExcelField(title="是否在事前报批", align=2, sort=15)
	
	public String getIspriorapproval() {
		return ispriorapproval;
	}

	public void setIspriorapproval(String ispriorapproval) {
		this.ispriorapproval = ispriorapproval;
	}
	
}