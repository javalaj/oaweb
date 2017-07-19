/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.oa.entity.Supmanagement;
import com.thinkgem.jeesite.modules.oa.dao.SupmanagementDao;

/**
 * 供应商管理Service
 * @author niting
 * @version 2016-11-07
 */
@Service
@Transactional(readOnly = true)
public class SupmanagementService extends CrudService<SupmanagementDao, Supmanagement> {

	public Supmanagement get(String id) {
		return super.get(id);
	}
	
	public List<Supmanagement> findList(Supmanagement supmanagement) {
		return super.findList(supmanagement);
	}
	
	public Page<Supmanagement> findPage(Page<Supmanagement> page, Supmanagement supmanagement) {
		return super.findPage(page, supmanagement);
	}
	
	@Transactional(readOnly = false)
	public void save(Supmanagement supmanagement) {
		super.save(supmanagement);
	}
	
	@Transactional(readOnly = false)
	public void delete(Supmanagement supmanagement) {
		super.delete(supmanagement);
	}
	
}