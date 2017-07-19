/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.dao.contract;

import java.util.List;

import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.oa.entity.contract.OaContractStatistics;

/**
 * 销售合同管理DAO接口
 * @author 李廷龙
 * @version 2016-12-12
 */
@MyBatisDao
public interface OaContractStatisticsDao {
	public List<OaContractStatistics> findOaContractSalesStatisticsList(OaContractStatistics oaContractSalesStatistics);

	public List<OaContractStatistics> findOaContractPurchaseStatisticsList(OaContractStatistics oaContractSalesStatistics);
	
}