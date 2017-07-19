/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.oa.entity.OaFileQuery;

/**
 * 公文查询DAO接口
 * 
 * @author liuxin
 * @version 2016-12-20
 */
@MyBatisDao
public interface OaFileQueryDao extends CrudDao<OaFileQuery> {
}