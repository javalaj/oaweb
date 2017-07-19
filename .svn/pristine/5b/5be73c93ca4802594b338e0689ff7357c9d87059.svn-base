/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.activiti.engine.task.Task;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.common.utils.DateUtils;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.act.service.ActTaskService;
import com.thinkgem.jeesite.modules.oa.actRouting.ActRouting;
import com.thinkgem.jeesite.modules.oa.dao.OaUsecarDao;
import com.thinkgem.jeesite.modules.oa.entity.OaUsecar;
import com.thinkgem.jeesite.modules.oa.service.flowback.OaFlowBackService;
import com.thinkgem.jeesite.modules.sys.entity.workflow.SysWorkflowVar;
import com.thinkgem.jeesite.modules.sys.service.workflow.SysWorkflowVarService;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;
import com.thinkgem.jeesite.modules.sys.utils.WorkflowUtils;

/**
 * 车辆管理流程Service
 * 
 * @author niting
 * @version 2016-11-21
 */
@Service
@Transactional(readOnly = true)
public class OaUsecarService extends CrudService<OaUsecarDao, OaUsecar> {

	@Autowired
	private ActTaskService actTaskService;// 工作流业务类
	@Autowired
	private SysWorkflowVarService sysWorkflowVarService;// 工作流变量service
	@Autowired
	private OaOvertimeService oaOvertimeService;// 抄送通知的service
	@Autowired
	private OaFlowBackService oaFlowBackService;// 流程撤回业务service

	public OaUsecar get(String id) {
		return super.get(id);
	}

	public List<OaUsecar> findList(OaUsecar oaUsecar) {
		return super.findList(oaUsecar);
	}

	public Page<OaUsecar> findPage(Page<OaUsecar> page, OaUsecar oaUsecar) {
		return super.findPage(page, oaUsecar);
	}

	@Transactional(readOnly = false)
	public void delete(OaUsecar oaUsecar) {
		super.delete(oaUsecar);
	}

	public OaUsecar getByProcInsId(String procInsId) {
		return dao.getByProcInsId(procInsId);
	}

