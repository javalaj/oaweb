/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.service.workturnover;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.oa.entity.workturnover.WorkTurnOver;
import com.thinkgem.jeesite.modules.oa.dao.workturnover.WorkTurnOverDao;

/**
 * 工作交接Service
 * @author zf
 * @version 2017-01-17
 */
@Service
@Transactional(readOnly = true)
public class WorkTurnOverService extends CrudService<WorkTurnOverDao, WorkTurnOver> {

	public WorkTurnOver get(String id) {
		return super.get(id);
	}
	
	public List<WorkTurnOver> findList(WorkTurnOver workTurnOver) {
		return super.findList(workTurnOver);
	}
	
	public Page<WorkTurnOver> findPage(Page<WorkTurnOver> page, WorkTurnOver workTurnOver) {
		return super.findPage(page, workTurnOver);
	}
	
	@Transactional(readOnly = false)
	public void save(WorkTurnOver workTurnOver) {
		super.save(workTurnOver);
	}
	
	@Transactional(readOnly = false)
	public void delete(WorkTurnOver workTurnOver) {
		super.delete(workTurnOver);
	}
	
	/**
	 * 根据人员异动主键删除
	 * @param staffTurnOverId
	 */
	@Transactional(readOnly = false)
	public void deletes(String staffTurnOverId)
	{
		dao.deletes(staffTurnOverId);
	}
}