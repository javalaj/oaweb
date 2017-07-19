/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.dao.fixedassets;

import java.util.Date;
import java.util.List;
import java.util.Map;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.oa.entity.fixedassets.AssetsEquipment;


/**
 * 资产设备DAO接口
 * @author zf
 * @version 2016-11-25
 */
@MyBatisDao
public interface AssetsEquipmentDao extends CrudDao<AssetsEquipment> {
	
	/**
	 * 根据资产表id和领用数量查询设备编号
	 * @param assetsId
	 * @param amount
	 * @return
	 */
	public List<String> findDeviceID(String assetsId, Integer amount);
	
	/**
	 * 根据资产表id和领用数量查询设备表主键
	 * @param assetsId
	 * @param amount
	 * @return
	 */
	public List<String> findIdByAssetsId(String assetsId, Integer amount);
	
	/**
	 * 批量更新设备状态
	 * @param params
	 */
	public void updateCondition(Map<String, Object> params);
	
	/**
	 * 更新设备状态
	 */
	public void updateConditionOne(String type, String id);
	
	/**
	 * 根据设备编号修改使用人
	 * @param staff
	 * @param deviceId
	 */
	public void updateStaff(String staff, String deviceId, Date time);
	
	/**
	 * 根据设备id更新状态
	 * @param type
	 * @param deviceID
	 */
	public void updateConditionByDeviceID(String type, String staff, String deviceID);

	public void updateStaffById(String staff, String equId, Date time);
	

}