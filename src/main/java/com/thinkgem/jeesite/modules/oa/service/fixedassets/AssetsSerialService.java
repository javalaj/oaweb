/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.service.fixedassets;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.activiti.engine.task.Task;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.common.utils.IdGen;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.act.service.ActTaskService;
import com.thinkgem.jeesite.modules.oa.dao.fixedassets.AssetsSerialDao;
import com.thinkgem.jeesite.modules.oa.entity.fixedassets.ApplyVo;
import com.thinkgem.jeesite.modules.oa.entity.fixedassets.AssetsEquipment;
import com.thinkgem.jeesite.modules.oa.entity.fixedassets.AssetsSerial;
import com.thinkgem.jeesite.modules.oa.entity.fixedassets.FixedAssetsApply;
import com.thinkgem.jeesite.modules.oa.service.flowback.OaFlowBackService;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;
import com.thinkgem.jeesite.modules.sys.utils.WorkflowUtils;

/**
 * 资产序列Service
 * @author zf
 * @version 2016-11-20
 */
@Service
@Transactional(readOnly = true)
public class AssetsSerialService extends CrudService<AssetsSerialDao, AssetsSerial> {


	
	public AssetsSerial get(String id) {
		return super.get(id);
	}
	
	public AssetsSerial getByProcInsId(String procInsId) {
		return dao.getByProcInsId(procInsId);
	}
	
	public List<AssetsSerial> findList(AssetsSerial assetsSerial) {
		return super.findList(assetsSerial);
	}
	
	public Page<AssetsSerial> findPage(Page<AssetsSerial> page, AssetsSerial assetsSerial) {
		return super.findPage(page, assetsSerial);
	}
	
	@Transactional(readOnly = false)
	public AssetsSerial save(String type,String[] assetsid, 
			String[] equid, String remarks, boolean b) 
	{
		//新增申请
		AssetsSerial assetsSerial = new AssetsSerial();
		
		if (StringUtils.equals("1", type))
			type = "领用";
		else if (StringUtils.equals("2", type))
			type = "外借";
		else if (StringUtils.equals("3", type))
			type = "报废";
		
		if (assetsSerial.getTitle() == null)
			assetsSerial.setTitle(UserUtils.getUser().getLoginName() + type + "申请");
		
		if (assetsSerial.getType() == null)
			assetsSerial.setType(type);
		
		String serialNumber = IdGen.uuid();
	
		assetsSerial.setSerialNumber(serialNumber);
		
		for (int i = 0;i < assetsid.length;i ++)
		{
			FixedAssetsApply apply = new FixedAssetsApply();
			
			apply.setSerialNumber(serialNumber);
			
			apply.setFixedId(assetsid[i]);
			
			apply.setEquId(equid[i]);
			
			apply.setAccount(1);
			
			apply.setRemarks(remarks);
			
			fixedAssetsApplyService.save(apply);
			
			AssetsEquipment assetsEquipment = assetsEquipmentService.get(equid[i]);
			
			assetsEquipment.setCondition(type + "申请中");
			
			assetsEquipment.setRemarks(remarks);
			
			assetsEquipmentService.save(assetsEquipment);
		}
		
		assetsSerial.setRemarks(remarks);
		
		super.save(assetsSerial);
		
		// 初始化工作流中的变量的值，带入vars中放到后面使用
		Map<String, Object> vars = initVars();
		
		String title = titleHandle(assetsSerial,"固定资产"+assetsSerial.getType()+"申请"); 
		
		if (assetsSerial.getProcInsId() == null)
		{
			// 第一次申请，启动工作流
			String procInsId = actTaskService.startProcess(AssetsSerial.PROC_DEF_KEY, AssetsSerial.BUSINESS_TABLE, assetsSerial.getId(), title, vars);
			// 线程暂停两秒
			try 
			{
				Thread.sleep(2000);
			}
			catch (InterruptedException e) 
			{
				e.printStackTrace();
			}
			// 通过procinsid获取任务的列表，一般只有一条，在出现分支或子流程的情况下会有多条，不建议现在配置那种，即并行网关
			List<Task> list = actTaskService.getProcessEngine().getTaskService().createTaskQuery().processInstanceId(procInsId).list();
			
			if (list.size() > 0) {
				// 任务完成，跟着流程的线继续走到下一个节点
				vars.put("flag", 1);
				
				examMsg(assetsSerial, AssetsSerial.WORKFLOW_NAME, AssetsSerial.WORKFLOW_URL_EXAM, 
						WorkflowUtils.getWorkflowVarValue(AssetsSerial.PROC_DEF_KEY, "staff", ""));
				
				actTaskService.complete(list.get(0).getId(), procInsId, "【提交】", title, vars);
				// 流程撤回操作数据设置
				oaFlowBackService.saveINIT(procInsId, list.get(0), AssetsSerial.URL_FORM + assetsSerial.getId());
			}
		}
		else 
		{
			// 打回后重新提交
			List<Task> list = actTaskService.getProcessEngine().getTaskService().createTaskQuery()
					.processInstanceId(assetsSerial.getProcInsId()).taskAssignee(UserUtils.getUser().getLoginName()).list();
			
			if (b) 
			{
				vars.put("flag", 1);
				
				examMsg(assetsSerial, AssetsSerial.WORKFLOW_NAME, AssetsSerial.WORKFLOW_URL_EXAM, 
						WorkflowUtils.getWorkflowVarValue(AssetsSerial.PROC_DEF_KEY, "staff", ""));
				
				actTaskService.complete(list.get(0).getId(),assetsSerial.getProcInsId(), "【重新提交】", title, vars);
				
				oaFlowBackService.saveNOW(assetsSerial.getProcInsId(),list.get(0));
			} 
			else 
			{
				vars.put("flag", 3);
				
				actTaskService.complete(list.get(0).getId(), assetsSerial.getProcInsId(), "【作废】", title, vars);
				
				// 流程撤回操作数据设置
				oaFlowBackService.saveNULL(assetsSerial.getProcInsId());
			}

		}
		return assetsSerial;
	}
	
