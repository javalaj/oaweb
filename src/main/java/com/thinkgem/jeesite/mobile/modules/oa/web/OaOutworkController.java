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
import com.thinkgem.jeesite.modules.oa.entity.OaOutwork;
import com.thinkgem.jeesite.modules.oa.service.OaOutworkService;
import com.thinkgem.jeesite.modules.oa.service.coding.OaProVacateService;
import com.thinkgem.jeesite.modules.oa.service.flowback.OaFlowBackService;
import com.thinkgem.jeesite.modules.oa.utils.flow.ModelUtil;
import com.thinkgem.jeesite.modules.sys.service.SystemService;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;
import com.thinkgem.jeesite.modules.user.service.UserFavoriteService;

/**
 * 出差申请业务表Controller
 * 
 * @author liuxin
 * @version 2016-11-18
 */
@Controller("mOaOutworkController")
@RequestMapping(value = "${adminPath}${mobilePath}/oa/oaOutwork")
public class OaOutworkController extends BaseController {

	@Autowired
	private OaOutworkService oaOutworkService;
	@Autowired
	private SystemService systemService;
	@Autowired
	private OaProVacateService oaProVacateService;
	@Autowired
	private ActTaskService actTaskService;// 流程流转信息获取的业务类
	@Autowired
	private OaFlowBackService oaFlowBackService;// 流程撤回交接操作service

	@ModelAttribute
	public OaOutwork get(@RequestParam(required = false) String id) {
		OaOutwork entity = null;
		if (StringUtils.isNotBlank(id)) {
			entity = oaOutworkService.get(id);
		}
		if (entity == null) {
			entity = new OaOutwork();
		}
		return entity;
	}

	@RequiresPermissions("oa:oaOutwork:edit")
	@RequestMapping(value = "delete")
	public String delete(OaOutwork oaOutwork, RedirectAttributes redirectAttributes) {
		oaOutworkService.delete(oaOutwork);
		addMessage(redirectAttributes, "删除成功");
		return "redirect:" + Global.getAdminPath() + Global.getMobilePath() + "/oa/oaOutwork/?repage";
	}

	@RequiresPermissions("oa:oaOutwork:view")
	@RequestMapping(value = { "list", "" })
	public String list(OaOutwork oaOutwork, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<OaOutwork> page = oaOutworkService.findPage(new Page<OaOutwork>(request, response), oaOutwork);
		model.addAttribute("page", page);
		return "mobile/modules/oa/oaOutworkList";
	}

	/**
	 * 新建，打回，页面
	 */
	@RequiresPermissions("oa:oaOutwork:view")
	@RequestMapping(value = "form")
	@Token(save = true)
	public String form(OaOutwork oaOutwork, Model model, String flag, RedirectAttributes redirectAttributes
			) {
		oaOutwork = init(oaOutwork);
		// 流程撤回按钮需要的procInsId 的model属性
		model.addAttribute("procInsId", oaFlowBackService.isCanBack(oaOutwork.getProcInsId()));
		String view = "mobile/modules/oa/oaOutworkView";
		if (oaOutworkService.isDeal(oaOutwork) && !"view".equals(flag)) {
			view = "mobile/modules/oa/oaOutworkForm";
			// 流程撤回权交接操作
			oaFlowBackService.saveNULL(oaOutwork.getProcInsId());
			ModelUtil.overtimeAddMinDate(model);
		} else {
			oaOutwork.setCreateBy(systemService.getUser(oaOutwork.getCreateBy().getId()));// 为页面查询出申请人的名字
		}
		model.addAttribute("oaOutwork", oaOutwork);
		addTitle(model, oaOutwork);
		addHistory(oaOutwork.getProcInsId(), model);// 装载流转信息
		addTask(model, oaOutwork);
		addShoucang(oaOutwork.getId(), model);
		return view;
	}

	/**
	 * 新建提交，打回修改提交
	 * 
	 * flag 0 确定申请 1 取消申请
	 */
	@RequiresPermissions("oa:oaOutwork:edit")
	@RequestMapping(value = "save")
	@Token(remove = true)
	public String save(OaOutwork oaOutwork, Model model, RedirectAttributes redirectAttributes, String flag) {
		if (!beanValidator(model, oaOutwork)) {
			return form(oaOutwork, model, "", redirectAttributes);
		}
		oaOutworkService.save(oaOutwork, flag);
		addMessage(redirectAttributes, "提交成功");
		return "redirect:" + Global.getAdminPath() + Global.getMobilePath() + "/oa/oaOutwork/form?id="
				+ oaOutwork.getId() + "&flag=view";
	}

