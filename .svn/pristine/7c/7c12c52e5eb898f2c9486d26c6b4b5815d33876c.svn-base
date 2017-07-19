/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.user.web.to;

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
import com.thinkgem.jeesite.modules.user.entity.to.UserTotalrecords;
import com.thinkgem.jeesite.modules.user.service.to.UserTotalrecordsService;

/**
 * 记录Controller
 * @author cz
 * @version 2017-02-13
 */
@Controller
@RequestMapping(value = "${adminPath}/user/to/userTotalrecords")
public class UserTotalrecordsController extends BaseController {

	@Autowired
	private UserTotalrecordsService userTotalrecordsService;
	
	@ModelAttribute
	public UserTotalrecords get(@RequestParam(required=false) String id) {
		UserTotalrecords entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = userTotalrecordsService.get(id);
		}
		if (entity == null){
			entity = new UserTotalrecords();
		}
		return entity;
	}
	
	@RequiresPermissions("user:to:userTotalrecords:view")
	@RequestMapping(value = {"list", ""})
	public String list(UserTotalrecords userTotalrecords, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<UserTotalrecords> page = userTotalrecordsService.findPage(new Page<UserTotalrecords>(request, response), userTotalrecords); 
		model.addAttribute("page", page);
		return "modules/user/to/userTotalrecordsList";
	}

	@RequiresPermissions("user:to:userTotalrecords:view")
	@RequestMapping(value = "form")
	public String form(UserTotalrecords userTotalrecords, Model model) {
		model.addAttribute("userTotalrecords", userTotalrecords);
		return "modules/user/to/userTotalrecordsForm";
	}

	@RequiresPermissions("user:to:userTotalrecords:edit")
	@RequestMapping(value = "save")
	public String save(UserTotalrecords userTotalrecords, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, userTotalrecords)){
			return form(userTotalrecords, model);
		}
		userTotalrecordsService.save(userTotalrecords);
		addMessage(redirectAttributes, "保存cz成功");
		return "redirect:"+Global.getAdminPath()+"/user/to/userTotalrecords/?repage";
	}
	
	@RequiresPermissions("user:to:userTotalrecords:edit")
	@RequestMapping(value = "delete")
	public String delete(UserTotalrecords userTotalrecords, RedirectAttributes redirectAttributes) {
		userTotalrecordsService.delete(userTotalrecords);
		addMessage(redirectAttributes, "删除cz成功");
		return "redirect:"+Global.getAdminPath()+"/user/to/userTotalrecords/?repage";
	}

	
	

}