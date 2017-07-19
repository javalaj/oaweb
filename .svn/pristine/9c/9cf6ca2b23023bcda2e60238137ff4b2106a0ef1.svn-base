/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.oa.entity.OaReceiveFile;

/**
 * 公司收文登记流程DAO接口
 * 
 * @author liuxin
 * @version 2016-12-20
 */
@MyBatisDao
public interface OaReceiveFileDao extends CrudDao<OaReceiveFile> {
	OaReceiveFile getByProcInsId(String procInsId);

	String findProcDefIdByKey(String key);
}