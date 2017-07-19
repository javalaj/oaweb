/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.user.dao.to;

import java.util.List;
import java.util.Map;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.user.entity.to.UserTotalrecords;

/**
 * 记录DAO接口
 * @author cz
 * @version 2017-02-13
 */
@MyBatisDao
public interface UserTotalrecordsDao extends CrudDao<UserTotalrecords> {
	
	void inserti(UserTotalrecords usertotalrecords);
	List<UserTotalrecords> getList(UserTotalrecords usertotalrecords);
	 List<Map<String, Object>>  toSum(UserTotalrecords usertotalrecords);
	
	
}