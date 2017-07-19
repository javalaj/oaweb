/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.oa.entity.OaOvertime;

/**
 * 加班流程业务工作流DAO接口
 * 
 * @author liuxin
 * @version 2016-11-17
 */
@MyBatisDao
public interface OaOvertimeDao extends CrudDao<OaOvertime> {
	OaOvertime getByProcInsId(String procInsId);

	/**
	 * 查询用户 剩余调休时间
	 */
	String getRestTimeById(String userId);
}