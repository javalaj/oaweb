/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.service.emp;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.oa.entity.emp.OaEmpOpinion;
import com.thinkgem.jeesite.modules.oa.dao.emp.OaEmpOpinionDao;

/**
 * 用户意见管理Service
 * @author 李廷龙
 * @version 2016-12-05
 */
@Service
@Transactional(readOnly = true)
public class OaEmpOpinionService extends CrudService<OaEmpOpinionDao, OaEmpOpinion> {

	public OaEmpOpinion get(String id) {
		return super.get(id);
	}
	
	public List<OaEmpOpinion> findList(OaEmpOpinion oaEmpOpinion) {
		return super.findList(oaEmpOpinion);
	}
	
	public Page<OaEmpOpinion> findPage(Page<OaEmpOpinion> page, OaEmpOpinion oaEmpOpinion) {
		return super.findPage(page, oaEmpOpinion);
	}
	
	@Transactional(readOnly = false)
	public void save(OaEmpOpinion oaEmpOpinion) {
		super.save(oaEmpOpinion);
	}
	
	@Transactional(readOnly = false)
	public void delete(OaEmpOpinion oaEmpOpinion) {
		super.delete(oaEmpOpinion);
	}
	
}