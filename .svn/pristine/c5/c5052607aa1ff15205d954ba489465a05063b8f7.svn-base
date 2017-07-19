package com.thinkgem.jeesite.common.utils;

import com.thinkgem.jeesite.modules.sys.dao.OfficeDao;
import com.thinkgem.jeesite.modules.sys.entity.Office;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;

public class ActUtil {
	private static OfficeDao officeDao = SpringContextHolder.getBean(OfficeDao.class);
	/**
	 * 返回各部门领导的登录名
	 * 
	 * @param officeId
	 *           
	 * @return 返回部门领导的loginname
	 */
	public static String getLeader(String officeId) {
	if(officeId!=null){
		Office office=officeDao.get(officeId);
		String leader=UserUtils.get(office.getPrimaryPerson().getId()).getLoginName();
		return leader;
	}
	return "jack";
		
	}
}
