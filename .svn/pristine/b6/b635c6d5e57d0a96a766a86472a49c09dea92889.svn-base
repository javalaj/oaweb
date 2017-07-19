/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.oa.entity.OaContract;
import com.thinkgem.jeesite.modules.oa.dao.OaContractDao;

/**
 * 合同Service
 * @author liaijun
 * @version 2016-11-26
 */
@Service
@Transactional(readOnly = true)
public class OaContractService extends CrudService<OaContractDao, OaContract> {

	public OaContract get(String id) {
		return super.get(id);
	}
	
	public List<OaContract> findList(OaContract oaContract) {
		return super.findList(oaContract);
	}
	
	public Page<OaContract> findPage(Page<OaContract> page, OaContract oaContract) {
		return super.findPage(page, oaContract);
	}
	
	@Transactional(readOnly = false)
	public void save(OaContract oaContract) {
		super.save(oaContract);
	}
	
	@Transactional(readOnly = false)
	public void delete(OaContract oaContract) {
		super.delete(oaContract);
	}
	
}