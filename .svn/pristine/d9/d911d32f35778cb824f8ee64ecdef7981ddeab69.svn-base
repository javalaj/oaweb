/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.web.shortcutkey;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.mapper.JsonMapper;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.oa.entity.shortcutkey.ShortcutKey;
import com.thinkgem.jeesite.modules.oa.service.shortcutkey.ShortcutKeyService;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;

/**
 * 快捷方式Controller
 * @author zf
 * @version 2016-12-28
 */
@Controller
@RequestMapping(value = "${adminPath}/oa/shortcutkey/shortcutKey")
public class ShortcutKeyController extends BaseController {

	@Autowired
	private ShortcutKeyService shortcutKeyService;
	
	@ModelAttribute
	public ShortcutKey get(@RequestParam(required=false) String id) {
		ShortcutKey entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = shortcutKeyService.get(id);
		}
		if (entity == null){
			entity = new ShortcutKey();
		}
		return entity;
	}
	
	@RequiresPermissions("oa:shortcutkey:shortcutKey:view")
	@RequestMapping(value = {"list", ""})
	public String list(ShortcutKey shortcutKey, 
			HttpServletRequest request, HttpServletResponse response, Model model) 
	{
		shortcutKey.setCreateBy(UserUtils.getUser());
		
		Page<ShortcutKey> page = shortcutKeyService
				.findPage(new Page<ShortcutKey>(request, response), shortcutKey);
		
		model.addAttribute("page", page);
		
		return "modules/oa/shortcutkey/shortcutKeyList";
	}

	@RequiresPermissions("oa:shortcutkey:shortcutKey:view")
	@RequestMapping(value = "keyList")
	@ResponseBody
	public String keyList(HttpServletRequest request,
			HttpServletResponse response)
	{
		ShortcutKey shortcutKey = new ShortcutKey();
		
		shortcutKey.setCreateBy(UserUtils.getUser());
		
		List<ShortcutKey> list = shortcutKeyService.findList(shortcutKey);
		
		return JsonMapper.getInstance().toJson(list);
	}
	
	@RequiresPermissions("oa:shortcutkey:shortcutKey:view")
	@RequestMapping(value = "form")
	public String form(ShortcutKey shortcutKey, Model model) {
		model.addAttribute("shortcutKey", shortcutKey);
		return "modules/oa/shortcutkey/shortcutKeyForm";
	}

	@RequiresPermissions("oa:shortcutkey:shortcutKey:edit")
	@RequestMapping(value = "save")
	public String save(ShortcutKey shortcutKey, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, shortcutKey)){
			return form(shortcutKey, model);
		}
		shortcutKeyService.save(shortcutKey);
		addMessage(redirectAttributes, "保存快捷方式成功");
		return "redirect:"+Global.getAdminPath()+"/oa/shortcutkey/shortcutKey/?repage";
	}
	
	@RequiresPermissions("oa:shortcutkey:shortcutKey:edit")
	@RequestMapping(value = "delete")
	public String delete(ShortcutKey shortcutKey, RedirectAttributes redirectAttributes) {
		shortcutKeyService.delete(shortcutKey);
		addMessage(redirectAttributes, "删除快捷方式成功");
		return "redirect:"+Global.getAdminPath()+"/oa/shortcutkey/shortcutKey/?repage";
	}

}