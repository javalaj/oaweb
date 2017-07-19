/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.user.dao;

import java.util.List;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.user.entity.UserWorklogVo;
import com.thinkgem.jeesite.modules.user.entity.UserWorkrecord;

/**
 * 我的日志具体工作记录DAO接口
 * 
 * @author liuxin
 * @version 2016-11-02
 */
@MyBatisDao
public interface UserWorkrecordDao extends CrudDao<UserWorkrecord> {

	/**
	 * 查询未完成的问题
	 * 
	 * @param userId
	 * @return
	 */
	public List<UserWorklogVo> findListForWorkColumn(String userId);

	void done(String id);

	void deleteAllById(String id);

}