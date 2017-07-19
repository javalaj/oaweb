/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.sys.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.service.TreeService;
import com.thinkgem.jeesite.modules.sys.dao.OfficeDao;
import com.thinkgem.jeesite.modules.sys.entity.Office;
import com.thinkgem.jeesite.modules.sys.entity.Role;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;

/**
 * 机构Service
 * 
 * @author ThinkGem
 * @version 2014-05-16
 */
@Service
@Transactional(readOnly = true)
public class OfficeService extends TreeService<OfficeDao, Office> {

	public List<Office> findAll() {
		return UserUtils.getOfficeList();
	}

	public List<Office> findList(Boolean isAll) {
		if (isAll != null && isAll) {
			return UserUtils.getOfficeAllList();
		} else {
			return UserUtils.getOfficeList();
		}
	}

	@Transactional(readOnly = true)
	public List<Office> findList(Office office) {
		if (office != null) {
			office.setParentIds(office.getParentIds() + "%");
			return dao.findByParentIdsLike(office);
		}
		return new ArrayList<Office>();
	}
	public List<Office> findByParentIdsplan(String id) {
		return dao.findByParentIdsplan(id);
	}
	/**
	 * 查询当前所在部门的所有子集
	 * 
	 */
	@Transactional(readOnly = true)
	public List<Office> findChildList(Office office) {
		boolean isWorklogManager = false;
		for (Role role : UserUtils.getUser().getRoleList()) {
			if (role.getEnname().equals("worklogManager")) {
				isWorklogManager = true;
				break;
			}
		}
		if (UserUtils.getUser().isAdmin() || isWorklogManager) {
			return findList(true);
		} else {
			if (office != null) {
				office.setParentIds("%," + office.getId() + "%");
				List<Office> list = new ArrayList<Office>();
				list = dao.findByParentIdsLike(office);
				if (list == null) {
					return new ArrayList<Office>();
				}
				list.add(0, UserUtils.getUser().getOffice());
				return list;
			}
		}
		return new ArrayList<Office>();
	}
	/**
	 * 查询当前所在部门的所有子集
	 * 无判断是不是属于日志专员
	 */
	@Transactional(readOnly = true)
	public List<Office> findWeekList(Office office) {
		boolean isWorklogManager = false;

		if (UserUtils.getUser().isAdmin() || isWorklogManager) {
			return findList(true);
		} else {
			if (office != null) {
				office.setParentIds("%," + office.getId() + "%");
				List<Office> list = new ArrayList<Office>();
				list = dao.findByParentIdsLike(office);
				if (list == null) {
					return new ArrayList<Office>();
				}
				list.add(0, UserUtils.getUser().getOffice());
				return list;
			}
		}
		return new ArrayList<Office>();
	}
	@Transactional(readOnly = false)
	public void save(Office office) {
		super.save(office);
		UserUtils.removeCache(UserUtils.CACHE_OFFICE_LIST);
	}

	@Transactional(readOnly = false)
	public void delete(Office office) {
		super.delete(office);
		UserUtils.removeCache(UserUtils.CACHE_OFFICE_LIST);
	}

	public Map<String, Object> findOfficeByUser(HashMap<String,String> paramMap){
		return dao.findOfficeByUser(paramMap);
	}
	
	public String findOfficeIdByName(String name){
		return dao.findOfficeIdByName(name);
	}
	
	public List<String> findOfficeIdByNameL(String name){
		return dao.findOfficeIdByNameL(name);
	}
}
