///**
// * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
// */
package com.thinkgem.jeesite.modules.oa.web;

import java.text.DateFormat;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.oa.entity.Supmanagement;
import com.thinkgem.jeesite.modules.oa.service.SupmanagementService;
import com.thinkgem.jeesite.modules.sys.entity.Menu;
import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;

///**
// * 供应商管理Controller
// * @author niting
// * @version 2016-11-07
// */
@Controller
@RequestMapping(value = "${adminPath}/oa/supmanagement")
public class SupmanagementController extends BaseController {

	@Autowired
	private SupmanagementService supmanagementService;
	
	@ModelAttribute
	public Supmanagement get(@RequestParam(required=false) String id) {
		Supmanagement entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = supmanagementService.get(id);
		}
		if (entity == null){
			entity = new Supmanagement();
		}
		return entity;
	}
	
	/*
	 * 获取供应商集合
	 */
	@RequiresPermissions("oa:supmanagement:view")
	@RequestMapping(value = {"list", ""})
	public String list(Supmanagement supmanagement, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<Supmanagement> page = supmanagementService.findPage(new Page<Supmanagement>(request, response), supmanagement); 
		System.err.println(page.getList().get(0).getTelephone());
		model.addAttribute("page", page);
		return "modules/oa/supmanagementList";
	}	
	@RequiresPermissions("oa:supmanagement:view")
	@RequestMapping(value = "form")	
	public String form(Supmanagement supmanagement, Model model) {
		return "modules/oa/supmanagementForm";
	}
	
	/*供应商详情*/
	@RequiresPermissions("oa:supmanagement:view")
	@RequestMapping(value = "detail")	
	public String detail(Supmanagement supmanagement, Model model) {
			User createby = UserUtils.get(supmanagement.getCreateBy().getId()); //获取创建者
			User updateby = UserUtils.get(supmanagement.getUpdateBy().getId()); //获取修改者
			model.addAttribute("supmanagement", supmanagement);
			model.addAttribute("createname",createby.getName());
			model.addAttribute("updatename",updateby.getName());
			return "modules/oa/supmanagementDetail";
	}
	
	@RequiresPermissions("oa:supmanagement:edit")
	@RequestMapping(value = "save")
	public String save(Supmanagement supmanagement, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, supmanagement)){
			return form(supmanagement, model);
		}
		supmanagementService.save(supmanagement);
		addMessage(redirectAttributes, "保存供应商成功");
		return "redirect:list";
	}
	
	/*删除单条信息*/
	@RequiresPermissions("oa:supmanagement:edit")
	@RequestMapping(value = "delete")
	public String delete(Supmanagement supmanagement, RedirectAttributes redirectAttributes) {
		supmanagementService.delete(supmanagement);
		addMessage(redirectAttributes, "删除供应商成功");
		return "redirect:"+Global.getAdminPath()+"/oa/supmanagement/?repage";
	}
	
	
	@RequestMapping(value = "deleteAll")
	public String deleteAll(String ids, RedirectAttributes redirectAttributes) {
		if(Global.isDemoMode()){
			addMessage(redirectAttributes, "演示模式，不允许操作！");
			return "redirect:" + adminPath + "/sys/menu/";
		}
		String idArray[] =ids.split(",");
		for(String id : idArray){
			Supmanagement menu = supmanagementService.get(id);
			if(menu != null){
				supmanagementService.delete(supmanagementService.get(id));
			}
		}
			
		addMessage(redirectAttributes, "批量删除供应商成功");
		return "redirect:"+Global.getAdminPath()+"/oa/supmanagement/?repage";
	}
	
//	/*批量删除*/
//	@RequiresPermissions("oa:supmanagement:edit")
//	@RequestMapping(value ="/deletemore",method=RequestMethod.POST)
//	public String deletemore(String ids,HttpServletRequest request,HttpServletResponse response,RedirectAttributes redirectAttributes){
//		String items = request.getParameter("delitems");
//		String[] item = items.split(",");
//		for(int i=0;i<item.length;i++){
//			Supmanagement supmanagement = new Supmanagement();
//			supmanagement.setId(item[i]);
//			supmanagementService.delete(supmanagement);
//		}
//		addMessage(redirectAttributes,"批量删除供应商成功");
//		return "redirect:list";
//	}
}