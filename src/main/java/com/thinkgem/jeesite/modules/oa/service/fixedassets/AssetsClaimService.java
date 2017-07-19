package com.thinkgem.jeesite.modules.oa.service.fixedassets;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.activiti.engine.task.Task;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.common.utils.DateUtils;
import com.thinkgem.jeesite.modules.act.service.ActTaskService;
import com.thinkgem.jeesite.modules.oa.dao.fixedassets.AssetsClaimDao;
import com.thinkgem.jeesite.modules.oa.entity.fixedassets.AssetsClaim;
import com.thinkgem.jeesite.modules.oa.entity.fixedassets.AssetsEquipment;
import com.thinkgem.jeesite.modules.oa.entity.fixedassets.AssetsSerial;
import com.thinkgem.jeesite.modules.oa.entity.fixedassets.FixedAssets;
import com.thinkgem.jeesite.modules.oa.service.flowback.OaFlowBackService;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;
import com.thinkgem.jeesite.modules.sys.utils.WorkflowUtils;

@Service
@Transactional(readOnly = true)
public class AssetsClaimService extends CrudService<AssetsClaimDao, AssetsClaim>
{
	
	public static final String WORKFLOW_NAME = "固定资产申请";
	
	public static final String WORKFLOW_URL = "@@proNotify@@/oa/a/fixedassets/assetsSerial/exam?id=";
	
	public Page<AssetsClaim> findPage(Page<AssetsClaim> page, AssetsClaim assetsClaim)
	{
		assetsClaim.setPage(page);
		
		page.setList(dao.findList(assetsClaim));
		
		return page;
	}
	
	public AssetsClaim get(String id)
	{
		return super.get(id);
	}
	
	/**
	 * 保存资产使用情况,结束流程
	 * @param assetsSerial
	 * @param claimNumber
	 * @param assetsId
	 * @param operator
	 * @param remarks
	 */
	@Transactional(readOnly = false)
	public void save(AssetsSerial assetsSerial, String[] claimNumber, String[] equId,
			String[] assetsId, String[] operator, String remarks,
			String[] phone, String[] address)
	{
		for (int i = 0;i < claimNumber.length;i++ )
		{
			AssetsClaim obj = new AssetsClaim();
			
			FixedAssets fixedAssets = new FixedAssets();
			
			fixedAssets.setId(assetsId[i]);
			
			obj.setPhone(phone==null || (phone!=null&&phone.length==0) ? "" : phone[i]);
			
			obj.setAddress(address==null || (address!=null&&address.length==0) ? "" : address[i]);
			
			obj.setType(assetsSerial.getType());
			
			obj.setRemarks(remarks);
			
			obj.setOperator(UserUtils.getUser().getId());
			
			obj.setClaimTime(new Date());
			
			obj.setClaimant(UserUtils.get(operator[i]).getName());
			
			obj.setFixedAssets(fixedAssets);
			
			obj.setClaimNumber(claimNumber[i]);
			
			super.save(obj);
			
			assetsEquipmentService.updateStaffById(operator[i], equId[i], new Date());
			
			AssetsEquipment  assetsEquipment = assetsEquipmentService.get(equId[i]);
			
			assetsEquipment.setCondition(assetsSerial.getType());
			
			assetsEquipmentService.save(assetsEquipment);
		}
		
		List<Task> list = actTaskService.getProcessEngine().getTaskService().createTaskQuery().processInstanceId(assetsSerial.getProcInsId())
				.taskAssignee(UserUtils.getUser().getLoginName()).list();
		
		if (list.size() > 0)
		{
			actTaskService.complete(list.get(0).getId(),
					assetsSerial.getProcInsId(), "完成", null);
			
			// 流程撤回操作数据设置
			oaFlowBackService.saveNULL(assetsSerial.getProcInsId());
			
			String notifyTitle = "您提交的" + WORKFLOW_NAME + "流程" + "【" + DateUtils.getDate() + "】" 
					+  "已被【" + UserUtils.getUser().getName() + "】办结";
					
			String content = WORKFLOW_URL + assetsSerial.getId();
			
			WorkflowUtils.sendOaNotify(notifyTitle,content,assetsSerial.getCreateBy().getId());
		}
	}
	
	@Transactional(readOnly = false)
	public void saveClaim(AssetsClaim assetsClaim)
	{
		super.save(assetsClaim);
	}
	
	/**
	 * 根据资产设备编号查询设备的使用记录
	 * @param id
	 * @return
	 */
	public List<AssetsClaim> findHistoryBydevice(String id)
	{
		return dao.findHistoryBydevice(id);
	}
	
	/**
	 * 归还设备
	 * @param deviceId
	 */
	@Transactional(readOnly = false)
	public void returned(String id)
	{
		AssetsClaim obj = new AssetsClaim();
		
		AssetsEquipment assetsEquipment = assetsEquipmentService.get(id);//当前设备
		
		obj.setClaimant(UserUtils.getUser().getName());
		
		obj.setClaimNumber(assetsEquipment.getSerialNumber());
		
		obj.setClaimTime(new Date());
		
		obj.setFixedAssets(assetsEquipment.getFixedAssets());
		
		obj.setType("归还");
		
		obj.setRemarks("");
		
		obj.setOperator(UserUtils.getUser().getId());
		
		super.save(obj);
		
		//设备归还到库存,当前使用人制空
		assetsEquipmentService.updateConditionByDeviceID("在库", 
				"",assetsEquipment.getSerialNumber());
		
		//资产表中的库存数量增加1
		 /*FixedAssets fixedAssets = fixedAssetsService.get(obj
				 .getFixedAssets().getId());
		 
		 fixedAssets.setAmount(fixedAssets.getAmount() + 1);
		 
		 fixedAssetsService.update(fixedAssets);*/
	}
	
	@Transactional(readOnly = false)
	public void delete(AssetsClaim assetsClaim)
	{
		super.delete(assetsClaim);
	}
	
	/**
	 * 调拨方法，更新申请人和申请时间
	 * @param id
	 */
	@Transactional(readOnly = false)
	public void allocation(String id, String userId)
	{
		AssetsClaim assetsClaim = get(id);
		
		assetsClaim.setClaimant(UserUtils.get(userId).getName());
		
		assetsClaim.setClaimTime(new Date());
		
		super.save(assetsClaim);
	}
	
	@Autowired
	private ActTaskService actTaskService;
	
	@Autowired
	private AssetsEquipmentService assetsEquipmentService;
	
	@Autowired
	private OaFlowBackService oaFlowBackService;// 流程撤回业务service
	
	public List<Map<String,Object>> getAll(HashMap<String,String> paramMap){
		return dao.getAll(paramMap);
	}
}
