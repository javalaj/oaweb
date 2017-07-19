/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.dao.project;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.oa.entity.project.OaProjectApproval;

/**
 * 售前项目立项审批管理DAO接口
 * @author 李廷龙
 * @version 2016-11-15
 */
@MyBatisDao
public interface OaProjectApprovalDao extends CrudDao<OaProjectApproval> {
	
	public OaProjectApproval getByProcInsId(String procInsId);
}