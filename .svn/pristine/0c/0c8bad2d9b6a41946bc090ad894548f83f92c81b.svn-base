/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.service.fixedassets;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.oa.entity.fixedassets.PerishableHistory;
import com.thinkgem.jeesite.modules.oa.dao.fixedassets.PerishableHistoryDao;

/**
 * 易耗品历史Service
 * @author zf
 * @version 2016-12-09
 */
@Service
@Transactional(readOnly = true)
public class PerishableHistoryService extends CrudService<PerishableHistoryDao, PerishableHistory> {

	public PerishableHistory get(String id) {
		return super.get(id);
	}
	
	public List<PerishableHistory> findList(PerishableHistory perishableHistory) {
		return super.findList(perishableHistory);
	}
	
	public Page<PerishableHistory> findPage(Page<PerishableHistory> page, PerishableHistory perishableHistory) {
		return super.findPage(page, perishableHistory);
	}
	
	@Transactional(readOnly = false)
	public void save(PerishableHistory perishableHistory) {
		super.save(perishableHistory);
	}
	
	@Transactional(readOnly = false)
	public void delete(PerishableHistory perishableHistory) {
		super.delete(perishableHistory);
	}
	
}