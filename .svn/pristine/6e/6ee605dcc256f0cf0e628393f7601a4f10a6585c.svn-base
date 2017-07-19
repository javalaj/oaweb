/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.act.dao;

import org.apache.ibatis.annotations.Param;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.act.entity.Act;

/**
 * 审批DAO接口
 * 
 * @author thinkgem
 * @version 2014-05-16
 */
@MyBatisDao
public interface MyActUtilsDao extends CrudDao<Act> {

	/**
	* 
	* 查询用户任务的数量，用于判断已发，已办重复情况。
	* 
	* */
	public int countUserTask(@Param("procInsId") String procInsId);

	/**
	 * 
	 * 删除代办列表，和已发重复的任务
	 * 
	 * */
	public void deleteHaveToDo(@Param("procInsId") String procInsId);

}