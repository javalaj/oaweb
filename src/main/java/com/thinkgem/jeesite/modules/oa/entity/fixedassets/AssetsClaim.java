/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.entity.fixedassets;

import org.hibernate.validator.constraints.Length;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 资产认领Entity
 * @author zf
 * @version 2016-11-24
 */
public class AssetsClaim extends DataEntity<AssetsClaim> {
	
	private static final long serialVersionUID = 1L;
	private FixedAssets fixedAssets;		// 资产名称 父类
	private String claimant;		// 领用人
	private Date claimTime;		// 领用时间
	private String claimNumber;		// 设备编号
	private String operator;		// 经办人
	private String type;		// 申请类型
	private String phone;		// 电话
	private String address;		// 地址
	
	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public AssetsClaim() {
		super();
	}

	public AssetsClaim(String id){
		super(id);
	}

	public AssetsClaim(FixedAssets fixedAssets){
		this.fixedAssets = fixedAssets;
	}

	@Length(min=0, max=255, message="资产名称长度必须介于 0 和 255 之间")
	public FixedAssets getFixedAssets() {
		return fixedAssets;
	}

	public void setFixedAssets(FixedAssets fixedAssets) {
		this.fixedAssets = fixedAssets;
	}
	
	@Length(min=0, max=255, message="领用人长度必须介于 0 和 255 之间")
	public String getClaimant() {
		return claimant;
	}

	public void setClaimant(String claimant) {
		this.claimant = claimant;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getClaimTime() {
		return claimTime;
	}

	public void setClaimTime(Date claimTime) {
		this.claimTime = claimTime;
	}
	
	@Length(min=0, max=255, message="领用编号长度必须介于 0 和 255 之间")
	public String getClaimNumber() {
		return claimNumber;
	}

	public void setClaimNumber(String claimNumber) {
		this.claimNumber = claimNumber;
	}
	
	@Length(min=0, max=255, message="经办人长度必须介于 0 和 255 之间")
	public String getOperator() {
		return operator;
	}

	public void setOperator(String operator) {
		this.operator = operator;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}
	
}