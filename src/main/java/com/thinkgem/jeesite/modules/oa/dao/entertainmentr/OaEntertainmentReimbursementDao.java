/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.dao.entertainmentr;

import java.util.List;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.oa.entity.entertainmentr.OaEntertainmentReimbursement;
import com.thinkgem.jeesite.modules.oa.entity.publicprivatecar.OaPublicPrivateCars;

/**
 * 招待费DAO接口
 * @author niting
 * @version 2017-01-12
 */
@MyBatisDao
public interface OaEntertainmentReimbursementDao extends CrudDao<OaEntertainmentReimbursement> {
	OaEntertainmentReimbursement getByProcInsId(String procInsId);
	List<OaEntertainmentReimbursement> getOaEnterBySameid(String sameid);
}