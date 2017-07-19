/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.sys.dao.workflow;

import java.util.List;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.sys.entity.workflow.SysWorkflowVar;

/**
 * 工作流变量维护DAO接口
 * 
 * @author 李廷龙
 * @version 2016-11-29
 */
@MyBatisDao
public interface SysWorkflowVarDao extends CrudDao<SysWorkflowVar> {
	public SysWorkflowVar getSysWorkflowVarByWorkflowIdentificationAndVarName(String workflowIdentification,
			String varName);

	/**
	 * 
	 * 通过流程标示 和 变量的名称查找 流程变量 集合
	 * 
	 * @param sysWorkflowVar
	 *            设置了 流程标识 和 流程变量名称的 对象
	 * @return 返回 流程变量集合
	 */
	List<SysWorkflowVar> findBySignVar(SysWorkflowVar sysWorkflowVar);
}