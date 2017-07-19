/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.oa.entity.CarManagement;
import com.thinkgem.jeesite.modules.oa.entity.OaUsecar;
import com.thinkgem.jeesite.modules.oa.dao.CarManagementDao;

/**
 * 车辆管理Service
 * @author niting
 * @version 2016-11-17
 */
@Service
@Transactional(readOnly = true)
public class CarManagementService extends CrudService<CarManagementDao, CarManagement> {

	public CarManagement get(String id) {
		return super.get(id);
	}
	
	public List<CarManagement> findList(CarManagement carManagement) {
		return super.findList(carManagement);
	}
	
	public Page<CarManagement> findPage(Page<CarManagement> page, CarManagement carManagement) {
		return super.findPage(page, carManagement);
	}
	
	@Transactional(readOnly = false)
	public void save(CarManagement carManagement) {
		super.save(carManagement);
	}
	
	@Transactional(readOnly = false)
	public void delete(CarManagement carManagement) {
		super.delete(carManagement);
	}
	
	
	public List<CarManagement> getByState(){
		return dao.getByState();
	}

	public CarManagement getByPlateNum(String platenum){
		return dao.getByPlateNum(platenum);
	}
}