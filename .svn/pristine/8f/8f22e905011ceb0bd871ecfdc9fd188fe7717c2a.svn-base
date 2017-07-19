/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.service.fixedassets;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.oa.dao.fixedassets.AssetsEquipmentDao;
import com.thinkgem.jeesite.modules.oa.entity.fixedassets.AssetsEquipment;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;

/**
 * 资产设备Service
 * @author zf
 * @version 2016-11-25
 */
@Service
@Transactional(readOnly = true)
public class AssetsEquipmentService extends CrudService<AssetsEquipmentDao, AssetsEquipment> {

	public AssetsEquipment get(String id) {
		return super.get(id);
	}
	
	public List<AssetsEquipment> findList(AssetsEquipment assetsEquipment) {
		return super.findList(assetsEquipment);
	}
	
	public Page<AssetsEquipment> findPage(Page<AssetsEquipment> page, AssetsEquipment assetsEquipment)
	{
		assetsEquipment.setPage(page);
		
		page.setList(dao.findList(assetsEquipment));
		
		return page;
	}
	
	@Transactional(readOnly = false)
	public void save(AssetsEquipment assetsEquipment) {
		super.save(assetsEquipment);
	}
	
	@Transactional(readOnly = false)
	public void delete(AssetsEquipment assetsEquipment) {
		super.delete(assetsEquipment);
	}
	
	public List<String> findDeviceID(String assetsId, Integer amount)
	{
		return dao.findDeviceID(assetsId, amount);
	}
	
	/**
	 * 批量更新设备状态
	 * @param params
	 */
	@Transactional(readOnly = false)
	public void updateCondition(String type, String staff, List<String> ids)
	{
		 Map<String, Object> params = new HashMap<String, Object>();
		 
		 params.put("type", type);
		 
		 params.put("ids", ids);
		 
		 params.put("staff", staff);
		 
		 dao.updateCondition(params);
	}
	
	@Transactional(readOnly = false)
	public void updateConditionOne(String type, String id)
	{
		dao.updateConditionOne(type, id);
	}
	
	/**
	 * 根据资产表id和领用数量查询设备表主键
	 * @param assetsId
	 * @param amount
	 * @return
	 */
	public List<String> findIdByAssetsId(String assetsId, Integer amount)
	{
		return dao.findIdByAssetsId(assetsId,amount);
	}
	
	/**
	 * 根据设备编号修改使用人
	 * @param staff
	 * @param deviceId
	 */
	@Transactional(readOnly = false)
	public void updateStaff(String staff, String deviceId, Date time)
	{
		dao.updateStaff(staff, deviceId, time);
	}
	
	/**
	 * 根据设备编号修改使用人
	 * @param staff
	 * @param deviceId
	 */
	@Transactional(readOnly = false)
	public void updateStaffById(String staff, String equId, Date time)
	{
		dao.updateStaffById(staff, equId, time);
	}
	
	/**
	 * 根据设备id更新状态
	 * @param type
	 * @param deviceID
	 */
	@Transactional(readOnly = false)
	public void updateConditionByDeviceID(String type, String staff, String deviceID)
	{
		dao.updateConditionByDeviceID(type, staff, deviceID);
	}
	
	/**
	 * 调拨方法，更新申请人和申请时间
	 * @param id
	 */
	@Transactional(readOnly = false)
	public void allocation(String id, String userId)
	{
		AssetsEquipment assetsEquipment = get(id);
		
		assetsEquipment.setEquStaff(UserUtils.get(userId).getName());
		
		assetsEquipment.setClaimTime(new Date());
		
		super.save(assetsEquipment);
	}
}