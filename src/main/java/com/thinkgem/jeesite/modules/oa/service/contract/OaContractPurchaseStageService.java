/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.service.contract;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.oa.entity.contract.OaContractPurchaseStage;
import com.thinkgem.jeesite.modules.oa.dao.contract.OaContractPurchaseStageDao;

/**
 * 采购合同阶段信息管理Service
 * @author 李廷龙
 * @version 2016-12-13
 */
@Service
@Transactional(readOnly = true)
public class OaContractPurchaseStageService extends CrudService<OaContractPurchaseStageDao, OaContractPurchaseStage> {

	public OaContractPurchaseStage get(String id) {
		return super.get(id);
	}
	
	public List<OaContractPurchaseStage> findList(OaContractPurchaseStage oaContractPurchaseStage) {
		return super.findList(oaContractPurchaseStage);
	}
	
	public Page<OaContractPurchaseStage> findPage(Page<OaContractPurchaseStage> page, OaContractPurchaseStage oaContractPurchaseStage) {
		return super.findPage(page, oaContractPurchaseStage);
	}
	
	@Transactional(readOnly = false)
	public void save(OaContractPurchaseStage oaContractPurchaseStage) {
		if (oaContractPurchaseStage.getIsNewRecord()){
			oaContractPurchaseStage.preInsert();
			oaContractPurchaseStage.setPayStageIndex(dao.getMaxPayStageIndex(oaContractPurchaseStage.getContractPurchase().getId())+1);
			dao.insert(oaContractPurchaseStage);
		}else{
			oaContractPurchaseStage.preUpdate();
			dao.update(oaContractPurchaseStage);
		}
	}
	
	@Transactional(readOnly = false)
	public void saveAdd(OaContractPurchaseStage oaContractPurchaseStage) {
		oaContractPurchaseStage.preUpdate();
		dao.update(oaContractPurchaseStage);
	}
	
	@Transactional(readOnly = false)
	public void delete(OaContractPurchaseStage oaContractPurchaseStage) {
		super.delete(oaContractPurchaseStage);
	}
	
}