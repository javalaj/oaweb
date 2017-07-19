/**
 * Copyright &copy; 2012-2025 <a href="https://www.chuyutech.com">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.service.newscenter;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.oa.entity.newscenter.OaNewsColumn;
import com.thinkgem.jeesite.modules.oa.dao.newscenter.OaNewsColumnDao;

/**
 * 栏目管理Service
 * @author zf
 * @version 2017-05-24
 */
@Service
@Transactional(readOnly = true)
public class OaNewsColumnService extends CrudService<OaNewsColumnDao, OaNewsColumn> {

	public OaNewsColumn get(String id) {
		return super.get(id);
	}
	
	public List<OaNewsColumn> findList(OaNewsColumn oaNewsColumn) {
		return super.findList(oaNewsColumn);
	}
	
	public Page<OaNewsColumn> findPage(Page<OaNewsColumn> page, OaNewsColumn oaNewsColumn) {
		return super.findPage(page, oaNewsColumn);
	}
	
	@Transactional(readOnly = false)
	public void save(OaNewsColumn oaNewsColumn) {
		super.save(oaNewsColumn);
	}
	
	@Transactional(readOnly = false)
	public void delete(OaNewsColumn oaNewsColumn) {
		super.delete(oaNewsColumn);
	}
	
}