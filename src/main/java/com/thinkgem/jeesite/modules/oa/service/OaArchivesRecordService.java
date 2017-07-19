/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.oa.entity.OaArchivesRecord;
import com.thinkgem.jeesite.modules.oa.dao.OaArchivesRecordDao;

/**
 * 公司发文记录Service
 * @author niting
 * @version 2016-12-22
 */
@Service
@Transactional(readOnly = true)
public class OaArchivesRecordService extends CrudService<OaArchivesRecordDao, OaArchivesRecord> {

	public OaArchivesRecord get(String id) {
		return super.get(id);
	}
	
	public List<OaArchivesRecord> findList(OaArchivesRecord oaArchivesRecord) {
		return super.findList(oaArchivesRecord);
	}
	
	public Page<OaArchivesRecord> findPage(Page<OaArchivesRecord> page, OaArchivesRecord oaArchivesRecord) {
		return super.findPage(page, oaArchivesRecord);
	}
	
	@Transactional(readOnly = false)
	public void save(OaArchivesRecord oaArchivesRecord) {
		super.save(oaArchivesRecord);
	}
	
	@Transactional(readOnly = false)
	public void delete(OaArchivesRecord oaArchivesRecord) {
		super.delete(oaArchivesRecord);
	}
	
}