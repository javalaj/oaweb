/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.user.dao;

import java.util.List;
import java.util.Map;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.oa.entity.mytask.OaPlan;
import com.thinkgem.jeesite.modules.user.entity.UserWeekrecord;

/**
 * 周计划计划的细节内容，与周计划一对多关联关系DAO接口
 * @author liuxin
 * @version 2016-11-04
 */
@MyBatisDao
public interface UserWeekrecordDao extends CrudDao<UserWeekrecord> {
	
	  List<UserWeekrecord> comList(String sameid);
	  UserWeekrecord  getprecomidListID(String id);
	  List<UserWeekrecord> precomidList(String sameid);
	  void upqualityscore(UserWeekrecord userWeekrecord);
	  void upPrecomid(UserWeekrecord userWeekrecord);
	  List<UserWeekrecord>  turnprecomidList(String sameid);
	 
	  void upweek(UserWeekrecord userWeekrecord);
	  
	  List<UserWeekrecord> grouplist(String createid);
	  
	  List<Map<String, Object>>  sum(UserWeekrecord userWeekrecord);
	  
	  void  UPschedule(UserWeekrecord userWeekrecord);
	  void upturndownId(UserWeekrecord userWeekrecord);
	  
	  void upturndownflag(UserWeekrecord userWeekrecord);  
	  
	  public List<UserWeekrecord> indexGetList(UserWeekrecord userWeekrecord);
	  
	  public List<UserWeekrecord> getweekPlanList(UserWeekrecord userWeekrecord);
	  
	  
	  public List<UserWeekrecord> allWeekPlanWeekid(UserWeekrecord userWeekrecord);
	  
	  void upProcinsFlag(UserWeekrecord userWeekrecord);
}