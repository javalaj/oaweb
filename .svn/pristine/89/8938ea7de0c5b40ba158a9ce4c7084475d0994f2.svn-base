/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.sys.service.workflow;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.sys.entity.workflow.SysWorkflowVar;
import com.thinkgem.jeesite.modules.sys.dao.workflow.SysWorkflowVarDao;

/**
 * 工作流变量维护Service
 * 
 * @author 李廷龙
 * @version 2016-11-29
 */
@Service
@Transactional(readOnly = true)
public class SysWorkflowVarService extends CrudService<SysWorkflowVarDao, SysWorkflowVar> {
	/**
	 * 
	 * 通过流程标示 和 变量的名称查找 流程变量 集合
	 * 
	 * @param sysWorkflowVar
	 *            设置了 流程标识 和 流程变量名称的 对象
	 * @return 返回 流程变量集合
	 */
	public List<SysWorkflowVar> findBySignVar(SysWorkflowVar sysWorkflowVar) {
		return dao.findBySignVar(sysWorkflowVar);
	}

	public SysWorkflowVar get(String id) {
		return super.get(id);
	}

	public List<SysWorkflowVar> findList(SysWorkflowVar sysWorkflowVar) {
		return super.findList(sysWorkflowVar);
	}

	public Page<SysWorkflowVar> findPage(Page<SysWorkflowVar> page, SysWorkflowVar sysWorkflowVar) {
		return super.findPage(page, sysWorkflowVar);
	}

	@Transactional(readOnly = false)
	public void save(SysWorkflowVar sysWorkflowVar) {
		super.save(sysWorkflowVar);
	}

	@Transactional(readOnly = false)
	public void delete(SysWorkflowVar sysWorkflowVar) {
		super.delete(sysWorkflowVar);
	}

}