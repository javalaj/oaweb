/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.service.project;

import java.lang.reflect.InvocationTargetException;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.activiti.engine.task.Task;
import org.apache.commons.beanutils.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.google.common.collect.Maps;
import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.ActEntity;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.common.utils.DateUtils;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.oa.entity.project.OaProject;
import com.thinkgem.jeesite.modules.oa.entity.project.OaProjectApproval;
import com.thinkgem.jeesite.modules.oa.entity.project.permission.OaProjectViewPermission;
import com.thinkgem.jeesite.modules.oa.service.flowback.OaFlowBackService;
import com.thinkgem.jeesite.modules.sys.service.SystemService;
import com.thinkgem.jeesite.modules.sys.utils.OrdersUtils;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;
import com.thinkgem.jeesite.modules.sys.utils.WorkflowUtils;
import com.thinkgem.jeesite.modules.act.service.ActTaskService;
import com.thinkgem.jeesite.modules.oa.consts.OaOrderPrifixConsts;
import com.thinkgem.jeesite.modules.oa.dao.project.OaProjectApprovalDao;

/**
 * 售前项目立项审批管理Service
 * 
 * @author 李廷龙
 * @version 2016-11-15
 */
@Service
@Transactional(readOnly = true)
public class OaProjectApprovalService extends CrudService<OaProjectApprovalDao, OaProjectApproval> {

	@Autowired
	private ActTaskService actTaskService;

	@Autowired
	private SystemService systemService;
	
	@Autowired
	private OaProjectService oaProjectService;
	@Autowired
	private OaFlowBackService oaFlowBackService;
	public static final String PROC_DEF_KEY = "oa_project_approval";
	public static final String BUSINESS_TABLE = "oa_project_approval";

	public OaProjectApproval get(String id) {
		return super.get(id);
	}
	public OaProjectApproval getByProcInsId(String procInsId){
		return dao.getByProcInsId(procInsId);
	}
	public List<OaProjectApproval> findList(OaProjectApproval oaProjectApproval) {
		return super.findList(oaProjectApproval);
	}

	public Page<OaProjectApproval> findPage(Page<OaProjectApproval> page, OaProjectApproval oaProjectApproval) {
		return super.findPage(page, oaProjectApproval);
	}

