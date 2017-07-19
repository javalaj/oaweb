/**
 * Copyright &copy; 2015-2020 <a href="http://www.jeeplus.org/">JeePlus</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.iim.service;

import java.io.UnsupportedEncodingException;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.iim.dao.ChatHistoryDao;
import com.thinkgem.jeesite.modules.iim.entity.ChatHistory;

/**
 * 聊天记录Service
 * 
 * @author jeeplus
 * @version 2015-12-29
 */
@Service
@Transactional(readOnly = true)
public class ChatHistoryService extends
		CrudService<ChatHistoryDao, ChatHistory> {

	public ChatHistory get(String id) {
		return super.get(id);
	}

	public List<ChatHistory> findList(ChatHistory chatHistory) {
		return super.findList(chatHistory);
	}

	public Page<ChatHistory> findPage(Page<ChatHistory> page, ChatHistory entity) {
		entity.setPage(page);
		page.setList(dao.findLogList(entity));
		return page;
	}

	@Transactional(readOnly = false)
	public void save(ChatHistory chatHistory) {
		super.save(chatHistory);
	}

	@Transactional(readOnly = false)
	public void delete(ChatHistory chatHistory) {
		super.delete(chatHistory);
	}

	public int findUnReadCount(ChatHistory chatHistory) {
		return dao.findUnReadCount(chatHistory);
	}

	public List<ChatHistory> findNearPerson(ChatHistory chatHistory) {
		return dao.findNearPerson(chatHistory);
	}
	public List<ChatHistory> findNearPerson2(ChatHistory chatHistory) {
		return dao.findNearPerson2(chatHistory);
	}
	
	
	
	public List<ChatHistory> findhistoryList(ChatHistory chatHistory) {
		return dao.findhistoryList(chatHistory);
	}
	
	/**
	 * 查询未读信息
	 * @param userId
	 * @return
	 */
	public Integer findUnread(String loginName)
	{
		return dao.findUnread(loginName);
	}
}