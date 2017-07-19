/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.dao;

import java.util.List;

import com.thinkgem.jeesite.common.persistence.TreeDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.oa.entity.OaDocmanage;

/**
 * 栏目管理DAO接口
 * @author liaijun
 * @version 2016-11-03
 */
@MyBatisDao
public interface OaDocmanageDao extends TreeDao<OaDocmanage> {
	public List<OaDocmanage> getPid(String pid);
	
}