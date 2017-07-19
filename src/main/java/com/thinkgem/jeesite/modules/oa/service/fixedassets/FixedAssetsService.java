/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.service.fixedassets;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.common.utils.PingYinUtil;
import com.thinkgem.jeesite.modules.oa.dao.fixedassets.FixedAssetsDao;
import com.thinkgem.jeesite.modules.oa.entity.fixedassets.AssetVo;
import com.thinkgem.jeesite.modules.oa.entity.fixedassets.AssetsEquipment;
import com.thinkgem.jeesite.modules.oa.entity.fixedassets.FixedAssets;
import com.thinkgem.jeesite.modules.sys.utils.OrdersUtils;

/**
 * 固定资产管理Service
 * @author zf
 * @version 2016-11-15
 */
@Service
@Transactional(readOnly = true)
public class FixedAssetsService extends CrudService<FixedAssetsDao, FixedAssets> {

	public FixedAssets get(String id) {
		return super.get(id);
	}
	
	public List<FixedAssets> findList(FixedAssets fixedAssets) {
		return super.findList(fixedAssets);
	}
	
	public Page<FixedAssets> findPage(Page<FixedAssets> page, FixedAssets fixedAssets) {
		return super.findPage(page, fixedAssets);
	}
	
	@Transactional(readOnly = false)
	public void save(FixedAssets fixedAssets) {
		
		super.save(fixedAssets);
		
		Integer amount = fixedAssets.getAmount();
		
		String category = getCategory(fixedAssets.getAssetsCategory());
		
		for (int i = 0;i < amount;i++)
		{
			AssetsEquipment obj = new AssetsEquipment();
			
			obj.setAssetsNumber(fixedAssets.getId());
			
			String serialNumber = OrdersUtils.getGenerateOrderNo8(category + "-");
			
			obj.setSerialNumber(serialNumber);
			
			obj.setRemarks("");
			
			obj.setCondition("在库");	//默认库存状态
			
			assetsEquipmentService.save(obj);
		}
	}
	
	@Transactional(readOnly = false)
	public void update(FixedAssets fixedAssets)
	{
		super.save(fixedAssets);
	}
	
	@Transactional(readOnly = false)
	public void delete(FixedAssets fixedAssets) {
		super.delete(fixedAssets);
	}
	
	public List<AssetVo> findAssetList(String condition)
	{
		return fad.findAssetList(condition);
	}
	
	public List<FixedAssets> findApplyList(List<String> ids)
	{
		return fad.findApplyList(ids);
	}
	
	public String getBrand(String value)
	{
		return PingYinUtil.getPinYin(dao.findBrand(value));
	}
	
	public String getCategory(String value)
	{
		return PingYinUtil.getPinYin(dao.findCategory(value));
	}
	
	@Autowired
	private FixedAssetsDao fad;
	
	@Autowired
	private AssetsEquipmentService assetsEquipmentService;
}