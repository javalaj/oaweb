/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.user.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.user.dao.UserMonthsumDao;
import com.thinkgem.jeesite.modules.user.entity.UserMonthsum;

/**
 * 月度总计集合类，没有包括月度总结具体细节内容Service
 * 
 * @author liuxin
 * @version 2016-11-04
 */
@Service
@Transactional(readOnly = true)
public class UserMonthsumService extends
		CrudService<UserMonthsumDao, UserMonthsum> {

	public UserMonthsum get(String id) {
		return super.get(id);
	}

	public List<UserMonthsum> findList(UserMonthsum userMonthsum) {
		return super.findList(userMonthsum);
	}

	public Page<UserMonthsum> findPage(Page<UserMonthsum> page,
			UserMonthsum userMonthsum) {
		return super.findPage(page, userMonthsum);
	}

	@Transactional(readOnly = false)
	public void save(UserMonthsum userMonthsum) {
		super.save(userMonthsum);
	}

	@Transactional(readOnly = false)
	public void delete(UserMonthsum userMonthsum) {
		super.delete(userMonthsum);
	}


}