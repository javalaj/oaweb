/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.service.contract;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.oa.entity.contract.OaContractSales;
import com.thinkgem.jeesite.modules.oa.entity.contract.OaContractStatistics;
import com.thinkgem.jeesite.modules.oa.dao.contract.OaContractSalesDao;
import com.thinkgem.jeesite.modules.oa.dao.contract.OaContractStatisticsDao;

/**
 * 销售合同管理Service
 * @author 李廷龙
 * @version 2016-12-12
 */
@Service
@Transactional(readOnly = true)
public class OaContractStatisticsService extends CrudService<OaContractSalesDao, OaContractSales> {

	@Autowired
	private OaContractStatisticsDao oaContractStatisticsDao;
	
	public List<OaContractStatistics> findOaContractSalesStatisticsList(OaContractStatistics oaContractSalesStatistics){
		return oaContractStatisticsDao.findOaContractSalesStatisticsList(oaContractSalesStatistics);
	}
	
	public List<OaContractStatistics> findOaContractPurchaseStatisticsList(OaContractStatistics oaContractSalesStatistics){
		return oaContractStatisticsDao.findOaContractPurchaseStatisticsList(oaContractSalesStatistics);
	}
}