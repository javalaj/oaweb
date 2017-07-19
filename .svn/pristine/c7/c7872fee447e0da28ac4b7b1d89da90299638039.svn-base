/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.dao.project;

import java.util.List;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.act.entity.Act;
import com.thinkgem.jeesite.modules.oa.entity.project.OaProject;

/**
 * 项目表的管理DAO接口
 * @author 李廷龙
 * @version 2016-11-17
 */
@MyBatisDao
public interface OaProjectDao extends CrudDao<OaProject> {
	public List<OaProject> findListBySearchUserId(OaProject oaProject);
	
	public List<OaProject> findListAdd(OaProject oaProject);
	
	public Integer getProjectsCountBySearchUserId(String searchUserId);
}