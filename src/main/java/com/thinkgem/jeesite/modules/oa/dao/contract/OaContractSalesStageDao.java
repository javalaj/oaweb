/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.dao.contract;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.oa.entity.contract.OaContractSalesStage;

/**
 * 销售合同阶段信息管理DAO接口
 * @author 李廷龙
 * @version 2016-12-13
 */
@MyBatisDao
public interface OaContractSalesStageDao extends CrudDao<OaContractSalesStage> {
	public Integer getMaxPayStageIndex(String contractSalesId);
}