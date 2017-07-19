/**
 * Copyright &copy; 2012-2025 <a href="https://www.chuyutech.com">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.service.salarybillsend;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.oa.entity.salarybillsend.OaSalaryDetails;
import com.thinkgem.jeesite.modules.oa.dao.salarybillsend.OaSalaryDetailsDao;

/**
 * 工资条发送详情Service
 * @author zf
 * @version 2017-05-08
 */
@Service
@Transactional(readOnly = true)
public class OaSalaryDetailsService extends CrudService<OaSalaryDetailsDao, OaSalaryDetails> {

	public OaSalaryDetails get(String id) {
		return super.get(id);
	}
	
	public List<OaSalaryDetails> findList(OaSalaryDetails oaSalaryDetails) {
		return super.findList(oaSalaryDetails);
	}
	
	public Page<OaSalaryDetails> findPage(Page<OaSalaryDetails> page, OaSalaryDetails oaSalaryDetails) {
		return super.findPage(page, oaSalaryDetails);
	}
	
	@Transactional(readOnly = false)
	public void save(OaSalaryDetails oaSalaryDetails) {
		super.save(oaSalaryDetails);
	}
	
	@Transactional(readOnly = false)
	public void delete(OaSalaryDetails oaSalaryDetails) {
		super.delete(oaSalaryDetails);
	}
	
}