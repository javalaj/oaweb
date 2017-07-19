/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.service.publicprivatecar;

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
import com.thinkgem.jeesite.modules.oa.entity.publicprivatecar.OaPublicPrivateCars;
import com.thinkgem.jeesite.modules.oa.service.OaOvertimeService;
import com.thinkgem.jeesite.modules.oa.service.flowback.OaFlowBackService;
import com.thinkgem.jeesite.modules.sys.entity.workflow.SysWorkflowVar;
import com.thinkgem.jeesite.modules.sys.service.workflow.SysWorkflowVarService;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;
import com.thinkgem.jeesite.modules.sys.utils.WorkflowUtils;
import com.thinkgem.jeesite.modules.act.service.ActTaskService;
import com.thinkgem.jeesite.modules.oa.dao.publicprivatecar.OaPublicPrivateCarsDao;

/**
 * 私车公用Service
 * @author niting
 * @version 2017-01-10
 */
@Service
@Transactional(readOnly = true)
public class OaPublicPrivateCarsService extends CrudService<OaPublicPrivateCarsDao, OaPublicPrivateCars> {

	@Autowired
	private ActTaskService actTaskService;
	@Autowired
	private SysWorkflowVarService sysWorkflowVarService;// 工作流变量service
	@Autowired
	private OaOvertimeService oaOvertimeService;// 抄送通知的service
	@Autowired
	private OaFlowBackService oaFlowBackService;// 流程撤回业务service
	
	public OaPublicPrivateCars get(String id) {
		return super.get(id);
	}
	
	public List<OaPublicPrivateCars> findList(OaPublicPrivateCars oaPublicPrivateCars) {
		return super.findList(oaPublicPrivateCars);
	}
	
	public Page<OaPublicPrivateCars> findPage(Page<OaPublicPrivateCars> page, OaPublicPrivateCars oaPublicPrivateCars) {
		return super.findPage(page, oaPublicPrivateCars);
	}
	
	@Transactional(readOnly = false)
	public void delete(OaPublicPrivateCars oaPublicPrivateCars) {
		super.delete(oaPublicPrivateCars);
	}
	
	public OaPublicPrivateCars getByProcInsId(String procInsId) {
		return dao.getByProcInsId(procInsId);
	}
	
