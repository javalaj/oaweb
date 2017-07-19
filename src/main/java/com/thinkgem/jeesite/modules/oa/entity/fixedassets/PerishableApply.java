/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.entity.fixedassets;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;
import com.thinkgem.jeesite.modules.oa.entity.perishableproducts.PerishableProducts;

/**
 * 低值易耗品申请Entity
 * @author 低值易耗品申请
 * @version 2016-12-02
 */
public class PerishableApply extends DataEntity<PerishableApply> {
	
	private static final long serialVersionUID = 1L;
	private String serialId;		// 易耗品序列主键
	private PerishableProducts perishable;		// 易耗品对象
	private Integer amount;		// 领用数量
	
	public PerishableApply() {
		super();
	}

	public PerishableApply(String id){
		super(id);
	}

	@Length(min=0, max=255, message="易耗品序列主键长度必须介于 0 和 255 之间")
	public String getSerialId() {
		return serialId;
	}

	public void setSerialId(String serialId) {
		this.serialId = serialId;
	}
	
	@Length(min=0, max=11, message="领用数量长度必须介于 0 和 11 之间")
	public Integer getAmount() {
		return amount;
	}

	public void setAmount(Integer amount) {
		this.amount = amount;
	}

	public PerishableProducts getPerishable() {
		return perishable;
	}

	public void setPerishable(PerishableProducts perishable) {
		this.perishable = perishable;
	}
	
}