/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.oa.entity.OaForgetclock;

/**
 * 忘记打卡申请流程DAO接口
 * 
 * @author liuxin
 * @version 2016-11-21
 */
@MyBatisDao
public interface OaForgetclockDao extends CrudDao<OaForgetclock> {
	OaForgetclock getByProcInsId(String procInsId);
}