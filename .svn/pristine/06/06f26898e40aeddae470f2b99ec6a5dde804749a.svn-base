/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.sys.dao;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.sys.entity.User;

/**
 * 用户DAO接口
 * 
 * @author ThinkGem
 * @version 2014-05-16
 */
@MyBatisDao
public interface UserDao extends CrudDao<User> {
	/**
	 * 根据登录名称查询用户
	 * 
	 * @param loginName
	 * @return
	 */
	public User getByLoginName(User user);

	/**
	 * 根据工号查询用户
	 * 
	 * @param no
	 * @return
	 */
	public User getByNo(User user);
	
	/**
	 * 根据用户工号查询用户
	 * 
	 * @param loginName
	 * @return
	 */
	public User getUserByUserNo(String userNo);

	/**
	 * 通过OfficeId获取用户列表，仅返回用户id和name（树查询用户时用）
	 * 
	 * @param user
	 * @return
	 */
	public List<User> findUserByOfficeId(User user);
	/**
	 * 查询离职员工档案
	 * 
	 * @param user
	 * @return
	 */
	public List<User> getProfileOutState(User user);
	/**
	 * 查询在职员工档案
	 * 
	 * @param user
	 * @return
	 */
	public List<User> getProfile(User user);

	/**
	 * 查询全部用户数目
	 * 
	 * @return
	 */
	public long findAllCount(User user);

	/**
	 * 更新用户密码
	 * 
	 * @param user
	 * @return
	 */
	public int updatePasswordById(User user);

	/**
	 * 更新登录信息，如：登录IP、登录时间
	 * 
	 * @param user
	 * @return
	 */
	public int updateLoginInfo(User user);

	/**
	 * 删除用户角色关联数据
	 * 
	 * @param user
	 * @return
	 */
	public int deleteUserRole(User user);

	/**
	 * 插入用户角色关联数据
	 * 
	 * @param user
	 * @return
	 */
	public int insertUserRole(User user);

	/**
	 * 更新用户信息
	 * 
	 * @param user
	 * @return
	 */
	public int updateUserInfo(User user);

	/**
	 * 插入好友
	 */
	public int insertFriend(@Param("id") String id, @Param("userId") String userId, @Param("friendId") String friendId);

	/**
	 * 查找好友
	 */
	public User findFriend(@Param("userId") String userId, @Param("friendId") String friendId);

	/**
	 * 删除好友
	 */
	public void deleteFriend(@Param("userId") String userId, @Param("friendId") String friendId);

	/**
	 * 
	 * 获取我的好友列表
	 * 
	 */
	public List<User> findFriends(User currentUser);

	public User findFriendLoginName(User user);

	/**
	 * 
	 * 查询用户-->用来添加到常用联系人
	 * 
	 */
	public List<User> searchUsers(User user);

	/**
	 * 
	 */

	public List<User> findListByOffice(User user);

	public List<User> findAllList();

	/**
	 * 查询我的任务
	 * 
	 * @param userId
	 * @param beginTime
	 * @param endTime
	 * @param state
	 * @return
	 */
	public Integer queryMyPlan(String userId, Date beginTime, Date endTime, String state);

	/**
	 * 查询用户发起的会议
	 * 
	 * @param userId
	 * @param beginTime
	 * @param endTime
	 * @return
	 */
	public Integer queryCongressSponsored(String userId, Date beginTime, Date endTime);

	/**
	 * 查询用户参与的会议
	 * 
	 * @param userId
	 * @param beginTime
	 * @param endTime
	 * @return
	 */
	public Integer queryCongressAttend(String userId, Date beginTime, Date endTime);

	/**
	 * 查询用户新增的收藏
	 * 
	 * @param userId
	 * @param beginTime
	 * @param endTime
	 * @return
	 */
	public Integer queryNewFavorite(String userId, Date beginTime, Date endTime);

	/**
	 * 查询用户删除的收藏
	 * 
	 * @param userId
	 * @param beginTime
	 * @param endTime
	 * @return
	 */
	public Integer queryDelFavorite(String userId, Date beginTime, Date endTime);

	/**
	 * 查询用户总的收藏
	 * 
	 * @param userId
	 * @return
	 */
	public Integer querySumFavorite(String userId);

	/**
	 * 更新用户state
	 * 
	 * liuxin
	 * 
	 **/
	public int updateStateById(User user);

	/**
	 * 查询待开会议
	 * 
	 * @param userId
	 * @param time
	 * @return
	 */
	public Integer queryMeeting(String userId, Date time);

	/*
	 * 查询我的日志中的问题
	 */
	public Integer queryWorkLog(String isdone, String userId, Date beginTime, Date endTime);

	/*
	 * 查询我的日志中的问题
	 */
	public Integer queryWorkLogForWorkColumn(String isdone, String userId);

	/** 修改可调休时长 */
	public void updateResttime(@Param(value = "id") String id, @Param(value = "resttime") String resttime);

	/** 查询可调休时长 */
	public String selectResttime(@Param(value = "id") String id);
}
