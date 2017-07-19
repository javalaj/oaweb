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

import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.oa.entity.OaEquipment;
import com.thinkgem.jeesite.modules.oa.service.OaEquipmentService;

/**
 * 固定资产管理Controller
 * @author liaijun
 * @version 2016-10-20
 */
@Controller
@RequestMapping(value = "${adminPath}/oa/oaEquipment")
public class OaEquipmentController extends BaseController {

	@Autowired
	private OaEquipmentService oaEquipmentService;
	
	@ModelAttribute
	public OaEquipment get(@RequestParam(required=false) String id) {
		OaEquipment entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = oaEquipmentService.get(id);
		}
		if (entity == null){
			entity = new OaEquipment();
		}
		return entity;
	}
	/**
	 * 固定资产列表
	 */
	@RequiresPermissions("oa:oaEquipment:view")
	@RequestMapping(value = {"list", ""})
	public String list(OaEquipment oaEquipment, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<OaEquipment> page = oaEquipmentService.findPage(new Page<OaEquipment>(request, response), oaEquipment); 
		model.addAttribute("page", page);
		return "modules/oa/oaEquipmentList";
	}

	@RequiresPermissions("oa:oaEquipment:view")
	@RequestMapping(value = "form")
	public String form(OaEquipment oaEquipment, Model model) {
		model.addAttribute("oaEquipment", oaEquipment);
		return "modules/oa/oaEquipmentForm";
	}

	@RequiresPermissions("oa:oaEquipment:edit")
	@RequestMapping(value = "save")
	public String save(OaEquipment oaEquipment, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, oaEquipment)){
			return form(oaEquipment, model);
		}
		oaEquipmentService.save(oaEquipment);
		addMessage(redirectAttributes, "保存固定资产管理成功");
		return "redirect:"+Global.getAdminPath()+"/oa/oaEquipment/?repage";
	}
	
	@RequiresPermissions("oa:oaEquipment:edit")
	@RequestMapping(value = "delete")
	public String delete(OaEquipment oaEquipment, RedirectAttributes redirectAttributes) {
		oaEquipmentService.delete(oaEquipment);
		addMessage(redirectAttributes, "删除固定资产管理成功");
		return "redirect:"+Global.getAdminPath()+"/oa/oaEquipment/?repage";
	}

}