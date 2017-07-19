/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.dao.contract;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.oa.entity.contract.OaContractPurchaseProduct;

/**
 * 采购合同物品登记信息管理DAO接口
 * @author 李廷龙
 * @version 2016-12-27
 */
@MyBatisDao
public interface OaContractPurchaseProductDao extends CrudDao<OaContractPurchaseProduct> {
	
}