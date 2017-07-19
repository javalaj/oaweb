/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.service.computerpurchase;

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
import com.thinkgem.jeesite.modules.oa.dao.computerpurchase.ComputerPurchaseDao;
import com.thinkgem.jeesite.modules.oa.entity.computerpurchase.ComputerPurchase;
import com.thinkgem.jeesite.modules.oa.entity.computerpurchase.ComputerPurchase.ComputerPurchaseStatus;
import com.thinkgem.jeesite.modules.oa.service.flowback.OaFlowBackService;
import com.thinkgem.jeesite.modules.sys.entity.Office;
import com.thinkgem.jeesite.modules.sys.service.OfficeService;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;
import com.thinkgem.jeesite.modules.sys.utils.WorkflowUtils;

/**
 * 电脑采购Service
 * @author zf
 * @version 2016-12-01
 */
@Service
@Transactional(readOnly = true)
public class ComputerPurchaseService extends CrudService<ComputerPurchaseDao, ComputerPurchase> {

	@Autowired
	private ActTaskService actTaskService;

	@Autowired
	private OaFlowBackService oaFlowBackService;// 流程撤回交接操作service
	
	@Autowired
	private OfficeService officeService;
	
	public ComputerPurchase get(String id) {
		return super.get(id);
	}
	
	public List<ComputerPurchase> findList(ComputerPurchase computerPurchase) {
		return super.findList(computerPurchase);
	}
	
	public Page<ComputerPurchase> findPage(Page<ComputerPurchase> page, ComputerPurchase computerPurchase) {
		return super.findPage(page, computerPurchase);
	}
	
	@Transactional(readOnly = false)
	public void save(ComputerPurchase computerPurchase) {
		super.save(computerPurchase);
	}
	
	@Transactional(readOnly = false)
	public void delete(ComputerPurchase computerPurchase) {
		super.delete(computerPurchase);
	}

