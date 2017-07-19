/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.mobile.modules.oa.service.leaveMore;

import java.util.ArrayList;
import java.util.Date;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.mobile.modules.oa.dao.leaveMore.LeaveMoreDao;
import com.thinkgem.jeesite.mobile.modules.oa.entity.leaveMore.LeaveMore;

/**
 * 查询考情单据Service
 * 
 * @author liuxin
 * @version 2016-11-18
 */
@Service
@Transactional(readOnly = true)
public class LeaveMoreService extends CrudService<LeaveMoreDao, LeaveMore> {
	/**
	 * 
	 * 手机端，查询考情单据.
	 * 
	 * */
	public ArrayList<LeaveMore> getMoreByType(Date querydate, String type, String officeid) {
		Date querydate2=null;
		if(querydate != null){
			querydate2=new Date(querydate.getTime()+24*60*60*1000);
		}
		return dao.getMoreByType(querydate, type, officeid,querydate2);
	}

}