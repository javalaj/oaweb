/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.dao.contract;

import java.util.List;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.oa.entity.contract.OaContractPurchase;

/**
 * 采购合同管理DAO接口
 * @author 李廷龙
 * @version 2016-12-12
 */
@MyBatisDao
public interface OaContractSubDao extends CrudDao<OaContractPurchase> {
	public List<OaContractPurchase> findListByProjectId(OaContractPurchase oaContractPurchase);
}