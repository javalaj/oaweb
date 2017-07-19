/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.dao.doc;

import org.apache.ibatis.annotations.Param;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.oa.entity.doc.OaDoc;

/**
 * 文档管理DAO接口
 * @author 李廷龙
 * @version 2017-02-28
 */
@MyBatisDao
public interface OaDocDao extends CrudDao<OaDoc> {
	
	public int deleteGroup(String groupId);
	
	public OaDoc getBy(@Param("id")String id,@Param("loanUserId")String loanUserId,@Param("DEL_FLAG_NORMAL")String DEL_FLAG_NORMAL);

	public int getOaDocListCount(OaDoc oaDoc);
}