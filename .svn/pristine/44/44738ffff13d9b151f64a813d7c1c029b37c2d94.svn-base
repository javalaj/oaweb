/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.mobile.modules.oa.web;

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
import com.thinkgem.jeesite.modules.act.service.ActTaskService;
import com.thinkgem.jeesite.modules.oa.entity.OaOvertime;
import com.thinkgem.jeesite.modules.oa.service.OaOvertimeService;
import com.thinkgem.jeesite.modules.oa.service.coding.OaProVacateService;
import com.thinkgem.jeesite.modules.oa.service.flowback.OaFlowBackService;
import com.thinkgem.jeesite.modules.oa.utils.flow.ModelUtil;
import com.thinkgem.jeesite.modules.sys.service.SystemService;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;
import com.thinkgem.jeesite.modules.user.service.UserFavoriteService;

/**
 * 加班流程业务工作流Controller
 * 
 * @author liuxin
 * @version 2016-11-17
 */
@Controller
@RequestMapping(value = "${adminPath}${mobilePath}/oa/oaOvertime")
public class OaOvertimeControllerMobile extends BaseController {

	@Autowired
	private OaOvertimeService oaOvertimeService;
	@Autowired
	private SystemService systemService;
	@Autowired
	private OaProVacateService oaProVacateService;
	@Autowired
	private ActTaskService actTaskService;// 流程流转信息获取的业务类
	@Autowired
	private OaFlowBackService oaFlowBackService;// 流程撤回交接操作service

	@ModelAttribute
	public OaOvertime get(@RequestParam(required = false) String id) {
		OaOvertime entity = null;
		if (StringUtils.isNotBlank(id)) {
			entity = oaOvertimeService.get(id);
		}
		if (entity == null) {
			entity = new OaOvertime();
		}
		return entity;
	}

	@RequiresPermissions("oa:oaOvertime:view")
	@RequestMapping(value = { "list", "" })
	public String list(OaOvertime oaOvertime, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<OaOvertime> page = oaOvertimeService.findPage(new Page<OaOvertime>(request, response), oaOvertime);
		model.addAttribute("page", page);
		return "mobile/modules/oa/oaOvertimeList";
	}

	@RequiresPermissions("oa:oaOvertime:edit")
	@RequestMapping(value = "delete")
	public String delete(OaOvertime oaOvertime, RedirectAttributes redirectAttributes) {
		oaOvertimeService.delete(oaOvertime);
		addMessage(redirectAttributes, "删除成功");
		return "redirect:" + Global.getAdminPath() + Global.getMobilePath() + "/oa/oaOvertime/?repage";
	}

	/**
	 * 新建，打回，页面
	 */
	@RequiresPermissions("oa:oaOvertime:view")
	@RequestMapping(value = "form")
	@Token(save = true)
	public String form(OaOvertime oaOvertime, Model model, String flag, RedirectAttributes redirectAttributes) {
		oaOvertime = init(oaOvertime);
		// 流程撤回按钮需要的procInsId 的model属性
		model.addAttribute("procInsId", oaFlowBackService.isCanBack(oaOvertime.getProcInsId()));
		String view = "mobile/modules/oa/oaOvertimeView";// 默认去查看页面
		if (oaOvertimeService.isDeal(oaOvertime) && !"view".equals(flag)) {
			view = "mobile/modules/oa/oaOvertimeForm";// 有权限的人去修改页面
			// 流程撤回权交接操作
			oaFlowBackService.saveNULL(oaOvertime.getProcInsId());
			ModelUtil.overtimeAddMinDate(model);
		} else {
			oaOvertime.setCreateBy(systemService.getUser(oaOvertime.getCreateBy().getId()));// 为页面查询出申请人的名字
		}
		model.addAttribute("oaOvertime", oaOvertime);
		addTitle(model, oaOvertime);
		addShoucang(oaOvertime.getId(), model);
		addHistory(oaOvertime.getProcInsId(), model);// 装载流转信息
		addTask(model, oaOvertime);
		return view;
	}

	/**
	 * 新建提交，打回修改提交
	 * 
	 * flag 0 确定申请 1 取消申请
	 */
	@RequiresPermissions("oa:oaOvertime:edit")
	@RequestMapping(value = "save")
	@Token(remove = true)
	public String save(OaOvertime oaOvertime, Model model, RedirectAttributes redirectAttributes, String flag) {
		if (!beanValidator(model, oaOvertime)) {
			return form(oaOvertime, model, "", redirectAttributes);
		}
		oaOvertimeService.save(oaOvertime, flag, null, null);
		addMessage(redirectAttributes, "提交成功");
		return "redirect:" + Global.getAdminPath() + Global.getMobilePath() + "/oa/oaOvertime/form?id="
				+ oaOvertime.getId() + "&flag=view";
	}

	/**
	 * 上级审核页面
	 */
	@RequiresPermissions("oa:oaOvertime:view")
	@RequestMapping(value = "exam")
	@Token(save = true)
	public String exam(OaOvertime oaOvertime, Model model) {
		oaOvertime = init(oaOvertime);
		// 流程撤回按钮需要的procInsId 的model属性
		model.addAttribute("procInsId", oaFlowBackService.isCanBack(oaOvertime.getProcInsId()));
		oaOvertime.setCreateBy(systemService.getUser(oaOvertime.getCreateBy().getId()));// 为页面查询出申请人的名字
		model.addAttribute("oaOvertime", oaOvertime);
		String view = "mobile/modules/oa/oaOvertimeView";// 默认去查看页面
		if (oaOvertimeService.isDeal(oaOvertime)) {
			view = "mobile/modules/oa/oaOvertimeExam";// 有权限的人去审核页面
			// 流程撤回权交接操作
			oaFlowBackService.saveNULL(oaOvertime.getProcInsId());
		}
		addTitle(model, oaOvertime);
		addShoucang(oaOvertime.getId(), model);
		addHistory(oaOvertime.getProcInsId(), model);// 装载流转信息
		addTask(model, oaOvertime);
		return view;
	}

