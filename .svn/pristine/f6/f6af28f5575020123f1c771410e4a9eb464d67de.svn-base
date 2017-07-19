/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.plan.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.plan.entity.SysPlan;
import com.thinkgem.jeesite.modules.plan.dao.SysPlanDao;

/**
 * 日程 管理Service
 * @author liaijun
 * @version 2016-10-19
 */
@Service
@Transactional(readOnly = true)
public class SysPlanService extends CrudService<SysPlanDao, SysPlan> {

	public SysPlan get(String id) {
		return super.get(id);
	}
	
	public List<SysPlan> findList(SysPlan sysPlan) {
		return super.findList(sysPlan);
	}
	
	public Page<SysPlan> findPage(Page<SysPlan> page, SysPlan sysPlan) {
		return super.findPage(page, sysPlan);
	}
	
	@Transactional(readOnly = false)
	public void save(SysPlan sysPlan) {
		super.save(sysPlan);
	}
	
	@Transactional(readOnly = false)
	public void delete(SysPlan sysPlan) {
		super.delete(sysPlan);
	}
	
}