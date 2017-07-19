/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.oa.entity.CarManagement;
import com.thinkgem.jeesite.modules.oa.entity.OaUsecar;

/**
 * 车辆管理DAO接口
 * @author niting
 * @version 2016-11-17
 */
@MyBatisDao
public interface CarManagementDao extends CrudDao<CarManagement> {
	List<CarManagement> getByState();
	CarManagement getByPlateNum(@Param(value="platenum")String platenum);
}