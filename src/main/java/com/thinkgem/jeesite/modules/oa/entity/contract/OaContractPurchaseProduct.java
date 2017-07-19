/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.entity.contract;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 采购合同物品登记信息管理Entity
 * @author 李廷龙
 * @version 2016-12-27
 */
public class OaContractPurchaseProduct extends DataEntity<OaContractPurchaseProduct> {
	
	private static final long serialVersionUID = 1L;
	private OaContractPurchase contractPurchase;		// 商品归属的采购合同
	private String name;		// 名称
	private String productType;		// 品牌型号
	private String unit;		// 单位
	private Double num;		// 数量
	private Double price;		// 单价
	private Double totalPrice;		// 总额
	
	
	public OaContractPurchaseProduct() {
		super();
	}

	public OaContractPurchaseProduct(String id){
		super(id);
	}
	public OaContractPurchaseProduct(OaContractPurchase oaContractPurchase){
		this.contractPurchase=oaContractPurchase;
	}

	
	public OaContractPurchase getContractPurchase() {
		return contractPurchase;
	}

	public void setContractPurchase(OaContractPurchase contractPurchase) {
		this.contractPurchase = contractPurchase;
	}

	@Length(min=0, max=64, message="名称长度必须介于 0 和 64 之间")
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	@Length(min=0, max=64, message="品牌型号长度必须介于 0 和 64 之间")
	public String getProductType() {
		return productType;
	}

	public void setProductType(String productType) {
		this.productType = productType;
	}
	
	@Length(min=0, max=64, message="单位长度必须介于 0 和 64 之间")
	public String getUnit() {
		return unit;
	}

	public void setUnit(String unit) {
		this.unit = unit;
	}
	
	public Double getNum() {
		return num;
	}

	public void setNum(Double num) {
		this.num = num;
	}
	
	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	public Double getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(Double totalPrice) {
		this.totalPrice = totalPrice;
	}
	
}