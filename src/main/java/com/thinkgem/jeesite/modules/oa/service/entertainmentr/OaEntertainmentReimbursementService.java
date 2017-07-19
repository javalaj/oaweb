/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.service.entertainmentr;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.activiti.engine.task.Task;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.common.utils.DateUtils;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.oa.entity.entertainmentr.OaEntertainmentReimbursement;
import com.thinkgem.jeesite.modules.oa.entity.qualificationb.OaQualificationb;
import com.thinkgem.jeesite.modules.oa.oaUtils.MoneyUtils;
import com.thinkgem.jeesite.modules.oa.service.OaOvertimeService;
import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.modules.sys.entity.workflow.SysWorkflowVar;
import com.thinkgem.jeesite.modules.sys.service.SystemService;
import com.thinkgem.jeesite.modules.sys.service.workflow.SysWorkflowVarService;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;
import com.thinkgem.jeesite.modules.act.service.ActTaskService;
import com.thinkgem.jeesite.modules.oa.actRouting.ActRouting;
import com.thinkgem.jeesite.modules.oa.dao.entertainmentr.OaEntertainmentReimbursementDao;

/**
 * 招待费Service
 * @author niting
 * @version 2017-01-12
 */
@Service
@Transactional(readOnly = true)
public class OaEntertainmentReimbursementService extends CrudService<OaEntertainmentReimbursementDao, OaEntertainmentReimbursement> {

	@Autowired
	private ActTaskService actTaskService;
	@Autowired
	private SysWorkflowVarService sysWorkflowVarService;// 工作流变量service
	@Autowired
	private OaOvertimeService oaOvertimeService;// 抄送通知的service
	
	public OaEntertainmentReimbursement get(String id) {
		return super.get(id);
	}
	
	public List<OaEntertainmentReimbursement> findList(OaEntertainmentReimbursement oaEntertainmentReimbursement) {
		return super.findList(oaEntertainmentReimbursement);
	}
	
	public Page<OaEntertainmentReimbursement> findPage(Page<OaEntertainmentReimbursement> page, OaEntertainmentReimbursement oaEntertainmentReimbursement) {
		return super.findPage(page, oaEntertainmentReimbursement);
	}
	
	@Transactional(readOnly = false)
	public void delete(OaEntertainmentReimbursement oaEntertainmentReimbursement) {
		super.delete(oaEntertainmentReimbursement);
	}
	
	public List<OaEntertainmentReimbursement> getOaEnterBySameid(String sameid){
		return dao.getOaEnterBySameid(sameid);
	}
	
	public OaEntertainmentReimbursement getByProcInsId(String procInsId) {
		return dao.getByProcInsId(procInsId);
	}
	
