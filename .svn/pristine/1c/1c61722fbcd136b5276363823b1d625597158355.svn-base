/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.web.filling;

import java.util.Date;

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

import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.oa.entity.filling.OaFilling;
import com.thinkgem.jeesite.modules.oa.service.filling.OaFillingService;

/**
 * 人事部归档Controller
 * 
 * @author lzx
 * @version 2016-11-23
 */
@Controller
@RequestMapping(value = "${adminPath}/oa/filling/oaFilling")
public class OaFillingController extends BaseController {

	@Autowired
	private OaFillingService oaFillingService;

	@ModelAttribute
	public OaFilling get(@RequestParam(required = false) String id) {
		OaFilling entity = null;
		if (StringUtils.isNotBlank(id)) {
			entity = oaFillingService.get(id);
		}
		if (entity == null) {
			entity = new OaFilling();
		}
		return entity;
	}

	@RequiresPermissions("oa:filling:oaFilling:view")
	@RequestMapping(value = { "list", "" })
	public String list(OaFilling oaFilling, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<OaFilling> page = oaFillingService.findPage(new Page<OaFilling>(request, response), oaFilling);
		model.addAttribute("page", page);
		return "modules/oa/filling/oaFillingList";
	}

	@RequiresPermissions("oa:filling:oaFilling:view")
	@RequestMapping(value = "findBySame")
	public String findBySame(OaFilling oaFilling, HttpServletRequest request, HttpServletResponse response, Model model,
			String type, String updateName, String createName, Date begindate2, Date enddate2) {
		model.addAttribute("type", type);
		model.addAttribute("updateName", updateName);
		model.addAttribute("createName", createName);
		model.addAttribute("begindate2", begindate2);
		model.addAttribute("enddate2", enddate2);
		Date enddate22 = null;
		if (enddate2 != null) {
			enddate22 = new Date(enddate2.getTime() + 86400000);
			oaFilling.setEndDate(enddate22);
		}
		Page<OaFilling> inpage = new Page<OaFilling>(request, response);
		Page<OaFilling> page = oaFillingService.findPage(inpage, oaFilling);
		model.addAttribute("page", page);
		return "modules/oa/filling/oaFillingList";
	}

	@RequiresPermissions("oa:filling:oaFilling:view")
	@RequestMapping(value = "form")
	public String form(OaFilling oaFilling, Model model) {
		model.addAttribute("oaFilling", oaFilling);
		return "modules/oa/filling/oaFillingForm";
	}

	@RequiresPermissions("oa:filling:oaFilling:edit")
	@RequestMapping(value = "save")
	public String save(OaFilling oaFilling, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, oaFilling)) {
			return form(oaFilling, model);
		}
		oaFillingService.save(oaFilling);
		addMessage(redirectAttributes, "保存人事部归档成功");
		return "redirect:" + Global.getAdminPath() + "/oa/filling/oaFilling/?repage";
	}

	@RequiresPermissions("oa:filling:oaFilling:edit")
	@RequestMapping(value = "delete")
	public String delete(OaFilling oaFilling, RedirectAttributes redirectAttributes) {
		oaFillingService.delete(oaFilling);
		addMessage(redirectAttributes, "删除人事部归档成功");
		return "redirect:" + Global.getAdminPath() + "/oa/filling/oaFilling/?repage";
	}

}