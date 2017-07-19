/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.dao.fixedassets;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.oa.entity.fixedassets.PerishableApply;

/**
 * 低值易耗品申请DAO接口
 * @author 低值易耗品申请
 * @version 2016-12-02
 */
@MyBatisDao
public interface PerishableApplyDao extends CrudDao<PerishableApply> {
	
}