	/**
	 * 上级审核页面
	 */
	@RequiresPermissions("oa:oaOutwork:view")
	@RequestMapping(value = "exam")
	@Token(save = true)
	public String exam(OaOutwork oaOutwork, Model model) {
		oaOutwork = init(oaOutwork);
		// 流程撤回按钮需要的procInsId 的model属性
		model.addAttribute("procInsId", oaFlowBackService.isCanBack(oaOutwork.getProcInsId()));
		oaOutwork.setCreateBy(systemService.getUser(oaOutwork.getCreateBy().getId()));// 为页面查询出申请人的名字
		model.addAttribute("oaOutwork", oaOutwork);
		String view = "mobile/modules/oa/oaOutworkView";
		if (oaOutworkService.isDeal(oaOutwork)) {
			view = "mobile/modules/oa/oaOutworkExam";
			// 流程撤回权交接操作
			oaFlowBackService.saveNULL(oaOutwork.getProcInsId());
		}
		addTitle(model, oaOutwork);
		addHistory(oaOutwork.getProcInsId(), model);// 装载流转信息
		addTask(model, oaOutwork);
		addShoucang(oaOutwork.getId(), model);
		return view;
	}

	/**
	 * 上级审核意见提交
	 * 
	 * exam 1不同意 ，0同意
	 */
	@RequiresPermissions("oa:oaOutwork:edit")
	@RequestMapping(value = "dealExam")
	@Token(remove = true)
	public String dealExam(OaOutwork oaOutwork, Model model, RedirectAttributes redirectAttributes, String exam) {
		if (!beanValidator(model, oaOutwork)) {
			return exam(oaOutwork, model);
		}
		oaOutworkService.dealExam(oaOutwork, exam, 1,null,null);
		addMessage(redirectAttributes, "审核成功");
		return "redirect:" + Global.getAdminPath() + Global.getMobilePath() + "/oa/oaOutwork/form?id="
				+ oaOutwork.getId() + "&flag=view";
	}

	/**
	 * 部门副总审核页面
	 */
	@RequiresPermissions("oa:oaOutwork:view")
	@RequestMapping(value = "exam2")
	@Token(save = true)
	public String exam2(OaOutwork oaOutwork, Model model,String newsign) {
		oaOutwork = init(oaOutwork);
		// 流程撤回按钮需要的procInsId 的model属性
		model.addAttribute("procInsId", oaFlowBackService.isCanBack(oaOutwork.getProcInsId()));
		oaOutwork.setCreateBy(systemService.getUser(oaOutwork.getCreateBy().getId()));// 为页面查询出申请人的名字
		model.addAttribute("oaOutwork", oaOutwork);
		String view = "mobile/modules/oa/oaOutworkView";
		if (oaOutworkService.isDeal(oaOutwork)) {
			view = "mobile/modules/oa/oaOutworkExam2";
			// 流程撤回权交接操作
			oaFlowBackService.saveNULL(oaOutwork.getProcInsId());
		}
		addTitle(model, oaOutwork);
		addHistory(oaOutwork.getProcInsId(), model);// 装载流转信息
		addTask(model, oaOutwork);
		addShoucang(oaOutwork.getId(), model);
		model.addAttribute("newsign", newsign);
		return view;
	}

	/**
	 * 部门副总审核意见提交
	 * 
	 * exam 1不同意 ，0同意
	 */
	@RequiresPermissions("oa:oaOutwork:edit")
	@RequestMapping(value = "dealExam2")
	@Token(remove = true)
	public String dealExam2(OaOutwork oaOutwork, Model model, RedirectAttributes redirectAttributes, String exam,String newsign,String examtextNew) {
		if (!beanValidator(model, oaOutwork)) {
			return exam2(oaOutwork, model,newsign);
		}
		oaOutworkService.dealExam(oaOutwork, exam, 2,newsign,examtextNew);
		addMessage(redirectAttributes, "审核成功");
		return "redirect:" + Global.getAdminPath() + Global.getMobilePath() + "/oa/oaOutwork/form?id="
				+ oaOutwork.getId() + "&flag=view";
	}

	/**
	 * 新增加的---1-出差结束确认时间填写---2-上级领导审核---3-财务报销状态填写----审核页面
	 */
	@RequiresPermissions("oa:oaOutwork:view")
	@RequestMapping(value = "exam3")
	@Token(save = true)
	public String exam3(OaOutwork oaOutwork, Model model, int num) {
		oaOutwork = init(oaOutwork);
		// 流程撤回按钮需要的procInsId 的model属性
		model.addAttribute("procInsId", oaFlowBackService.isCanBack(oaOutwork.getProcInsId()));
		oaOutwork.setCreateBy(systemService.getUser(oaOutwork.getCreateBy().getId()));// 为页面查询出申请人的名字
		model.addAttribute("oaOutwork", oaOutwork);
		String view = "mobile/modules/oa/oaOutworkView";
		if (oaOutworkService.isDeal(oaOutwork)) {
			view = "mobile/modules/oa/oaOutworkExam3" + num;
			// 流程撤回权交接操作
			oaFlowBackService.saveNULL(oaOutwork.getProcInsId());
		}
		addTitle(model, oaOutwork);
		addHistory(oaOutwork.getProcInsId(), model);// 装载流转信息
		addTask(model, oaOutwork);
		addShoucang(oaOutwork.getId(), model);
		return view;
	}

