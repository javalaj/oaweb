/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.entity.assetsturnover;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 资产交接Entity
 * @author zf
 * @version 2017-01-18
 */
public class AssetsTurnOver extends DataEntity<AssetsTurnOver> {
	
	private static final long serialVersionUID = 1L;
	private String assetsName;		// 资产名称
	private String number;		// 数量
	private String staffTurnoverId;		// 人员异动id
	
	public AssetsTurnOver() {
		super();
	}

	public AssetsTurnOver(String id){
		super(id);
	}

	@Length(min=0, max=10, message="资产名称长度必须介于 0 和 10 之间")
	public String getAssetsName() {
		return assetsName;
	}

	public void setAssetsName(String assetsName) {
		this.assetsName = assetsName;
	}
	
	@Length(min=0, max=5, message="数量长度必须介于 0 和 5 之间")
	public String getNumber() {
		return number;
	}

	public void setNumber(String number) {
		this.number = number;
	}
	
	@Length(min=0, max=64, message="人员异动id长度必须介于 0 和 64 之间")
	public String getStaffTurnoverId() {
		return staffTurnoverId;
	}

	public void setStaffTurnoverId(String staffTurnoverId) {
		this.staffTurnoverId = staffTurnoverId;
	}
	
}