	@Transactional(readOnly = false)
	public void save(OaEntertainmentReimbursement oaEntertainmentReimbursement,String flag, List<OaEntertainmentReimbursement> OaEntertainments,String sameid) {		
			User currentUser = oaEntertainmentReimbursement.getCurrentUser();
	//		String offid=currentUser.getOffice().getId();
			
			// 查询出部门名称，并设置
			if (StringUtils.isBlank(oaEntertainmentReimbursement.getOfficename())) {
				oaEntertainmentReimbursement.setOfficename(UserUtils.getUser().getOffice().getName());
			}
		
		
			//保存招待费集合（一次报销多条）
			for (int i = 0; i < OaEntertainments.size(); i++) {
				oaEntertainmentReimbursement = OaEntertainments.get(i);
				oaEntertainmentReimbursement.setCreateBy(UserUtils.getUser());
				oaEntertainmentReimbursement.setOfficename(UserUtils.getUser().getOffice().getName());
				oaEntertainmentReimbursement.setSameid(sameid);
	//			oaEntertainmentReimbursement.setMoneyDouble(oaEntertainmentReimbursement.getMeals()+oaEntertainmentReimbursement.getAlcoholtobacco());
	//			if (StringUtils.isBlank(oaEntertainmentReimbursement.getMoneyDouble())) {
	//				// 人民币小写转换成大写
	//				OaEntertainments.setMoneyString(MoneyUtils.convertMoney(Double.parseDouble(oaOvertime.getMoneyDouble())));
	//			}
				super.save(OaEntertainments.get(i));// 该步骤为默认继承步骤，直接保存该记录。
		
		
				Map<String, Object> vars = new HashMap<String, Object>();
				vars.put("apply", UserUtils.getUser().getLoginName());// 发起人名字
				vars.put("sameid", sameid);
				SysWorkflowVar workflow = new SysWorkflowVar();// 工作流变量实体类
				workflow.setWorkflowIdentification("oa_entertainmentR"); // 流程标示
		
				vars.put("flag", true);
				if(UserUtils.getUser().getOffice().getParentId().equals("1") || UserUtils.getUser().getOffice().getParentId().equals("0")){
					vars.put("next", false);
					workflow.setVarName("manager");
					vars.put("manager",sysWorkflowVarService.findBySignVar(workflow).get(0).getVarValue());// 总经理
				}else{
					vars.put("next", true);			
					vars.put("upper",ActRouting.getUpper(UserUtils.getUser().getId()));// 获取上级领导登录名
				}	
				workflow.setVarName("finance");
				vars.put("finance", sysWorkflowVarService.findBySignVar(workflow).get(0).getVarValue());// 财务审核
		
		
				if (StringUtils.isBlank(oaEntertainmentReimbursement.getProcInsId())) {			
					// 流程关联id为null所以为第一次创建 entertainmentR
					oaEntertainmentReimbursement.setProcInsId(actTaskService.startProcess("oa_entertainmentR", "oa_entertainment_reimbursement", oaEntertainmentReimbursement.getId(),
							"招待费报销申请流程【" + UserUtils.getUser().getName() + DateUtils.getDate() + "】", vars));
					// 线程暂停两秒，使得流程流转信息排序正确，防止开始和申请排序颠倒
					try {
						Thread.sleep(2000);
					} catch (InterruptedException e) {
						e.printStackTrace();
					}
					//执行下一步,指定个人任务查询
					List<Task> list = actTaskService.getProcessEngine().getTaskService().createTaskQuery()
							.taskAssignee(UserUtils.getUser().getLoginName()).processInstanceId(oaEntertainmentReimbursement.getProcInsId()).list();
					if (list.size() > 0) {
						actTaskService.complete(list.get(0).getId(), oaEntertainmentReimbursement.getProcInsId(), "【提交】", null, vars);
					}
				}else{
					//打回后，以及流程第一次成功啟動后的相同步驟
					oaEntertainmentReimbursement.setExamname(null);
					oaEntertainmentReimbursement.setExamtext(null);
					oaEntertainmentReimbursement.setExamname1(null);
					oaEntertainmentReimbursement.setExamtext1(null);
					oaEntertainmentReimbursement.setExamname2(null);
					oaEntertainmentReimbursement.setExamtext2(null);
					String examtext = "【重新提交】";
					if (oaEntertainmentReimbursement.getFlag().equals("1")) {
						vars.put("flag", false);// 流程控制标志位 boolean
						examtext = "【作废】";
					}
					List<Task> list = actTaskService.getProcessEngine().getTaskService().createTaskQuery()
							.taskAssignee(UserUtils.getUser().getLoginName()).processInstanceId(oaEntertainmentReimbursement.getProcInsId())
							.list();
					if (list.size() > 0) {
						actTaskService.complete(list.get(0).getId(), oaEntertainmentReimbursement.getProcInsId(), examtext, null, vars);
					}
					
		//			//保存招待费集合（一次报销多条）
		//			for (int i = 0; i < OaEntertainments.size(); i++) {
		//				super.save(OaEntertainments.get(i));
		//			}
					super.save(OaEntertainments.get(i));
				}
			}		
		}
	
