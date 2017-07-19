package com.thinkgem.jeesite.modules.iim.dao;

import java.util.List;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.iim.entity.ChatHistory;


/**
 * 聊天记录DAO接口
 * @author jeeplus
 * @version 2015-12-29
 */
@MyBatisDao
public interface ChatHistoryDao extends CrudDao<ChatHistory> {
	
	
	/**
	 * 查询列表数据
	 * @param entity
	 * @return
	 */
	public List<ChatHistory> findLogList(ChatHistory entity);
	
	public List<ChatHistory> findNearPerson(ChatHistory entity);
	public List<ChatHistory> findNearPerson2(ChatHistory entity);
	
	
	public int findUnReadCount(ChatHistory chatHistory);
	
	/**
	 * 查询群离线信息
	 */
	public List<ChatHistory> findhistoryList(ChatHistory chatHistory);
	
	/**
	 * 查询未读信息
	 * @param userId
	 * @return
	 */
	public Integer findUnread(String loginName);
}