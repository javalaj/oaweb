/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.service.contract;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.oa.entity.contract.OaContractSalesStage;
import com.thinkgem.jeesite.modules.oa.dao.contract.OaContractSalesStageDao;

/**
 * 销售合同阶段信息管理Service
 * @author 李廷龙
 * @version 2016-12-13
 */
@Service
@Transactional(readOnly = true)
public class OaContractSalesStageService extends CrudService<OaContractSalesStageDao, OaContractSalesStage> {

	public OaContractSalesStage get(String id) {
		return super.get(id);
	}
	
	public List<OaContractSalesStage> findList(OaContractSalesStage oaContractSalesStage) {
		return super.findList(oaContractSalesStage);
	}
	
	public Page<OaContractSalesStage> findPage(Page<OaContractSalesStage> page, OaContractSalesStage oaContractSalesStage) {
		return super.findPage(page, oaContractSalesStage);
	}
	
	@Transactional(readOnly = false)
	public void save(OaContractSalesStage oaContractSalesStage) {
		if (oaContractSalesStage.getIsNewRecord()){
			oaContractSalesStage.preInsert();
			oaContractSalesStage.setPayStageIndex(dao.getMaxPayStageIndex(oaContractSalesStage.getContractSales().getId())+1);
			dao.insert(oaContractSalesStage);
		}else{
			oaContractSalesStage.preUpdate();
			dao.update(oaContractSalesStage);
		}
	}
	
	@Transactional(readOnly = false)
	public void delete(OaContractSalesStage oaContractSalesStage) {
		super.delete(oaContractSalesStage);
	}
	
}