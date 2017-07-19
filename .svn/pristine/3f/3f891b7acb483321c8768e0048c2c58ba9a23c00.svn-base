/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.entity.fixedassets;

import org.hibernate.validator.constraints.Length;
import java.util.Date;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonFormat;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 固定资产管理Entity
 * @author zf
 * @version 2016-11-17
 */
public class FixedAssets extends DataEntity<FixedAssets> {
	
	private static final long serialVersionUID = 1L;
	private String assetsName;		// 资产名称
	private String assetsCategory;		// 资产类别
	private String serialNumber;		// 资产编号
	private String brand;		// 品牌
	private String model;		// 型号
	private Integer amount;		// 数量
	private String specifications;		// 规格
	private Double unitPrice;		// 单价
	private String supplier;		// 供应商
	private String unit;		// 单位
	private String photo;		// 图片
	private Date purchaseDate;		// 采购时间
	
	private List<String> ids;		//主键集合
	
	public FixedAssets() {
		super();
	}

	public FixedAssets(String id){
		super(id);
	}

	@Length(min=0, max=255, message="资产名称长度必须介于 0 和 255 之间")
	public String getAssetsName() {
		return assetsName;
	}

	public void setAssetsName(String assetsName) {
		this.assetsName = assetsName;
	}
	
	@Length(min=0, max=255, message="资产类别长度必须介于 0 和 255 之间")
	public String getAssetsCategory() {
		return assetsCategory;
	}

	public void setAssetsCategory(String assetsCategory) {
		this.assetsCategory = assetsCategory;
	}
	
	@Length(min=0, max=255, message="资产编号长度必须介于 0 和 255 之间")
	public String getSerialNumber() {
		return serialNumber;
	}

	public void setSerialNumber(String serialNumber) {
		this.serialNumber = serialNumber;
	}
	
	@Length(min=0, max=255, message="品牌长度必须介于 0 和 255 之间")
	public String getBrand() {
		return brand;
	}

	public void setBrand(String brand) {
		this.brand = brand;
	}
	
	@Length(min=0, max=255, message="型号长度必须介于 0 和 255 之间")
	public String getModel() {
		return model;
	}

	public void setModel(String model) {
		this.model = model;
	}
	
	public Integer getAmount() {
		return amount;
	}

	public void setAmount(Integer amount) {
		this.amount = amount;
	}
	
	@Length(min=0, max=255, message="规格长度必须介于 0 和 255 之间")
	public String getSpecifications() {
		return specifications;
	}

	public void setSpecifications(String specifications) {
		this.specifications = specifications;
	}
	
	public Double getUnitPrice() {
		return unitPrice;
	}

	public void setUnitPrice(Double unitPrice) {
		this.unitPrice = unitPrice;
	}
	
	@Length(min=0, max=255, message="供应商长度必须介于 0 和 255 之间")
	public String getSupplier() {
		return supplier;
	}

	public void setSupplier(String supplier) {
		this.supplier = supplier;
	}
	
	@Length(min=0, max=255, message="单位长度必须介于 0 和 255 之间")
	public String getUnit() {
		return unit;
	}

	public void setUnit(String unit) {
		this.unit = unit;
	}
	
	@Length(min=0, max=255, message="图片长度必须介于 0 和 255 之间")
	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getPurchaseDate() {
		return purchaseDate;
	}

	public void setPurchaseDate(Date purchaseDate) {
		this.purchaseDate = purchaseDate;
	}

	public List<String> getIds() {
		return ids;
	}

	public void setIds(List<String> ids) {
		this.ids = ids;
	}
	
}