/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.mobile.modules.oa.dao.leaveMore;

import java.util.ArrayList;
import java.util.Date;

import org.apache.ibatis.annotations.Param;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.mobile.modules.oa.entity.leaveMore.LeaveMore;

/**
 * 查询考情单据DAO接口
 * 
 * @author liuxin
 * @version 2016-11-18
 */
@MyBatisDao
public interface LeaveMoreDao extends CrudDao<LeaveMore> {
	/**
	 * 
	 * 手机端，查询考情单据.
	 * 
	 */
	ArrayList<LeaveMore> getMoreByType(@Param("querydate") Date querydate, @Param("type") String type,
			@Param("officeid") String officeid, @Param("querydate2") Date querydate2);
}