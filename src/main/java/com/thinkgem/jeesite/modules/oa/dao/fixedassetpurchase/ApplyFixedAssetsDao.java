/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.dao.fixedassetpurchase;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.oa.entity.fixedassetpurchase.ApplyFixedAssets;

/**
 * 固定资产申购DAO接口
 * @author zf
 * @version 2017-01-09
 */
@MyBatisDao
public interface ApplyFixedAssetsDao extends CrudDao<ApplyFixedAssets> {
	
	public ApplyFixedAssets getByProcInsId(String procInsId);
}