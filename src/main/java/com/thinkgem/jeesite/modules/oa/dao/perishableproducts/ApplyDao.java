/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.dao.perishableproducts;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.oa.entity.perishableproducts.Apply;

/**
 * 易耗品增删改查DAO接口
 * @author zf
 * @version 2016-11-08
 */
@MyBatisDao
public interface ApplyDao extends CrudDao<Apply> {
	
}