	@Transactional(readOnly = false)
	public String saveApproval(OaProjectApproval approval) {
		if (StringUtils.equals("save", approval.getAct().getFlag())) {
			if (!StringUtils.equals("1", approval.getIsStart())) {
				approval.setStatus(ActEntity.ACT_STATUS_NOT_START);
			}
			approval.setApplicant(UserUtils.getUser());
			approval.setTitle("售前项目立项流程【"+UserUtils.getUser().getName()+"】");
			//保存
			super.save(approval);
			return "[售前项目立项申请][信息保存]操作已完成";
		}else{
			if (StringUtils.isBlank(approval.getId())||!StringUtils.equals("1", approval.getIsStart())) {
				approval.setEstablishmentTime(new Date());
				approval.setApplyDate(new Date());
				approval.setApplicant(UserUtils.getUser());
				
				OaProjectViewPermission opvp=new OaProjectViewPermission();
				opvp.setStarter(UserUtils.getUser().getId());
				approval.setViewPermission(opvp.jsonString());
				approval.setTitle("售前项目立项流程【"+UserUtils.getUser().getName()+" "+DateUtils.getDate("yyyy-MM-dd")+"】");
				approval.setStatus(ActEntity.ACT_STATUS_RUNNING);
				approval.setIsStart("1");
				super.save(approval);
				String procDefKey = PROC_DEF_KEY;
				String businessTable = BUSINESS_TABLE;
				String businessId = approval.getId();
				String title = approval.getTitle();
				String procInsId = actTaskService.startProcess(procDefKey, businessTable, businessId, title);
				String comment = "[立项申请]";
				List<Task> list = actTaskService.getProcessEngine().getTaskService().createTaskQuery()
						.processInstanceId(procInsId).list();
				try {
					Thread.sleep(1000);
				} catch (InterruptedException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				if (list.size() > 0) {
					String taskId = list.get(0).getId();
					Map<String, Object> vars = Maps.newHashMap();
					vars.put("apply", UserUtils.getUser().getLoginName());
					vars.put("flag", "true");
					vars.put("marketingDirector", WorkflowUtils.getWorkflowVarValue(PROC_DEF_KEY, "marketingDirector", Global.getDefaultUser()));
					actTaskService.complete(taskId, procInsId, comment, title, vars);
					oaFlowBackService.saveINIT(procInsId, list.get(0),
							"/oa/project/oaProjectApproval/form?id=" + approval.getId());
				}
				return "[售前项目立项申请][提交]操作已完成";
			} else {
				if (!approval.getAct().isFinishTask()) {
					
					Map<String, Object> vars = Maps.newHashMap();
					vars.put("flag", approval.getAct().getFlag());
					String taskId = approval.getAct().getTaskId();
					String procInsId = approval.getAct().getProcInsId();
					String comment = "default comment";
					String title = approval.getTitle();
					
					String taskDefKey = approval.getAct().getTaskDefKey();
					if ("exam1".equals(taskDefKey)) {
						approval.setApplyDate(new Date());
						approval.setApplicant(UserUtils.getUser());
						comment = resultComment(approval, "重新申请", "销毁申请", "");
						OaProjectViewPermission opvp=OaProjectViewPermission.getOaProjectViewPermissionFromJsonString(approval.getViewPermission());
						opvp.setStarter(UserUtils.getUser().getId());
						approval.setViewPermission(opvp.jsonString());
						if (StringUtils.equals(approval.getAct().getFlag(), "true")) {
							approval.setStatus(ActEntity.ACT_STATUS_RUNNING);
							vars.put("marketingDirector", WorkflowUtils.getWorkflowVarValue(PROC_DEF_KEY, "marketingDirector", Global.getDefaultUser()));
						}else{
							approval.setStatus(ActEntity.ACT_STATUS_DESTROYED);
						}
					} else if ("exam2".equals(taskDefKey)) {
						String marketingDirectorOpinion = approval.getMarketingDirectorOpinion();
						comment = resultComment(approval, "通过", "驳回", marketingDirectorOpinion);
						OaProjectViewPermission opvp=OaProjectViewPermission.getOaProjectViewPermissionFromJsonString(approval.getViewPermission());
						opvp.setMarketingDirector(UserUtils.getUser().getId());
						approval.setViewPermission(opvp.jsonString());
						if (StringUtils.equals(approval.getAct().getFlag(), "true")) {
							vars.put("viceMinister", WorkflowUtils.getWorkflowVarValue(PROC_DEF_KEY, "viceMinister", Global.getDefaultUser()));
						}else{
							approval.setStatus(ActEntity.ACT_STATUS_Edit);
						}
					} else if ("exam3".equals(taskDefKey)) {
						String viceMinisterOpinion = approval.getViceMinisterOpinion();
						comment = resultComment(approval, "通过", "驳回", viceMinisterOpinion);
						String businessManagerId = approval.getBusinessManager().getId();
						String examerLoginName = systemService.getUser(businessManagerId).getLoginName();
						vars.put("businessManager", examerLoginName);
						OaProjectViewPermission opvp=OaProjectViewPermission.getOaProjectViewPermissionFromJsonString(approval.getViewPermission());
						opvp.setViceMinister(UserUtils.getUser().getId());
						approval.setViewPermission(opvp.jsonString());
					} else if ("exam4".equals(taskDefKey)) {
						String remarkText = approval.getRemarkText();
						comment = resultComment(approval, "通过", "驳回", remarkText);
						OaProjectViewPermission opvp=OaProjectViewPermission.getOaProjectViewPermissionFromJsonString(approval.getViewPermission());
						opvp.setBusinessManager(UserUtils.getUser().getId());
						approval.setViewPermission(opvp.jsonString());
						if (StringUtils.equals(approval.getAct().getFlag(), "true")) {
							vars.put("preSalesManager", WorkflowUtils.getWorkflowVarValue(PROC_DEF_KEY, "preSalesManager", Global.getDefaultUser()));
						}
					} else if ("exam5".equals(taskDefKey)) {
						String preSalesManagerOpinion = approval.getPreSalesManagerOpinion();
						comment = resultComment(approval, "通过", "驳回", preSalesManagerOpinion);
						String technicalManagerId = approval.getTechnicalManager().getId();
						String examerLoginName = systemService.getUser(technicalManagerId).getLoginName();
						vars.put("technicalManager", examerLoginName);
						OaProjectViewPermission opvp=OaProjectViewPermission.getOaProjectViewPermissionFromJsonString(approval.getViewPermission());
						opvp.setPreSalesManager(UserUtils.getUser().getId());
						approval.setViewPermission(opvp.jsonString());
					} else if ("exam6".equals(taskDefKey)) {
						String remarkText = approval.getRemarkText();
						comment = resultComment(approval, "通过", "驳回", remarkText);
						OaProjectViewPermission opvp=OaProjectViewPermission.getOaProjectViewPermissionFromJsonString(approval.getViewPermission());
						opvp.setTechnicalManager(UserUtils.getUser().getId());
						approval.setViewPermission(opvp.jsonString());
						if (StringUtils.equals(approval.getAct().getFlag(), "true")) {
							vars.put("projectManager", WorkflowUtils.getWorkflowVarValue(PROC_DEF_KEY, "projectManager", Global.getDefaultUser()));
						}
					} else if ("exam7".equals(taskDefKey)) {
						String remarkText = approval.getRemarkText();
						comment = resultComment(approval, "结案", "驳回", remarkText);
						
						OaProjectViewPermission opvp=OaProjectViewPermission.getOaProjectViewPermissionFromJsonString(approval.getViewPermission());
						opvp.setProjectSpecialist(UserUtils.getUser().getId());
						approval.setViewPermission(opvp.jsonString());
						if (StringUtils.equals(approval.getAct().getFlag(), "true")) {
							approval.setStatus(ActEntity.ACT_STATUS_COMPLETDD);
						}
					}
					
					//归档
					if ("exam7".equals(taskDefKey)&&StringUtils.equals(approval.getAct().getFlag(), "true")) {
						OaProject oaProject=new OaProject();
						try {
							BeanUtils.copyProperties(oaProject, approval);
							String id=oaProject.getId();
							oaProject.preInsert();
							oaProject.setCreateBy(approval.getApplicant());
							oaProject.setId(id); 
							oaProject.setWriteTime(new Date());
							oaProject.setWriteWay(OaProject.WRITE_WAY_APPROVAL);
							oaProject.setProjectNo(OrdersUtils.getGenerateOrderNo12(OaOrderPrifixConsts.OA_PROJECT_NO_PREFIX));
							oaProjectService.insert(oaProject);
						} catch (IllegalAccessException e) {
							e.printStackTrace();
						} catch (InvocationTargetException e) {
							e.printStackTrace();
						}
					}
					approval.preUpdate();
					dao.update(approval);
					actTaskService.complete(taskId, procInsId, comment, title, vars);
					
					oaFlowBackService.saveNOW(procInsId,taskDefKey);

					if ("exam1".equals(taskDefKey)) {
						if (StringUtils.equals(approval.getAct().getFlag(), "true")) {
							return "[售前项目立项申请][重新申请]操作已完成";
						}else{
							return "[售前项目立项申请][销毁申请]操作已完成";
						}
					}else{
						if (StringUtils.equals(approval.getAct().getFlag(), "true")) {
							return "[售前项目立项申请][通过申请]操作已完成";
						}else{
							return "[售前项目立项申请][驳回申请]操作已完成";
						}
					}
				}
			}
		}
		return "default message";
		
	}

	@Transactional(readOnly = false)
	public void delete(OaProjectApproval oaProjectApproval) {
		super.delete(oaProjectApproval);
	}

	public static String resultComment(OaProjectApproval oaProjectApproval, String successText, String failText,
			String comment) {
		String result = failText;
		if (StringUtils.equals(oaProjectApproval.getAct().getFlag(), "true")) {
			result = successText;
		}
		result = "[" + result + "]" + comment;
		return result;
	}
}