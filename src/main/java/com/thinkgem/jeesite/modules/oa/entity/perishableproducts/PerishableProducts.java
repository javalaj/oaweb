/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.entity.perishableproducts;

import org.hibernate.validator.constraints.Length;
import java.util.Date;
import java.util.List;

import com.thinkgem.jeesite.common.persistence.DataEntity;
import com.thinkgem.jeesite.common.utils.excel.annotation.ExcelField;

/**
 * 易耗品增删改查Entity
 * @author zf
 * @version 2016-11-11
 */
public class PerishableProducts extends DataEntity<PerishableProducts> {
	
	private static final long serialVersionUID = 1L;
	private String serialNumber;		// 用品编号
	private String itemName;		// 用品名称
	private String itemCategory;		// 用品类别
	private Integer amount;		// 库存数量
	private Double unitPrice;		// 单价(元)
	private String model;		// 型号
	private String specifications;		// 规格
	private String supplier;		// 供应商
	private String brand;		// 品牌
	private String photo;		// 图片
	private String total;		// 合计
	private Date beginCreateDate;		// 开始 创建时间
	private Date endCreateDate;		// 结束 创建时间
	private Date beginUpdateDate;		// 开始 更新时间
	private Date endUpdateDate;		// 结束 更新时间
	private String unit;			//单位
	
	private List<String> ids;
	
	private String ides;
	
	public PerishableProducts() {
		super();
	}

	public PerishableProducts(String id){
		super(id);
	}

	@Length(min=0, max=255, message="用品编号长度必须介于 0 和 255 之间")
	@ExcelField(title = "用品编号", align = 1, sort = 1)
	public String getSerialNumber() {
		return serialNumber;
	}

	public void setSerialNumber(String serialNumber) {
		this.serialNumber = serialNumber;
	}
	
	@Length(min=0, max=255, message="用品名称长度必须介于 0 和 255 之间")
	@ExcelField(title = "用品名称", align = 1, sort = 2)
	public String getItemName() {
		return itemName;
	}

	public void setItemName(String itemName) {
		this.itemName = itemName;
	}
	
	@Length(min=0, max=255, message="用品类别长度必须介于 0 和 255 之间")
	@ExcelField(title = "用品类别", align = 1, sort = 3)
	public String getItemCategory() {
		return itemCategory;
	}

	public void setItemCategory(String itemCategory) {
		this.itemCategory = itemCategory;
	}
	
	@ExcelField(title = "库存数量", align = 1, sort = 4)
	public Integer getAmount() {
		return amount;
	}

	public void setAmount(Integer amount) {
		this.amount = amount;
	}
	
	@ExcelField(title = "单价(元)", align = 1, sort = 5)
	public Double getUnitPrice() {
		return unitPrice;
	}

	public void setUnitPrice(Double unitPrice) {
		this.unitPrice = unitPrice;
	}
	
	@Length(min=0, max=255, message="型号长度必须介于 0 和 255 之间")
	public String getModel() {
		return model;
	}

	public void setModel(String model) {
		this.model = model;
	}
	
	@Length(min=0, max=255, message="规格长度必须介于 0 和 255 之间")
	public String getSpecifications() {
		return specifications;
	}

	public void setSpecifications(String specifications) {
		this.specifications = specifications;
	}
	
	@Length(min=0, max=255, message="供应商长度必须介于 0 和 255 之间")
	@ExcelField(title = "供应商", align = 1, sort = 7)
	public String getSupplier() {
		return supplier;
	}

	public void setSupplier(String supplier) {
		this.supplier = supplier;
	}
	
	@Length(min=0, max=255, message="品牌长度必须介于 0 和 255 之间")
	@ExcelField(title = "品牌", align = 1, sort = 8)
	public String getBrand() {
		return brand;
	}

	public void setBrand(String brand) {
		this.brand = brand;
	}
	
	@Length(min=0, max=1000, message="图片长度必须介于 0 和 1000 之间")
	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}
	
	public String getTotal() {
		return total;
	}

	public void setTotal(String total) {
		this.total = total;
	}
	
	public Date getBeginCreateDate() {
		return beginCreateDate;
	}

	public void setBeginCreateDate(Date beginCreateDate) {
		this.beginCreateDate = beginCreateDate;
	}
	
	public Date getEndCreateDate() {
		return endCreateDate;
	}

	public void setEndCreateDate(Date endCreateDate) {
		this.endCreateDate = endCreateDate;
	}
		
	public Date getBeginUpdateDate() {
		return beginUpdateDate;
	}

	public void setBeginUpdateDate(Date beginUpdateDate) {
		this.beginUpdateDate = beginUpdateDate;
	}
	
	public Date getEndUpdateDate() {
		return endUpdateDate;
	}

	public void setEndUpdateDate(Date endUpdateDate) {
		this.endUpdateDate = endUpdateDate;
	}

	public List<String> getIds() {
		return ids;
	}

	public void setIds(List<String> ids) {
		this.ids = ids;
	}

	@ExcelField(title = "单位", align = 1, sort = 6)
	public String getUnit() {
		return unit;
	}

	public void setUnit(String unit) {
		this.unit = unit;
	}

	public String getIdes() {
		return ides;
	}

	public void setIdes(String ides) {
		this.ides = ides;
	}

}