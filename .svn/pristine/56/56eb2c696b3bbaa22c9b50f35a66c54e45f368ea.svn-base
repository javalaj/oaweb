/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.mobile.modules.oa.web.doc;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.oa.entity.OaNotify;
import com.thinkgem.jeesite.modules.oa.entity.doc.OaDoc;
import com.thinkgem.jeesite.modules.oa.entity.doc.OaDocReadApply;
import com.thinkgem.jeesite.modules.oa.service.OaNotifyService;
import com.thinkgem.jeesite.modules.oa.service.doc.OaDocReadApplyService;
import com.thinkgem.jeesite.modules.oa.service.doc.OaDocService;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;

/**
 * 文档阅读申请管理Controller
 * @author 李廷龙
 * @version 2017-02-28
 */
@Controller
@RequestMapping(value = "${adminPath}${mobilePath}/oa/doc/oaDocReadApply")
public class OaDocReadApplyMController extends BaseController {

	@Autowired
	private OaDocReadApplyService oaDocReadApplyService;
	@Autowired
	private OaDocService oaDocService;
	
	@Autowired
	private OaNotifyService oaNotifyService;
	
	@ModelAttribute
	public OaDocReadApply get(@RequestParam(required=false) String id) {
		OaDocReadApply entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = oaDocReadApplyService.get(id);
		}
		if (entity == null){
			entity = new OaDocReadApply();
		}
		return entity;
	}
	
	@RequiresPermissions("oa:doc:oaDocReadApply:view")
	@RequestMapping(value = {"list", ""})
	public String list(OaDocReadApply oaDocReadApply, HttpServletRequest request, HttpServletResponse response, Model model) {
		OaDoc oaDoc=new OaDoc();
		oaDoc.setCreateBy(UserUtils.getUser());
		oaDocReadApply.setDoc(oaDoc);
		oaDocReadApply.setLendStatus("0");
		Page<OaDocReadApply> page = oaDocReadApplyService.findPage(new Page<OaDocReadApply>(request, response), oaDocReadApply); 
		model.addAttribute("page", page);
		String url="modules/oa/doc/oaDocReadApplyList";
		url="mobile/"+url;
		return url;
	}
	
	@RequiresPermissions("oa:doc:oaDocReadApply:view")
	@RequestMapping(value = {"myList"})
	public String myList(OaDocReadApply oaDocReadApply, HttpServletRequest request, HttpServletResponse response, Model model) {
		oaDocReadApply.setLendUser(UserUtils.getUser());
		Page<OaDocReadApply> page = oaDocReadApplyService.findPage(new Page<OaDocReadApply>(request, response), oaDocReadApply); 
		model.addAttribute("page", page);
		String url="modules/oa/doc/oaDocReadApplyMyList";
		url="mobile/"+url;
		return url;
	}

	@RequiresPermissions("oa:doc:oaDocReadApply:view")
	@RequestMapping(value = "form")
	public String form(OaDocReadApply oaDocReadApply, Model model) {
		model.addAttribute("oaDocReadApply", oaDocReadApply);
		return "modules/oa/doc/oaDocReadApplyForm";
	}

	@RequiresPermissions("oa:doc:oaDocReadApply:edit")
	@RequestMapping(value = "save")
	public String save(OaDocReadApply oaDocReadApply, Model model, RedirectAttributes redirectAttributes,@RequestParam(required=false)String prePage) {
		if (!beanValidator(model, oaDocReadApply)){
			return form(oaDocReadApply, model);
		}
		
		OaDoc doc=oaDocService.get(oaDocReadApply.getDoc().getId());
		if (doc==null||StringUtils.equals("1", doc.getDelFlag())) {
			addMessage(redirectAttributes, "您所要借阅的文档已不存在");
		}else{
			oaDocReadApply.setLendStatus("0");
			oaDocReadApplyService.save(oaDocReadApply);
			addMessage(redirectAttributes, "借阅申请提交成功");
			OaNotify oaNotify = new OaNotify();
			oaNotify.setContent("@@docReadNotify@@/oa/a/oa/doc/oaDocReadApply");// 注入@@proNotify@@作为超链接的注解，前台判断
			oaNotify.setType("4");// 流程通知配置为4
			oaNotify.setStatus("1");// 貌似是已发
			oaNotify.setTitle("文档借阅处理通知-您有新的的文档借阅申请需要处理");
			oaNotify.setOaNotifyRecordIds(doc.getCreateBy().getId());
			oaNotifyService.save(oaNotify);
		}
		return "redirect:"+Global.getAdminPath()+Global.getMobilePath()+"/oa/doc/oaDoc/form?id="+oaDocReadApply.getDoc().getId()+"&prePage="+prePage;
	}
	
	@RequiresPermissions("oa:doc:oaDocReadApply:edit")
	@RequestMapping(value = "delete")
	public String delete(OaDocReadApply oaDocReadApply, RedirectAttributes redirectAttributes) {
		oaDocReadApplyService.delete(oaDocReadApply);
		addMessage(redirectAttributes, "删除借阅申请成功");
		
		return "redirect:"+Global.getAdminPath()+Global.getMobilePath()+"/oa/doc/oaDocReadApply/myList?repage";
	}
	
	@RequiresPermissions("oa:doc:oaDocReadApply:edit")
	@RequestMapping(value = "updateLendStatus")
	public String updateLendStatus(OaDocReadApply oaDocReadApply,String oaDocReadApplyId,String changTolendStatus, HttpServletRequest request, HttpServletResponse response,Model model) {
		OaDocReadApply current=oaDocReadApplyService.get(oaDocReadApplyId);
		current.setLendStatus(changTolendStatus);
		oaDocReadApplyService.save(current);
		Page<OaDocReadApply> page = oaDocReadApplyService.findPage(new Page<OaDocReadApply>(request, response), oaDocReadApply); 
		model.addAttribute("page", page);
		OaNotify oaNotify = new OaNotify();
		oaNotify.setContent("@@docReadNotify@@/oa/a/oa/doc/oaDocReadApply/myList");// 注入@@proNotify@@作为超链接的注解，前台判断
		oaNotify.setType("4");// 流程通知配置为4
		oaNotify.setStatus("1");// 貌似是已发
		oaNotify.setTitle("文档借阅处理通知-您的文档借阅申请已被处理");
		oaNotify.setOaNotifyRecordIds(current.getLendUser().getId());
		oaNotifyService.save(oaNotify);
		return "modules/oa/doc/oaDocReadApplyList";
	}
	
	
	@RequestMapping(value="updateLendStatusBatch")
	public @ResponseBody Map<String,String> updateLendStatusBatch(@RequestParam(required=false) List<String> items,String changTolendStatus){
		for(String oaDocReadApplyId:items){
			OaDocReadApply current=oaDocReadApplyService.get(oaDocReadApplyId);
			current.setLendStatus(changTolendStatus);
			oaDocReadApplyService.save(current);
			OaNotify oaNotify = new OaNotify();
			oaNotify.setContent("@@docReadNotify@@/oa/a/oa/doc/oaDocReadApply/myList");// 注入@@proNotify@@作为超链接的注解，前台判断
			oaNotify.setType("4");// 流程通知配置为4
			oaNotify.setStatus("1");// 貌似是已发
			oaNotify.setTitle("文档借阅处理通知-您的文档借阅申请已被处理");
			oaNotify.setOaNotifyRecordIds(current.getLendUser().getId());
			oaNotifyService.save(oaNotify);
		}
		Map<String,String> map=new HashMap<String,String>();
		map.put("result", "ok");
		return map;
	}

}