/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.service.TreeService;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.oa.dao.CyTspOaAddressGroupDao;
import com.thinkgem.jeesite.modules.oa.entity.CyTspOaAddressGroup;

/**
 * 分组Service
 * 
 * @author cz
 * @version 2016-11-04
 */
@Service
@Transactional(readOnly = true)
public class CyTspOaAddressGroupService extends TreeService<CyTspOaAddressGroupDao, CyTspOaAddressGroup> {
		
	@Autowired
	CyTspOaAddressGroupDao dao;

	// 根据用户ID查询分组
	public List<CyTspOaAddressGroup> getCyTspOaAddressGroup(String userId) {
		return dao.getCyTspOaAddressGroup(userId);
	}

	// 根据用户ID查询分组
	public List<CyTspOaAddressGroup> getGroupName(CyTspOaAddressGroup cyTspOaAddressGroup) {
		return dao.getGroupName(cyTspOaAddressGroup);
	}
	// 新建分组
	@Transactional(readOnly = false)
	public void insertGroup(String userId, String name) {
		dao.insertGroup(userId, name);
	}

	public List<CyTspOaAddressGroup> findList(CyTspOaAddressGroup cyTspOaAddressGroup) {
		if (StringUtils.isNotBlank(cyTspOaAddressGroup.getParentIds())) {
			cyTspOaAddressGroup.setParentIds("," + cyTspOaAddressGroup.getParentIds() + ",");
		}
		cyTspOaAddressGroup.setParentIds(cyTspOaAddressGroup.getParentIds() + "%");
		return super.findList(cyTspOaAddressGroup);
	}

	@Transactional(readOnly = false)
	public void updateGroup(CyTspOaAddressGroup cyTspOaAddressGroup) {
		dao.updateGroup(cyTspOaAddressGroup);
	}

	@Transactional(readOnly = false)
	public void deleteGroup(CyTspOaAddressGroup cyTspOaAddressGroup) {
		dao.deleteGroup(cyTspOaAddressGroup);
	}
}