/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.thinkgem.jeesite.common.annotation.Token;
import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.utils.DateUtils;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.oa.entity.OaEmployeeFormal;
import com.thinkgem.jeesite.modules.oa.service.OaEmployeeFormalService;
import com.thinkgem.jeesite.modules.oa.service.OaReceiveFileService;
import com.thinkgem.jeesite.modules.oa.service.coding.OaProVacateService;
import com.thinkgem.jeesite.modules.oa.service.flowback.OaFlowBackService;
import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;

/**
 * 员工转正申请流程Controller
 * 
 * @author liuxin
 * @version 2016-12-15
 */
@Controller
@RequestMapping(value = "${adminPath}/oa/oaEmployeeFormal")
public class OaEmployeeFormalController extends BaseController {

	@Autowired
	private OaEmployeeFormalService oaEmployeeFormalService;
	@Autowired
	private OaProVacateService oaProVacateService;
	@Autowired
	private OaReceiveFileService oaReceiveFileService;
	@Autowired
	private OaFlowBackService oaFlowBackService;// 流程撤回交接操作service

	@ModelAttribute
	public OaEmployeeFormal get(@RequestParam(required = false) String id) {
		OaEmployeeFormal entity = null;
		if (StringUtils.isNotBlank(id)) {
			entity = oaEmployeeFormalService.get(id);
		}
		if (entity == null) {
			entity = new OaEmployeeFormal();
		}
		return entity;
	}

	@RequiresPermissions("oa:oaEmployeeFormal:view")
	@RequestMapping(value = { "list", "" })
	public String list(OaEmployeeFormal oaEmployeeFormal, HttpServletRequest request, HttpServletResponse response,
			Model model) {
		Page<OaEmployeeFormal> page = oaEmployeeFormalService.findPage(new Page<OaEmployeeFormal>(request, response),
				oaEmployeeFormal);
		model.addAttribute("page", page);
		return "modules/oa/oaEmployeeFormalList";
	}

	@RequiresPermissions("oa:oaEmployeeFormal:edit")
	@RequestMapping(value = "delete")
	public String delete(OaEmployeeFormal oaEmployeeFormal, RedirectAttributes redirectAttributes) {
		oaEmployeeFormalService.delete(oaEmployeeFormal);
		addMessage(redirectAttributes, "删除成功");
		return "redirect:" + Global.getAdminPath() + "/oa/oaEmployeeFormal/?repage";
	}

	/**
	 * 新建，打回，页面
	 */
	@RequiresPermissions("oa:oaEmployeeFormal:view")
	@RequestMapping(value = "form")
	@Token(save = true)
	public String form(OaEmployeeFormal oaEmployeeFormal, Model model, String flag, RedirectAttributes redirectAttributes) {
		oaReceiveFileService.addProcDefId("oa_employee_formal", model);
		if ("1".equals(UserUtils.getUser().getState()) && StringUtils.isBlank(flag)) {
			// 已经转正
			return "error/n2oaEmployeeFormal";
		} else {
			// 新入职
			oaEmployeeFormal = init(oaEmployeeFormal);
			// 流程撤回按钮需要的procInsId 的model属性
			model.addAttribute("procInsId", oaFlowBackService.isCanBack(oaEmployeeFormal.getProcInsId()));
			String view = "modules/oa/oaEmployeeFormalView";// 默认去查看页面
			if (oaEmployeeFormalService.isDeal(oaEmployeeFormal) && !"view".equals(flag)) {
				view = "modules/oa/oaEmployeeFormalForm";// 有权限的人去修改页面
				// 流程撤回权交接操作
				oaFlowBackService.saveNULL(oaEmployeeFormal.getProcInsId());
				if (StringUtils.isBlank(oaEmployeeFormal.getId())) {
					User user = UserUtils.getUser();
					oaEmployeeFormal.setName(user.getName());
					oaEmployeeFormal.setPhone(user.getPhone());
					oaEmployeeFormal.setSex(user.getGender().equals("1") ? "男" : "女");
				}
			} else {
				oaEmployeeFormal.setCreateBy(UserUtils.get(oaEmployeeFormal.getCreateBy().getId()));// 为页面查询出申请人的名字
			}
			model.addAttribute("oaEmployeeFormal", oaEmployeeFormal);
			addTitle(model, oaEmployeeFormal);
			addTask(model, oaEmployeeFormal);
			return view;

		}
	}

	/**
	 * 新建提交，打回修改提交
	 * 
	 * flag 0 确定申请 1 取消申请
	 */
	@RequiresPermissions("oa:oaEmployeeFormal:edit")
	@RequestMapping(value = "save")
	@Token(remove = true)
	public String save(OaEmployeeFormal oaEmployeeFormal, Model model, RedirectAttributes redirectAttributes,
			String flag) {
		if (!beanValidator(model, oaEmployeeFormal)) {
			return form(oaEmployeeFormal, model, "",redirectAttributes);
		}
		oaEmployeeFormalService.save(oaEmployeeFormal, flag);
		addMessage(redirectAttributes, "提交成功");
		return "redirect:" + Global.getAdminPath() + "/oa/oaEmployeeFormal/form?id=" + oaEmployeeFormal.getId()
				+ "&flag=view";
	}

