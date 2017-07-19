/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.service.contract;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.oa.entity.contract.OaContractPurchaseProduct;
import com.thinkgem.jeesite.modules.oa.dao.contract.OaContractPurchaseProductDao;

/**
 * 采购合同物品登记信息管理Service
 * @author 李廷龙
 * @version 2016-12-27
 */
@Service
@Transactional(readOnly = true)
public class OaContractPurchaseProductService extends CrudService<OaContractPurchaseProductDao, OaContractPurchaseProduct> {

	public OaContractPurchaseProduct get(String id) {
		return super.get(id);
	}
	
	public List<OaContractPurchaseProduct> findList(OaContractPurchaseProduct oaContractPurchaseProduct) {
		return super.findList(oaContractPurchaseProduct);
	}
	
	public Page<OaContractPurchaseProduct> findPage(Page<OaContractPurchaseProduct> page, OaContractPurchaseProduct oaContractPurchaseProduct) {
		return super.findPage(page, oaContractPurchaseProduct);
	}
	
	@Transactional(readOnly = false)
	public void save(OaContractPurchaseProduct oaContractPurchaseProduct) {
		super.save(oaContractPurchaseProduct);
	}
	
	@Transactional(readOnly = false)
	public void delete(OaContractPurchaseProduct oaContractPurchaseProduct) {
		super.delete(oaContractPurchaseProduct);
	}
	
}