	/**
	 * 重新申请
	 * @param obj
	 * @param b
	 */
	@Transactional(readOnly = false)
	public void reapply(AssetsSerial assetsSerial, boolean b)
	{
		// 初始化工作流中的变量的值，带入vars中放到后面使用
		Map<String, Object> vars = initVars();
		
		String title = titleHandle(assetsSerial, "固定资产" + assetsSerial.getType() + "申请");;
		
		// 打回后重新提交
		List<Task> list = actTaskService.getProcessEngine().getTaskService().createTaskQuery().processInstanceId(assetsSerial.getProcInsId())
				.taskAssignee(UserUtils.getUser().getLoginName()).list();
		
		String comment = b ? "【重新提交】" : "【作废】";
		
		if (b) 
		{
			vars.put("flag", 1);
			
			examMsg(assetsSerial, AssetsSerial.WORKFLOW_NAME, AssetsSerial.WORKFLOW_URL_EXAM,
					WorkflowUtils.getWorkflowVarValue(AssetsSerial.PROC_DEF_KEY, "staff", ""));
			
			oaFlowBackService.saveNOW(assetsSerial.getProcInsId(),list.get(0));
		} 
		else 
		{
			vars.put("flag", 3);
			
			// 流程撤回操作数据设置
			oaFlowBackService.saveNULL(assetsSerial.getProcInsId());
		}
		
		actTaskService.complete(list.get(0).getId(), assetsSerial.getProcInsId(), comment, title, vars);
	}
	
	/**
	 * 根据流程实例Id查询任务
	 * @param procInsId
	 * @return
	 */
	public Task getTaskByProcInsId(String procInsId) {

		List<Task> list = actTaskService.getProcessEngine().getTaskService().createTaskQuery().processInstanceId(procInsId).list();
		
		if (list.size() > 0) {
			return list.get(0);
		}
		return null;
	}
	
	/**
	 * 判断是否该当前人员处理
	 * 
	 * @param id
	 * @return true/false
	 */
	public boolean isDeal(AssetsSerial assetsSerial) 
	{
		if (assetsSerial.getProcInsId() == null) 
			return true;
		else 
		{
			List<Task> list = actTaskService.getProcessEngine().getTaskService().createTaskQuery().taskAssignee(UserUtils.getUser().getLoginName())
					.processInstanceId(assetsSerial.getProcInsId()).list();
			
			if (list.size() > 0) 
				return true;
		}
		return false;
	}
	
