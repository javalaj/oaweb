/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.service.project;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.oa.entity.project.OaProjectChange;
import com.thinkgem.jeesite.modules.oa.dao.project.OaProjectChangeDao;

/**
 * 项目成员管理Service
 * @author 李廷龙
 * @version 2017-02-22
 */
@Service
@Transactional(readOnly = true)
public class OaProjectChangeService extends CrudService<OaProjectChangeDao, OaProjectChange> {

	public OaProjectChange get(String id) {
		return super.get(id);
	}
	
	public List<OaProjectChange> findList(OaProjectChange oaProjectChange) {
		return super.findList(oaProjectChange);
	}
	
	public Page<OaProjectChange> findPage(Page<OaProjectChange> page, OaProjectChange oaProjectChange) {
		return super.findPage(page, oaProjectChange);
	}
	
	@Transactional(readOnly = false)
	public void save(OaProjectChange oaProjectChange) {
		super.save(oaProjectChange);
	}
	
	@Transactional(readOnly = false)
	public void delete(OaProjectChange oaProjectChange) {
		super.delete(oaProjectChange);
	}
	
}