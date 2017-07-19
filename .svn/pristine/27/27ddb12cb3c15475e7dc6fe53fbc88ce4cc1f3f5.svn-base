/**
 * Copyright &copy; 2012-2025 <a href="https://www.chuyutech.com">JeeCY</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.dao.flowback;

import org.apache.ibatis.annotations.Param;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.oa.entity.flowback.OaFlowBack;

/**
 * 流程撤回操作DAO接口
 * 
 * @author liuxin
 * @version 2017-05-04
 */
@MyBatisDao
public interface OaFlowBackDao extends CrudDao<OaFlowBack> {
	/**
	 * 
	 * 删除已办记录
	 * 
	 */
	public void deleteHaveToDo(@Param("procInsId") String procInsId, @Param("taskDefKey") String taskDefKey);

	/**
	 * 
	 * 删除流程流转信息多余记录
	 * 
	 */
	public void deleteFlowInfo1(@Param("procInsId") String procInsId, @Param("taskDefKey") String taskDefKey);
	
	/**
	 * 
	 * 删除流程流转信息多余记录
	 * 
	 */
	public void deleteFlowInfo2(@Param("procInsId") String procInsId, @Param("taskDefKey") String taskDefKey);
}