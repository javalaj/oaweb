/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.mobile.modules.oa.web.doc;


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
import com.thinkgem.jeesite.modules.oa.entity.doc.OaDoc;
import com.thinkgem.jeesite.modules.oa.service.doc.OaDocReadApplyService;
import com.thinkgem.jeesite.modules.oa.service.doc.OaDocService;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;

/**
 * 文档管理Controller
 * @author 李廷龙
 * @version 2017-02-28
 */
@Controller
@RequestMapping(value = "${adminPath}${mobilePath}/oa/doc/oaDoc")
public class OaDocMController extends BaseController {

	@Autowired
	private OaDocService oaDocService;
	
	@Autowired
	private OaDocReadApplyService oaDocReadApplyService;
	
	@ModelAttribute
	public OaDoc get(@RequestParam(required=false) String id) {
		OaDoc entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = oaDocService.getBy(id, UserUtils.getUser().getId(), "0");
		}
		if (entity == null){
			entity = new OaDoc();
		}
		return entity;
	}
	@RequiresPermissions("oa:doc:oaDoc:view")
	@RequestMapping(value = {"index"})
	public String index(HttpServletRequest request, HttpServletResponse response, Model model) {
		
		String url="modules/oa/doc/oaDocIndex";
		url="mobile/"+url;
		return url;
	}
	
	@RequiresPermissions("oa:doc:oaDoc:view")
	@RequestMapping(value = {"list", ""})
	public String list(OaDoc oaDoc, HttpServletRequest request, HttpServletResponse response, Model model) {
		if (!UserUtils.hasRole(Global.getConfig("docManagerRoleEnname"))) {
			oaDoc.setCurrentUserId(UserUtils.getUser().getId());
		}
		Integer totalReadApply=oaDocReadApplyService.getTotalReadApplyByDocCreateById(UserUtils.getUser().getId());
		Page<OaDoc> page = oaDocService.findPage(new Page<OaDoc>(request, response), oaDoc); 
		model.addAttribute("page", page);
		model.addAttribute("totalReadApply", totalReadApply);
		String url="modules/oa/doc/oaDocList";
		url="mobile/"+url;
		return url;
	}
	
	@RequiresPermissions("oa:doc:oaDoc:view")
	@RequestMapping(value = {"officeList"})
	public String officeList(OaDoc oaDoc, HttpServletRequest request, HttpServletResponse response, Model model) {
		oaDoc.setIsPublic("0");
		oaDoc.setOffice(UserUtils.getUser().getOffice());
		oaDoc.setLoanUserId(UserUtils.getUser().getId());
		Page<OaDoc> page = oaDocService.findPage(new Page<OaDoc>(request, response), oaDoc); 
		model.addAttribute("page", page);
		String url="modules/oa/doc/oaDocOfficeList";
		url="mobile/"+url;
		return url;
	}
	
	@RequiresPermissions("oa:doc:oaDoc:view")
	@RequestMapping(value = {"publicList"})
	public String publicList(OaDoc oaDoc, HttpServletRequest request, HttpServletResponse response, Model model) {
		oaDoc.setIsPublic("1");
		oaDoc.setLoanUserId(UserUtils.getUser().getId());
		Page<OaDoc> page = oaDocService.findPage(new Page<OaDoc>(request, response), oaDoc); 
		model.addAttribute("page", page);
		String url="modules/oa/doc/oaDocPublicList";
		url="mobile/"+url;
		return url;
	}

	@RequiresPermissions("oa:doc:oaDoc:view")
	@RequestMapping(value = "form")
	public String form(OaDoc oaDoc, Model model) {
		if (oaDoc.getIsNewRecord()){
			oaDoc.setIsNeedLend("0");
		}
		model.addAttribute("oaDoc", oaDoc);
		String url="modules/oa/doc/oaDocForm";
		url="mobile/"+url;
		return url;
	}

	@RequiresPermissions("oa:doc:oaDoc:edit")
	@RequestMapping(value = "save")
	public String save(OaDoc oaDoc, Model model, RedirectAttributes redirectAttributes,@RequestParam(required=false)String prePage) {
		if (!beanValidator(model, oaDoc)){
			return form(oaDoc, model);
		}
		oaDocService.save(oaDoc);
		addMessage(redirectAttributes, "保存文档信息成功");
		
		return "redirect:"+Global.getAdminPath()+Global.getMobilePath()+ "/oa/doc/oaDoc/form?id="+oaDoc.getId()+"&prePage="+prePage;
	}
	
	@RequiresPermissions("oa:doc:oaDoc:edit")
	@RequestMapping(value = "delete")
	public String delete(OaDoc oaDoc, RedirectAttributes redirectAttributes) {
		oaDocService.delete(oaDoc);
		addMessage(redirectAttributes, "删除文档信息成功");
		return "redirect:"+Global.getAdminPath()+"/oa/doc/oaDoc/?repage";
	}
	
	@RequiresPermissions("oa:doc:oaDoc:edit")
	@RequestMapping(value = "deleteGroup")
	public String deleteGroup(String groupId, RedirectAttributes redirectAttributes) {
		oaDocService.deleteGroup(groupId);;
		addMessage(redirectAttributes, "删除文档信息成功");
		return "redirect:"+Global.getAdminPath()+"/oa/doc/oaDoc/?repage";
	}

}