/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.service.staffturnover;

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
import com.thinkgem.jeesite.common.utils.DateUtils;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.act.service.ActTaskService;
import com.thinkgem.jeesite.modules.oa.dao.staffturnover.StaffTurnoverDao;
import com.thinkgem.jeesite.modules.oa.entity.assetsturnover.AssetsTurnOver;
import com.thinkgem.jeesite.modules.oa.entity.assetsturnover.AssetsTurnOverMap;
import com.thinkgem.jeesite.modules.oa.entity.staffturnover.StaffTurnover;
import com.thinkgem.jeesite.modules.oa.entity.staffturnover.UserRoles;
import com.thinkgem.jeesite.modules.oa.entity.workturnover.WorkTurnOver;
import com.thinkgem.jeesite.modules.oa.entity.workturnover.WorkTurnOverMap;
import com.thinkgem.jeesite.modules.oa.service.assetsturnover.AssetsTurnOverService;
import com.thinkgem.jeesite.modules.oa.service.workturnover.WorkTurnOverService;
import com.thinkgem.jeesite.modules.sys.entity.Office;
import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.modules.sys.service.OfficeService;
import com.thinkgem.jeesite.modules.sys.utils.DictUtils;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;
import com.thinkgem.jeesite.modules.sys.utils.WorkflowUtils;

/**
 * 人员异动Service
 * @author zf
 * @version 2017-01-12
 */
@Service
@Transactional(readOnly = true)
public class StaffTurnoverService extends CrudService<StaffTurnoverDao, StaffTurnover> {

	@Autowired
	private ActTaskService actTaskService;
	
	@Autowired
	private OfficeService officeService;
	
	@Autowired
	private WorkTurnOverService workTurnOverService;
	
	@Autowired
	private AssetsTurnOverService assetsTurnOverService;
	
	/**副总经理角色id*/
	public static final String VICEMANAGER_ID = "db6f1ea523354118a81b678228a00093";
	
	/**部门主管角色id*/
	public static final String DEPTDIRECTOR_ID = "4";
	
	public StaffTurnover get(String id) 
	{
		StaffTurnover staffTurnover = super.get(id);
		
		WorkTurnOver workTurnOver = new WorkTurnOver();
		
		workTurnOver.setStaffTurnoverId(id);
		
		List<WorkTurnOver> workList = workTurnOverService.findList(workTurnOver);
		
		staffTurnover.setWorkList(workList);
		
		AssetsTurnOver assetsTurnOver = new AssetsTurnOver();
		
		assetsTurnOver.setStaffTurnoverId(id);
		
		List<AssetsTurnOver> assetsList = assetsTurnOverService.findList(assetsTurnOver);
		
		staffTurnover.setAssetsList(assetsList);
		
		return staffTurnover;
	}
	
	public List<StaffTurnover> findList(StaffTurnover staffTurnover) {
		return super.findList(staffTurnover);
	}
	
	public Page<StaffTurnover> findPage(Page<StaffTurnover> page, StaffTurnover staffTurnover) {
		return super.findPage(page, staffTurnover);
	}
	
	@Transactional(readOnly = false)
	public void save(StaffTurnover staffTurnover) {
		super.save(staffTurnover);
	}
	
	@Transactional(readOnly = false)
	public void delete(StaffTurnover staffTurnover) 
	{
		workTurnOverService.deletes(staffTurnover.getId());
		
		assetsTurnOverService.deletes(staffTurnover.getId());
		
		super.delete(staffTurnover);
	}
	
