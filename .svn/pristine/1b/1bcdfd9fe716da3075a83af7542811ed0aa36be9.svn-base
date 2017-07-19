/**
 * Copyright &copy; 2012-2025 <a href="https://www.chuyutech.com">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.service.newscenter;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.oa.dao.newscenter.OaNewsDao;
import com.thinkgem.jeesite.modules.oa.entity.newscenter.OaNews;

/**
 * 新闻中心Service
 * @author zf
 * @version 2017-05-24
 */
@Service
@Transactional(readOnly = true)
public class OaNewsService extends CrudService<OaNewsDao, OaNews> {

	public OaNews get(String id) {
		return super.get(id);
	}
	
	public List<OaNews> findList(OaNews oaNews) {
		return super.findList(oaNews);
	}
	
	public Page<OaNews> findPage(Page<OaNews> page, OaNews oaNews) {
		return super.findPage(page, oaNews);
	}
	
	@Transactional(readOnly = false)
	public void save(OaNews oaNews) {
		super.save(oaNews);
	}
	
	@Transactional(readOnly = false)
	public void delete(OaNews oaNews) {
		super.delete(oaNews);
	}
	
	@Transactional(readOnly = false)
	public void update(OaNews oaNews) 
	{
		dao.update(oaNews);
	}
}