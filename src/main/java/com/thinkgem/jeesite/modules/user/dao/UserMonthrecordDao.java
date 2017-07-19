/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.user.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.user.entity.UserMonthrecord;

/**
 * 月度总结记录的细节内容，与月度总结一对多关联关系DAO接口
 * @author liuxin
 * @version 2016-11-04
 */
@MyBatisDao
public interface UserMonthrecordDao extends CrudDao<UserMonthrecord> {
	
}