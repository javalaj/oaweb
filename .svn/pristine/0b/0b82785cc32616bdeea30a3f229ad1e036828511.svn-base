/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.dao.fixedassets;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.oa.entity.fixedassets.PerishableSerial;

/**
 * 易耗品序列DAO接口
 * @author 易耗品序列
 * @version 2016-12-02
 */
@MyBatisDao
public interface PerishableSerialDao extends CrudDao<PerishableSerial> {
	
	public PerishableSerial getByProcInsId(String procInsId);
	
	public PerishableSerial selectSerialById(String id);
}