/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.service.perishableproducts;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.oa.dao.perishableproducts.ApplyDao;
import com.thinkgem.jeesite.modules.oa.entity.perishableproducts.Apply;

/**
 * 易耗品增删改查Service
 * @author zf
 * @version 2016-11-08
 */
@Service
@Transactional(readOnly = true)
public class ApplyService extends CrudService<ApplyDao, Apply> {

	public Apply get(String id) {
		return super.get(id);
	}
	
	public List<Apply> findList(Apply apply) {
		return super.findList(apply);
	}
	
	public Page<Apply> findPage(Page<Apply> page, Apply apply) {
		return super.findPage(page, apply);
	}
	
	@Transactional(readOnly = false)
	public void save(Apply apply) {
		super.save(apply);
	}
	
	@Transactional(readOnly = false)
	public void delete(Apply apply) {
		super.delete(apply);
	}
	
}