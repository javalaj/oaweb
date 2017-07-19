/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.service.fixedassetpurchase;

import java.util.List;
import java.util.Map;

import org.activiti.engine.task.Task;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.google.common.collect.Maps;
import com.thinkgem.jeesite.common.persistence.ActEntity;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.act.service.ActTaskService;
import com.thinkgem.jeesite.modules.oa.entity.fixedassetpurchase.ApplyFixedAssets;
import com.thinkgem.jeesite.modules.oa.dao.fixedassetpurchase.ApplyFixedAssetsDao;
import com.thinkgem.jeesite.modules.sys.entity.Office;
import com.thinkgem.jeesite.modules.sys.service.OfficeService;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;
import com.thinkgem.jeesite.modules.sys.utils.WorkflowUtils;

/**
 * 固定资产申购Service
 * @author zf
 * @version 2017-01-09
 */
@Service
@Transactional(readOnly = true)
public class ApplyFixedAssetsService extends CrudService<ApplyFixedAssetsDao, ApplyFixedAssets> {

	@Autowired
	private ActTaskService actTaskService;
	
	@Autowired
	private OfficeService officeService;
	
	public ApplyFixedAssets get(String id) {
		return super.get(id);
	}
	
	public List<ApplyFixedAssets> findList(ApplyFixedAssets applyFixedAssets) {
		return super.findList(applyFixedAssets);
	}
	
	public Page<ApplyFixedAssets> findPage(Page<ApplyFixedAssets> page, ApplyFixedAssets applyFixedAssets) {
		return super.findPage(page, applyFixedAssets);
	}
	
	@Transactional(readOnly = false)
	public void save(ApplyFixedAssets applyFixedAssets) {
		super.save(applyFixedAssets);
	}
	
	@Transactional(readOnly = false)
	public void delete(ApplyFixedAssets applyFixedAssets) {
		super.delete(applyFixedAssets);
	}
	
