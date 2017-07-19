/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.oa.entity.CyTspOaMonthlyPlan;
import com.thinkgem.jeesite.modules.oa.dao.CyTspOaMonthlyPlanDao;

/**
 * 月计划Service
 * @author cz
 * @version 2016-11-08
 */
@Service
@Transactional(readOnly = true)
public class CyTspOaMonthlyPlanService extends CrudService<CyTspOaMonthlyPlanDao, CyTspOaMonthlyPlan> {
	@Autowired
	CyTspOaMonthlyPlanDao dao;

	public CyTspOaMonthlyPlan get(String id) {
		return super.get(id);
	}
	
	public List<CyTspOaMonthlyPlan> findList(CyTspOaMonthlyPlan cyTspOaMonthlyPlan) {
		return super.findList(cyTspOaMonthlyPlan);
	}
	
	public Page<CyTspOaMonthlyPlan> findPage(Page<CyTspOaMonthlyPlan> page, CyTspOaMonthlyPlan cyTspOaMonthlyPlan) {
		
		return super.findPage(page, cyTspOaMonthlyPlan);
	}
	
	@Transactional(readOnly = false)
	public void save(CyTspOaMonthlyPlan cyTspOaMonthlyPlan) {
		super.save(cyTspOaMonthlyPlan);
	}
	
	@Transactional(readOnly = false)
	public void insert(CyTspOaMonthlyPlan cytspoamonthlyplan) {
		dao.insert(cytspoamonthlyplan);
	}
	
	
	@Transactional(readOnly = false)
	public void delete(CyTspOaMonthlyPlan cyTspOaMonthlyPlan) {
		super.delete(cyTspOaMonthlyPlan);
	}
	
	public Map<Integer, Integer> findScrores(String startTime,String userId) {
		return dao.findScrores(startTime, userId);
	}

	public List<CyTspOaMonthlyPlan> finddate(String startTime,String userId) {
		return dao.finddate(startTime, userId);
	}
	@Transactional(readOnly = false)
	public void updatei(CyTspOaMonthlyPlan cyTspOaMonthlyPlan) {
		 dao.updatei(cyTspOaMonthlyPlan);
	}
	public	List<CyTspOaMonthlyPlan> transactor(CyTspOaMonthlyPlan cyTspOaMonthlyPlan){
		return dao.transactor(cyTspOaMonthlyPlan);
	}
	
	
	@Transactional(readOnly = false)
	public int saveApply(CyTspOaMonthlyPlan cytspoamonthlyplan) {
		cytspoamonthlyplan.preUpdate();
		return dao.saveApply(cytspoamonthlyplan);
	}
	public List<CyTspOaMonthlyPlan> passlist(String commonId){
		return dao.passlist(commonId);
	}
	
	public	List<CyTspOaMonthlyPlan> findApprovalList(CyTspOaMonthlyPlan cyTspOaMonthlyPlan){
		return dao.findApprovalList(cyTspOaMonthlyPlan);
	}
	public	List<CyTspOaMonthlyPlan> findApprovalListv(CyTspOaMonthlyPlan cyTspOaMonthlyPlan){
		return dao.findApprovalListv(cyTspOaMonthlyPlan);
	}

	public Page<CyTspOaMonthlyPlan> epList(Page<CyTspOaMonthlyPlan> page, CyTspOaMonthlyPlan cyTspOaMonthlyPlan) {
			page.setPageSize(20);
			cyTspOaMonthlyPlan.setPage(page);
			page.setList(dao.epList(cyTspOaMonthlyPlan));
			return page;
		}
	
}