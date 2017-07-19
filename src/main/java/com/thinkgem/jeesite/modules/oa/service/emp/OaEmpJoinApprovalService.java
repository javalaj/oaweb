/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.service.emp;

import java.util.List;
import java.util.Map;

import org.activiti.engine.task.Task;
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
import com.thinkgem.jeesite.modules.oa.entity.OaNotify;
import com.thinkgem.jeesite.modules.oa.entity.emp.OaEmpJoinApproval;
import com.thinkgem.jeesite.modules.oa.service.OaNotifyService;
import com.thinkgem.jeesite.modules.oa.service.flowback.OaFlowBackService;
import com.thinkgem.jeesite.modules.sys.entity.Office;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;
import com.thinkgem.jeesite.modules.sys.utils.WorkflowUtils;
import com.thinkgem.jeesite.modules.act.service.ActTaskService;
import com.thinkgem.jeesite.modules.oa.dao.emp.OaEmpJoinApprovalDao;

/**
 * 人员入职审批Service
 * @author 李廷龙
 * @version 2016-11-28
 */
@Service
@Transactional(readOnly = true)
public class OaEmpJoinApprovalService extends CrudService<OaEmpJoinApprovalDao, OaEmpJoinApproval> {

	public static final String PROC_DEF_KEY = "oa_emp_join_approval";
	public static final String BUSINESS_TABLE = "oa_emp_join_approval";
	
	@Autowired
	private ActTaskService actTaskService;
	@Autowired
	private OaFlowBackService oaFlowBackService;
	@Autowired
	private OaNotifyService oaNotifyService;// 抄送通知的service
	
	public OaEmpJoinApproval get(String id) {
		return super.get(id);
	}
	public OaEmpJoinApproval getByProcInsId(String procInsId){
		return dao.getByProcInsId(procInsId);
	}
	
	public List<OaEmpJoinApproval> findList(OaEmpJoinApproval oaEmpJoinApproval) {
		return super.findList(oaEmpJoinApproval);
	}
	
	public Page<OaEmpJoinApproval> findPage(Page<OaEmpJoinApproval> page, OaEmpJoinApproval oaEmpJoinApproval) {
		return super.findPage(page, oaEmpJoinApproval);
	}
	
