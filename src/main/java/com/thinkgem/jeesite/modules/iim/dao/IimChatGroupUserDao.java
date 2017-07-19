/**
 * Copyright &copy; 2012-2025 <a href="https://www.chuyutech.com">JeeCY</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.iim.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.iim.entity.IimChatGroup;
import com.thinkgem.jeesite.modules.iim.entity.IimChatGroupUser;
import com.thinkgem.jeesite.modules.sys.entity.User;

/**
 * 群成员关系DAO接口
 * @author HLZ
 * @version 2017-03-06
 */
@MyBatisDao
public interface IimChatGroupUserDao extends CrudDao<IimChatGroupUser> {
	
	/**
	 * 根据当前用户获取所在的群信息列表
	 * @param user
	 * @return
	 */
	
	public List<IimChatGroup> getGroupByuser(User user);
	
	/***
	 * 根据组获取组下所有群成员
	 * @param group
	 * @return
	 */
	public List<User> getUserBygroup(IimChatGroup group);
	
	
	
	/***
	 * 根据组获取组与成员关系
	 * @param group
	 * @return
	 */
	public List<IimChatGroupUser> getGroupUserBygroup(IimChatGroup gg);
	
	
	/***
	 * 根据组ID以及当前用户ID
	 * @param group
	 * @return
	 */
	public List<Map<String, Object>> getUserBygroupID(@Param("groupid")String groupid);
	
	
	
	
	/**
	 * 根据当前用户获取群
	 * @param user
	 * @return
	 */
	
	public List<IimChatGroup> getGroup(@Param("userid")String userid,@Param("state")String state);
	
	
	/**
	 * 根据当前组和级别获取所有人
	 * @param user
	 * @return
	 */
	public List<User>  getGroupUser(@Param("id")String id,@Param("state")String state);
	
	
	/***
	 * 判断此群是否存在此用户
	 */
	public List<IimChatGroupUser> booleanGroupUser(@Param("groupid")String groupid,@Param("userid")String userid,@Param("delflag")String delflag,@Param("state")String state);

	
	/***
	 * 更新此人在群中是否生效
	 */
	public void updateGroupUser(IimChatGroupUser gu);
	

	/***
	 * 根据组和用户获取群关系
	 */
	public List<IimChatGroupUser> GetGroupUserbyid(@Param("groupid")String groupid,@Param("userid")String userid);

	
	/**
	 * 申请入群发送对象
	 * @param gu
	 * @return
	 */
	public List<IimChatGroupUser> findManageUser(@Param("groupid")String groupid);

	
	/**
	 * 解散群发送对象管理员普通人员
	 * @param gu
	 * @return
	 */
	public  List<IimChatGroupUser>  findCommonUser(String groupid);
	
}