	/**
	 * dealExam业务逻辑方法
	 * 
	 * exam 1不同意 ，0同意
	 */
	@Transactional(readOnly = false)
	public void dealexam(OaEntertainmentReimbursement oaEntertainmentReimbursement,
			List<OaEntertainmentReimbursement> oaEntertainments,String exam,
			int sign){
		//审批人签字
		for (int i = 0; i < oaEntertainments.size(); i++) {
			oaEntertainmentReimbursement = oaEntertainments.get(i);
							
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
		
		List<Task> list = actTaskService.getProcessEngine().getTaskService().createTaskQuery()
				.taskAssignee(UserUtils.getUser().getLoginName()).processInstanceId(oaEntertainmentReimbursement.getProcInsId()).list();
		//判断是进入第一次审核还是第二次审核
		switch(sign){
		case 1:
			oaEntertainmentReimbursement.setExamname(UserUtils.getUser().getName());
			oaEntertainmentReimbursement.setExamtext(examStr+oaEntertainmentReimbursement.getExamtext());
			if (list.size() > 0) {
				actTaskService.complete(list.get(0).getId(), oaEntertainmentReimbursement.getProcInsId(), oaEntertainmentReimbursement.getExamtext(), null, vars);
			}
			if(examStr.equals("【不同意】")){
				//发送通知
				oaOvertimeService.sendMsg("@@proNotify@@/oa/a/oa/entertainmentr/oaEntertainmentReimbursement/form?sameid=" + oaEntertainmentReimbursement.getSameid(),
						"您申请的招待费报销申请【" + DateUtils.formatDate(oaEntertainmentReimbursement.getCreateDate()) + "】已被【"+oaEntertainmentReimbursement.getExamname()+"】退回",
						oaEntertainmentReimbursement.getCreateBy().getId());
			}
			break;
		case 2:
			oaEntertainmentReimbursement.setExamname1(UserUtils.getUser().getName());
			oaEntertainmentReimbursement.setExamtext1(examStr+oaEntertainmentReimbursement.getExamtext1());
			if (list.size() > 0) {
				actTaskService.complete(list.get(0).getId(), oaEntertainmentReimbursement.getProcInsId(), oaEntertainmentReimbursement.getExamtext1(), null, vars);
			}
			/*if(examStr.equals("【不同意】")){
				//发送通知
				oaOvertimeService.sendMsg("@@proNotify@@/oa/a/oa/entertainmentr/oaEntertainmentReimbursement/form?id=" + oaEntertainmentReimbursement.getId(),
						"您申请的招待费报销申请【" + DateUtils.formatDate(oaEntertainmentReimbursement.getCreateDate()) + "】已被【"+oaEntertainmentReimbursement.getExamname1()+"】退回",
						oaEntertainmentReimbursement.getCreateBy().getId());
			}*/
			break;
		case 3:
			oaEntertainmentReimbursement.setExamname2(UserUtils.getUser().getName());
			oaEntertainmentReimbursement.setExamtext2(examStr+oaEntertainmentReimbursement.getExamtext2());
			if (list.size() > 0) {
				actTaskService.complete(list.get(0).getId(), oaEntertainmentReimbursement.getProcInsId(), oaEntertainmentReimbursement.getExamtext2(), null, vars);
			}
			if(exam.equals("0")){
				//发送通知
				oaOvertimeService.sendMsg("@@proNotify@@/oa/a/oa/entertainmentr/oaEntertainmentReimbursement/form?id=" + oaEntertainmentReimbursement.getId(),
						"您申请的招待费报销申请【" + DateUtils.formatDate(oaEntertainmentReimbursement.getCreateDate()) + "】已被【"+oaEntertainmentReimbursement.getExamname2()+"】办结",
						oaEntertainmentReimbursement.getCreateBy().getId());
			}else{
				//发送通知
				oaOvertimeService.sendMsg("@@proNotify@@/oa/a/oa/entertainmentr/oaEntertainmentReimbursement/form?id=" + oaEntertainmentReimbursement.getId(),
						"您申请的招待费报销申请【" + DateUtils.formatDate(oaEntertainmentReimbursement.getCreateDate()) + "】已被【"+oaEntertainmentReimbursement.getExamname2()+"】退回",
						oaEntertainmentReimbursement.getCreateBy().getId());
			}
			break;
		}
		
		
		super.save(oaEntertainmentReimbursement);
	}}
	

	/**
	 * 判断当前用户是否需要去form页面创建，审批，修改这个流程
	 */
	public boolean isDeal(OaEntertainmentReimbursement oaEntertainmentReimbursement) {
		if (StringUtils.isBlank(oaEntertainmentReimbursement.getId())) {
			return true;
		} else {
			List<Task> list = actTaskService.getProcessEngine().getTaskService().createTaskQuery()
					.taskAssignee(UserUtils.getUser().getLoginName()).processInstanceId(oaEntertainmentReimbursement.getProcInsId())
					.list();
			if (list.size() > 0) {
				return true;
			}
		}
		return false;
	}
}