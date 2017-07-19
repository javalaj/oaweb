/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.service.fixedassets;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.oa.entity.fixedassets.PerishableApply;
import com.thinkgem.jeesite.modules.oa.dao.fixedassets.PerishableApplyDao;

/**
 * 低值易耗品申请Service
 * @author 低值易耗品申请
 * @version 2016-12-02
 */
@Service
@Transactional(readOnly = true)
public class PerishableApplyService extends CrudService<PerishableApplyDao, PerishableApply> {

	public PerishableApply get(String id) {
		return super.get(id);
	}
	
	public List<PerishableApply> findList(PerishableApply perishableApply) {
		return super.findList(perishableApply);
	}
	
	public Page<PerishableApply> findPage(Page<PerishableApply> page, PerishableApply perishableApply) {
		return super.findPage(page, perishableApply);
	}
	
	@Transactional(readOnly = false)
	public void save(PerishableApply perishableApply) {
		super.save(perishableApply);
	}
	
	@Transactional(readOnly = false)
	public void delete(PerishableApply perishableApply) {
		super.delete(perishableApply);
	}
	
}