/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.dao.sign;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.oa.entity.OaGoout;
import com.thinkgem.jeesite.modules.oa.entity.sign.OaSign;

/**
 * 签报DAO接口
 * @author cz
 * @version 2016-12-20
 */
@MyBatisDao
public interface OaSignDao extends CrudDao<OaSign> {
	OaSign getByProcInsId(String procInsId);
}