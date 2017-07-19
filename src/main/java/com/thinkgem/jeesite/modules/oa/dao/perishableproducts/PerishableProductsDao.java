/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.dao.perishableproducts;

import java.util.List;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.oa.entity.perishableproducts.PerishableProducts;

/**
 * 易耗品增删改查DAO接口
 * @author zf
 * @version 2016-11-10
 */
@MyBatisDao
public interface PerishableProductsDao extends CrudDao<PerishableProducts> 
{
	/**
	 * 查找领用物品
	 * @param ids
	 * @return
	 */
	public List<PerishableProducts> findOutstockList(List<String> ids);
	
	/**
	 * 查询商品名称
	 */
	public String findBrand(String value);
	
	/**
	 * 查询商品单位
	 * @param value
	 * @return
	 */
	public String findUnit(String value);
	
	/**
	 * 查询序列号出现次数
	 * @param serialNumber
	 * @return
	 */
	public Integer countSerialNumber(String serialNumber);
	
	public String findCategory(String value);
}