	/**
	 * 新增加的---1- 出差结束确认时间填写---2-上级领导审核---3-财务报销状态填写----意见提交
	 * 
	 * exam 1不同意 ，0同意
	 */
	@RequiresPermissions("oa:oaOutwork:edit")
	@RequestMapping(value = "dealExam3")
	@Token(remove = true)
	public String dealExam3(OaOutwork oaOutwork, Model model, RedirectAttributes redirectAttributes, String exam,
			int sign, String toSendMessageUserid) {
		if (!beanValidator(model, oaOutwork)) {
			return exam3(oaOutwork, model, sign);
		}
		oaOutworkService.dealExam3(oaOutwork, exam, sign, toSendMessageUserid);
		addMessage(redirectAttributes, "审核成功");
		return "redirect:" + Global.getAdminPath() + Global.getMobilePath() + "/oa/oaOutwork/form?id="
				+ oaOutwork.getId() + "&flag=view";
	}

	/**
	 * 归档审核页面
	 */
	@RequiresPermissions("oa:oaOutwork:view")
	@RequestMapping(value = "filling")
	@Token(save = true)
	public String filling(OaOutwork oaOutwork, Model model) {
		oaOutwork = init(oaOutwork);
		// 流程撤回按钮需要的procInsId 的model属性
		model.addAttribute("procInsId", oaFlowBackService.isCanBack(oaOutwork.getProcInsId()));
		oaOutwork.setCreateBy(systemService.getUser(oaOutwork.getCreateBy().getId()));// 为页面查询出申请人的名字
		model.addAttribute("oaOutwork", oaOutwork);
		String view = "mobile/modules/oa/oaOutworkView";
		if (oaOutworkService.isDeal(oaOutwork)) {
			view = "mobile/modules/oa/oaOutworkFilling";
			// 流程撤回权交接操作
			oaFlowBackService.saveNULL(oaOutwork.getProcInsId());
		}
		addTitle(model, oaOutwork);
		addHistory(oaOutwork.getProcInsId(), model);// 装载流转信息
		addTask(model, oaOutwork);
		addShoucang(oaOutwork.getId(), model);
		return view;
	}

	/**
	 * 人事归档审核意见提交
	 * 
	 * 
	 */
	@RequiresPermissions("oa:oaOutwork:edit")
	@RequestMapping(value = "dealFilling")
	@Token(remove = true)
	public String dealFilling(OaOutwork oaOutwork, Model model, RedirectAttributes redirectAttributes, String exam,
			String ftext) {
		if (!beanValidator(model, oaOutwork)) {
			return filling(oaOutwork, model);
		}
		// 认识归档操作代码？？
		oaOutworkService.dealFilling(oaOutwork, exam, ftext);
		addMessage(redirectAttributes, "归档成功");
		return "redirect:" + Global.getAdminPath() + Global.getMobilePath() + "/oa/oaOutwork/form?id="
				+ oaOutwork.getId() + "&flag=view";
	}

	/**
	 * 流程结束后的获取实体对象的方法
	 * 
	 */
	private OaOutwork init(OaOutwork oaOutwork) {
		if (oaOutwork.getAct() != null && StringUtils.isNotBlank(oaOutwork.getAct().getProcInsId())) {
			oaOutwork = oaOutworkService.getByProcInsId(oaOutwork.getAct().getProcInsId());
		}
		return oaOutwork;
	}

	/** 加入流程标题 */
	public void addTitle(Model model, OaOutwork oaOutwork) {
		String name = null;
		String date = null;
		if (StringUtils.isNotBlank(oaOutwork.getId())) {
			name = UserUtils.get(oaOutwork.getCreateBy().getId()).getName();
			date = DateUtils.formatDate(oaOutwork.getCreateDate());
		} else {
			name = UserUtils.getUser().getName();
			date = DateUtils.getDate();
		}
		model.addAttribute("title", "出差申请流程【" + name + " " + date + "】");
	}

	/** 加入工作台对象，用于显示流程图 */
	private void addTask(Model model, OaOutwork oaOutwork) {
		// 如果流程已启动，给出流程图
		if (oaOutwork.getProcInsId() != null
				&& oaProVacateService.getTaskByProcInsId(oaOutwork.getProcInsId()) != null) {
			model.addAttribute("task", oaProVacateService.getTaskByProcInsId(oaOutwork.getProcInsId()));
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