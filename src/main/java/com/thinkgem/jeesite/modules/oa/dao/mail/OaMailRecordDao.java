/**
 * Copyright &copy; 2012-2025 <a href="https://www.chuyutech.com">JeeCY</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.dao.mail;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.oa.entity.mail.OaMailRecord;

/**
 * 站内邮件（意见从表）DAO接口
 * @author liuxin
 * @version 2017-04-27
 */
@MyBatisDao
public interface OaMailRecordDao extends CrudDao<OaMailRecord> {
	
}