/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.dao.project;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.oa.entity.project.OaProjectMember;

/**
 * 项目成员管理DAO接口
 * @author 李廷龙
 * @version 2017-02-22
 */
@MyBatisDao
public interface OaProjectMemberDao extends CrudDao<OaProjectMember> {
	
}