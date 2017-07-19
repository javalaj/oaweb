/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.service.perishableproducts;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.common.utils.PingYinUtil;
import com.thinkgem.jeesite.modules.oa.dao.perishableproducts.PerishableProductsDao;
import com.thinkgem.jeesite.modules.oa.entity.fixedassets.PerishableHistory;
import com.thinkgem.jeesite.modules.oa.entity.perishableproducts.PerishableProducts;
import com.thinkgem.jeesite.modules.oa.service.fixedassets.PerishableHistoryService;
import com.thinkgem.jeesite.modules.sys.utils.OrdersUtils;

/**
 * 易耗品增删改查Service
 * @author zf
 * @version 2016-11-10
 */
@Service
@Transactional(readOnly = true)
public class PerishableProductsService extends CrudService<PerishableProductsDao, PerishableProducts> {

	public PerishableProducts get(String id) {
		return super.get(id);
	}
	
	public List<PerishableProducts> findList(PerishableProducts perishableProducts) {
		return super.findList(perishableProducts);
	}
	
	public Page<PerishableProducts> findPage(Page<PerishableProducts> page, PerishableProducts perishableProducts) {
		return super.findPage(page, perishableProducts);
	}
	
	@Transactional(readOnly = false)
	public void saveForPerishable(PerishableProducts perishableProducts)
	{
		String category = getCategory(perishableProducts.getItemCategory());
		
		perishableProducts.setSerialNumber(OrdersUtils.getGenerateOrderNo8(category + "-"));
		
		PerishableHistory perishableHistory = new PerishableHistory();
		
		perishableHistory.setAmount(perishableProducts.getAmount());
		
		perishableHistory.setType("0");
		
		super.save(perishableProducts);
		
		perishableHistory.setPerishableProducts(perishableProducts);
		
		phs.save(perishableHistory);
	}
	
	@Transactional(readOnly = false)
	public void save(PerishableProducts perishableProducts) 
	{
		super.save(perishableProducts);
	}
	
	@Transactional(readOnly = false)
	public void delete(PerishableProducts perishableProducts) {
		super.delete(perishableProducts);
	}
	
	/**
	 * 查找领用物品
	 * @param ids
	 * @return
	 */
	public List<PerishableProducts> findOutstockList(List<String> ids)
	{
		return ppd.findOutstockList(ids);
	}
	
	/**
	 * 查询商品名称
	 */
	public String findBrand(String value)
	{
		return ppd.findBrand(value);
	}
	
	/**
	 * 查询商品单位
	 * @param value
	 * @return
	 */
	public String findUnit(String value)
	{
		return ppd.findUnit(value);
	}
	
	private PerishableProductsDao ppd;
	
	@Autowired
	public void setPpd(PerishableProductsDao ppd) {
		this.ppd = ppd;
	}
	
	/**
	 * 判断序列号是否重复
	 * @param serialNumber
	 * @return
	 */
	public boolean checkSerialNumber(String serialNumber)
	{
		return dao.countSerialNumber(serialNumber) > 0 ? true : false;
	}
	
	
	public String getBrand(String value)
	{
		return PingYinUtil.getPinYin(dao.findBrand(value));
	}
	
	public String getCategory(String value)
	{
		return PingYinUtil.getPinYin(dao.findCategory(value));
	}
	
	@Autowired
	private PerishableHistoryService phs;
}