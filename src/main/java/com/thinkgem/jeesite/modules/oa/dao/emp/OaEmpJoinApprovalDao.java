/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.dao.emp;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.oa.entity.emp.OaEmpJoinApproval;

/**
 * 人员入职审批DAO接口
 * @author 李廷龙
 * @version 2016-11-28
 */
@MyBatisDao
public interface OaEmpJoinApprovalDao extends CrudDao<OaEmpJoinApproval> {
	public OaEmpJoinApproval getByProcInsId(String procInsId);
}