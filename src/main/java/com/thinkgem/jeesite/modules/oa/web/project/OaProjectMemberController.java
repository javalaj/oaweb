/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.web.project;

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
import com.thinkgem.jeesite.modules.oa.entity.project.OaProjectMember;
import com.thinkgem.jeesite.modules.oa.service.project.OaProjectMemberService;

/**
 * 项目成员管理Controller
 * @author 李廷龙
 * @version 2017-02-22
 */
@Controller
@RequestMapping(value = "${adminPath}/oa/project/oaProjectMember")
public class OaProjectMemberController extends BaseController {

	@Autowired
	private OaProjectMemberService oaProjectMemberService;
	
	@ModelAttribute
	public OaProjectMember get(@RequestParam(required=false) String id) {
		OaProjectMember entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = oaProjectMemberService.get(id);
		}
		if (entity == null){
			entity = new OaProjectMember();
		}
		return entity;
	}
	
	@RequiresPermissions("oa:project:oaProjectMember:view")
	@RequestMapping(value = {"list", ""})
	public String list(OaProjectMember oaProjectMember, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<OaProjectMember> page = oaProjectMemberService.findPage(new Page<OaProjectMember>(request, response), oaProjectMember); 
		model.addAttribute("page", page);
		return "modules/oa/project/oaProjectMemberList";
	}

	@RequiresPermissions("oa:project:oaProjectMember:view")
	@RequestMapping(value = "form")
	public String form(OaProjectMember oaProjectMember, Model model) {
		model.addAttribute("oaProjectMember", oaProjectMember);
		return "modules/oa/project/oaProjectMemberForm";
	}

	@RequiresPermissions("oa:project:oaProjectMember:edit")
	@RequestMapping(value = "save")
	public String save(OaProjectMember oaProjectMember, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, oaProjectMember)){
			return form(oaProjectMember, model);
		}
		oaProjectMemberService.save(oaProjectMember);
		addMessage(redirectAttributes, "保存项目成员成功");
		
		return "redirect:"+Global.getAdminPath()+"/oa/project/oaProject/form?id="+oaProjectMember.getProject().getId()+"&tabIndex=4";
	}
	
	@RequiresPermissions("oa:project:oaProjectMember:edit")
	@RequestMapping(value = "delete")
	public String delete(OaProjectMember oaProjectMember, RedirectAttributes redirectAttributes) {
		oaProjectMemberService.delete(oaProjectMember);
		addMessage(redirectAttributes, "删除项目成员成功");
		return "redirect:"+Global.getAdminPath()+"/oa/project/oaProject/form?id="+oaProjectMember.getProject().getId()+"&tabIndex=4";
	}

}