/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.dao.contract;

import java.util.List;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.oa.entity.contract.OaContractProtocol;
import com.thinkgem.jeesite.modules.oa.entity.contract.OaContractPurchase;

/**
 * 协议框架合同管理DAO接口
 * @author 李廷龙
 * @version 2017-01-04
 */
@MyBatisDao
public interface OaContractProtocolDao extends CrudDao<OaContractProtocol> {
	public List<OaContractProtocol> findListByProjectId(OaContractProtocol oaContractProtocol);
}