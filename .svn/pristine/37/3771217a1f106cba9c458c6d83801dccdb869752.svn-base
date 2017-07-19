/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.entity.fixedassets;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;
import com.thinkgem.jeesite.common.utils.excel.annotation.ExcelField;
import com.thinkgem.jeesite.modules.oa.entity.perishableproducts.PerishableProducts;

/**
 * 易耗品历史Entity
 * @author zf
 * @version 2016-12-09
 */
public class PerishableHistory extends DataEntity<PerishableHistory> {
	
	private static final long serialVersionUID = 1L;
	private PerishableProducts perishableProducts;		// 易耗品对象
	private String type;		// 统计标记(0:入库;1:出库)
	private Integer amount;		// 数量
	private Date beginCreateDate;		// 开始 创建时间
	private Date endCreateDate;		// 结束 创建时间
	
	private String  statisticsWordType;	// 用品统计字段类型
	
	public PerishableHistory() {
		super();
	}

	public PerishableHistory(String id){
		super(id);
	}

	
	@Length(min=0, max=5, message="统计标记(0:入库;1:出库)长度必须介于 0 和 5 之间")
	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}
	
	@ExcelField(title="统计周期", type=1, align=2, sort=1)
	public String getCycle()
	{
		SimpleDateFormat dateFormater = new SimpleDateFormat("yyyy-MM-dd");
		
		return dateFormater.format(beginCreateDate) + "--" + dateFormater.format(beginCreateDate);
	}
	
	@Length(min=0, max=255, message="数量长度必须介于 0 和 255 之间")
	@ExcelField(title="数量", align=2, sort=20)
	public Integer getAmount() {
		return amount;
	}

	public void setAmount(Integer amount) {
		this.amount = amount;
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

	public PerishableProducts getPerishableProducts() {
		return perishableProducts;
	}

	public void setPerishableProducts(PerishableProducts perishableProducts) {
		this.perishableProducts = perishableProducts;
	}

	public String getStatisticsWordType() {
		return statisticsWordType;
	}

	public void setStatisticsWordType(String statisticsWordType) {
		this.statisticsWordType = statisticsWordType;
	}
		
}