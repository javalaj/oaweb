/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.user.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.user.entity.UserMonthsum;

/**
 * 月度总计集合类，没有包括月度总结具体细节内容DAO接口
 * 
 * @author liuxin
 * @version 2016-11-04
 */
@MyBatisDao
public interface UserMonthsumDao extends CrudDao<UserMonthsum> {

}