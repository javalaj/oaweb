/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.junit.experimental.theories.DataPoint;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.thinkgem.jeesite.common.annotation.Token;
import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.common.utils.StringUtils;

import com.thinkgem.jeesite.modules.oa.entity.OaDocument;
import com.thinkgem.jeesite.modules.oa.service.OaDocumentService;
import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.modules.sys.service.SystemService;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;

/**
 * 管理文档，对文档进行分类Controller
 * 
 * @author liaijun
 * @version 2016-11-03
 */
@Controller
@RequestMapping(value = "${adminPath}/oa/oaDocument")
public class OaDocumentController extends BaseController {

	@Autowired
	private OaDocumentService oaDocumentService;

	@ModelAttribute
	public OaDocument get(@RequestParam(required = false) String id) {
		OaDocument entity = null;
		if (StringUtils.isNotBlank(id)) {
			entity = oaDocumentService.get(id);
		}
		if (entity == null) {
			entity = new OaDocument();
		}
		return entity;
	}

	/**
	 * 文档管理首页
	 * 
	 * @param oaDocument
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequiresPermissions("oa:oaDocument:view")
	@RequestMapping(value = "")
	public String index(OaDocument oaDocument, HttpServletRequest request,
			HttpServletResponse response, Model model) {

		return "modules/oa/oaDocumentIndex";
	}

	/**
	 * 文档管理列表
	 * 
	 * @param oaDocument
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequiresPermissions("oa:oaDocument:view")
	@RequestMapping(value = "list")
	public String list(OaDocument oaDocument, HttpServletRequest request,
			HttpServletResponse response, Model model) {
		Page<OaDocument> page = oaDocumentService.findPage(
				new Page<OaDocument>(request, response), oaDocument);
		List<OaDocument> list=page.getList();
		for (int i = 0; i < list.size(); i++) {
			String uid=list.get(i).getCreateBy().getId();			
				User createBy =  UserUtils.get(uid);// 通过用户id获取用户信息
				list.get(i).setCreateBy(createBy);
		}
		
		page.setList(list);	
		model.addAttribute("page", page);
		return "modules/oa/oaDocumentList";
	}

	@RequiresPermissions("oa:oaDocument:view")
	@RequestMapping(value = "form")
	public String form(OaDocument oaDocument, Model model) {
		model.addAttribute("oaDocument", oaDocument);
		return "modules/oa/oaDocumentForm";
	}

	@RequiresPermissions("oa:oaDocument:edit")
	@Token(save=true)
	@RequestMapping(value = "save")
	public String save(OaDocument oaDocument, Model model,
			RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, oaDocument)) {
			return form(oaDocument, model);
		}
		if( oaDocument.getType()==null||oaDocument.getType().equals("")){
			return form(oaDocument, model);
		}
		oaDocumentService.save(oaDocument);
		addMessage(redirectAttributes, "保存文档成功");
		return "redirect:" + Global.getAdminPath() + "/oa/oaDocument/list?repage";
	}

	@RequiresPermissions("oa:oaDocument:edit")
	@RequestMapping(value = "delete")
	public String delete(OaDocument oaDocument,
			RedirectAttributes redirectAttributes) {
		oaDocumentService.delete(oaDocument);
		addMessage(redirectAttributes, "删除文档成功");
		return "redirect:" + Global.getAdminPath() + "/oa/oaDocument/?repage";
	}

	/**
	 * 批量删除
	 * 
	 * @param request
	 * @param response
	 * @param redirectAttributes
	 * @return
	 */
	@RequiresPermissions("oa:oaDocument:edit")
	@RequestMapping(value = "/deletemore", method = RequestMethod.POST)
	public String deleteMore(HttpServletRequest request,
			HttpServletResponse response, RedirectAttributes redirectAttributes) {
		String items = request.getParameter("delitems");
		String[] item = items.split(",");
		for (int i = 0; i < item.length; i++) {
			OaDocument oaDocument = new OaDocument();
			oaDocument.setId(item[i]);
			oaDocumentService.delete(oaDocument);
		}
		addMessage(redirectAttributes, "删除文档成功");
		return "redirect:list";
	}

}