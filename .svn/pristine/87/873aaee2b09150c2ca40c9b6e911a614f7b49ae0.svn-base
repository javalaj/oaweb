/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.service.project;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.oa.entity.project.OaProjectMember;
import com.thinkgem.jeesite.modules.oa.dao.project.OaProjectMemberDao;

/**
 * 项目成员管理Service
 * @author 李廷龙
 * @version 2017-02-22
 */
@Service
@Transactional(readOnly = true)
public class OaProjectMemberService extends CrudService<OaProjectMemberDao, OaProjectMember> {

	public OaProjectMember get(String id) {
		return super.get(id);
	}
	
	public List<OaProjectMember> findList(OaProjectMember oaProjectMember) {
		return super.findList(oaProjectMember);
	}
	
	public Page<OaProjectMember> findPage(Page<OaProjectMember> page, OaProjectMember oaProjectMember) {
		return super.findPage(page, oaProjectMember);
	}
	
	@Transactional(readOnly = false)
	public void save(OaProjectMember oaProjectMember) {
		super.save(oaProjectMember);
	}
	
	@Transactional(readOnly = false)
	public void delete(OaProjectMember oaProjectMember) {
		super.delete(oaProjectMember);
	}
	
}