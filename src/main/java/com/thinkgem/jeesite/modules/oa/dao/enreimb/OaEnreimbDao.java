/**
 * Copyright &copy; 2012-2025 <a href="https://www.chuyutech.com">JeeCY</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.dao.enreimb;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.oa.entity.OaUsecar;
import com.thinkgem.jeesite.modules.oa.entity.enreimb.OaEnreimb;

/**
 * 招待费报销申请DAO接口
 * @author niting
 * @version 2017-04-28
 */
@MyBatisDao
public interface OaEnreimbDao extends CrudDao<OaEnreimb> {
	OaEnreimb getByProcInsId(String procInsId);
}