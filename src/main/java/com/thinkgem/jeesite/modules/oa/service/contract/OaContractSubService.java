/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.service.contract;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.oa.entity.contract.OaContractPurchase;
import com.thinkgem.jeesite.modules.oa.entity.contract.OaContractPurchaseProduct;
import com.thinkgem.jeesite.modules.oa.entity.contract.OaContractPurchaseStage;
import com.thinkgem.jeesite.modules.sys.utils.OrdersUtils;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;
import com.thinkgem.jeesite.modules.oa.dao.contract.OaContractPurchaseDao;
import com.thinkgem.jeesite.modules.oa.dao.contract.OaContractPurchaseProductDao;
import com.thinkgem.jeesite.modules.oa.dao.contract.OaContractPurchaseStageDao;
import com.thinkgem.jeesite.modules.oa.dao.contract.OaContractSubDao;

/**
 * 采购合同管理Service
 * @author 李廷龙
 * @version 2016-12-12
 */
@Service
@Transactional(readOnly = true)
public class OaContractSubService extends CrudService<OaContractSubDao, OaContractPurchase> {
	@Autowired
	private OaContractPurchaseStageDao oaContractPurchaseStageDao;
	
	public OaContractPurchase get(String id) {
		OaContractPurchase oaContractPurchase=super.get(id);
		oaContractPurchase.setOaContractPurchaseStageList(oaContractPurchaseStageDao.findList(new OaContractPurchaseStage(oaContractPurchase)));
		return oaContractPurchase;
	}
	
	public List<OaContractPurchase> findList(OaContractPurchase oaContractPurchase) {
		return super.findList(oaContractPurchase);
	}
	
	public Page<OaContractPurchase> findPage(Page<OaContractPurchase> page, OaContractPurchase oaContractPurchase) {
		String sql="";
		if (StringUtils.equals("0", oaContractPurchase.getIsOverdue())) {
			sql="AND a.supplier_warranty_end_time >= #{currentTime}";
		}else if (StringUtils.equals("1", oaContractPurchase.getIsOverdue())) {
			sql="AND a.supplier_warranty_end_time < #{currentTime}";
		}
		oaContractPurchase.getSqlMap().put("isOverdue", sql);
		oaContractPurchase.setPage(page);
		page.setList(dao.findList(oaContractPurchase));
		return page;
	}
	
	@Transactional(readOnly = false)
	public void save(OaContractPurchase oaContractPurchase) {
		if (oaContractPurchase.getIsNewRecord()){
			oaContractPurchase.preInsert();
			oaContractPurchase.setIsAddStageAbled("1");
			oaContractPurchase.setContractType("1");
			if (StringUtils.isBlank(oaContractPurchase.getContractNo())) {
				oaContractPurchase.setContractNo(OrdersUtils.getGenerateOrderNo4("FB-"));
			}
			dao.insert(oaContractPurchase);
		}else{
			oaContractPurchase.preUpdate();
			dao.update(oaContractPurchase);
		}
	}
//	@Transactional(readOnly = false)
//	public void inspection(OaContractPurchase oaContractPurchase) {
//		OaContractPurchase oaContractPurchaseDB=dao.get(oaContractPurchase.getId());
//		oaContractPurchaseDB.setInspectionTime(new Date());
//		oaContractPurchaseDB.setInspectionUser(UserUtils.getUser());
//		oaContractPurchaseDB.setIsInspected("1");
//		//oaContractPurchaseDB.setIsAddStageAbled("1");
//		oaContractPurchaseDB.setInspectionFiles(oaContractPurchase.getInspectionFiles());
//		super.save(oaContractPurchaseDB);
//	}
//	@Transactional(readOnly = false)
//	public void checkInspection(OaContractPurchase oaContractPurchase) {
//		OaContractPurchase oaContractPurchaseDB=dao.get(oaContractPurchase.getId());
//		oaContractPurchaseDB.setIsInspected("2");
//		oaContractPurchaseDB.setIsAddStageAbled("1");
//		super.save(oaContractPurchaseDB);
//	}
	
	
	
	@Transactional(readOnly = false)
	public void delete(OaContractPurchase oaContractPurchase) {
		super.delete(oaContractPurchase);
		oaContractPurchaseStageDao.delete(new OaContractPurchaseStage(oaContractPurchase));
	}
	public List<OaContractPurchase> findListByProjectId(OaContractPurchase oaContractPurchase) {
		return dao.findListByProjectId(oaContractPurchase);
	}
	
}