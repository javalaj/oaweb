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
import com.thinkgem.jeesite.modules.oa.entity.OaGoout;
import com.thinkgem.jeesite.modules.oa.service.OaGooutService;
import com.thinkgem.jeesite.modules.oa.service.coding.OaProVacateService;
import com.thinkgem.jeesite.modules.oa.service.flowback.OaFlowBackService;
import com.thinkgem.jeesite.modules.sys.service.SystemService;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;
import com.thinkgem.jeesite.modules.user.service.UserFavoriteService;

/**
 * 外出申请流程业务Controllermobile
 * 
 * @author liuxin
 * @version 2016-11-18
 */
@Controller
@RequestMapping(value = "${adminPath}${mobilePath}/oa/oaGoout")
public class OaGooutControllerMobile extends BaseController {

	@Autowired
	private OaGooutService oaGooutService;
	@Autowired
	private SystemService systemService;
	@Autowired
	private OaProVacateService oaProVacateService;
	@Autowired
	private ActTaskService actTaskService;// 流程流转信息获取的业务类
	@Autowired
	private OaFlowBackService oaFlowBackService;// 流程撤回交接操作service

	@ModelAttribute
	public OaGoout get(@RequestParam(required = false) String id) {
		OaGoout entity = null;
		if (StringUtils.isNotBlank(id)) {
			entity = oaGooutService.get(id);
		}
		if (entity == null) {
			entity = new OaGoout();
		}
		return entity;
	}

	@RequiresPermissions("oa:oaGoout:view")
	@RequestMapping(value = { "list", "" })
	public String list(OaGoout oaGoout, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<OaGoout> page = oaGooutService.findPage(new Page<OaGoout>(request, response), oaGoout);
		model.addAttribute("page", page);
		return "mobile/modules/oa/goout/oaGooutList";
	}

	@RequiresPermissions("oa:oaGoout:edit")
	@RequestMapping(value = "delete")
	public String delete(OaGoout oaGoout, RedirectAttributes redirectAttributes) {
		oaGooutService.delete(oaGoout);
		addMessage(redirectAttributes, "删除成功");
		return "redirect:" + Global.getAdminPath() + Global.getMobilePath() + "/oa/oaGoout/?repage";
	}

	/**
	 * 新建，打回，页面
	 */
	@RequiresPermissions("oa:oaGoout:view")
	@RequestMapping(value = "form")
	@Token(save = true)
	public String form(OaGoout oaGoout, Model model, String flag, RedirectAttributes redirectAttributes) {
		oaGoout = init(oaGoout);
		// 流程撤回按钮需要的procInsId 的model属性
		model.addAttribute("procInsId", oaFlowBackService.isCanBack(oaGoout.getProcInsId()));
		String view = "mobile/modules/oa/goout/oaGooutView";
		if (oaGooutService.isDeal(oaGoout) && !"view".equals(flag)) {
			view = "mobile/modules/oa/goout/oaGooutForm";
			// 流程撤回权交接操作
			oaFlowBackService.saveNULL(oaGoout.getProcInsId());
		} else {
			oaGoout.setCreateBy(systemService.getUser(oaGoout.getCreateBy().getId()));// 为页面查询出申请人的名字
		}
		model.addAttribute("oaGoout", oaGoout);
		addTitle(model, oaGoout);
		addShoucang(oaGoout.getId(), model);
		addHistory(oaGoout.getProcInsId(), model);// 装载流转信息
		addTask(model, oaGoout);
		return view;
	}

	/**
	 * 新建提交，打回修改提交
	 * 
	 * flag 0 确定申请 1 取消申请
	 */
	@RequiresPermissions("oa:oaGoout:edit")
	@RequestMapping(value = "save")
	@Token(remove = true)
	public String save(OaGoout oaGoout, Model model, RedirectAttributes redirectAttributes, String flag) {
		if (!beanValidator(model, oaGoout)) {
			return form(oaGoout, model, "", redirectAttributes);
		}
		oaGooutService.save(oaGoout, flag);
		addMessage(redirectAttributes, "提交成功");
		return "redirect:" + Global.getAdminPath() + Global.getMobilePath() + "/oa/oaGoout/form?id=" + oaGoout.getId()
				+ "&flag=view";
	}