	@Transactional(readOnly = false)
	public String saveTurnover(StaffTurnover staffTurnover, WorkTurnOverMap workTurnOvers,
			AssetsTurnOverMap assetsTurnOvers) 
	{
		if (StringUtils.equals("save", staffTurnover.getAct().getFlag())) 
		{
			if (!StringUtils.equals(ActEntity.ACT_STATUS_RUNNING, staffTurnover.getIsStart())) 
			{
				staffTurnover.setStatus(StaffTurnover.WITHOUT_APPROVAL);
				
				staffTurnover.setIsStart(ActEntity.ACT_STATUS_NOT_START);
			}
			//保存
			super.save(staffTurnover);
			
			return "【" + StaffTurnover.WORKFLOW_NAME + "】【信息保存】操作已完成";
		}
		else
		{
			if (StringUtils.isBlank(staffTurnover.getId())||StringUtils.equals(ActEntity.ACT_STATUS_NOT_START, staffTurnover.getIsStart())) 
			{
				String officeDeputyPersonLoginNameOfUser = WorkflowUtils.getOfficeDeputyPersonLoginNameOfUser();
				
				String officePrimaryPersonLoginNameOfUser = WorkflowUtils.getOfficePrimaryPersonLoginNameOfUser();
				
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
				
				staffTurnover.setIsStart(ActEntity.ACT_IS_START);
				
				staffTurnover.setStatus(ActEntity.ACT_STATUS_RUNNING);
				
				staffTurnover.setUser(UserUtils.getUser());
				
				staffTurnover.setDeptBefore(UserUtils.getUser().getOffice().getId());
				
				super.save(staffTurnover);
				
				String procDefKey = StaffTurnover.PROC_DEF_KEY;
				
				String businessTable = StaffTurnover.BUSINESS_TABLE;
				
				String businessId = staffTurnover.getId();
				
				String title = titleHandle(staffTurnover, StaffTurnover.WORKFLOW_NAME);
				
				String procInsId = actTaskService.startProcess(procDefKey, businessTable, businessId, title);
				
				String comment = "【" + StaffTurnover.WORKFLOW_NAME + "】";
				
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
					
					title = staffPositionsHandle(staffTurnover, vars, officeDeputyPersonLoginNameOfUser, officePrimaryPersonLoginNameOfUser);
					
					super.save(staffTurnover);
					
					actTaskService.complete(taskId, procInsId, comment, title, vars);
				}
				return "【" + StaffTurnover.WORKFLOW_NAME + "】【提交】操作已完成";
			} 
			else 
			{
				if (!staffTurnover.getAct().isFinishTask()) 
				{
					Map<String, Object> vars = Maps.newHashMap();
					
					vars.put("flag", staffTurnover.getAct().getFlag());
					
					String taskId = staffTurnover.getAct().getTaskId();
					
					String procInsId = staffTurnover.getAct().getProcInsId();
					
					String comment = "default comment";
					
					String title = "【" + staffTurnover.getUser().getName() + "】" + "【" + StaffTurnover.WORKFLOW_NAME + "】";
					
					String taskDefKey = staffTurnover.getAct().getTaskDefKey();
					
					String officeDeputyPersonLoginNameOfUser = WorkflowUtils.getOfficeDeputyPersonLoginNameOfUser();
					
					String officePrimaryPersonLoginNameOfUser = WorkflowUtils.getOfficePrimaryPersonLoginNameOfUser();
					
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
					
					if (StringUtils.equals(ActEntity.FIRST_AUDIT_PHASE, taskDefKey)) 
					{
						comment = resultComment(staffTurnover,"重新申请", "销毁申请", "");
						
						if (StringUtils.equals(staffTurnover.getAct().getFlag(), "true")) 
						{
							title = staffPositionsHandle(staffTurnover, vars, officeDeputyPersonLoginNameOfUser, officePrimaryPersonLoginNameOfUser);
							
							staffTurnover.setStatus(ActEntity.ACT_STATUS_RUNNING);
							
							vars.put("deptDirector", officeDeputyPersonLoginNameOfUser);
						}
						else
						{
							vars.put("flag", "4");
							
							staffTurnover.setStatus(ActEntity.ACT_STATUS_DESTROYED);
						}
					} 
					else if (StringUtils.equals(ActEntity.SECOND_AUDIT_PHASE, taskDefKey)) 
					{
						String deptDirectorSuggestion = staffTurnover.getDeptDirectorSuggestionBefore();
						
						comment = resultComment(staffTurnover,"通过", "驳回", deptDirectorSuggestion);
						
						if (StringUtils.equals(staffTurnover.getAct().getFlag(), "true")) 
						{
							officePrimaryPersonLoginNameOfUser = WorkflowUtils.getOfficePrimaryPersonLoginNameOfUser(staffTurnover.getUser().getId());
							
							vars.put("deptManagerBefore", officePrimaryPersonLoginNameOfUser);
						}
						else
						{
							staffTurnover.setStatus(ActEntity.ACT_STATUS_Edit);
							
							title = retreatHandle(staffTurnover, StaffTurnover.WORKFLOW_NAME, StaffTurnover.WORKFLOW_URL);
						}
					} 
					else if (StringUtils.equals(ActEntity.THIRD_AUDIT_PHASE, taskDefKey)) 
					{
						String deptManagerSuggestionBefore = staffTurnover.getDeptManagerSuggestionBefore();
						
						comment = resultComment(staffTurnover, "通过", "驳回", deptManagerSuggestionBefore);
						
						if (StringUtils.equals(staffTurnover.getAct().getFlag(), "true")) 
						{
							Office office = officeService.get(staffTurnover.getDeptAfter());
							
							String deptDirectorAfter = WorkflowUtils.getReletiveOfficeDeputyPersonLoginNameOfUser(office);
							
							vars.put("deptDirectorAfter", deptDirectorAfter);
							
							title = examMsg(staffTurnover, StaffTurnover.WORKFLOW_NAME, StaffTurnover.WORKFLOW_URL, deptDirectorAfter);
						}
						else
						{
							title = retreatHandle(staffTurnover, StaffTurnover.WORKFLOW_NAME, StaffTurnover.WORKFLOW_URL);
						}
					} 
					else if (StringUtils.equals(ActEntity.FOURTH_AUDIT_PHASE, taskDefKey)) 
					{
						String deptDirectorSuggestionAfter = staffTurnover.getDeptDirectorSuggestionAfter();
						
						comment = resultComment(staffTurnover, "通过", "驳回", deptDirectorSuggestionAfter);
						
						if (StringUtils.equals(staffTurnover.getAct().getFlag(), "true")) 
						{
							Office office = officeService.get(staffTurnover.getDeptAfter());
							
							String deptManagerAfter = WorkflowUtils.getReletiveOfficePrimaryPersonLoginNameOfUser(office);
							
							vars.put("deptManagerAfter", deptManagerAfter);
							
							title = examMsg(staffTurnover, StaffTurnover.WORKFLOW_NAME, StaffTurnover.WORKFLOW_URL,deptManagerAfter);
						}
						else
						{
							title = retreatHandle(staffTurnover, StaffTurnover.WORKFLOW_NAME, StaffTurnover.WORKFLOW_URL);					
						}
					} 
					else if (StringUtils.equals(ActEntity.FIFTH_AUDIT_PHASE, taskDefKey)) 
					{
						String deptManagerSuggestionAfter = staffTurnover.getDeptManagerSuggestionAfter();
						
						comment = resultComment(staffTurnover, "通过", "驳回", deptManagerSuggestionAfter);
						
						if (StringUtils.equals(staffTurnover.getAct().getFlag(), "true")) 
						{
							vars.put("apply", staffTurnover.getUser().getLoginName());
							
							title = examMsg(staffTurnover, StaffTurnover.WORKFLOW_NAME, StaffTurnover.WORKFLOW_URL,staffTurnover.getUser().getLoginName());
						}
						else
						{
							title = retreatHandle(staffTurnover, StaffTurnover.WORKFLOW_NAME, StaffTurnover.WORKFLOW_URL);						
						}
					} 
					else if (StringUtils.equals(ActEntity.SIXTH_AUDIT_PHASE, taskDefKey)) 
					{
						String generalManagerSuggestion = staffTurnover.getGeneralManagerSuggestion();
						
						comment = resultComment(staffTurnover, "通过", "驳回", generalManagerSuggestion);
						
						if (StringUtils.equals(staffTurnover.getAct().getFlag(), "true")) 
						{
							vars.put("apply", staffTurnover.getUser().getLoginName());
							
							title = examMsg(staffTurnover, StaffTurnover.WORKFLOW_NAME, StaffTurnover.WORKFLOW_URL,staffTurnover.getUser().getLoginName());
						}
						else
						{
							title = retreatHandle(staffTurnover, StaffTurnover.WORKFLOW_NAME, StaffTurnover.WORKFLOW_URL);							
							
							staffTurnover.setStatus(ActEntity.ACT_STATUS_Edit);
						}
					}
					else if (StringUtils.equals(ActEntity.SEVENTH_AUDIT_PHASE, taskDefKey)) 
					{
						comment = resultComment(staffTurnover, "通过", "驳回", "");
						
						if (StringUtils.equals(staffTurnover.getAct().getFlag(), "true")) 
						{
							//保存工作交接
							for (Map.Entry<String, WorkTurnOver> entry : workTurnOvers.getWorkTurnOvers().entrySet())
							{
								WorkTurnOver workTurnOver = entry.getValue();
								
								workTurnOver.setStaffTurnoverId(staffTurnover.getId());
								
								workTurnOverService.save(workTurnOver);
							}
							vars.put("workTurnoverReceiver", UserUtils.get(staffTurnover.getWorkTurnoverReceiver().getId()).getLoginName());
							
							title = examMsg(staffTurnover, StaffTurnover.WORKFLOW_NAME, StaffTurnover.WORKFLOW_URL,UserUtils.get(staffTurnover
									.getWorkTurnoverReceiver().getId()).getLoginName());
						}
						else
						{
							title = retreatHandle(staffTurnover, StaffTurnover.WORKFLOW_NAME, StaffTurnover.WORKFLOW_URL);					
						}
					}
					else if (StringUtils.equals(ActEntity.EIGHTH_AUDIT_PHASE, taskDefKey)) 
					{
						comment = resultComment(staffTurnover, "通过", "驳回", "");
						
						if (StringUtils.equals(staffTurnover.getAct().getFlag(), "true")) 
						{
							vars.put("workTakeoverAcceptor", staffTurnover.getWorkTakeoverAcceptor().getLoginName());
							
							title = examMsg(staffTurnover, StaffTurnover.WORKFLOW_NAME, StaffTurnover.WORKFLOW_URL, staffTurnover.getWorkTakeoverAcceptor().getLoginName());
						}
						else
						{
							title = retreatHandle(staffTurnover, StaffTurnover.WORKFLOW_NAME, StaffTurnover.WORKFLOW_URL);						
							
							workTurnOverService.deletes(staffTurnover.getId());
						}
					}
					else if (StringUtils.equals(ActEntity.NINTH_AUDIT_PHASE, taskDefKey)) 
					{
						comment = resultComment(staffTurnover, "通过", "驳回", "");
						
						if (StringUtils.equals(staffTurnover.getAct().getFlag(), "true")) 
						{
							vars.put("apply", staffTurnover.getUser().getLoginName());
							
							title = examMsg(staffTurnover, StaffTurnover.WORKFLOW_NAME, StaffTurnover.WORKFLOW_URL, staffTurnover.getUser().getLoginName());
						}
						else
						{
							title = retreatHandle(staffTurnover, StaffTurnover.WORKFLOW_NAME, StaffTurnover.WORKFLOW_URL);					
						}
					}
					else if (StringUtils.equals(ActEntity.TENTH_AUDIT_PHASE, taskDefKey)) 
					{
						comment = resultComment(staffTurnover, "通过", "驳回", "");
						
						if (StringUtils.equals(staffTurnover.getAct().getFlag(), "true")) 
						{
							//保存资产交接
							for (Map.Entry<String, AssetsTurnOver> entry : assetsTurnOvers.getAssetsTurnOvers().entrySet())
							{
								AssetsTurnOver assetsTurnOver = entry.getValue();
								
								assetsTurnOver.setStaffTurnoverId(staffTurnover.getId());
								
								assetsTurnOverService.save(assetsTurnOver);
							}
							
							vars.put("assetsTurnoverReceiver",UserUtils.get(staffTurnover.getAssetsTurnoverReceiver().getId()).getLoginName());
							
							title = examMsg(staffTurnover, StaffTurnover.WORKFLOW_NAME, StaffTurnover.WORKFLOW_URL,UserUtils.get(staffTurnover
									.getAssetsTurnoverReceiver().getId()).getLoginName());
						}
						else
						{
							title = retreatHandle(staffTurnover, StaffTurnover.WORKFLOW_NAME, StaffTurnover.WORKFLOW_URL);					
						}
					}
					else if (StringUtils.equals(ActEntity.ELEVENTH_AUDIT_PHASE, taskDefKey)) 
					{
						comment = resultComment(staffTurnover, "通过", "驳回", "");
						
						if (StringUtils.equals(staffTurnover.getAct().getFlag(), "true")) 
						{
							vars.put("assetsTakeoverAcceptor", staffTurnover.getAssetsTakeoverAcceptor().getLoginName());
							
							title = examMsg(staffTurnover, StaffTurnover.WORKFLOW_NAME, StaffTurnover.WORKFLOW_URL,staffTurnover.getAssetsTakeoverAcceptor().getLoginName());
						}
						else
						{
							title = retreatHandle(staffTurnover, StaffTurnover.WORKFLOW_NAME, StaffTurnover.WORKFLOW_URL);							
							
							assetsTurnOverService.deletes(staffTurnover.getId());
						}
					}
					else if (StringUtils.equals(ActEntity.TWELFTH_AUDIT_PHASE, taskDefKey)) 
					{
						comment = resultComment(staffTurnover, "通过", "驳回", "");
						
						if (StringUtils.equals(staffTurnover.getAct().getFlag(), "true")) 
						{
							String financialStaff = WorkflowUtils.getWorkflowVarValue(StaffTurnover.PROC_DEF_KEY, "financialStaff", "");
							
							vars.put("financialStaff", financialStaff);
							
							title = examMsg(staffTurnover, StaffTurnover.WORKFLOW_NAME, StaffTurnover.WORKFLOW_URL, financialStaff);
						}
						else
						{
							title = retreatHandle(staffTurnover, StaffTurnover.WORKFLOW_NAME, StaffTurnover.WORKFLOW_URL);						
						}
					}
					else if (StringUtils.equals(ActEntity.THIRTEENTH_AUDIT_PHASE, taskDefKey)) 
					{
						comment = resultComment(staffTurnover, "结案", "驳回", "");
						
						if (StringUtils.equals(staffTurnover.getAct().getFlag(), "true")) 
						{
							staffTurnover.setStatus(ActEntity.ACT_STATUS_COMPLETDD);
							
							if (!StringUtils.isBlank(WorkflowUtils.getRoleId()))
							{
								String content = StaffTurnover.WORKFLOW_URL + staffTurnover.getId();
								
								String notifyTitle = StaffTurnover.WORKFLOW_NAME + "【" + DateUtils.getDate() + "】" + "已办结";
								
								WorkflowUtils.sendOaNotify(notifyTitle, content, WorkflowUtils.getRoleId());
							}
						}
						else
						{
							title = retreatHandle(staffTurnover, StaffTurnover.WORKFLOW_NAME, StaffTurnover.WORKFLOW_URL);
						}
					}
					staffTurnover.preUpdate();
					
					dao.update(staffTurnover);
					
					actTaskService.complete(taskId, procInsId, comment, title, vars);
					
					if (StringUtils.equals(ActEntity.FIRST_AUDIT_PHASE, taskDefKey)) 
					{
						if (StringUtils.equals(staffTurnover.getAct().getFlag(), "true") || StringUtils.equals(staffTurnover.getAct().getFlag(), "false")) 
						{
							return "【" + StaffTurnover.WORKFLOW_NAME + "】【重新申请】操作已完成";
						}
						else
						{
							return "【" + StaffTurnover.WORKFLOW_NAME + "】【销毁申请】操作已完成";
						}
					}
					else
					{
						if (StringUtils.equals(staffTurnover.getAct().getFlag(), "true")) 
						{
							return "【" + StaffTurnover.WORKFLOW_NAME + "】【通过申请】操作已完成";
						}
						else
						{
							return "【" + StaffTurnover.WORKFLOW_NAME + "】【驳回申请】操作已完成";
						}
					}
				}
			}
		}
		return "default message";
	}

	/**
	 * 员工职位处理
	 * @param staffTurnover
	 * @param vars
	 * @param officeDeputyPersonLoginNameOfUser
	 * @param officePrimaryPersonLoginNameOfUser
	 * @return
	 */
	private String staffPositionsHandle(StaffTurnover staffTurnover, Map<String, Object> vars, String officeDeputyPersonLoginNameOfUser,
			String officePrimaryPersonLoginNameOfUser)
	{
		String title = "";
		
		User user = UserUtils.getUser();
		
		String userName = user.getLoginName();
		
		vars.put("apply", userName);
		
		//离职员工
		if ("离职".equals(DictUtils.getDictLabel(staffTurnover.getType(), "turnover_type", "")))
		{
			 vars.put("flag", "4");
		}
		else//调职
		{
			boolean isViceManager = false;
			
			boolean isDeptDirector = false;
			
			List<UserRoles> roleslist = findUserRoles(UserUtils.getUser().getId());
			
			for (UserRoles userRole : roleslist) 
			{
				//副总经理
				if (VICEMANAGER_ID.equals(userRole.getRoleId()))
				{
					vars.put("flag", "3");
					
					String generalManager = WorkflowUtils.getWorkflowVarValue(StaffTurnover.PROC_DEF_KEY, "generalManager", "");
					
					vars.put("generalManager", generalManager);
					
					title = examMsg(staffTurnover, StaffTurnover.WORKFLOW_NAME, StaffTurnover.WORKFLOW_URL, generalManager);
					
					isViceManager = true;
				}
				//部门主管
				if (DEPTDIRECTOR_ID.equals(userRole.getRoleId()))
				{	
					vars.put("flag", "2");
					
					vars.put("deptManagerBefore",officePrimaryPersonLoginNameOfUser);
					
					title = examMsg(staffTurnover, StaffTurnover.WORKFLOW_NAME, StaffTurnover.WORKFLOW_URL,officePrimaryPersonLoginNameOfUser);
					
					isDeptDirector = true;
				}
			}
			
			if (!isViceManager && !isDeptDirector)
			{
				vars.put("flag", "1");
				
				vars.put("deptDirectorBefore", officeDeputyPersonLoginNameOfUser);
				
				title = examMsg(staffTurnover, StaffTurnover.WORKFLOW_NAME, StaffTurnover.WORKFLOW_URL,officePrimaryPersonLoginNameOfUser);
			}
		}
		return title;
	}
	
	/**
	 * 查询用户角色id
	 * @param userId
	 * @return
	 */
	public List<UserRoles> findUserRoles(String userId)
	{
		return dao.findUserRoles(userId);
	}
	
	public StaffTurnover getByProcInsId(String procInsId)
	{
		StaffTurnover staffTurnover = dao.getByProcInsId(procInsId);
		
		WorkTurnOver workTurnOver = new WorkTurnOver();
		
		workTurnOver.setStaffTurnoverId(staffTurnover.getId());
		
		List<WorkTurnOver> workList = workTurnOverService.findList(workTurnOver);
		
		staffTurnover.setWorkList(workList);
		
		AssetsTurnOver assetsTurnOver = new AssetsTurnOver();
		
		assetsTurnOver.setStaffTurnoverId(staffTurnover.getId());
		
		List<AssetsTurnOver> assetsList = assetsTurnOverService.findList(assetsTurnOver);
		
		staffTurnover.setAssetsList(assetsList);
		
		return staffTurnover;
	}
}