/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.plan.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.plan.entity.SysPlan;

/**
 * 日程 管理DAO接口
 * @author liaijun
 * @version 2016-10-19
 */
@MyBatisDao
public interface SysPlanDao extends CrudDao<SysPlan> {
	
}