	/**
	 * 归档审核页面
	 */
	@RequiresPermissions("oa:oaEmployeeFormal:view")
	@RequestMapping(value = "exam")
	@Token(save = true)
	public String exam(OaEmployeeFormal oaEmployeeFormal, Model model, int num) {
		oaEmployeeFormal = init(oaEmployeeFormal);
		// 流程撤回按钮需要的procInsId 的model属性
				model.addAttribute("procInsId", oaFlowBackService.isCanBack(oaEmployeeFormal.getProcInsId()));
		oaEmployeeFormal.setCreateBy(UserUtils.get(oaEmployeeFormal.getCreateBy().getId()));// 为页面查询出申请人的名字
		String view = "modules/oa/oaEmployeeFormalView";// 默认去查看页面
		if (oaEmployeeFormalService.isDeal(oaEmployeeFormal)) {
			view = "modules/oa/oaEmployeeFormalExam" + num;// 有权限的人去修改页面
			// 流程撤回权交接操作
						oaFlowBackService.saveNULL(oaEmployeeFormal.getProcInsId());
		}
		model.addAttribute("oaEmployeeFormal", oaEmployeeFormal);
		addTitle(model, oaEmployeeFormal);
		addTask(model, oaEmployeeFormal);
		return view;
	}

	/**
	 * 人事归档审核意见提交
	 * 
	 * exam 1不同意 ，0同意
	 */
	@RequiresPermissions("oa:oaEmployeeFormal:edit")
	@RequestMapping(value = "dealExam")
	@Token(remove = true)
	public String dealExam(OaEmployeeFormal oaEmployeeFormal, Model model, RedirectAttributes redirectAttributes,
			String exam, int sign) {
		if (!beanValidator(model, oaEmployeeFormal)) {
			return exam(oaEmployeeFormal, model, sign);
		}
		oaEmployeeFormalService.dealExam(oaEmployeeFormal, exam, sign);
		addMessage(redirectAttributes, "审核成功");
		return "redirect:" + Global.getAdminPath() + "/oa/oaEmployeeFormal/form?id=" + oaEmployeeFormal.getId()
				+ "&flag=view";
	}

	/**
	 * 流程结束后的获取实体对象的方法
	 * 
	 */
	@RequiresPermissions("oa:oaEmployeeFormal:view")
	@RequestMapping(value = "filling")
	@Token(save = true)
	public String filling(OaEmployeeFormal oaEmployeeFormal, Model model) {
		oaEmployeeFormal = init(oaEmployeeFormal);
		// 流程撤回按钮需要的procInsId 的model属性
				model.addAttribute("procInsId", oaFlowBackService.isCanBack(oaEmployeeFormal.getProcInsId()));
		oaEmployeeFormal.setCreateBy(UserUtils.get(oaEmployeeFormal.getCreateBy().getId()));// 为页面查询出申请人的名字
		model.addAttribute("oaEmployeeFormal", oaEmployeeFormal);
		String view = "modules/oa/oaEmployeeFormalView";// 默认去查看页面
		if (oaEmployeeFormalService.isDeal(oaEmployeeFormal)) {
			view = "modules/oa/oaEmployeeFormalFilling";// 有权限的人去归档审核页面
			// 流程撤回权交接操作
						oaFlowBackService.saveNULL(oaEmployeeFormal.getProcInsId());
		}
		addTitle(model, oaEmployeeFormal);
		addTask(model, oaEmployeeFormal);
		return view;

	}

	/**
	 * 新建提交，打回修改提交
	 * 
	 * flag 0 确定申请 1 取消申请
	 */
	@RequiresPermissions("oa:oaEmployeeFormal:edit")
	@RequestMapping(value = "dealFilling")
	@Token(remove = true)
	public String dealFilling(OaEmployeeFormal oaEmployeeFormal, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, oaEmployeeFormal)) {
			return filling(oaEmployeeFormal, model);
		}
		oaEmployeeFormalService.dealFilling(oaEmployeeFormal);
		addMessage(redirectAttributes, "归档成功");
		return "redirect:" + Global.getAdminPath() + "/oa/oaEmployeeFormal/form?id=" + oaEmployeeFormal.getId()
				+ "&flag=view";
	}

	/**
	 * 流程结束后的获取实体对象的方法
	 * 
	 */
	private OaEmployeeFormal init(OaEmployeeFormal oaOvertime) {
		if (oaOvertime.getAct() != null && StringUtils.isNotBlank(oaOvertime.getAct().getProcInsId())) {
			oaOvertime = oaEmployeeFormalService.getByProcInsId(oaOvertime.getAct().getProcInsId());
		}
		return oaOvertime;
	}

	/** 加入流程标题 */
	private void addTitle(Model model, OaEmployeeFormal oaOvertime) {
		String name = null;
		String date = null;
		if (StringUtils.isNotBlank(oaOvertime.getId())) {
			name = UserUtils.get(oaOvertime.getCreateBy().getId()).getName();
			date = DateUtils.formatDate(oaOvertime.getCreateDate());
		} else {
			name = UserUtils.getUser().getName();
			date = DateUtils.getDate();
		}
		model.addAttribute("title", "员工转正申请流程【" + name + " " + date + "】");
	}

	/** 加入工作台对象，用于显示流程图 */
	private void addTask(Model model, OaEmployeeFormal oaOvertime) {
		// 如果流程已启动，给出流程图
		if (oaOvertime.getProcInsId() != null
				&& oaProVacateService.getTaskByProcInsId(oaOvertime.getProcInsId()) != null) {
			model.addAttribute("task", oaProVacateService.getTaskByProcInsId(oaOvertime.getProcInsId()));
		}
	}

}