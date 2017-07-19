/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.dao.fixedassets;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.oa.entity.fixedassets.PerishableHistory;

/**
 * 易耗品历史DAO接口
 * @author zf
 * @version 2016-12-09
 */
@MyBatisDao
public interface PerishableHistoryDao extends CrudDao<PerishableHistory> {
	
}