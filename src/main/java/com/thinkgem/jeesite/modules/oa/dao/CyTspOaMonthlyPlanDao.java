/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.oa.entity.CyTspOaMonthlyPlan;

/**
 * 月计划DAO接口
 * @author cz
 * @version 2016-11-08
 */
@MyBatisDao
public interface CyTspOaMonthlyPlanDao extends CrudDao<CyTspOaMonthlyPlan> {
	
	Map<Integer, Integer> findScrores(@Param("startTime")String startTime,@Param("userId")String userId);
	
	
	
	List<CyTspOaMonthlyPlan> finddate(@Param("startTime")String startTime,@Param("userId")String userId);
	void updatei(CyTspOaMonthlyPlan cyTspOaMonthlyPlan);
	
	void insert(List<CyTspOaMonthlyPlan> cytspoamonthlyplan);
	
	
	//保存申请信息
	int saveApply(CyTspOaMonthlyPlan cyTspOaMonthlyPlan);
	
	
	//查询个人代办理的任务
	List<CyTspOaMonthlyPlan> findApprovalList(CyTspOaMonthlyPlan cyTspOaMonthlyPlan);
	//最高级查询个人代办理的任务
	List<CyTspOaMonthlyPlan> findApprovalListv(CyTspOaMonthlyPlan cyTspOaMonthlyPlan);
	
	//审核完成后
	List<CyTspOaMonthlyPlan> passlist(@Param("commonId")String commonId);
	
	List<CyTspOaMonthlyPlan> transactor(CyTspOaMonthlyPlan cyTspOaMonthlyPlan);
	
	/**
	 *  
	 * 查看所有部门员工绩效
	 * 
	 * */
	  
	List<CyTspOaMonthlyPlan> epList(CyTspOaMonthlyPlan cyTspOaMonthlyPlan);
	
	
}