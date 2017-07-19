/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.entity.fixedassets;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 固定资产物品栏Entity
 * @author zf
 * @version 2016-11-28
 */
public class AssetsInventory extends DataEntity<AssetsInventory> {
	
	private static final long serialVersionUID = 1L;
	private String userid;		// 用户编号
	private FixedAssets fixedAssets;		// 资产编号
	
	private String equId;	//设备表主键
	
	public AssetsInventory() {
		super();
	}

	public AssetsInventory(String id){
		super(id);
	}

	@Length(min=0, max=255, message="用户编号长度必须介于 0 和 255 之间")
	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public FixedAssets getFixedAssets() {
		return fixedAssets;
	}

	public void setFixedAssets(FixedAssets fixedAssets) {
		this.fixedAssets = fixedAssets;
	}

	public String getEquId() {
		return equId;
	}

	public void setEquId(String equId) {
		this.equId = equId;
	}

}