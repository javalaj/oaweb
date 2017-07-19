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
import com.thinkgem.jeesite.modules.oa.entity.OaArchivesRecord;
import com.thinkgem.jeesite.modules.oa.service.OaArchivesRecordService;

/**
 * 公司发文记录Controller
 * @author niting
 * @version 2016-12-22
 */
@Controller
@RequestMapping(value = "${adminPath}/oa/oaArchivesRecord")
public class OaArchivesRecordController extends BaseController {

	@Autowired
	private OaArchivesRecordService oaArchivesRecordService;
	
	@ModelAttribute
	public OaArchivesRecord get(@RequestParam(required=false) String id) {
		OaArchivesRecord entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = oaArchivesRecordService.get(id);
		}
		if (entity == null){
			entity = new OaArchivesRecord();
		}
		return entity;
	}
	
	@RequiresPermissions("oa:oaArchivesRecord:view")
	@RequestMapping(value = {"list", ""})
	public String list(OaArchivesRecord oaArchivesRecord, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<OaArchivesRecord> page = oaArchivesRecordService.findPage(new Page<OaArchivesRecord>(request, response), oaArchivesRecord); 
		model.addAttribute("page", page);
		return "modules/oa/oaArchivesRecordList";
	}

	@RequiresPermissions("oa:oaArchivesRecord:view")
	@RequestMapping(value = "form")
	public String form(OaArchivesRecord oaArchivesRecord, Model model) {
		model.addAttribute("oaArchivesRecord", oaArchivesRecord);
		return "modules/oa/oaArchivesRecordForm";
	}

	@RequiresPermissions("oa:oaArchivesRecord:edit")
	@RequestMapping(value = "save")
	public String save(OaArchivesRecord oaArchivesRecord, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, oaArchivesRecord)){
			return form(oaArchivesRecord, model);
		}
		oaArchivesRecordService.save(oaArchivesRecord);
		addMessage(redirectAttributes, "保存保存发文记录成功成功");
		return "redirect:"+Global.getAdminPath()+"/oa/oaArchivesRecord/?repage";
	}
	
	@RequiresPermissions("oa:oaArchivesRecord:edit")
	@RequestMapping(value = "delete")
	public String delete(OaArchivesRecord oaArchivesRecord, RedirectAttributes redirectAttributes) {
		oaArchivesRecordService.delete(oaArchivesRecord);
		addMessage(redirectAttributes, "删除保存发文记录成功成功");
		return "redirect:"+Global.getAdminPath()+"/oa/oaArchivesRecord/?repage";
	}

}