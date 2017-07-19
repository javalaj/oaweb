/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.dao.staff;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.oa.entity.sign.OaSign;
import com.thinkgem.jeesite.modules.oa.entity.staff.OaStaffupdated;

/**
 * 人员增补DAO接口
 * @author cz
 * @version 2017-01-12
 */
@MyBatisDao
public interface OaStaffupdatedDao extends CrudDao<OaStaffupdated> {
	OaStaffupdated getByProcInsId(String procInsId);
	
	void Deemandupdate(OaStaffupdated oaStaffupdated);
	void Personnelmattersupdate(OaStaffupdated oaStaffupdated);
	void Bossupdate(OaStaffupdated oaStaffupdated);
	
}