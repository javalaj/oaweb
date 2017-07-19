/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.dao.qualificationb;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.oa.entity.OaSealUse;
import com.thinkgem.jeesite.modules.oa.entity.qualificationb.OaQualificationb;

/**
 * 资质借用流程DAO接口
 * @author niting
 * @version 2017-01-09
 */
@MyBatisDao
public interface OaQualificationbDao extends CrudDao<OaQualificationb> {
	OaQualificationb getByProcInsId(String procInsId);
}