	@Transactional(readOnly = false)
	public String saveApproval(OaEmpJoinApproval approval) throws Exception{
		if (StringUtils.equals("save", approval.getAct().getFlag())) {
			if (!StringUtils.equals("1", approval.getIsStart())) {
				approval.setStatus(ActEntity.ACT_STATUS_NOT_START);
			}
			approval.setTitles("员工入职流程【"+UserUtils.getUser().getName()+"】");
			//保存
			super.save(approval);
			return "[员工入职流程][信息保存]操作已完成";
		}else{
			//处理
			if (StringUtils.isBlank(approval.getId())||!StringUtils.equals("1", approval.getIsStart())) {
				String officePrimaryPersonLoginNameOfUser=WorkflowUtils.getOfficePrimaryPersonLoginNameOfUser();
				if (StringUtils.isBlank(officePrimaryPersonLoginNameOfUser)) {
					throw new Exception("<找不到您所属的部门主负责人>");
				}
				approval.setTitles("员工入职流程【"+UserUtils.getUser().getName()+" "+DateUtils.getDate("yyyy-MM-dd")+"】");
				approval.setStatus(ActEntity.ACT_STATUS_RUNNING);
				approval.setIsStart("1");
				super.save(approval);
				String procDefKey = PROC_DEF_KEY;
				String businessTable = BUSINESS_TABLE;
				String businessId = approval.getId();
				String title = approval.getTitles();
				String procInsId = actTaskService.startProcess(procDefKey, businessTable, businessId, title);
				String comment = "[入职申请]";
				List<Task> list = actTaskService.getProcessEngine().getTaskService().createTaskQuery()
						.processInstanceId(procInsId).list();
				try {
					Thread.sleep(1000);
				} catch (InterruptedException e) {
					e.printStackTrace();
				}
				if (list.size() > 0) {
					String taskId = list.get(0).getId();
					Map<String, Object> vars = Maps.newHashMap();
					vars.put("apply", UserUtils.getUser().getLoginName());
					vars.put("deptMinister", officePrimaryPersonLoginNameOfUser);
					vars.put("flag", "true");
					actTaskService.complete(taskId, procInsId, comment, title, vars);
					oaFlowBackService.saveINIT(procInsId, list.get(0),
							"/oa/emp/oaEmpJoinApproval/form?id=" + approval.getId());
				}
				return "[员工入职申请][提交]操作已完成";
				
			} else {
				if (!approval.getAct().isFinishTask()) {
					
					Map<String, Object> vars = Maps.newHashMap();
					vars.put("flag", approval.getAct().getFlag());
					String taskId = approval.getAct().getTaskId();
					String procInsId = approval.getAct().getProcInsId();
					String comment = "default comment";
					String title = approval.getTitles();
					//流程跳跃
					boolean xinFlag=true;
					
					String taskDefKey = approval.getAct().getTaskDefKey();
					if ("exam1".equals(taskDefKey)) {
						String officePrimaryPersonLoginNameOfUser=WorkflowUtils.getOfficePrimaryPersonLoginNameOfUser();
						
						comment = resultComment(approval, "重新申请", "销毁申请", "");
						if (StringUtils.equals(approval.getAct().getFlag(), "true")) {
							approval.setStatus(ActEntity.ACT_STATUS_RUNNING);
							if (StringUtils.isBlank(officePrimaryPersonLoginNameOfUser)) {
								throw new Exception("<找不到该部门的主负责人>");
							}
							vars.put("deptMinister", officePrimaryPersonLoginNameOfUser);
						}else{
							approval.setStatus(ActEntity.ACT_STATUS_DESTROYED);
						}
					} else if ("exam2".equals(taskDefKey)) {
						Office office=WorkflowUtils.getOffice(approval.getOffice().getId());
						String officePrimaryPersonLoginNameOfUser=WorkflowUtils.getReletiveOfficePrimaryPersonLoginNameOfUser(office);
						if (StringUtils.isBlank(officePrimaryPersonLoginNameOfUser)) {
							throw new Exception("<找不到该部门的主负责人>");
						}
						vars.put("empDeptMinister", officePrimaryPersonLoginNameOfUser);
						String opinion = approval.getDeptMinisterOpinion();
						comment = resultComment(approval, "通过", "驳回", opinion);
						if (StringUtils.equals(approval.getAct().getFlag(), "true")) {
						}else{
							approval.setStatus(ActEntity.ACT_STATUS_Edit);
						}
					}else if ("exam22".equals(taskDefKey)) {
						vars.put("hr", WorkflowUtils.getWorkflowVarValue(PROC_DEF_KEY, "hr", Global.getDefaultUser()));
						String opinion = approval.getEmpDeptMinisterOpinion();
						comment = resultComment(approval, "通过", "驳回", opinion);
					} else if ("exam3".equals(taskDefKey)) {
						vars.put("hrMinister", WorkflowUtils.getWorkflowVarValue(PROC_DEF_KEY, "hrMinister", Global.getDefaultUser()));
						String viceMinisterOpinion = approval.getHrOpinion();
						comment = resultComment(approval, "通过", "驳回", viceMinisterOpinion);
					} else if ("exam4".equals(taskDefKey)) {
						String remarkText = approval.getHrMinisterOpinion();
						comment = resultComment(approval, "通过", "驳回", remarkText);
						if (StringUtils.equals(approval.getAct().getFlag(), "true")) {
							approval.setStatus(ActEntity.ACT_STATUS_COMPLETDD);
							//流程结束，撤回操作关闭
							oaFlowBackService.saveNULL(procInsId);
							xinFlag=false;
						}
					}
					approval.preUpdate();
					dao.update(approval);
					actTaskService.complete(taskId, procInsId, comment, title, vars);
					if(xinFlag){
						oaFlowBackService.saveNOW(procInsId,taskDefKey);
					}
					if ("exam1".equals(taskDefKey)) {
						if (StringUtils.equals(approval.getAct().getFlag(), "true")) {
							return "[员工入职申请][重新申请]操作已完成";
						}else{
							return "[员工入职申请][销毁申请]操作已完成";
						}
					}else{
						if (StringUtils.equals(approval.getAct().getFlag(), "true")) {
							OaNotify oaNotify = new OaNotify();
							oaNotify.setType("4");// 流程通知配置为4
							oaNotify.setStatus("1");// 貌似是已发
							oaNotify.setTitle(title + "】已被【"	+ UserUtils.getUser().getName() + "】通过");
							oaNotify.setOaNotifyRecordIds(approval.getCreateBy().getId());
							oaNotify.setContent("@@proNotify@@/oa/a/oa/emp/oaEmpJoinApproval/form?id=" + approval.getId());
							oaNotifyService.save(oaNotify);
						
							return "[员工入职申请][通过申请]操作已完成";
						}else{
							OaNotify oaNotify = new OaNotify();
							oaNotify.setType("4");// 流程通知配置为4
							oaNotify.setStatus("1");// 貌似是已发
							oaNotify.setTitle(title + "】已被【"	+ UserUtils.getUser().getName() + "】驳回");
							oaNotify.setOaNotifyRecordIds(approval.getCreateBy().getId());
							oaNotify.setContent("@@proNotify@@/oa/a/oa/emp/oaEmpJoinApproval/form?id=" + approval.getId());
							oaNotifyService.save(oaNotify);
							
							return "[员工入职申请][驳回申请]操作已完成";
						}
					}
					
				}
			}
		}
		return "default message";
	}
	
	@Transactional(readOnly = false)
	public void delete(OaEmpJoinApproval oaEmpJoinApproval) {
		super.delete(oaEmpJoinApproval);
	}
	public static String resultComment(OaEmpJoinApproval oaProjectApproval, String successText, String failText,
			String comment) {
		String result = failText;
		if (StringUtils.equals(oaProjectApproval.getAct().getFlag(), "true")) {
			result = successText;
		}
		result = "[" + result + "]" + comment;
		return result;
	}
}