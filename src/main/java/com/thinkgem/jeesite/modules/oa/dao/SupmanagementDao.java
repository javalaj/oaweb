/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.oa.entity.Supmanagement;

/**
 * 供应商管理DAO接口
 * @author niting
 * @version 2016-11-07
 */
@MyBatisDao
public interface SupmanagementDao extends CrudDao<Supmanagement> {
	
}