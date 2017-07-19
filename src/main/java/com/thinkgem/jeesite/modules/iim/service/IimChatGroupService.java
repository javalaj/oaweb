package com.thinkgem.jeesite.modules.iim.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.iim.dao.IimChatGroupDao;
import com.thinkgem.jeesite.modules.iim.dao.IimChatGroupUserDao;
import com.thinkgem.jeesite.modules.iim.entity.IimChatGroup;
import com.thinkgem.jeesite.modules.iim.entity.IimChatGroupUser;
import com.thinkgem.jeesite.modules.sys.entity.User;

@Service
public class IimChatGroupService extends CrudService<IimChatGroupDao, IimChatGroup> {
	@Autowired
	private IimChatGroupDao iimChatGroupDao;

	
	/***
	 * 根据群名模糊查询群
	 * @param Groupname
	 * @return
	 */
	public List<IimChatGroup> getGroupList(String groupname) {
		return iimChatGroupDao.getGroupList(groupname);
	}
	
	
	
	/***
	 * 逻辑删除
	 * @param Groupname
	 * @return
	 */
	public void deleteByLogic(IimChatGroup group ) {
		iimChatGroupDao.deleteByLogic(group);
	}
	
	

}
