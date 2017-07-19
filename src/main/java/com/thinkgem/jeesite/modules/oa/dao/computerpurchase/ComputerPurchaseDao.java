/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.dao.computerpurchase;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.oa.entity.computerpurchase.ComputerPurchase;

/**
 * 电脑采购DAO接口
 * @author zf
 * @version 2016-12-01
 */
@MyBatisDao
public interface ComputerPurchaseDao extends CrudDao<ComputerPurchase> {
	public ComputerPurchase getByProcInsId(String procInsId);
}