/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.dao.filling;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.oa.entity.filling.OaFilling;

/**
 * 人事部归档DAO接口
 * 
 * @author lzx
 * @version 2016-11-23
 */
@MyBatisDao
public interface OaFillingDao extends CrudDao<OaFilling> {
	List<OaFilling> findBySame(@Param("page") Page<OaFilling> page, @Param("type") String type,
			@Param("updateName") String updateName, @Param("createName") String createName,
			@Param("begindate") Date begindate, @Param("enddate") Date enddate,
			@Param("DEL_FLAG_NORMAL") String DEL_FLAG_NORMAL, @Param("dbName") String dbName);
}