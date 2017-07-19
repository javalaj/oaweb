/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 供应商管理Entity
 * @author niting
 * @version 2016-11-07
 */
public class Supmanagement extends DataEntity<Supmanagement> {
	
	private static final long serialVersionUID = 1L;
	private String orgCode;		// 组织机构代码
	private String supName;		// 供应商名称
	private String telephone;		// 单位号码
	private String taxNumber;		// 税务登记号
	private String address;		// 单位联系地址
	private String suppliercontact; //供应商联系人
	
	public Supmanagement() {
		super();
	}

	public Supmanagement(String id){
		super(id);
	}

	public String getSuppliercontact() {
		return suppliercontact;
	}

	public void setSuppliercontact(String suppliercontact) {
		this.suppliercontact = suppliercontact;
	}

	@Length(min=1, max=64, message="组织机构代码长度必须介于 1 和 64 之间")
	public String getOrgCode() {
		return orgCode;
	}

	public void setOrgCode(String orgCode) {
		this.orgCode = orgCode;
	}
	
	@Length(min=1, max=100, message="供应商名称长度必须介于 1 和 100 之间")
	public String getSupName() {
		return supName;
	}

	public void setSupName(String supName) {
		this.supName = supName;
	}
	
	@Length(min=1, max=64, message="单位号码长度必须介于 1 和 64 之间")
	public String getTelephone() {
		return telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}
	
	@Length(min=1, max=64, message="税务登记号长度必须介于 1 和 64 之间")
	public String getTaxNumber() {
		return taxNumber;
	}

	public void setTaxNumber(String taxNumber) {
		this.taxNumber = taxNumber;
	}
	
	@Length(min=1, max=100, message="单位联系地址长度必须介于 1 和 100 之间")
	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}
	
}