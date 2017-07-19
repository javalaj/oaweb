/**
 * Copyright &copy; 2012-2025 <a href="https://www.chuyutech.com">JeeCY</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.iim.dao;

import java.util.List;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.iim.entity.IimChatGroup;

/**
 * 群信息DAO接口
 * @author HLZ
 * @version 2017-03-06
 */
@MyBatisDao
public interface IimChatGroupDao extends CrudDao<IimChatGroup> {
	/***
	 * 根据群名模糊查询群
	 * @param Groupname
	 * @return
	 */
	public List<IimChatGroup> getGroupList(String groupname);
	
	/***
	 * 逻辑删除
	 * @param Groupname
	 * @return
	 */
	public void deleteByLogic(IimChatGroup group );
}