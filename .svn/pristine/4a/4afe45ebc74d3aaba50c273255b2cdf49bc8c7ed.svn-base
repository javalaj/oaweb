/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.thinkgem.jeesite.common.persistence.TreeDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.oa.entity.CyTspOaAddressGroup;

/**
 * 分组DAO接口
 * 
 * @author cz
 * @version 2016-11-04
 */
@MyBatisDao
public interface CyTspOaAddressGroupDao extends TreeDao<CyTspOaAddressGroup> {

	List<CyTspOaAddressGroup> getCyTspOaAddressGroup(String userId);

	void insertGroup(@Param("userId") String userId, @Param("name") String name);

	public int updateGroup(CyTspOaAddressGroup cyTspOaAddressGroup);

	public int deleteGroup(CyTspOaAddressGroup cyTspOaAddressGroup);
	
	
	List<CyTspOaAddressGroup>  getGroupName(CyTspOaAddressGroup cyTspOaAddressGroup);

}