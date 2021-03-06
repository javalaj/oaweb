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
import org.springframework.ui.Model;

import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.common.utils.DateUtils;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.act.service.ActTaskService;
import com.thinkgem.jeesite.modules.oa.dao.OaReceiveFileDao;
import com.thinkgem.jeesite.modules.oa.entity.OaReceiveFile;
import com.thinkgem.jeesite.modules.sys.service.OfficeService;
import com.thinkgem.jeesite.modules.sys.utils.OrdersUtils;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;
import com.thinkgem.jeesite.modules.sys.utils.WorkflowUtils;

/**
 * 公司收文登记流程Service
 * 
 * @author liuxin
 * @version 2016-12-20
 */
@Service
@Transactional(readOnly = true)
public class OaReceiveFileService extends CrudService<OaReceiveFileDao, OaReceiveFile> {
	private static final String PROC_DEF_KEY = "oa_receive_file";// 流程定义标示
	@Autowired
	private ActTaskService actTaskService;// 工作流业务类
	@Autowired
	private OfficeService officeService;
	@Autowired
	private OaOvertimeService oaOvertimeService;

	public OaReceiveFile get(String id) {
		return super.get(id);
	}

	public List<OaReceiveFile> findList(OaReceiveFile oaReceiveFile) {
		return super.findList(oaReceiveFile);
	}

	public Page<OaReceiveFile> findPage(Page<OaReceiveFile> page, OaReceiveFile oaReceiveFile) {
		return super.findPage(page, oaReceiveFile);
	}

	@Transactional(readOnly = false)
	public void delete(OaReceiveFile oaReceiveFile) {
		super.delete(oaReceiveFile);
	}

	public OaReceiveFile getByProcInsId(String procInsId) {
		return dao.getByProcInsId(procInsId);
	}