	@Transactional(readOnly = false)
	public String savePurchase(ComputerPurchase computerPurchase) 
	{
		
		if (StringUtils.equals("save", computerPurchase.getAct().getFlag())) 
		{
			if (!StringUtils.equals(ActEntity.ACT_STATUS_RUNNING, computerPurchase.getIsStart())) 
			{
				computerPurchase.setStatus(ComputerPurchaseStatus.WITHOUT_APPROVAL.getIndex());
				
				computerPurchase.setIsStart(ActEntity.ACT_STATUS_NOT_START);
				
				computerPurchase.setDeptId(UserUtils.getUser().getOffice().getId());
			}
			//保存
			super.save(computerPurchase);
			
			return "【" + ComputerPurchase.WORKFLOW_NAME + "申请】【信息保存】操作已完成";
		}
		else
		{
			if (StringUtils.isBlank(computerPurchase.getId())||StringUtils.equals(ActEntity.ACT_STATUS_NOT_START, computerPurchase.getIsStart())) 
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
				
				computerPurchase.setStatus(ComputerPurchaseStatus.DEPTDIRECTOR_EXAM.getIndex());
				
				computerPurchase.setIsStart(ActEntity.ACT_STATUS_RUNNING);
				
				computerPurchase.setDeptId(UserUtils.getUser().getOffice().getId());
				
				super.save(computerPurchase);
				
				String procDefKey = ComputerPurchase.PROC_DEF_KEY;
				
				String businessTable = ComputerPurchase.BUSINESS_TABLE;
				
				String businessId = computerPurchase.getId();
				
				String title = titleHandle(computerPurchase,ComputerPurchase.WORKFLOW_NAME);
				
				String procInsId = actTaskService.startProcess(procDefKey, businessTable, businessId, title);
				
				String comment = "【采购申请】";
				
				List<Task> list = actTaskService.getProcessEngine().getTaskService().createTaskQuery()
						.processInstanceId(procInsId).list();
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
					
					if (userName.equals(officeDeputyPersonLoginNameOfUser))
					{
						vars.put("flag", "1");
						
						vars.put("deputyManager", officePrimaryPersonLoginNameOfUser);
						
						title = examMsg(computerPurchase,ComputerPurchase.WORKFLOW_NAME,ComputerPurchase.WORKFLOW_URL,officePrimaryPersonLoginNameOfUser);
					}
					else
					{
						vars.put("flag", "2");
						
						vars.put("deptDirector", officeDeputyPersonLoginNameOfUser);
						
						title = examMsg(computerPurchase,ComputerPurchase.WORKFLOW_NAME,ComputerPurchase.WORKFLOW_URL,officeDeputyPersonLoginNameOfUser);
					}
					
					actTaskService.complete(taskId, procInsId, comment, title, vars);
					
					// 流程撤回操作数据设置
					oaFlowBackService.saveINIT(procInsId, list.get(0), ComputerPurchase.WORKFLOW_URL_BACK + computerPurchase.getId());
					
				}
				return "【" + ComputerPurchase.WORKFLOW_NAME + "申请】【提交】操作已完成";
			} 
			else 
			{
				if (!computerPurchase.getAct().isFinishTask()) 
				{
					
					Map<String, Object> vars = Maps.newHashMap();
					
					vars.put("flag", computerPurchase.getAct().getFlag());
					
					String taskId = computerPurchase.getAct().getTaskId();
					
					String procInsId = computerPurchase.getAct().getProcInsId();
					
					String comment = "default comment";
					
					String title = "【" + computerPurchase.getUserName().getName() + "】" + "【" + ComputerPurchase.WORKFLOW_NAME + "】";
					
					String taskDefKey = computerPurchase.getAct().getTaskDefKey();
					
					if (StringUtils.equals(ActEntity.FIRST_AUDIT_PHASE, taskDefKey)) 
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
						
						comment = resultComment(computerPurchase, "重新申请", "销毁申请", "");
						
						if (StringUtils.equals(computerPurchase.getAct().getFlag(), "true")) 
						{
							String userName = UserUtils.getUser().getLoginName();
							
							String officePrimaryPersonLoginNameOfUser=WorkflowUtils.getOfficePrimaryPersonLoginNameOfUser();
							
							vars.put("apply", userName);
							
							if (userName.equals(officeDeputyPersonLoginNameOfUser))
							{
								vars.put("flag", "1");
								
								vars.put("deputyManager", officePrimaryPersonLoginNameOfUser);
								
								title = examMsg(computerPurchase,ComputerPurchase.WORKFLOW_NAME,ComputerPurchase.WORKFLOW_URL,officePrimaryPersonLoginNameOfUser);
							}
							else
							{
								vars.put("flag", "2");
								
								vars.put("deptDirector", officeDeputyPersonLoginNameOfUser);
								
								title = examMsg(computerPurchase,ComputerPurchase.WORKFLOW_NAME,ComputerPurchase.WORKFLOW_URL,officeDeputyPersonLoginNameOfUser);
							}
							
							computerPurchase.setStatus(ComputerPurchaseStatus.DEPTDIRECTOR_EXAM.getIndex());
							
							vars.put("deptDirector", officeDeputyPersonLoginNameOfUser);
						}
						else
						{
							computerPurchase.setStatus(ComputerPurchaseStatus.DESTROY.getIndex());
						}
					} 
					else if (StringUtils.equals(ActEntity.SECOND_AUDIT_PHASE, taskDefKey)) 
					{
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
						
						String deptDirectorSuggestion = computerPurchase.getDeptDirectorSuggestion();
						
						comment = resultComment(computerPurchase, "通过", "驳回", deptDirectorSuggestion);
						
						if (StringUtils.equals(computerPurchase.getAct().getFlag(), "true")) 
						{
							computerPurchase.setStatus(ComputerPurchaseStatus.DEPUTYMANAGER_EXAM.getIndex());
							
							vars.put("deputyManager", officePrimaryPersonLoginNameOfUser);
							
							title = examMsg(computerPurchase,ComputerPurchase.WORKFLOW_NAME,ComputerPurchase.WORKFLOW_URL,officePrimaryPersonLoginNameOfUser);
						}
						else
						{
							String userName = computerPurchase.getUserName().getName();

							String officeDeputyPersonLoginNameOfUser=WorkflowUtils.getOfficeDeputyPersonLoginNameOfUser();
							
							if (userName.equals(officeDeputyPersonLoginNameOfUser))
							{
								vars.put("flag", "1");
								
								vars.put("deputyManager", officePrimaryPersonLoginNameOfUser);
							}
							else
							{
								vars.put("flag", "2");
								
								vars.put("deptDirector", officeDeputyPersonLoginNameOfUser);
							}
							
							title = retreatHandle(computerPurchase, ComputerPurchase.WORKFLOW_NAME, ComputerPurchase.WORKFLOW_URL);
							
							computerPurchase.setStatus(ComputerPurchaseStatus.MODIFY.getIndex());
						}
					} 
					else if (StringUtils.equals(ActEntity.THIRD_AUDIT_PHASE, taskDefKey)) 
					{
						String deputyManagerSuggestion = computerPurchase.getDeputyManagerSuggestion();
						
						comment = resultComment(computerPurchase, "通过", "驳回", deputyManagerSuggestion);
						
						String adminDeptManager = WorkflowUtils.getWorkflowVarValue(ComputerPurchase.PROC_DEF_KEY, "adminDeptManager", "");
						
						vars.put("adminDeptManager", adminDeptManager);
						
						if (StringUtils.equals(computerPurchase.getAct().getFlag(), "true")) 
						{
							computerPurchase.setStatus(ComputerPurchaseStatus.ADMINDEPTMANAGER_EXAM.getIndex());
							
							title = examMsg(computerPurchase,ComputerPurchase.WORKFLOW_NAME,ComputerPurchase.WORKFLOW_URL,adminDeptManager);
						}
						else
						{
							Office office = officeService.get(computerPurchase.getDeptId());
							
							vars.put("deptDirector", WorkflowUtils.getReletiveOfficeDeputyPersonLoginNameOfUser(office));
							
							title = retreatHandle(computerPurchase, ComputerPurchase.WORKFLOW_NAME, ComputerPurchase.WORKFLOW_URL);
						
							computerPurchase.setStatus(ComputerPurchaseStatus.DEPTDIRECTOR_EXAM.getIndex());
						}
					} 
					else if (StringUtils.equals(ActEntity.FOURTH_AUDIT_PHASE, taskDefKey)) 
					{
						String adminDeptManagerSuggestion = computerPurchase.getAdminDeptManagerSuggestion();
						
						comment = resultComment(computerPurchase, "通过", "驳回", adminDeptManagerSuggestion);
						
						if (StringUtils.equals(computerPurchase.getAct().getFlag(), "true")) 
						{
							computerPurchase.setStatus(ComputerPurchaseStatus.GENERALMANAGER_EXAM.getIndex());
							
							String generalManager = WorkflowUtils.getWorkflowVarValue(ComputerPurchase.PROC_DEF_KEY, "generalManager", "");
							
							vars.put("generalManager", generalManager);
							
							title = examMsg(computerPurchase,ComputerPurchase.WORKFLOW_NAME,ComputerPurchase.WORKFLOW_URL,generalManager);
						}
						else
						{
							vars.put("deputyManager", WorkflowUtils.getOfficePrimaryPersonLoginNameOfUser(computerPurchase.getUserName().getId()));
							
							title = retreatHandle(computerPurchase, ComputerPurchase.WORKFLOW_NAME, ComputerPurchase.WORKFLOW_URL);
							
							computerPurchase.setStatus(ComputerPurchaseStatus.DEPUTYMANAGER_EXAM.getIndex());
						}
					} 
					else if (StringUtils.equals(ActEntity.FIFTH_AUDIT_PHASE, taskDefKey)) 
					{
						String generalManagerSuggestion = computerPurchase.getGeneralManagerSuggestion();
						
						comment = resultComment(computerPurchase, "通过", "驳回", generalManagerSuggestion);
						
						String staff = WorkflowUtils.getWorkflowVarValue(ComputerPurchase.PROC_DEF_KEY, "staff", "");
						
						vars.put("staff", staff);
						
						if (StringUtils.equals(computerPurchase.getAct().getFlag(), "true")) 
						{
							computerPurchase.setStatus(ComputerPurchaseStatus.STAFF_EXAM.getIndex());
							
							title = examMsg(computerPurchase,ComputerPurchase.WORKFLOW_NAME,ComputerPurchase.WORKFLOW_URL,staff);
						}
						else
						{
							vars.put("generalManager", WorkflowUtils.getWorkflowVarValue(ComputerPurchase.PROC_DEF_KEY, "generalManager", ""));
							
							title = retreatHandle(computerPurchase, ComputerPurchase.WORKFLOW_NAME, ComputerPurchase.WORKFLOW_URL);
							
							computerPurchase.setStatus(ComputerPurchaseStatus.ADMINDEPTMANAGER_EXAM.getIndex());
						}
					} 
					else if (StringUtils.equals(ActEntity.SIXTH_AUDIT_PHASE, taskDefKey)) 
					{
						String purchaser = computerPurchase.getPurchaser();
						
						comment = resultComment(computerPurchase, "通过", "驳回", purchaser);
						
						if (StringUtils.equals(computerPurchase.getAct().getFlag(), "true")) 
						{
							computerPurchase.setStatus(ComputerPurchaseStatus.ASSETSADMIN_EXAM.getIndex());
							
							String assetsAdmin = WorkflowUtils.getWorkflowVarValue(ComputerPurchase.PROC_DEF_KEY, "assetsAdmin", "");
							
							vars.put("assetsAdmin", assetsAdmin);
							
							title = examMsg(computerPurchase,ComputerPurchase.WORKFLOW_NAME,ComputerPurchase.WORKFLOW_URL,assetsAdmin);
						}
						else
						{
							vars.put("staff", WorkflowUtils.getWorkflowVarValue(ComputerPurchase.PROC_DEF_KEY, "staff", ""));
							
							title = retreatHandle(computerPurchase, ComputerPurchase.WORKFLOW_NAME, ComputerPurchase.WORKFLOW_URL);
							
							computerPurchase.setStatus(ComputerPurchaseStatus.GENERALMANAGER_EXAM.getIndex());
						}
					} 
					else if (StringUtils.equals(ActEntity.SEVENTH_AUDIT_PHASE, taskDefKey)) 
					{
						String admin = computerPurchase.getAdmin();
						
						comment = resultComment(computerPurchase, "结案", "驳回", admin);
						
						if (StringUtils.equals(computerPurchase.getAct().getFlag(), "true")) 
						{
							computerPurchase.setStatus(ComputerPurchaseStatus.COMPLETED.getIndex());
							
							completedHandle(computerPurchase, ComputerPurchase.WORKFLOW_NAME, ComputerPurchase.WORKFLOW_URL);
							// 流程撤回操作数据设置
							oaFlowBackService.saveNULL(computerPurchase.getProcInsId());
						}
						else
						{
							vars.put("assetsAdmin", WorkflowUtils.getWorkflowVarValue(ComputerPurchase.PROC_DEF_KEY, "assetsAdmin", ""));
							
							title = retreatHandle(computerPurchase, ComputerPurchase.WORKFLOW_NAME, ComputerPurchase.WORKFLOW_URL);
							
							computerPurchase.setStatus(ComputerPurchaseStatus.STAFF_EXAM.getIndex());
						}
					}
					computerPurchase.preUpdate();
					
					dao.update(computerPurchase);
					
					actTaskService.complete(taskId, procInsId, comment, title, vars);
					
					// 流程撤回操作数据设置
					oaFlowBackService.saveNOW(computerPurchase.getProcInsId(),taskDefKey);
					
					if (StringUtils.equals(ActEntity.FIRST_AUDIT_PHASE, taskDefKey)) 
					{
						if (StringUtils.equals(computerPurchase.getAct().getFlag(), "true")
								|| StringUtils.equals(computerPurchase.getAct().getFlag(), "false")) 
						{
							return "【" + ComputerPurchase.WORKFLOW_NAME + "申请】【重新申请】操作已完成";
						}
						else
						{
							return "【" + ComputerPurchase.WORKFLOW_NAME + "申请】【销毁申请】操作已完成";
						}
					}
					else
					{
						if (StringUtils.equals(computerPurchase.getAct().getFlag(), "true")) 
						{
							return "【" + ComputerPurchase.WORKFLOW_NAME + "申请】【通过申请】操作已完成";
						}
						else
						{
							return "【" + ComputerPurchase.WORKFLOW_NAME + "申请】【驳回申请】操作已完成";
						}
					}
				}
			}
		}
		return "default message";
	}
	
	@Transactional(readOnly = false)
	public void update(ComputerPurchase computerPurchase)
	{
		dao.update(computerPurchase);
	}
}