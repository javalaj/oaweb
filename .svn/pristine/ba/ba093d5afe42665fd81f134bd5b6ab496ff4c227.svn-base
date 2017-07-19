/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.mobile.modules.oa.web.oaReceiveFile;

import java.io.UnsupportedEncodingException;

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
import com.thinkgem.jeesite.modules.oa.entity.OaReceiveFile;
import com.thinkgem.jeesite.modules.oa.service.OaReceiveFileService;
import com.thinkgem.jeesite.modules.oa.service.coding.OaProVacateService;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;
import com.thinkgem.jeesite.modules.user.entity.UserFavorite;
import com.thinkgem.jeesite.modules.user.service.UserFavoriteService;

/**
 * 公司收文登记流程Controller
 * 
 * @author liuxin
 * @version 2016-12-20
 */
@Controller(value = "oaReceiveFileControllerMobile")
@RequestMapping(value = "${adminPath}${mobilePath}/oa/oaReceiveFile")
public class OaReceiveFileController extends BaseController {

	@Autowired
	private OaReceiveFileService oaReceiveFileService;
	@Autowired
	private OaProVacateService oaProVacateService;
	@Autowired
	private UserFavoriteService userFavoriteService;// 收藏业务类

	@ModelAttribute
	public OaReceiveFile get(@RequestParam(required = false) String id) {
		OaReceiveFile entity = null;
		if (StringUtils.isNotBlank(id)) {
			entity = oaReceiveFileService.get(id);
		}
		if (entity == null) {
			entity = new OaReceiveFile();
		}
		return entity;
	}

	@RequiresPermissions("oa:oaReceiveFile:view")
	@RequestMapping(value = { "list", "" })
	public String list(OaReceiveFile oaReceiveFile, HttpServletRequest request, HttpServletResponse response,
			Model model, String flag) {
		oaReceiveFile.setCreateBy(UserUtils.getUser());
		Page<OaReceiveFile> page = oaReceiveFileService.findPage(new Page<OaReceiveFile>(request, response),
				oaReceiveFile);
		model.addAttribute("page", page);
		model.addAttribute("flag", flag);
		return "mobile/modules/oa/oaReceiveFile/oaReceiveFileList";
	}

	@RequiresPermissions("oa:oaReceiveFile:edit")
	@RequestMapping(value = "delete")
	public String delete(OaReceiveFile oaReceiveFile, RedirectAttributes redirectAttributes) {
		oaReceiveFileService.delete(oaReceiveFile);
		addMessage(redirectAttributes, "删除成功");
		return "redirect:" + Global.getAdminPath() + "/oa/oaReceiveFile/?repage";
	}

	/**
	 * 新建，打回，页面
	 */
	@RequiresPermissions("oa:oaReceiveFile:view")
	@RequestMapping(value = "form")
	@Token(save = true)
	public String form(OaReceiveFile oaReceiveFile, Model model, String flag) {
		addProcDefId("oa_receive_file", model);
		oaReceiveFile = init(oaReceiveFile);
		String view = "mobile/modules/oa/oaReceiveFile/oaReceiveFileView";// 默认去查看页面
		if ((oaReceiveFileService.isDeal(oaReceiveFile) && !"view".equals(flag)) || "form".equals(flag)) {
			view = "modules/oa/oaReceiveFileForm";// 有权限的人去修改页面
		} else {
			oaReceiveFile.setCreateBy(UserUtils.get(oaReceiveFile.getCreateBy().getId()));// 为页面查询出申请人的名字
		}
		model.addAttribute("oaReceiveFile", oaReceiveFile);
		addTitle(model, oaReceiveFile);
		addTask(model, oaReceiveFile);
		addShoucang(oaReceiveFile.getId(), model);
		addHistory(oaReceiveFile.getProcInsId(), model);// 装载流转信息
		return view;
	}

	/**
	 * 新建提交，打回修改提交
	 * 
	 * flag 0 确定申请 1 取消申请
	 */
	@RequiresPermissions("oa:oaReceiveFile:edit")
	@RequestMapping(value = "save")
	@Token(remove = true)
	public String save(OaReceiveFile oaReceiveFile, Model model, RedirectAttributes redirectAttributes, String flag,
			String hostUpperOfficeId) {
		if (!beanValidator(model, oaReceiveFile)) {
			return form(oaReceiveFile, model, "");
		}
		if (oaReceiveFile.getIsdraft().equals("0")) {
			if (StringUtils.isBlank(oaReceiveFile.getOfficename())) {
				// 查询出部门名称，并设置
				oaReceiveFile.setOfficename(UserUtils.getUser().getOffice().getName());
			}
			oaReceiveFileService.save(oaReceiveFile);
			return "redirect:" + Global.getAdminPath() + "/oa/oaReceiveFile/?repage";
		} else {
			oaReceiveFileService.save(oaReceiveFile, flag, hostUpperOfficeId);
			addMessage(redirectAttributes, "提交成功");
			return "redirect:" + Global.getAdminPath() + "/oa/oaReceiveFile/form?id=" + oaReceiveFile.getId()
					+ "&flag=view";
		}

	}

