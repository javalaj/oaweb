/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.oa.entity.OaOutwork;

/**
 * 出差申请业务表DAO接口
 * @author liuxin
 * @version 2016-11-18
 */
@MyBatisDao
public interface OaOutworkDao extends CrudDao<OaOutwork> {
	OaOutwork getByProcInsId(String procInsId);
}