	/**
	 * 上级审核页面
	 */
	@RequiresPermissions("oa:oaGoout:view")
	@RequestMapping(value = "exam")
	@Token(save = true)
	public String exam(OaGoout oaGoout, Model model) {
		oaGoout = init(oaGoout);
		// 流程撤回按钮需要的procInsId 的model属性
		model.addAttribute("procInsId", oaFlowBackService.isCanBack(oaGoout.getProcInsId()));
		oaGoout.setCreateBy(systemService.getUser(oaGoout.getCreateBy().getId()));// 为页面查询出申请人的名字
		model.addAttribute("oaGoout", oaGoout);
		String view = "mobile/modules/oa/goout/oaGooutView";
		if (oaGooutService.isDeal(oaGoout)) {
			view = "mobile/modules/oa/goout/oaGooutExam";
			// 流程撤回权交接操作
			oaFlowBackService.saveNULL(oaGoout.getProcInsId());
		}
		addTitle(model, oaGoout);
		addShoucang(oaGoout.getId(), model);
		addHistory(oaGoout.getProcInsId(), model);// 装载流转信息
		addTask(model, oaGoout);
		return view;
	}

	/**
	 * 上级审核意见提交
	 * 
	 * exam 1不同意 ，0同意
	 */
	@RequiresPermissions("oa:oaGoout:edit")
	@RequestMapping(value = "dealExam")
	@Token(remove = true)
	public String dealExam(OaGoout oaGoout, Model model, RedirectAttributes redirectAttributes, String exam) {
		if (!beanValidator(model, oaGoout)) {
			return exam(oaGoout, model);
		}
		oaGooutService.dealExam(oaGoout, exam);
		addMessage(redirectAttributes, "审核成功");
		return "redirect:" + Global.getAdminPath() + Global.getMobilePath() + "/oa/oaGoout/form?id=" + oaGoout.getId()
				+ "&flag=view";
	}

	/**
	 * 归档审核页面
	 */
	@RequiresPermissions("oa:oaGoout:view")
	@RequestMapping(value = "filling")
	@Token(save = true)
	public String filling(OaGoout oaGoout, Model model) {
		oaGoout = init(oaGoout);
		// 流程撤回按钮需要的procInsId 的model属性
		model.addAttribute("procInsId", oaFlowBackService.isCanBack(oaGoout.getProcInsId()));
		oaGoout.setCreateBy(systemService.getUser(oaGoout.getCreateBy().getId()));// 为页面查询出申请人的名字
		model.addAttribute("oaGoout", oaGoout);
		String view = "mobile/modules/oa/goout/oaGooutView";
		if (oaGooutService.isDeal(oaGoout)) {
			view = "mobile/modules/oa/goout/oaGooutFilling";
			// 流程撤回权交接操作
			oaFlowBackService.saveNULL(oaGoout.getProcInsId());
		}
		addTitle(model, oaGoout);
		addShoucang(oaGoout.getId(), model);
		addHistory(oaGoout.getProcInsId(), model);// 装载流转信息
		addTask(model, oaGoout);
		return view;
	}

	/**
	 * 人事归档审核意见提交
	 * 
	 * exam 1不同意 ，0同意
	 */
	@RequiresPermissions("oa:oaGoout:edit")
	@RequestMapping(value = "dealFilling")
	@Token(remove = true)
	public String dealFilling(OaGoout oaGoout, Model model, RedirectAttributes redirectAttributes, String exam,
			String ftext) {
		if (!beanValidator(model, oaGoout)) {
			return filling(oaGoout, model);
		}
		// 认识归档操作代码？？
		oaGooutService.dealFilling(oaGoout, exam, ftext);
		addMessage(redirectAttributes, "归档成功");
		return "redirect:" + Global.getAdminPath() + Global.getMobilePath() + "/oa/oaGoout/form?id=" + oaGoout.getId()
				+ "&flag=view";
	}

	/**
	 * 流程结束后的获取实体对象的方法
	 * 
	 */
	private OaGoout init(OaGoout oaGoout) {
		if (oaGoout.getAct() != null && StringUtils.isNotBlank(oaGoout.getAct().getProcInsId())) {
			oaGoout = oaGooutService.getByProcInsId(oaGoout.getAct().getProcInsId());
		}
		return oaGoout;
	}

	/** 加入流程标题 */
	private void addTitle(Model model, OaGoout oaGoout) {
		String name = null;
		String date = null;
		if (StringUtils.isNotBlank(oaGoout.getId())) {
			name = UserUtils.get(oaGoout.getCreateBy().getId()).getName();
			date = DateUtils.formatDate(oaGoout.getCreateDate());
		} else {
			name = UserUtils.getUser().getName();
			date = DateUtils.getDate();
		}
		model.addAttribute("title", "外出申请流程【" + name + " " + date + "】");
	}

	/** 加入工作台对象，用于显示流程图 */
	private void addTask(Model model, OaGoout oaGoout) {
		// 如果流程已启动，给出流程图
		if (oaGoout.getProcInsId() != null && oaProVacateService.getTaskByProcInsId(oaGoout.getProcInsId()) != null) {
			model.addAttribute("task", oaProVacateService.getTaskByProcInsId(oaGoout.getProcInsId()));
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