/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.user.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.user.entity.UserMonthrecord;
import com.thinkgem.jeesite.modules.user.dao.UserMonthrecordDao;

/**
 * 月度总结记录的细节内容，与月度总结一对多关联关系Service
 * @author liuxin
 * @version 2016-11-04
 */
@Service
@Transactional(readOnly = true)
public class UserMonthrecordService extends CrudService<UserMonthrecordDao, UserMonthrecord> {

	public UserMonthrecord get(String id) {
		return super.get(id);
	}
	
	public List<UserMonthrecord> findList(UserMonthrecord userMonthrecord) {
		return super.findList(userMonthrecord);
	}
	
	public Page<UserMonthrecord> findPage(Page<UserMonthrecord> page, UserMonthrecord userMonthrecord) {
		return super.findPage(page, userMonthrecord);
	}
	
	@Transactional(readOnly = false)
	public void save(UserMonthrecord userMonthrecord) {
		super.save(userMonthrecord);
	}
	
	@Transactional(readOnly = false)
	public void delete(UserMonthrecord userMonthrecord) {
		super.delete(userMonthrecord);
	}
	
}