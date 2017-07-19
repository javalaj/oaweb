/**
 * Copyright &copy; 2012-2025 <a href="https://www.chuyutech.com">JeeCY</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.dao.mail;

import org.apache.ibatis.annotations.Param;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.oa.entity.mail.OaMail;

/**
 * 站内邮件（主表）DAO接口
 * 
 * @author liuxin
 * @version 2017-04-27
 */
@MyBatisDao
public interface OaMailDao extends CrudDao<OaMail> {
	/**是否是当前人处理*/
	public Integer isdeal(@Param("userid") String userid, @Param("mailid") String mailid);

	/** 修改邮件状态-邮件回复完毕时触发 */
	public void updateIsdraft(OaMail oaMail);
}