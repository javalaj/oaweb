/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.entity.fixedassets;

import java.util.Date;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 资产设备Entity
 * @author zf
 * @version 2016-11-26
 */
public class AssetsEquipment extends DataEntity<AssetsEquipment> {
	
	private static final long serialVersionUID = 1L;
	private String serialNumber;		// 设备编号
	private String assetsNumber;		// 资产编号
	private String condition;		// 资产状态
	private String equStaff;		// 人员
	private Date claimTime;		// 申请时间
	private Date scrapTime;		// 报废时间
	private FixedAssets fixedAssets;
	
	private String beginTime;		// 开始 日期
	
	private String endTime;			// 结束 日期

	private String scrapBeginTime;
	
	private String scrapEndTime;
	
	private String claimBeginTime;
	
	private String claimEndTime;
	
	public AssetsEquipment() {
		super();
	}

	public AssetsEquipment(String id){
		super(id);
	}

	@Length(min=0, max=255, message="设备编号长度必须介于 0 和 255 之间")
	public String getSerialNumber() {
		return serialNumber;
	}

	public void setSerialNumber(String serialNumber) {
		this.serialNumber = serialNumber;
	}
	
	@Length(min=0, max=255, message="资产编号长度必须介于 0 和 255 之间")
	public String getAssetsNumber() {
		return assetsNumber;
	}

	public void setAssetsNumber(String assetsNumber) {
		this.assetsNumber = assetsNumber;
	}
	
	@Length(min=0, max=255, message="资产状态长度必须介于 0 和 255 之间")
	public String getCondition() {
		return condition;
	}

	public void setCondition(String condition) {
		this.condition = condition;
	}

	public String getEquStaff() {
		return equStaff;
	}

	public void setEquStaff(String equStaff) {
		this.equStaff = equStaff;
	}

	public FixedAssets getFixedAssets() {
		return fixedAssets;
	}

	public void setFixedAssets(FixedAssets fixedAssets) {
		this.fixedAssets = fixedAssets;
	}

	public Date getClaimTime() {
		return claimTime;
	}

	public void setClaimTime(Date claimTime) {
		this.claimTime = claimTime;
	}

	public Date getScrapTime() {
		return scrapTime;
	}

	public void setScrapTime(Date scrapTime) {
		this.scrapTime = scrapTime;
	}

	public String getBeginTime() {
		return beginTime;
	}

	public void setBeginTime(String beginTime) {
		this.beginTime = beginTime;
	}

	public String getEndTime() {
		return endTime;
	}

	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}

	public String getScrapBeginTime() {
		return scrapBeginTime;
	}

	public void setScrapBeginTime(String scrapBeginTime) {
		this.scrapBeginTime = scrapBeginTime;
	}

	public String getScrapEndTime() {
		return scrapEndTime;
	}

	public void setScrapEndTime(String scrapEndTime) {
		this.scrapEndTime = scrapEndTime;
	}

	public String getClaimBeginTime() {
		return claimBeginTime;
	}

	public void setClaimBeginTime(String claimBeginTime) {
		this.claimBeginTime = claimBeginTime;
	}

	public String getClaimEndTime() {
		return claimEndTime;
	}

	public void setClaimEndTime(String claimEndTime) {
		this.claimEndTime = claimEndTime;
	}
	
	
}