	/**
	 * save业务逻辑方法
	 */
	@Transactional(readOnly = false)
	public void save(OaUsecar oausecar, String flag) {
		if (StringUtils.isBlank(oausecar.getDepartment())) {
			// 查询出部门名称，并设置
			oausecar.setDepartment(UserUtils.getUser().getOffice().getName());
			oausecar.setExamtext("");
		}
		super.save(oausecar);// 这个步骤是默认继承步骤，直接保存该记录

		Map<String, Object> vars = new HashMap<String, Object>();
		// 这里put 流程图上所有的需要值，以便于activiti流插件，的控制
		vars.put("apply", UserUtils.getUser().getLoginName()); // 发起人登录名字
		
		vars.put("personnel", WorkflowUtils.getWorkflowVarValue("oa_carManagement", "personnel", Global.getDefaultUser())); // 人事行政部名字
		vars.put("flag", true);// 流程控制标志位 boolean
		vars.put("next", true);
		// vars.put("apply", UserUtils.getUser().getLoginName()); //
		// 上级审核后，重新回到发起人
		vars.put("driver",  WorkflowUtils.getWorkflowVarValue("oa_carManagement", "driver", ""));
		vars.put("filling", WorkflowUtils.getWorkflowVarValue("oa_carManagement", "filling", Global.getDefaultUser()));

		if (StringUtils.isBlank(oausecar.getProcInsId())) {
			// 流程关联id为null所以为第一次创建
			oausecar.setProcInsId(actTaskService.startProcess("oa_carManagement", "oa_usecar", oausecar.getId(),
					"用车申请流程【" + UserUtils.getUser().getName() + DateUtils.getDate() + "】", vars));
			
			// 线程暂停两秒，使得流程流转信息排序正确，防止开始和申请排序颠倒
			try {
				Thread.sleep(2000);
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
			// 执行下一步
			List<Task> list = actTaskService.getProcessEngine().getTaskService().createTaskQuery()
					.taskAssignee(UserUtils.getUser().getLoginName()).processInstanceId(oausecar.getProcInsId()).list();
			if (list.size() > 0) {
				actTaskService.complete(list.get(0).getId(), oausecar.getProcInsId(), "【提交】", null, vars);
				// 流程撤回操作数据设置
				oaFlowBackService.saveINIT(oausecar.getProcInsId(), list.get(0),
				"/oa/oaUsecar/view?id=" + oausecar.getId());
			}
		} else {
			// 打回后，以及第一次流程启动成功后的相同步骤
			// 清空上级意见
			oausecar.setExamname(null);
			oausecar.setExamtext(null);
			oausecar.setExamname2(null);
			oausecar.setExamtext2(null);
			oausecar.setDestinationchange(null);
			// 如果取消用车申请
			String examtext = "【重新提交】";
			if (flag.equals("1")) {
				vars.put("flag", false);
				examtext = "【作废】";
			}
			List<Task> list = actTaskService.getProcessEngine().getTaskService().createTaskQuery()
					.taskAssignee(UserUtils.getUser().getLoginName()).processInstanceId(oausecar.getProcInsId()).list();
			if (list.size() > 0) {
				actTaskService.complete(list.get(0).getId(), oausecar.getProcInsId(), examtext, null, vars);
				if (flag.equals("1")) {
					// 流程撤回操作数据设置
					oaFlowBackService.saveNULL(oausecar.getProcInsId());
				} else {
					// 流程撤回操作数据设置
					oaFlowBackService.saveNOW(oausecar.getProcInsId(),list.get(0));
				}
			}
			super.save(oausecar);
		}
	}

	/**
	 * dealExam业务逻辑方法
	 * 
	 * exam 1不同意 ，0同意
	 */
	@Transactional(readOnly = false)
	public void dealExam(OaUsecar oausecar, String exam, int state, String next) {
		// 审批人签名
		if(StringUtils.isBlank(oausecar.getExamname())){
			oausecar.setExamname(UserUtils.getUser().getName());
		}
		
		Map<String, Object> vars = new HashMap<String, Object>();
		String examStr = "";
		// 如果取消用车申请 next取消还是保存    exam同意还是不同意     state判断是行政审核还是更改目的地或者是司机填写
		String examtext = null;
		
		if (next.equals("0")) {
			vars.put("next", true);
			List<Task> list = actTaskService.getProcessEngine().getTaskService().createTaskQuery()
					.taskAssignee(UserUtils.getUser().getLoginName()).processInstanceId(oausecar.getProcInsId())
					.list();
			if(state == 1){//行政审核页面
				if(exam.equals("0")){
					vars.put("flag", true); // 流程控制标志位 boolean					
					examStr = "【同意】";
				}else{
					vars.put("flag", false);// 流程控制标志位 boolean
					examStr = "【不同意】";
					oaOvertimeService.sendMsg("@@proNotify@@/oa/a/oa/oaUsecar/form?id=" + oausecar.getId(),
							"您申请的用车申请【" + DateUtils.formatDate(oausecar.getCreateDate()) + "】已被【"+UserUtils.getUser().getName()+"】退回",
							oausecar.getCreateBy().getId());
				}
				
				try {
					if(oausecar.getDestinationchange()!=null){ 
						oausecar.setExamname2(UserUtils.getUser().getName());
						oausecar.setExamtext2(examStr + oausecar.getExamtext2()); //变更目的地之后的审核意见
						if(list.size() > 0){
							actTaskService.complete(list.get(0).getId(), oausecar.getProcInsId(), oausecar.getExamtext2(), null,
									vars);
							// 流程撤回操作数据设置
							oaFlowBackService.saveNOW(oausecar.getProcInsId(), list.get(0));
						}
					}else{
						oausecar.setExamtext(examStr + oausecar.getExamtext());//没有变更目的地的审核意见
						if(list.size() > 0){
							actTaskService.complete(list.get(0).getId(), oausecar.getProcInsId(), oausecar.getExamtext(), null,
									vars);
							// 流程撤回操作数据设置
							oaFlowBackService.saveNOW(oausecar.getProcInsId(), list.get(0));
						}
					}			
				} catch (Exception e) {
					// TODO: handle exception
				}
			}else if(state == 2){ //变更目的地页面
				if(exam.equals("0")){
					vars.put("flag", true);// 流程控制标志位 boolean					
					examStr = "【不变更目的地】";
				}else{
					// 申请人变更目的地	
					vars.put("flag", false);// 流程控制标志位 boolean					
					examStr = "【变更目的地】";
					try{//重复变更目的地后，签字和意见置空
						if(oausecar.getExamname2()!=null){
							oausecar.setExamname2(null);
							oausecar.setExamtext2(null);
						}
					}
					catch (Exception e) {
						// TODO: handle exception
					}
				}
				if (list.size() > 0) {
					actTaskService.complete(list.get(0).getId(), oausecar.getProcInsId(), examStr, null,
							vars);
					// 流程撤回操作数据设置
					oaFlowBackService.saveNOW(oausecar.getProcInsId(), list.get(0));
				}
			}else{//司机填写之后提交用车信息
				if (list.size() > 0) {
					actTaskService.complete(list.get(0).getId(), oausecar.getProcInsId(), "【提交】", null,
							vars);
					// 流程撤回操作数据设置
					oaFlowBackService.saveNOW(oausecar.getProcInsId(), list.get(0));
				}
			}
		} else {
			vars.put("flag", true);
			vars.put("next", false);
			examtext = "【作废】";
			List<Task> list = actTaskService.getProcessEngine().getTaskService().createTaskQuery()
					.taskAssignee(UserUtils.getUser().getLoginName()).processInstanceId(oausecar.getProcInsId()).list();
			if (list.size() > 0) {
				actTaskService.complete(list.get(0).getId(), oausecar.getProcInsId(), examtext, null, vars);
				// 流程撤回操作数据设置
				oaFlowBackService.saveNULL(oausecar.getProcInsId());
			}
		}
		super.save(oausecar);// 更新业务表字段
	}

	/**
	 * dealFilling业务逻辑方法
	 * 
	 */
	@Transactional(readOnly = false)
	public void dealFilling(OaUsecar oaUsecar) {
		List<Task> list = actTaskService.getProcessEngine().getTaskService().createTaskQuery()
				.taskAssignee(UserUtils.getUser().getLoginName()).processInstanceId(oaUsecar.getProcInsId()).list();
		if (list.size() > 0) {
			actTaskService.complete(list.get(0).getId(), oaUsecar.getProcInsId(), "【归档】", null, null);
		}
		oaOvertimeService.sendMsg("@@proNotify@@/oa/a/oa/oaUsecar/form?id=" + oaUsecar.getId(),
				"您申请的用车申请【" + DateUtils.formatDate(oaUsecar.getCreateDate()) + "】已被【"+UserUtils.getUser().getName()+"】办结",
				oaUsecar.getCreateBy().getId());
	}

	/**
	 * 判断当前用户是否需要去form页面创建，审批，修改这个流程
	 */
	public boolean isDeal(OaUsecar oausecar) {
		if (StringUtils.isBlank(oausecar.getId())) {
			return true;
		} else {
			List<Task> list = actTaskService.getProcessEngine().getTaskService().createTaskQuery()
					.taskAssignee(UserUtils.getUser().getLoginName()).processInstanceId(oausecar.getProcInsId()).list();
			if (list.size() > 0) {
				return true;
			}
		}
		return false;
	}
}