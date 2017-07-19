/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.oa.entity.OaTask;
import com.thinkgem.jeesite.modules.oa.dao.OaTaskDao;

/**
 * 我的任务Service
 * @author liaijun
 * @version 2016-11-28
 */
@Service
@Transactional(readOnly = true)
public class OaTaskService extends CrudService<OaTaskDao, OaTask> {

	
	public OaTask get(String id) {
		OaTask oaTask = super.get(id);
		return oaTask;
	}
	
	public List<OaTask> findList(OaTask oaTask) {
		return super.findList(oaTask);
	}
	
	public Page<OaTask> findPage(Page<OaTask> page, OaTask oaTask) {
		return super.findPage(page, oaTask);
	}
	
	@Transactional(readOnly = false)
	public void save(OaTask oaTask) {
		super.save(oaTask);
	}
	
	@Transactional(readOnly = false)
	public void delete(OaTask oaTask) {
		super.delete(oaTask);
	}
	
}