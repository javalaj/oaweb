/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.dao.staffturnover;

import java.util.List;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.oa.entity.staffturnover.StaffTurnover;
import com.thinkgem.jeesite.modules.oa.entity.staffturnover.UserRoles;

/**
 * 人员异动DAO接口
 * @author zf
 * @version 2017-01-12
 */
@MyBatisDao
public interface StaffTurnoverDao extends CrudDao<StaffTurnover> 
{
	/**
	 * 查询用户角色id
	 * @param userId
	 * @return
	 */
	public List<UserRoles> findUserRoles(String userId);

	public StaffTurnover getByProcInsId(String procInsId);
}