	@Transactional(readOnly = false)
	public String savePurchase(ApplyFixedAssets applyFixedAssets)
	{
		if (StringUtils.equals("save", applyFixedAssets.getAct().getFlag())) 
		{
			if (!StringUtils.equals(ActEntity.ACT_STATUS_RUNNING, applyFixedAssets.getIsStart())) 
			{
				applyFixedAssets.setStatus(ApplyFixedAssets.WITHOUT_APPROVAL);
				
				applyFixedAssets.setIsStart(ActEntity.ACT_STATUS_NOT_START);
			}
			//保存
			super.save(applyFixedAssets);
			
			return "【" + ApplyFixedAssets.WORKFLOW_NAME + "】【信息保存】操作已完成";
		}
		else
		{
			if (StringUtils.isBlank(applyFixedAssets.getId())||StringUtils.equals(ActEntity.ACT_STATUS_NOT_START, applyFixedAssets.getIsStart())) 
			{
				String officeDeputyPersonLoginNameOfUser=WorkflowUtils.getOfficeDeputyPersonLoginNameOfUser();
				
				String officePrimaryPersonLoginNameOfUser=WorkflowUtils.getOfficePrimaryPersonLoginNameOfUser();
				
				if (StringUtils.isBlank(officePrimaryPersonLoginNameOfUser)) 
				{
					try 
					{
						throw new Exception("<找不到您所属的部门主负责人>");
					} 
					catch (Exception e) 
					{
						e.printStackTrace();
					}
				}
				
				if (StringUtils.isBlank(officeDeputyPersonLoginNameOfUser)) 
				{
					try 
					{
						throw new Exception("<找不到您所属的部门主管>");
					} 
					catch (Exception e) 
					{
						e.printStackTrace();
					}
				}
				
				applyFixedAssets.setStatus(ApplyFixedAssets.DEPTDIRECTOR_EXAM);
				
				applyFixedAssets.setIsStart(ActEntity.ACT_STATUS_RUNNING);
				
				super.save(applyFixedAssets);
				
				String procDefKey = ApplyFixedAssets.PROC_DEF_KEY;
				
				String businessTable = ApplyFixedAssets.BUSINESS_TABLE;
				
				String businessId = applyFixedAssets.getId();
				
				String title = titleHandle(applyFixedAssets,ApplyFixedAssets.WORKFLOW_NAME);
				
				String procInsId = actTaskService.startProcess(procDefKey, businessTable, businessId, title);
				
				String comment = "【采购申请】";
				
				List<Task> list = actTaskService.getProcessEngine().getTaskService().createTaskQuery().processInstanceId(procInsId).list();
				try
				{
					Thread.sleep(1000);
				} 
				catch (InterruptedException e)
				{
					
					e.printStackTrace();
				}
				
				if (list.size() > 0) 
				{
					String taskId = list.get(0).getId();
					
					Map<String, Object> vars = Maps.newHashMap();
					
					String userName = UserUtils.getUser().getLoginName();
					
					vars.put("apply", userName);
					
					vars.put("flag", true);
					
					vars.put("deptDirector", officeDeputyPersonLoginNameOfUser);
					
					title = examMsg(applyFixedAssets, ApplyFixedAssets.WORKFLOW_NAME, ApplyFixedAssets.WORKFLOW_URL, officeDeputyPersonLoginNameOfUser);
					
					actTaskService.complete(taskId, procInsId, comment, title, vars);
				}
				return "【" + ApplyFixedAssets.WORKFLOW_NAME + "】【提交】操作已完成";
			} 
			else 
			{
				if (!applyFixedAssets.getAct().isFinishTask()) 
				{
					Map<String, Object> vars = Maps.newHashMap();
					
					vars.put("flag", applyFixedAssets.getAct().getFlag());
					
					String taskId = applyFixedAssets.getAct().getTaskId();
					
					String procInsId = applyFixedAssets.getAct().getProcInsId();
					
					String comment = "default comment";
					
					String title = "【" + applyFixedAssets.getApplyName().getName() + "】" + "【" + ApplyFixedAssets.WORKFLOW_NAME + "】";
					
					String taskDefKey = applyFixedAssets.getAct().getTaskDefKey();
					
					if (StringUtils.equals(ActEntity.FIRST_AUDIT_PHASE, taskDefKey)) 
					{
						comment = resultComment(applyFixedAssets, "重新申请", "销毁申请", "");
						
						if (StringUtils.equals(applyFixedAssets.getAct().getFlag(), "true")) 
						{
							String officeDeputyPersonLoginNameOfUser=WorkflowUtils.getOfficeDeputyPersonLoginNameOfUser();
							
							if (StringUtils.isBlank(officeDeputyPersonLoginNameOfUser)) 
							{
								try 
								{
									throw new Exception("<找不到您所属的部门主管>");
								} 
								catch (Exception e) 
								{
									e.printStackTrace();
								}
							}
							
							applyFixedAssets.setStatus(ApplyFixedAssets.DEPTDIRECTOR_EXAM);
							
							vars.put("deptDirector", officeDeputyPersonLoginNameOfUser);
							
							title = examMsg(applyFixedAssets, ApplyFixedAssets.WORKFLOW_NAME, ApplyFixedAssets.WORKFLOW_URL, officeDeputyPersonLoginNameOfUser);
						}
						else
						{
							applyFixedAssets.setStatus(ActEntity.ACT_STATUS_DESTROYED);
						}
					} 
					else if (StringUtils.equals(ActEntity.SECOND_AUDIT_PHASE, taskDefKey)) 
					{
						String deptDirectorSuggestion = applyFixedAssets.getDeptDirectorSuggestion();
						
						comment = resultComment(applyFixedAssets, "通过", "驳回", deptDirectorSuggestion);
						
						if (StringUtils.equals(applyFixedAssets.getAct().getFlag(), "true")) 
						{
							applyFixedAssets.setStatus(ApplyFixedAssets.RELETIVEOFFICE_EXAM);
							
							Office office = officeService.get(applyFixedAssets.getReletiveOffice());
							
							String other = WorkflowUtils.getReletiveOfficePrimaryPersonLoginNameOfUser(office);
							
							vars.put("other", other);
							
							title = examMsg(applyFixedAssets, ApplyFixedAssets.WORKFLOW_NAME, ApplyFixedAssets.WORKFLOW_URL, other);
						}
						else
						{
							title = retreatHandle(applyFixedAssets, ApplyFixedAssets.WORKFLOW_NAME, ApplyFixedAssets.WORKFLOW_URL);
							
							applyFixedAssets.setStatus(ApplyFixedAssets.MODIFY);
						}
					} 
					else if (StringUtils.equals(ActEntity.THIRD_AUDIT_PHASE, taskDefKey)) 
					{
						String otherDirectorSuggestion = applyFixedAssets.getOtherDirectorSuggestion();
						
						comment = resultComment(applyFixedAssets, "通过", "驳回", otherDirectorSuggestion);
						
						String generalManager = WorkflowUtils.getWorkflowVarValue(ApplyFixedAssets.PROC_DEF_KEY, "generalManager", "");
						
						vars.put("generalManager", generalManager);
						
						if (StringUtils.equals(applyFixedAssets.getAct().getFlag(), "true")) 
						{
							applyFixedAssets.setStatus(ApplyFixedAssets.GENERALMANAGER_EXAM);
							
							title = examMsg(applyFixedAssets, ApplyFixedAssets.WORKFLOW_NAME, ApplyFixedAssets.WORKFLOW_URL,generalManager);
						}
						else
						{
							title = retreatHandle(applyFixedAssets, ApplyFixedAssets.WORKFLOW_NAME, ApplyFixedAssets.WORKFLOW_URL);
							
							applyFixedAssets.setStatus(ApplyFixedAssets.DEPTDIRECTOR_EXAM);
						}
					} 
					else if (StringUtils.equals(ActEntity.FOURTH_AUDIT_PHASE, taskDefKey)) 
					{
						String generalManagerSuggestion = applyFixedAssets.getGeneralManagerSuggestion();
						
						comment = resultComment(applyFixedAssets, "通过", "驳回", generalManagerSuggestion);
						
						if (StringUtils.equals(applyFixedAssets.getAct().getFlag(), "true")) 
						{
							applyFixedAssets.setStatus(ApplyFixedAssets.PURCHASER_EXAM);
							
							String staff = WorkflowUtils.getWorkflowVarValue(ApplyFixedAssets.PROC_DEF_KEY, "staff", "");
							
							vars.put("staff", staff);
							
							title = examMsg(applyFixedAssets, ApplyFixedAssets.WORKFLOW_NAME, ApplyFixedAssets.WORKFLOW_URL,staff);
						}
						else
						{
							title = retreatHandle(applyFixedAssets, ApplyFixedAssets.WORKFLOW_NAME, ApplyFixedAssets.WORKFLOW_URL);
							
							applyFixedAssets.setStatus(ApplyFixedAssets.RELETIVEOFFICE_EXAM);
						}
					} 
					else if (StringUtils.equals(ActEntity.FIFTH_AUDIT_PHASE, taskDefKey)) 
					{
						String purchaser = applyFixedAssets.getPurchaser();
						
						comment = resultComment(applyFixedAssets, "通过", "驳回", purchaser);
						
						String assetsAdmin = WorkflowUtils.getWorkflowVarValue(ApplyFixedAssets.PROC_DEF_KEY, "assetsAdmin", "");
						
						vars.put("assetsAdmin", assetsAdmin);
						
						if (StringUtils.equals(applyFixedAssets.getAct().getFlag(), "true")) 
						{
							applyFixedAssets.setStatus(ApplyFixedAssets.ADMIN_EXAM);
							
							title = examMsg(applyFixedAssets, ApplyFixedAssets.WORKFLOW_NAME, ApplyFixedAssets.WORKFLOW_URL,assetsAdmin);
						}
						else
						{
							title = retreatHandle(applyFixedAssets, ApplyFixedAssets.WORKFLOW_NAME, ApplyFixedAssets.WORKFLOW_URL);
							
							applyFixedAssets.setStatus(ApplyFixedAssets.GENERALMANAGER_EXAM);
						}
					} 
					else if (StringUtils.equals(ActEntity.SIXTH_AUDIT_PHASE, taskDefKey)) 
					{
						String admin = applyFixedAssets.getAdmin();
						
						comment = resultComment(applyFixedAssets, "结案", "驳回", admin);
						
						if (StringUtils.equals(applyFixedAssets.getAct().getFlag(), "true")) 
						{
							applyFixedAssets.setStatus(ActEntity.ACT_STATUS_COMPLETDD);
						}
						else
						{
							title = retreatHandle(applyFixedAssets, ApplyFixedAssets.WORKFLOW_NAME, ApplyFixedAssets.WORKFLOW_URL);
							
							applyFixedAssets.setStatus(ApplyFixedAssets.PURCHASER_EXAM);
						}
					} 
					
					applyFixedAssets.preUpdate();
					
					dao.update(applyFixedAssets);
					
					actTaskService.complete(taskId, procInsId, comment, title, vars);
					
					if (StringUtils.equals(ActEntity.FIRST_AUDIT_PHASE, taskDefKey)) 
					{
						if (StringUtils.equals(applyFixedAssets.getAct().getFlag(), "true")
								|| StringUtils.equals(applyFixedAssets.getAct().getFlag(), "false")) 
						{
							return "【" + ApplyFixedAssets.WORKFLOW_NAME + "】【重新申请】操作已完成";
						}
						else
						{
							return "【" + ApplyFixedAssets.WORKFLOW_NAME + "】【销毁申请】操作已完成";
						}
					}
					else
					{
						if (StringUtils.equals(applyFixedAssets.getAct().getFlag(), "true")) 
						{
							return "【" + ApplyFixedAssets.WORKFLOW_NAME + "】【通过申请】操作已完成";
						}
						else
						{
							return "【" + ApplyFixedAssets.WORKFLOW_NAME + "】【驳回申请】操作已完成";
						}
					}
				}
			}
		}
		return "default message";
	}
	
}