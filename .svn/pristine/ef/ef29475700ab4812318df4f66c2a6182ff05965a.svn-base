/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.user.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.user.dao.UserWorkrecordDao;
import com.thinkgem.jeesite.modules.user.entity.UserWorklogVo;
import com.thinkgem.jeesite.modules.user.entity.UserWorkrecord;

/**
 * 我的日志具体工作记录Service
 * 
 * @author liuxin
 * @version 2016-11-02
 */
@Service
@Transactional(readOnly = true)
public class UserWorkrecordService extends CrudService<UserWorkrecordDao, UserWorkrecord> {

	public UserWorkrecord get(String id) {
		return super.get(id);
	}

	public List<UserWorkrecord> findList(UserWorkrecord userWorkrecord) {
		return super.findList(userWorkrecord);
	}

	public Page<UserWorkrecord> findPage(Page<UserWorkrecord> page, UserWorkrecord userWorkrecord) {
		return super.findPage(page, userWorkrecord);
	}

	@Transactional(readOnly = false)
	public void save(UserWorkrecord userWorkrecord) {
		super.save(userWorkrecord);
	}

	@Transactional(readOnly = false)
	public void done(String id) {
		dao.done(id);
	}

	@Transactional(readOnly = false)
	public void delete(UserWorkrecord userWorkrecord) {
		super.delete(userWorkrecord);
	}

	/**
	 * 查询未完成的问题
	 * 
	 * @param userId
	 * @return
	 */
	public List<UserWorklogVo> findListForWorkColumn(String userId) {
		return dao.findListForWorkColumn(userId);
	}

	/** 修改日志，删除所以记录 */
	@Transactional(readOnly = false)
	public void deleteAllById(String id) {
		dao.deleteAllById(id);
	}
}