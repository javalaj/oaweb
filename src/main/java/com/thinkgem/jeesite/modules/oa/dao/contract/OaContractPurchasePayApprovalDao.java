/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.dao.contract;

import java.util.List;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.oa.entity.contract.OaContractPurchasePayApproval;
import com.thinkgem.jeesite.modules.oa.entity.emp.OaEmpJoinApproval;
import com.thinkgem.jeesite.modules.oa.entity.project.OaProject;

/**
 * 采购合同付款申请审批管理DAO接口
 * @author 李廷龙
 * @version 2016-12-12
 */
@MyBatisDao
public interface OaContractPurchasePayApprovalDao extends CrudDao<OaContractPurchasePayApproval> {
	public List<OaProject> findOaProjectsBeenLinkedToOaContractPurchase();
	
	public OaContractPurchasePayApproval getByOaContractPurchaseStageId(String oaContractPurchaseStageId);
	
	public OaContractPurchasePayApproval getByProcInsId(String procInsId);
}