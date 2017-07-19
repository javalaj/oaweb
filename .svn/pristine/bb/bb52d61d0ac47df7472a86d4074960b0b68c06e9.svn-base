/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.service;

import java.util.Date;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.oa.dao.OaFileQueryDao;
import com.thinkgem.jeesite.modules.oa.entity.OaFileQuery;

/**
 * 公文查询Service
 * 
 * @author liuxin
 * @version 2016-12-20
 */
@Service
@Transactional(readOnly = true)
public class OaFileQueryService extends CrudService<OaFileQueryDao, OaFileQuery> {
	@Override
	public Page<OaFileQuery> findPage(Page<OaFileQuery> page, OaFileQuery entity) {
		if (entity.getEndDate() != null) {
			long time = entity.getEndDate().getTime() + 86400000 - 1000;
			entity.setEndDate(new Date(time));
		}
		return super.findPage(page, entity);
	}
}