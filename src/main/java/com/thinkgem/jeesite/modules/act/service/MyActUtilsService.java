/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.act.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.service.BaseService;
import com.thinkgem.jeesite.modules.act.dao.MyActUtilsDao;

/**
 * 流程定义相关Service
 * 
 * @author ThinkGem
 * @version 2013-11-03
 */
@Service
@Transactional(readOnly = true)
public class MyActUtilsService extends BaseService {

	@Autowired
	private MyActUtilsDao dao;

	/**
	 * 
	 * 查询用户任务的数量，用于判断已发，已办重复情况。
	 * 
	 */
	public boolean countUserTask(String procInsId) {
		if (dao.countUserTask(procInsId) == 1) {
			return true;
		}
		return false;
	}

	/**
	 * 
	 * 删除代办列表，和已发重复的任务
	 * 
	 */
	@Transactional(readOnly = false)
	public void deleteHaveToDo(String procInsId) {
		dao.deleteHaveToDo(procInsId);
	}
	
	/**
	 * 
	 * 逻辑判断方法，判断是是否已发和已办相重复，需要删除已办任务
	 * 
	 * */
	public void judgeAndDo(String procInsId){
		if(countUserTask(procInsId)){
			deleteHaveToDo(procInsId);
		}
	}
}
