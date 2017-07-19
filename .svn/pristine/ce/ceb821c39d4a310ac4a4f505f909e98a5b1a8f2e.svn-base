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
import com.thinkgem.jeesite.modules.oa.entity.OaForgetclock;
import com.thinkgem.jeesite.modules.oa.service.OaForgetclockService;
import com.thinkgem.jeesite.modules.oa.service.coding.OaProVacateService;
import com.thinkgem.jeesite.modules.oa.service.flowback.OaFlowBackService;
import com.thinkgem.jeesite.modules.sys.service.SystemService;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;

/**
 * 忘记打卡申请流程Controller
 * 
 * @author liuxin
 * @version 2016-11-21
 */
@Controller
@RequestMapping(value = "${adminPath}/oa/oaForgetclock")
public class OaForgetclockController extends BaseController {

	@Autowired
	private OaForgetclockService oaForgetclockService;
	@Autowired
	private SystemService systemService;
	@Autowired
	private OaProVacateService oaProVacateService;
	@Autowired
	private OaFlowBackService oaFlowBackService;// 流程撤回交接操作service

	@ModelAttribute
	public OaForgetclock get(@RequestParam(required = false) String id) {
		OaForgetclock entity = null;
		if (StringUtils.isNotBlank(id)) {
			entity = oaForgetclockService.get(id);
		}
		if (entity == null) {
			entity = new OaForgetclock();
		}
		return entity;
	}

	@RequiresPermissions("oa:oaForgetclock:view")
	@RequestMapping(value = { "list", "" })
	public String list(OaForgetclock oaForgetclock, HttpServletRequest request, HttpServletResponse response,
			Model model) {
		Page<OaForgetclock> page = oaForgetclockService.findPage(new Page<OaForgetclock>(request, response),
				oaForgetclock);
		model.addAttribute("page", page);
		return "modules/oa/oaForgetclockList";
	}

	@RequiresPermissions("oa:oaForgetclock:edit")
	@RequestMapping(value = "delete")
	public String delete(OaForgetclock oaForgetclock, RedirectAttributes redirectAttributes) {
		oaForgetclockService.delete(oaForgetclock);
		addMessage(redirectAttributes, "删除成功");
		return "redirect:" + Global.getAdminPath() + "/oa/oaForgetclock/?repage";
	}

	/**
	 * 新建，打回，页面
	 */
	@RequiresPermissions("oa:oaForgetclock:view")
	@RequestMapping(value = "form")
	@Token(save = true)
	public String form(OaForgetclock oaForgetclock, Model model, String flag, RedirectAttributes redirectAttributes) {
		oaForgetclock = init(oaForgetclock);
		// 流程撤回按钮需要的procInsId 的model属性
		model.addAttribute("procInsId", oaFlowBackService.isCanBack(oaForgetclock.getProcInsId()));
		String view = "modules/oa/oaForgetclockView";
		if (oaForgetclockService.isDeal(oaForgetclock) && !"view".equals(flag)) {
			view = "modules/oa/oaForgetclockForm";
			// 流程撤回权交接操作
			oaFlowBackService.saveNULL(oaForgetclock.getProcInsId());
		} else {
			oaForgetclock.setCreateBy(systemService.getUser(oaForgetclock.getCreateBy().getId()));// 为页面查询出申请人的名字
		}
		model.addAttribute("oaForgetclock", oaForgetclock);
		model.addAttribute("nowUserId", UserUtils.getUser().getId());// 拿到自己的id，以用于排除证明人队列的自己
		addTitle(model, oaForgetclock);
		addTask(model, oaForgetclock);
		return view;
	}

	/**
	 * 新建提交，打回修改提交
	 * 
	 * flag 0 确定申请 1 取消申请
	 */
	@RequiresPermissions("oa:oaForgetclock:edit")
	@RequestMapping(value = "save")
	@Token(remove = true)
	public String save(OaForgetclock oaForgetclock, Model model, RedirectAttributes redirectAttributes, String flag) {
		if (!beanValidator(model, oaForgetclock)) {
			return form(oaForgetclock, model, "", redirectAttributes);
		}
		oaForgetclockService.save(oaForgetclock, flag);
		addMessage(redirectAttributes, "提交成功");
		return "redirect:" + Global.getAdminPath() + "/oa/oaForgetclock/form?id=" + oaForgetclock.getId()
				+ "&flag=view";
	}