	/**
	 * 上级审核意见提交
	 * 
	 * exam 1不同意 ，0同意
	 */
	@RequiresPermissions("oa:oaOvertime:edit")
	@RequestMapping(value = "dealExam")
	@Token(remove = true)
	public String dealExam(OaOvertime oaOvertime, Model model, RedirectAttributes redirectAttributes, String exam) {
		if (!beanValidator(model, oaOvertime)) {
			return exam(oaOvertime, model);
		}
		oaOvertimeService.dealExam(oaOvertime, exam);
		addMessage(redirectAttributes, "审核成功");
		return "redirect:" + Global.getAdminPath() + Global.getMobilePath() + "/oa/oaOvertime/form?id="
				+ oaOvertime.getId() + "&flag=view";
	}

	/**
	 * 归档审核页面
	 */
	@RequiresPermissions("oa:oaOvertime:view")
	@RequestMapping(value = "filling")
	@Token(save = true)
	public String filling(OaOvertime oaOvertime, Model model) {
		oaOvertime = init(oaOvertime);
		// 流程撤回按钮需要的procInsId 的model属性
		model.addAttribute("procInsId", oaFlowBackService.isCanBack(oaOvertime.getProcInsId()));
		oaOvertime.setCreateBy(systemService.getUser(oaOvertime.getCreateBy().getId()));// 为页面查询出申请人的名字
		model.addAttribute("oaOvertime", oaOvertime);
		String view = "mobile/modules/oa/oaOvertimeView";// 默认去查看页面
		if (oaOvertimeService.isDeal(oaOvertime)) {
			view = "mobile/modules/oa/oaOvertimeFilling";// 有权限的人去归档审核页面
			// 流程撤回权交接操作
			oaFlowBackService.saveNULL(oaOvertime.getProcInsId());
		}
		addTitle(model, oaOvertime);
		addShoucang(oaOvertime.getId(), model);
		addHistory(oaOvertime.getProcInsId(), model);// 装载流转信息
		addTask(model, oaOvertime);
		return view;
	}

	/**
	 * 人事归档审核意见提交
	 * 
	 * exam 1不同意 ，0同意
	 */
	@RequiresPermissions("oa:oaOvertime:edit")
	@RequestMapping(value = "dealFilling")
	@Token(remove = true)
	public String dealFilling(OaOvertime oaOvertime, Model model, RedirectAttributes redirectAttributes, String exam,
			String ftext) {
		if (!beanValidator(model, oaOvertime)) {
			return filling(oaOvertime, model);
		}
		// 认识归档操作代码？？
		oaOvertimeService.dealFilling(oaOvertime, exam, ftext);
		addMessage(redirectAttributes, "归档成功");
		return "redirect:" + Global.getAdminPath() + Global.getMobilePath() + "/oa/oaOvertime/form?id="
				+ oaOvertime.getId() + "&flag=view";
	}

	/**
	 * 流程结束后的获取实体对象的方法
	 * 
	 */
	private OaOvertime init(OaOvertime oaOvertime) {
		if (oaOvertime.getAct() != null && StringUtils.isNotBlank(oaOvertime.getAct().getProcInsId())) {
			oaOvertime = oaOvertimeService.getByProcInsId(oaOvertime.getAct().getProcInsId());
		}
		return oaOvertime;
	}

	/** 加入流程标题 */
	private void addTitle(Model model, OaOvertime oaOvertime) {
		String name = null;
		String date = null;
		if (StringUtils.isNotBlank(oaOvertime.getId())) {
			name = UserUtils.get(oaOvertime.getCreateBy().getId()).getName();
			date = DateUtils.formatDate(oaOvertime.getCreateDate());
		} else {
			name = UserUtils.getUser().getName();
			date = DateUtils.getDate();
		}
		model.addAttribute("title", "加班申请流程【" + name + " " + date + "】");
	}

	/** 加入工作台对象，用于显示流程图 */
	private void addTask(Model model, OaOvertime oaOvertime) {
		// 如果流程已启动，给出流程图
		if (oaOvertime.getProcInsId() != null
				&& oaProVacateService.getTaskByProcInsId(oaOvertime.getProcInsId()) != null) {
			model.addAttribute("task", oaProVacateService.getTaskByProcInsId(oaOvertime.getProcInsId()));
		}
	}

	/**
	 * 查找并且装载，流程流转信息
	 */
	public void addHistory(String procInsId, Model model) {
		if (StringUtils.isNotBlank(procInsId)) {
			// List<Act> temp=actTaskService.histoicFlowList(procInsId, null,
			// null);
			model.addAttribute("historys", actTaskService.histoicFlowList(procInsId, null, null));
		}
	}

	@Autowired
	private UserFavoriteService UserFavoriteService;// 获取当前流程信息是否已经被收藏

	/** 获取当前物质收藏状态 */
	public void addShoucang(String id, Model model) {
		if (StringUtils.isNotBlank(id)) {
			model.addAttribute("shoucang", UserFavoriteService.getShoucangState(id));
		}
	}

}