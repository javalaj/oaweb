/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.user.service.to;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.user.entity.to.UserTotalrecords;
import com.thinkgem.jeesite.modules.user.dao.to.UserTotalrecordsDao;

/**
 * 记录Service
 * @author cz
 * @version 2017-02-13
 */
@Service
@Transactional(readOnly = true)
public class UserTotalrecordsService extends CrudService<UserTotalrecordsDao, UserTotalrecords> {
@Autowired
UserTotalrecordsDao dao;
	public UserTotalrecords get(String id) {
		return super.get(id);
	}
	
	public List<UserTotalrecords> findList(UserTotalrecords userTotalrecords) {
		return super.findList(userTotalrecords);
	}
	
	public Page<UserTotalrecords> findPage(Page<UserTotalrecords> page, UserTotalrecords userTotalrecords) {
		return super.findPage(page, userTotalrecords);
	}
	
	@Transactional(readOnly = false)
	public void save(UserTotalrecords userTotalrecords) {
		super.save(userTotalrecords);
	}
	
	@Transactional(readOnly = false)
	public void delete(UserTotalrecords userTotalrecords) {
		super.delete(userTotalrecords);
	}
	@Transactional(readOnly = false)
	public void inserti(UserTotalrecords userTotalrecords) {
		userTotalrecords.preInsert();
		dao.inserti(userTotalrecords);
	}
	public List<UserTotalrecords> getList(UserTotalrecords userTotalrecords) {
		return dao.getList(userTotalrecords);
	}
	public 	 List<Map<String, Object>>  toSum(UserTotalrecords usertotalrecords) {
		return dao.toSum(usertotalrecords);
	}
	
}