	/**
	 * 证明人审核页面
	 */
	@RequiresPermissions("oa:oaForgetclock:view")
	@RequestMapping(value = "exam")
	@Token(save = true)
	public String exam(OaForgetclock oaForgetclock, Model model) {
		oaForgetclock = init(oaForgetclock);
		// 流程撤回按钮需要的procInsId 的model属性
		model.addAttribute("procInsId", oaFlowBackService.isCanBack(oaForgetclock.getProcInsId()));
		oaForgetclock.setCreateBy(systemService.getUser(oaForgetclock.getCreateBy().getId()));// 为页面查询出申请人的名字
		model.addAttribute("oaForgetclock", oaForgetclock);
		String view = "modules/oa/oaForgetclockView";
		if (oaForgetclockService.isDeal(oaForgetclock)) {
			view = "modules/oa/oaForgetclockExam";
			// 流程撤回权交接操作
			oaFlowBackService.saveNULL(oaForgetclock.getProcInsId());
		}
		addTitle(model, oaForgetclock);
		addTask(model, oaForgetclock);
		return view;
	}

	/**
	 * 证明人审核提交
	 * 
	 * exam 1不同意 ，0同意
	 */
	@RequiresPermissions("oa:oaForgetclock:edit")
	@RequestMapping(value = "dealExam")
	@Token(remove = true)
	public String dealExam(OaForgetclock oaForgetclock, Model model, RedirectAttributes redirectAttributes,
			String exam) {
		if (!beanValidator(model, oaForgetclock)) {
			return exam(oaForgetclock, model);
		}
		oaForgetclockService.dealExam(oaForgetclock, exam);
		addMessage(redirectAttributes, "审核成功");
		return "redirect:" + Global.getAdminPath() + "/oa/oaForgetclock/form?id=" + oaForgetclock.getId()
				+ "&flag=view";
	}

	/**
	 * 归档审核页面
	 */
	@RequiresPermissions("oa:oaForgetclock:view")
	@RequestMapping(value = "filling")
	@Token(save = true)
	public String filling(OaForgetclock oaForgetclock, Model model) {
		oaForgetclock = init(oaForgetclock);
		// 流程撤回按钮需要的procInsId 的model属性
		model.addAttribute("procInsId", oaFlowBackService.isCanBack(oaForgetclock.getProcInsId()));
		oaForgetclock.setCreateBy(systemService.getUser(oaForgetclock.getCreateBy().getId()));// 为页面查询出申请人的名字
		model.addAttribute("oaForgetclock", oaForgetclock);
		String view = "modules/oa/oaForgetclockView";
		if (oaForgetclockService.isDeal(oaForgetclock)) {
			view = "modules/oa/oaForgetclockFilling";
			// 流程撤回权交接操作
			oaFlowBackService.saveNULL(oaForgetclock.getProcInsId());
		}
		addTitle(model, oaForgetclock);
		addTask(model, oaForgetclock);
		return view;
	}

	/**
	 * 人事归档审核意见提交
	 * 
	 * exam 1不同意 ，0同意
	 */
	@RequiresPermissions("oa:oaForgetclock:edit")
	@RequestMapping(value = "dealFilling")
	@Token(remove = true)
	public String dealFilling(OaForgetclock oaForgetclock, Model model, RedirectAttributes redirectAttributes,
			String exam) {
		if (!beanValidator(model, oaForgetclock)) {
			return filling(oaForgetclock, model);
		}
		// 认识归档操作代码？？
		oaForgetclockService.dealFilling(oaForgetclock, exam);
		if(exam.equals("0")){
			addMessage(redirectAttributes, "归档成功");
		}else{
			addMessage(redirectAttributes, "已驳回发起人");
		}
		return "redirect:" + Global.getAdminPath() + "/oa/oaForgetclock/form?id=" + oaForgetclock.getId()
				+ "&flag=view";
	}

	/**
	 * 流程结束后的获取实体对象的方法
	 * 
	 */
	private OaForgetclock init(OaForgetclock oaForgetclock) {
		if (oaForgetclock.getAct() != null && StringUtils.isNotBlank(oaForgetclock.getAct().getProcInsId())) {
			oaForgetclock = oaForgetclockService.getByProcInsId(oaForgetclock.getAct().getProcInsId());
		}
		return oaForgetclock;
	}

	/** 加入流程标题 */
	private void addTitle(Model model, OaForgetclock oaForgetclock) {
		String name = null;
		String date = null;
		if (StringUtils.isNotBlank(oaForgetclock.getId())) {
			name = UserUtils.get(oaForgetclock.getCreateBy().getId()).getName();
			date = DateUtils.formatDate(oaForgetclock.getCreateDate());
		} else {
			name = UserUtils.getUser().getName();
			date = DateUtils.getDate();
		}
		model.addAttribute("title", "忘记打卡申请流程【" + name + " " + date + "】");
	}

	/** 加入工作台对象，用于显示流程图 */
	private void addTask(Model model, OaForgetclock oaForgetclock) {
		// 如果流程已启动，给出流程图
		if (oaForgetclock.getProcInsId() != null
				&& oaProVacateService.getTaskByProcInsId(oaForgetclock.getProcInsId()) != null) {
			model.addAttribute("task", oaProVacateService.getTaskByProcInsId(oaForgetclock.getProcInsId()));
		}
	}
}