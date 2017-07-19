package com.thinkgem.jeesite.modules.iim.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.iim.dao.IimChatGroupUserDao;
import com.thinkgem.jeesite.modules.iim.entity.IimChatGroup;
import com.thinkgem.jeesite.modules.iim.entity.IimChatGroupUser;
import com.thinkgem.jeesite.modules.sys.entity.User;

@Service
@Transactional(readOnly = true)
public class IimChatGroupUserService extends CrudService<IimChatGroupUserDao, IimChatGroupUser> {
	@Autowired
	private IimChatGroupUserDao iimChatGroupUserDao;
	
	
	
	/**
	 * 根据当前用户获取所在的群信息列表
	 * @param user
	 * @return
	 */
	
	public List<IimChatGroup> getGroupByuser(User user){
		return iimChatGroupUserDao.getGroupByuser(user);
	}
	
	/***
	 * 根据组获取组下所有群成员
	 * @param group
	 * @return
	 */
	public List<User> getUserBygroup(IimChatGroup group){
		return iimChatGroupUserDao.getUserBygroup(group);
	}
	
	
	/***
	 * 根据组获取组与成员关系
	 * @param group
	 * @return
	 */
	public List<IimChatGroupUser> getGroupUserBygroup(IimChatGroup group){
		return iimChatGroupUserDao.getGroupUserBygroup(group);
	}
	
	
	
	/***
	 * 根据组ID
	 * @param group
	 * @return
	 */
	public List<Map<String, Object>> getUserBygroupID(String groupid){
		return iimChatGroupUserDao.getUserBygroupID(groupid);
	}
	
	

	
	
	/**
	 * 根据当前用户获取群
	 * @param user
	 * @return
	 */
	
	public List<IimChatGroup> getGroup(String userid,String state){
		return iimChatGroupUserDao.getGroup(userid,state);
	}
	
	
	/**
	 * 根据当前组和级别获取所有人
	 * @param user
	 * @return
	 */
	public List<User>  getGroupUser(String userid,String state){
		return iimChatGroupUserDao.getGroupUser(userid, state);
	}
	
	/***
	 * 判断此群是否存在此用户
	 */
	public List<IimChatGroupUser> booleanGroupUser(String groupid,String userid,String delflag,String state){
		return iimChatGroupUserDao.booleanGroupUser(groupid, userid,delflag,state);
	}
	
	
	
	/***
	 * 更新此人在群中是否生效
	 */
	@Transactional(readOnly = false)
	public void updateGroupUser(IimChatGroupUser gu){
		iimChatGroupUserDao.updateGroupUser(gu);
	}
	
	
	/***
	 * 根据组和用户获取群关系
	 */
	public List<IimChatGroupUser> GetGroupUserbyid(String groupid,String userid){
		return iimChatGroupUserDao.GetGroupUserbyid(groupid, userid);
	}
	
	/**
	 * 申请入群发送对象群主和管理员
	 * @param gu
	 * @return
	 */
	public  List<IimChatGroupUser>  findManageUser(String groupid){
		return iimChatGroupUserDao.findManageUser(groupid);
	}
	
	

	/**
	 * 解散群发送对象管理员普通人员
	 * @param gu
	 * @return
	 */
	public  List<IimChatGroupUser>  findCommonUser(String groupid){
		return iimChatGroupUserDao.findCommonUser(groupid);
	}
	
	
	
}