	/**
	 * 新建，打回，页面
	 */
	@RequiresPermissions("oa:oaReceiveFile:view")
	@RequestMapping(value = "exam")
	@Token(save = true)
	public String exam(OaReceiveFile oaReceiveFile, Model model, int num) {

		oaReceiveFile = init(oaReceiveFile);
		oaReceiveFile.setCreateBy(UserUtils.get(oaReceiveFile.getCreateBy().getId()));// 为页面查询出申请人的名字
		String view = "modules/oa/oaReceiveFileView";// 默认去查看页面
		if (oaReceiveFileService.isDeal(oaReceiveFile)) {
			view = "modules/oa/oaReceiveFileExam" + num;// 有权限的人去修改页面
		}
		model.addAttribute("oaReceiveFile", oaReceiveFile);
		addTitle(model, oaReceiveFile);
		addTask(model, oaReceiveFile);
		addShoucang(oaReceiveFile.getId(), model);
		addHistory(oaReceiveFile.getProcInsId(), model);// 装载流转信息
		return view;
	}

	/**
	 * 新建提交，打回修改提交
	 * 
	 * flag 0 确定申请 1 取消申请
	 */
	@RequiresPermissions("oa:oaReceiveFile:edit")
	@RequestMapping(value = "dealExam")
	@Token(remove = true)
	public String dealExam(OaReceiveFile oaReceiveFile, Model model, RedirectAttributes redirectAttributes, String exam,
			int sign, String next, String hostPersonId) {
		oaReceiveFile.setIsdraft("1");
		if (!beanValidator(model, oaReceiveFile)) {
			return exam(oaReceiveFile, model, sign);
		}
		oaReceiveFileService.dealExam(oaReceiveFile, exam, sign, next, hostPersonId);
		addMessage(redirectAttributes, "审核成功");
		return "redirect:" + Global.getAdminPath() + "/oa/oaReceiveFile/form?id=" + oaReceiveFile.getId()
				+ "&flag=view";
	}

	/**
	 * 流程结束后的获取实体对象的方法
	 * 
	 */
	private OaReceiveFile init(OaReceiveFile oaOvertime) {
		if (oaOvertime.getAct() != null && StringUtils.isNotBlank(oaOvertime.getAct().getProcInsId())) {
			oaOvertime = oaReceiveFileService.getByProcInsId(oaOvertime.getAct().getProcInsId());
		}
		return oaOvertime;
	}

	/** 加入流程标题 */
	private void addTitle(Model model, OaReceiveFile oaOvertime) {
		String name = null;
		String date = null;
		if (StringUtils.isNotBlank(oaOvertime.getId())) {
			name = UserUtils.get(oaOvertime.getCreateBy().getId()).getName();
			date = DateUtils.formatDate(oaOvertime.getCreateDate());
		} else {
			name = UserUtils.getUser().getName();
			date = DateUtils.getDate();
		}
		model.addAttribute("title", "公司收文流程【" + name + " " + date + "】");
	}

	/** 加入工作台对象，用于显示流程图 */
	private void addTask(Model model, OaReceiveFile oaOvertime) {
		// 如果流程已启动，给出流程图
		if (oaOvertime.getProcInsId() != null
				&& oaProVacateService.getTaskByProcInsId(oaOvertime.getProcInsId()) != null) {
			model.addAttribute("task", oaProVacateService.getTaskByProcInsId(oaOvertime.getProcInsId()));
		}
	}

	/** 批量收藏 */
	@RequiresPermissions("oa:oaReceiveFile:edit")
	@RequestMapping(value = "xinSave")
	public String xinSave(String ids) {
		try {
			ids = java.net.URLDecoder.decode(ids, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		String[] ids2 = ids.split(",,,");
		for (String id : ids2) {
			UserFavorite userFavorite = new UserFavorite();
			userFavorite.setType("公司收文");
			userFavorite.setTitle(id.substring(32, id.length()));
			userFavorite.setSign(id.substring(0, 32));
			userFavorite.setUrl("/oa/oaReceiveFile/form?flag=view&id=" + id.substring(0, 32));
			System.err.println(id);
			System.err.println(userFavorite.getTitle());
			System.err.println(userFavorite.getSign());
			userFavoriteService.save(userFavorite);
		}
		return "redirect:" + Global.getAdminPath() + "/oa/oaReceiveFile/?repage&flag=xinSave";
	}

	/** 批量删除 */
	@RequiresPermissions("oa:oaReceiveFile:edit")
	@RequestMapping(value = "xinDel")
	public String xinDel(String[] ids) {
		for (String id : ids) {
			OaReceiveFile oaReceiveFile = new OaReceiveFile();
			oaReceiveFile.setId(id);
			oaReceiveFileService.delete(oaReceiveFile);
		}
		return "redirect:" + Global.getAdminPath() + "/oa/oaReceiveFile/?repage&flag=xinDel";
	}

	/**
	 * 查出流程的 procDefId 放在 model 中，用于页面查看流程图
	 */
	public void addProcDefId(String key, Model model) {
		model.addAttribute("procDefId", oaReceiveFileService.findProcDefIdByKey(key));
	}

	@Autowired
	private ActTaskService actTaskService;// 流程流转信息获取的业务类

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