	/**
	 * 行政审批
	 * @param assetsSerial
	 * @param b
	 */
	@Transactional(readOnly = false)
	public void dealExam(AssetsSerial assetsSerial, String flag) 
	{
		// 通过procinsid和当前人两个维度取得任务列表，一般只有一条
		List<Task> list = actTaskService.getProcessEngine().getTaskService().createTaskQuery().processInstanceId(assetsSerial.getProcInsId())
				.taskAssignee(UserUtils.getUser().getLoginName()).list();
		
		oaFlowBackService.saveNOW(assetsSerial.getProcInsId(),list.get(0));
		
		Map<String, Object> vars = initVars();
		
		if (StringUtils.equals("1", flag))
		{
			vars.put("flag", 1);
			
			if (list.size() > 0) 
				actTaskService.complete(list.get(0).getId(), assetsSerial.getProcInsId(), "【同意】", vars);
		} 
		else if (StringUtils.equals("2", flag))
		{
			vars.put("flag", 2);
			
			if (list.size() > 0)
			{
				vars.put("apply", UserUtils.get(assetsSerial.getCreateBy().getId()).getLoginName());
				
				String workflowTitle = retreatHandle(assetsSerial, AssetsSerial.WORKFLOW_NAME, AssetsSerial.WORKFLOW_URL_FORM);
				
				actTaskService.complete(list.get(0).getId(), assetsSerial.getProcInsId(), "【退回】", workflowTitle, vars);
			}
		}
		else if (StringUtils.equals("3", flag))
		{
			vars.put("flag", 3);
			
			if (list.size() > 0)
				actTaskService.complete(list.get(0).getId(), assetsSerial.getProcInsId(), "【不同意】", vars);
		}
			
	}

	/**
	 * 初始化工作流中的变量的值，带入vars中放到后面使用
	 * @return
	 */
	public Map<String, Object> initVars()
	{
		Map<String, Object> vars = new HashMap<String, Object>();
		
		vars.put("apply", UserUtils.getUser().getLoginName());
		
		vars.put("staff", WorkflowUtils.getWorkflowVarValue(AssetsSerial.PROC_DEF_KEY, "staff", ""));
		
		vars.put("filling",  WorkflowUtils.getWorkflowVarValue(AssetsSerial.PROC_DEF_KEY, "filling", ""));
		
		return vars;
	}
	
	/**
	 * 根据单据id查询申请物品
	 * @param id
	 * @return
	 */
	public List<ApplyVo> findApply(String id)
	{
		return assetsSerialDao.findApply(id);
	}
	
	/**
	 * 更新申请资产物品的数量
	 * @param amount
	 * @param id
	 */
	@Transactional(readOnly = false)
	public void updateApply(Integer amount, String id)
	{
		dao.updateApply(amount, id);
	}
	
	/**
	 * 更新申请单备注
	 * @param remarks
	 */
	@Transactional(readOnly = false)
	public void updateRemarks(String remarks, String id)
	{
		dao.updateRemarks(remarks,id);
	}
	
	/**
	 * 资产使用情况登记并更新库存状态(将资产编号加入的申请列表中)
	 * @param list
	 * @return
	 */
	@Transactional(readOnly = false)
	public List<ApplyVo> claimList(AssetsSerial assetsSerial, List<ApplyVo> list)
	{
		List<ApplyVo> claimList = new ArrayList<ApplyVo>();
		
		for (ApplyVo applyVo : list) 
		{
			//查询设备编号
			List<String> deviceIDList = assetsEquipmentService.findDeviceID(applyVo.getFixed_id(), applyVo.getAmount());
			
			//更新设备状态和使用人员(人员暂时设置为空,在申请登记之后加入人员名称)
			assetsEquipmentService.updateCondition(assetsSerial.getType(),"",assetsEquipmentService
					.findIdByAssetsId(applyVo.getFixed_id(), applyVo.getAmount()));
			
			for (String deviceID : deviceIDList) 
			{
				ApplyVo temp = new ApplyVo();
				
				temp.setAssetsName(applyVo.getAssetsName());
				
				temp.setBrand(applyVo.getBrand());
				
				temp.setFixed_id(applyVo.getFixed_id());
				
				temp.setModel(applyVo.getModel());
				
				temp.setUnit(applyVo.getUnit());
				
				temp.setUnitPrice(applyVo.getUnitPrice());
				
				temp.setDeviceID(deviceID);
				
				claimList.add(temp);
			}
			
		}
		
		return claimList;
	}
	
	public List<ApplyVo> getClaimList(List<ApplyVo> list)
	{
		for (ApplyVo applyVo : list)
		{
			AssetsEquipment assetsEquipment = assetsEquipmentService.get(applyVo.getEquId());
			
			applyVo.setDeviceID(assetsEquipment.getSerialNumber());
		}
		
		return list;
	}
	
	@Transactional(readOnly = false)
	public void delete(AssetsSerial assetsSerial) {
		super.delete(assetsSerial);
	}
	
	@Autowired
	private ActTaskService actTaskService;

	@Autowired
	private FixedAssetsApplyService fixedAssetsApplyService;
	
	@Autowired
	private AssetsSerialDao assetsSerialDao;
	
	@Autowired
	private AssetsEquipmentService assetsEquipmentService;

	@Autowired
	private OaFlowBackService oaFlowBackService;// 流程撤回业务service
}