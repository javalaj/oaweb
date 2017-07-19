/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.entity.fixedassets;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 固定资产申请Entity
 * @author zf
 * @version 2016-11-20
 */
public class FixedAssetsApply extends DataEntity<FixedAssetsApply> {
	
	private static final long serialVersionUID = 1L;
	private String fixedId;		// 资产表id
	private Integer account;		// 资产数量
	private String applyCondition;		// 状态
	private String serialNumber;		// 单据编号
	
	private String equId;		//设备id
	
	public FixedAssetsApply() {
		super();
	}

	public FixedAssetsApply(String id){
		super(id);
	}

	@Length(min=0, max=255, message="资产表id长度必须介于 0 和 255 之间")
	public String getFixedId() {
		return fixedId;
	}

	public void setFixedId(String fixedId) {
		this.fixedId = fixedId;
	}
	
	public Integer getAccount() {
		return account;
	}

	public void setAccount(Integer account) {
		this.account = account;
	}
	
	@Length(min=0, max=255, message="状态长度必须介于 0 和 255 之间")
	public String getApplyCondition() {
		return applyCondition;
	}

	public void setApplyCondition(String applyCondition) {
		this.applyCondition = applyCondition;
	}
	
	@Length(min=0, max=255, message="单据编号长度必须介于 0 和 255 之间")
	public String getSerialNumber() {
		return serialNumber;
	}

	public void setSerialNumber(String serialNumber) {
		this.serialNumber = serialNumber;
	}

	public String getEquId() {
		return equId;
	}

	public void setEquId(String equId) {
		this.equId = equId;
	}
	
}