	/**
	 * save业务逻辑方法
	 */
	@Transactional(readOnly = false)
	public void save(OaReceiveFile oaOvertime, String flag, String hostUpperOfficeId) {
		// 查询文件编号，并设置？？
		if (StringUtils.isBlank(oaOvertime.getCode())) {
			oaOvertime.setCode(OrdersUtils.getGenerateOrderNo8("CY"));
		}
		//
		if (StringUtils.isBlank(oaOvertime.getOfficename())) {
			// 查询出部门名称，并设置
			oaOvertime.setOfficename(UserUtils.getUser().getOffice().getName());
		}
		super.save(oaOvertime);// 该步骤为默认继承步骤，直接保存该记录。
		//
		// officePrimary officeDeputy deputyPersonnel filling
		Map<String, Object> vars = new HashMap<String, Object>();
		if (StringUtils.isBlank(oaOvertime.getProcInsId())) {
			// 这里put 流程图上所有的需要值，以便于activiti流插件，的控制
			vars.put("apply", UserUtils.getUser().getLoginName());// 发起人登陆名字
			vars.put("hostUpper",
					UserUtils.get(officeService.get(hostUpperOfficeId).getPrimaryPerson().getId()).getLoginName());// 主办部门副总登陆名字

			vars.put("boss", WorkflowUtils.getWorkflowVarValue(PROC_DEF_KEY, "boss", Global.getDefaultUser()));// 总经理登陆名字
			//
			vars.put("next", true);// 流程控制特殊跳转标志位 boolean
			vars.put("flag", true);// 流程控制标志位 boolean
			//
			// 流程关联id为null所以为第一次创建
			oaOvertime
					.setProcInsId(actTaskService.startProcess("oa_receive_file", "oa_receive_file", oaOvertime.getId(),
							"公司收文流程【" + UserUtils.getUser().getName() + " " + DateUtils.getDate() + "】", vars));// 关键步骤，获取procInsId，否则推送失败
			// 线程暂停两秒，使得流程流转信息排序正确，防止开始和申请排序颠倒
			try {
				Thread.sleep(2000);
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
			// 执行下一步
			List<Task> list = actTaskService.getProcessEngine().getTaskService().createTaskQuery()
					.taskAssignee(UserUtils.getUser().getLoginName()).processInstanceId(oaOvertime.getProcInsId())
					.list();
			if (list.size() > 0) {
				actTaskService.complete(list.get(0).getId(), oaOvertime.getProcInsId(), "【提交】", null, vars);
			}
		} else {
			// 打回后，以及第一次流程启动成功后的相同步骤
			oaOvertime.setExamname(null);
			oaOvertime.setExamtext(null);
			oaOvertime.setExamname2(null);
			oaOvertime.setExamtext2(null);
			oaOvertime.setExamname3(null);
			oaOvertime.setExamtext3(null);
			String examtext = "【重新提交】";
			if (flag.equals("1")) {
				vars.put("flag", false);// 流程控制标志位 boolean
				examtext = "【作废】";
				// oaOvertime.setIsdraft("2");
			} else {
				vars.put("flag", true);// 流程控制标志位 boolean
			}
			List<Task> list = actTaskService.getProcessEngine().getTaskService().createTaskQuery()
					.taskAssignee(UserUtils.getUser().getLoginName()).processInstanceId(oaOvertime.getProcInsId())
					.list();
			if (list.size() > 0) {
				actTaskService.complete(list.get(0).getId(), oaOvertime.getProcInsId(), examtext, null, vars);
			}
			super.save(oaOvertime);
		}

	}

	/**
	 * dealExam业务逻辑方法
	 * 
	 * exam 1不同意 ，0同意
	 */
	@Transactional(readOnly = false)
	public void dealExam(OaReceiveFile oaOvertime, String exam, int sign, String next, String hostPersonId) {
		// 审批人签名??
		Map<String, Object> vars = new HashMap<String, Object>();
		String examStr = "";
		if (StringUtils.isNotBlank(exam)) {
			if (exam.equals("0")) {// 上级审核同意
				// 定制vars
				vars.put("flag", true);// 流程控制标志位 boolean
				examStr = "【同意】";
			} else {
				// 上级审核不同意
				vars.put("flag", false);// 流程控制标志位 boolean
				examStr = "【不同意】";
				// 发送通知
				oaOvertimeService.sendMsg("@@proNotify@@/oa/a/oa/oaReceiveFile/form?id=" + oaOvertime.getId(),
						"您提交的公司收文流程【" + DateUtils.formatDate(oaOvertime.getCreateDate()) + "】已被【"
								+ UserUtils.getUser().getName() + "】退回",
						oaOvertime.getCreateBy().getId());
			}
		}
		switch (sign) {
		case 1:
			oaOvertime.setExamname(UserUtils.getUser().getName());
			examStr += oaOvertime.getExamtext();
			oaOvertime.setExamtext(examStr);
			if (next.equals("0")) {
				// 经过总经理
				vars.put("next", false);
			} else {
				if (exam.equals("0")) {
					vars.put("hostPerson", UserUtils.get(hostPersonId).getLoginName());// 主办人员登陆名字
				}
			}
			break;
		case 2:
			oaOvertime.setExamname2(UserUtils.getUser().getName());
			examStr += oaOvertime.getExamtext2();
			oaOvertime.setExamtext2(examStr);
			break;
		case 3:
			oaOvertime.setExamname3(UserUtils.getUser().getName());
			examStr += oaOvertime.getExamtext3();
			oaOvertime.setExamtext3(examStr);
			if (exam.equals("0")) {
				oaOvertime.setIsdraft("2");// 已完结状态
				// 发送通知
				oaOvertimeService.sendMsg("@@proNotify@@/oa/a/oa/oaReceiveFile/form?flag=view&id=" + oaOvertime.getId(),
						"您提交的公司收文流程【" + DateUtils.formatDate(oaOvertime.getCreateDate()) + "】已被【"
								+ UserUtils.getUser().getName() + "】办结",
						oaOvertime.getCreateBy().getId());
			}
			break;
		case 4:
			examStr = oaOvertime.getExamtext();
			vars.put("hostPerson", UserUtils.get(hostPersonId).getLoginName());// 主办人员登陆名字
			break;
		}
		List<Task> list = actTaskService.getProcessEngine().getTaskService().createTaskQuery()
				.taskAssignee(UserUtils.getUser().getLoginName()).processInstanceId(oaOvertime.getProcInsId()).list();
		if (list.size() > 0) {
			actTaskService.complete(list.get(0).getId(), oaOvertime.getProcInsId(), examStr, null, vars);
		}
		super.save(oaOvertime);// 更新业务表字段
	}

	/**
	 * 判断当前用户是否需要去form页面创建，审批，修改这个流程
	 */
	public boolean isDeal(OaReceiveFile oaOvertime) {
		if (StringUtils.isBlank(oaOvertime.getId())) {
			return true;
		} else {
			List<Task> list = actTaskService.getProcessEngine().getTaskService().createTaskQuery()
					.taskAssignee(UserUtils.getUser().getLoginName()).processInstanceId(oaOvertime.getProcInsId())
					.list();
			if (list.size() > 0) {
				return true;
			}
		}
		return false;
	}

	/**
	 * 查出流程的 procDefId 放在 model 中，用于页面查看流程图
	 */
	public String findProcDefIdByKey(String key) {
		return dao.findProcDefIdByKey(key);
	}

	/**
	 * 查出流程的 procDefId 放在 model 中，用于页面查看流程图
	 */
	public void addProcDefId(String key, Model model) {
		model.addAttribute("procDefId", findProcDefIdByKey(key));
	}
}