	@Transactional(readOnly = false)
	public void save(OaPublicPrivateCars oaPublicPrivateCars,String flag) {
		// 查询出部门名称，并设置
		if (StringUtils.isBlank(oaPublicPrivateCars.getOfficename())) {
			oaPublicPrivateCars.setOfficename(UserUtils.getUser().getOffice().getName());
		}
		super.save(oaPublicPrivateCars);// 该步骤为默认继承步骤，直接保存该记录。
		
		Map<String, Object> vars = new HashMap<String, Object>();
		vars.put("apply", UserUtils.getUser().getLoginName());// 发起人名字
		vars.put("personnel",WorkflowUtils.getWorkflowVarValue("oa_publicPrivateCar", "personnel", Global.getDefaultUser()));// 人事行政副总		
		vars.put("next", false);
		vars.put("Finance", WorkflowUtils.getWorkflowVarValue("oa_publicPrivateCar", "Finance", Global.getDefaultUser()));// 财务
		vars.put("flag", true);
		

		if (StringUtils.isBlank(oaPublicPrivateCars.getProcInsId())) {			
			// 流程关联id为null所以为第一次创建
			oaPublicPrivateCars.setProcInsId(actTaskService.startProcess("oa_publicPrivateCar", "oa_public_private_cars", oaPublicPrivateCars.getId(),
					"私车公用流程【" + UserUtils.getUser().getName() + DateUtils.getDate() + "】", vars));
			// 线程暂停两秒，使得流程流转信息排序正确，防止开始和申请排序颠倒
			try {
				Thread.sleep(2000);
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
			//执行下一步,指定个人任务查询
			List<Task> list = actTaskService.getProcessEngine().getTaskService().createTaskQuery()
					.taskAssignee(UserUtils.getUser().getLoginName()).processInstanceId(oaPublicPrivateCars.getProcInsId()).list();
			if (list.size() > 0) {
				actTaskService.complete(list.get(0).getId(), oaPublicPrivateCars.getProcInsId(), "【提交】", null, vars);
				// 流程撤回操作数据设置
				oaFlowBackService.saveINIT(oaPublicPrivateCars.getProcInsId(), list.get(0),
				"/oa/publicprivatecar/oaPublicPrivateCars/view?id=" + oaPublicPrivateCars.getId());
			}
			
		}else{
			//打回后，以及流程第一次成功啟動后的相同步驟
			oaPublicPrivateCars.setExamname(null);
			oaPublicPrivateCars.setExamtext(null);
			oaPublicPrivateCars.setExamname1(null);
			oaPublicPrivateCars.setExamtext1(null);
			String examtext = "【重新提交】";
			if (flag.equals("1")) {
				vars.put("flag", false);// 流程控制标志位 boolean
				examtext = "【作废】";
			}
			List<Task> list = actTaskService.getProcessEngine().getTaskService().createTaskQuery()
					.taskAssignee(UserUtils.getUser().getLoginName()).processInstanceId(oaPublicPrivateCars.getProcInsId())
					.list();
			if (list.size() > 0) {
				actTaskService.complete(list.get(0).getId(), oaPublicPrivateCars.getProcInsId(), examtext, null, vars);
				if (flag.equals("1")) {
					// 流程撤回操作数据设置
					oaFlowBackService.saveNULL(oaPublicPrivateCars.getProcInsId());
				} else {
					// 流程撤回操作数据设置
					oaFlowBackService.saveNOW(oaPublicPrivateCars.getProcInsId(),list.get(0));
				}
			}
			super.save(oaPublicPrivateCars);
		}		
	}
	
	/**
	 * dealExam业务逻辑方法
	 * 
	 * exam 1不同意 ，0同意
	 */
	@Transactional(readOnly = false)
	public void dealexam(OaPublicPrivateCars oaPublicPrivateCars,String exam,int sign){
		//审批人签字
		//oaSealUse.setExamname(UserUtils.getUser().getName());
		Map<String, Object> vars = new HashMap<String, Object>();
		String examStr = "";
		//根据审核结果执行不同操作
		if(exam.equals("0")){
			vars.put("flag",true);// 流程控制标志位 boolean
			examStr = "【同意】";
		}
		else{
			vars.put("flag",false);// 流程控制标志位 boolean
			examStr = "【不同意】";
		}
		
		//判断是进入第一次审核还是第二次审核
		switch(sign){
		case 1:
			oaPublicPrivateCars.setExamname(UserUtils.getUser().getName());
			oaPublicPrivateCars.setExamtext(examStr+oaPublicPrivateCars.getExamtext());
			if(exam.equals("1")){
				//发送通知
				oaOvertimeService.sendMsg("@@proNotify@@/oa/a/oa/publicprivatecar/oaPublicPrivateCars/form?id=" + oaPublicPrivateCars.getId(),
						"您提交的私车公用申请【" + DateUtils.formatDate(oaPublicPrivateCars.getCreateDate()) + "】已被【"+oaPublicPrivateCars.getExamname()+"】退回",
						oaPublicPrivateCars.getCreateBy().getId());
			}
			break;
		case 2:
			oaPublicPrivateCars.setExamname1(UserUtils.getUser().getName());
			oaPublicPrivateCars.setExamtext1(examStr+oaPublicPrivateCars.getExamtext1());
			if(exam.equals("0")){
				//发送通知

				oaOvertimeService.sendMsg("@@proNotify@@/oa/a/oa/publicprivatecar/oaPublicPrivateCars/form?id=" + oaPublicPrivateCars.getId(),
						"您提交的私车公用申请【" + DateUtils.formatDate(oaPublicPrivateCars.getCreateDate()) + "】已被【"+oaPublicPrivateCars.getExamname1()+"】办结",
						oaPublicPrivateCars.getCreateBy().getId());
			}else{
				//发送通知
				oaOvertimeService.sendMsg("@@proNotify@@/oa/a/oa/publicprivatecar/oaPublicPrivateCars/form?id=" + oaPublicPrivateCars.getId(),
						"您提交的私车公用申请【" + DateUtils.formatDate(oaPublicPrivateCars.getCreateDate()) + "】已被【"+oaPublicPrivateCars.getExamname1()+"】退回",
						oaPublicPrivateCars.getCreateBy().getId());
			}
			break;
		}
		List<Task> list = actTaskService.getProcessEngine().getTaskService().createTaskQuery()
				.taskAssignee(UserUtils.getUser().getLoginName()).processInstanceId(oaPublicPrivateCars.getProcInsId()).list();
		if(sign==1){
			if (list.size() > 0) {
				actTaskService.complete(list.get(0).getId(), oaPublicPrivateCars.getProcInsId(), oaPublicPrivateCars.getExamtext(), null, vars);
				// 流程撤回操作数据设置
				oaFlowBackService.saveNOW(oaPublicPrivateCars.getProcInsId(), list.get(0));
			}
		}else if(sign==2){
			if (list.size() > 0) {
				actTaskService.complete(list.get(0).getId(), oaPublicPrivateCars.getProcInsId(), oaPublicPrivateCars.getExamtext1(), null, vars);
				// 流程撤回操作数据设置
				oaFlowBackService.saveNULL(oaPublicPrivateCars.getProcInsId());
			}
		}		
		super.save(oaPublicPrivateCars);
	}
	
	/**
	 * 判断当前用户是否需要去form页面创建，审批，修改这个流程
	 */
	public boolean isDeal(OaPublicPrivateCars oaPublicPrivateCars) {
		if (StringUtils.isBlank(oaPublicPrivateCars.getId())) {
			return true;
		} else {
			List<Task> list = actTaskService.getProcessEngine().getTaskService().createTaskQuery()
					.taskAssignee(UserUtils.getUser().getLoginName()).processInstanceId(oaPublicPrivateCars.getProcInsId())
					.list();
			if (list.size() > 0) {
				return true;
			}
		}
		return false;
	}
}