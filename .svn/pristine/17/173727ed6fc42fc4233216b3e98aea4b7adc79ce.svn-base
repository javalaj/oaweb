/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.service.contract;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.oa.entity.contract.OaContractSales;
import com.thinkgem.jeesite.modules.oa.entity.contract.OaContractSalesStage;
import com.thinkgem.jeesite.modules.sys.utils.OrdersUtils;
import com.thinkgem.jeesite.modules.oa.dao.contract.OaContractSalesDao;
import com.thinkgem.jeesite.modules.oa.dao.contract.OaContractSalesStageDao;

/**
 * 销售合同管理Service
 * @author 李廷龙
 * @version 2016-12-12
 */
@Service
@Transactional(readOnly = true)
public class OaContractSalesService extends CrudService<OaContractSalesDao, OaContractSales> {

	@Autowired
	private OaContractSalesStageDao oaContractSalesStageDao;
	
	public OaContractSales get(String id) {
		OaContractSales oaContractSales=super.get(id);
		oaContractSales.setOaContractSalesStageList(oaContractSalesStageDao.findList(new OaContractSalesStage(oaContractSales)));
		return oaContractSales;
	}
	
	public List<OaContractSales> findList(OaContractSales oaContractSales) {
		return super.findList(oaContractSales);
	}
	public List<OaContractSales> findListByProjectId(OaContractSales oaContractSales) {
		return dao.findListByProjectId(oaContractSales);
	}
	
	public Page<OaContractSales> findPage(Page<OaContractSales> page, OaContractSales oaContractSales) {
		String sql="";
		if (StringUtils.equals("0", oaContractSales.getIsOverdue())) {
			sql="AND a.warranty_end_time >= #{currentTime}";
		}else if (StringUtils.equals("1", oaContractSales.getIsOverdue())) {
			sql="AND a.warranty_end_time < #{currentTime}";
		}
		oaContractSales.getSqlMap().put("isOverdue", sql);
		oaContractSales.setPage(page);
		page.setList(dao.findList(oaContractSales));
		return page;
	}
	
	@Transactional(readOnly = false)
	public void save(OaContractSales oaContractSales) {
		
		if (oaContractSales.getIsNewRecord()){
			oaContractSales.preInsert();
			if (StringUtils.isBlank(oaContractSales.getContractNo())) {
				oaContractSales.setContractNo(OrdersUtils.getGenerateOrderNo4("XSHT-"));
			}
			dao.insert(oaContractSales);
		}else{
			oaContractSales.preUpdate();
			dao.update(oaContractSales);
		}
	}
	
	@Transactional(readOnly = false)
	public void delete(OaContractSales oaContractSales) {
		super.delete(oaContractSales);
		oaContractSalesStageDao.delete(new OaContractSalesStage(oaContractSales));
	}
	
}