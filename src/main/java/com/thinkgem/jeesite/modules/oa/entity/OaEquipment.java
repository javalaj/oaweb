/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.entity;

import org.hibernate.validator.constraints.Length;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import javax.validation.constraints.NotNull;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 固定资产管理Entity
 * @author liaijun
 * @version 2016-10-20
 */
public class OaEquipment extends DataEntity<OaEquipment> {
	
	private static final long serialVersionUID = 1L;
	private String ename;		// 固定资产名称
	private String type;		// 资产类别
	private String ebrand;		// 资产品牌
	private String model;		// 资产型号
	private String price;		// 资产价格
	private String specs;		// 资产规格
	private String count;		// 资产数目
	private Date indate;		// 采购日期
	private String state;		// 资产状态
	
	public OaEquipment() {
		super();
	}

	public OaEquipment(String id){
		super(id);
	}

	@Length(min=1, max=64, message="固定资产名称长度必须介于 1 和 64 之间")
	public String getEname() {
		return ename;
	}

	public void setEname(String ename) {
		this.ename = ename;
	}
	
	@Length(min=1, max=1, message="资产类别长度必须介于 1 和 1 之间")
	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}
	
	@Length(min=1, max=64, message="资产品牌长度必须介于 1 和 64 之间")
	public String getEbrand() {
		return ebrand;
	}

	public void setEbrand(String ebrand) {
		this.ebrand = ebrand;
	}
	
	
	public String getModel() {
		return model;
	}

	public void setModel(String model) {
		this.model = model;
	}
	
	@Length(min=1, max=100, message="资产价格长度必须介于 1 和 100 之间")
	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}
	
	@Length(min=1, max=1, message="资产规格长度必须介于 1 和 1 之间")
	public String getSpecs() {
		return specs;
	}

	public void setSpecs(String specs) {
		this.specs = specs;
	}
	
	@Length(min=1, max=100, message="资产数目长度必须介于 1 和 100 之间")
	public String getCount() {
		return count;
	}

	public void setCount(String count) {
		this.count = count;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd ")
	@NotNull(message="采购日期不能为空")
	public Date getIndate() {
		return indate;
	}

	public void setIndate(Date indate) {
		this.indate = indate;
	}
	
	@Length(min=1, max=1, message="资产状态长度必须介于 1 和 1 之间")
	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}
	
}