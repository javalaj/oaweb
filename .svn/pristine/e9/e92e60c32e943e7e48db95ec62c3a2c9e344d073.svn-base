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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.oa.entity.OaNotify;
import com.thinkgem.jeesite.modules.oa.service.OaNotifyService;
import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;
import com.thinkgem.jeesite.modules.user.entity.UserFavorite;
import com.thinkgem.jeesite.modules.user.service.UserFavoriteService;

/**
 * 通知公告Controller
 * 
 * @author liaijun
 * @version 2014-05-16
 */
@Controller
@RequestMapping(value = "${adminPath}/oa/oaNotify")
public class OaNotifyController extends BaseController {

	@Autowired
	private OaNotifyService oaNotifyService;
	@Autowired
	private UserFavoriteService userFavoriteService;

	@ModelAttribute
	public OaNotify get(@RequestParam(required = false) String id) {
		OaNotify entity = null;
		if (StringUtils.isNotBlank(id)) {
			entity = oaNotifyService.get(id);
		}
		if (entity == null) {
			entity = new OaNotify();
		}
		return entity;
	}

	/**
	 * 通告列表
	 * 
	 * @param oaNotify
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequiresPermissions("oa:oaNotify:view")
	@RequestMapping(value = { "list", "" })
	public String list(OaNotify oaNotify, HttpServletRequest request, HttpServletResponse response, Model model) {

		oaNotify.setCreateBy(oaNotify.getCurrentUser());
		Page<OaNotify> page = oaNotifyService.findList(new Page<OaNotify>(request, response), oaNotify);
		model.addAttribute("page", page);
		return "modules/oa/oaNotifyList";

	}

	@RequiresPermissions("oa:oaNotify:view")
	@RequestMapping(value = "form")
	public String form(OaNotify oaNotify, Model model) {
		if (StringUtils.isNotBlank(oaNotify.getId())) {
			oaNotify = oaNotifyService.getRecordList(oaNotify);
			User createBy = UserUtils.get(oaNotify.getCreateBy().getId());// 通过用户id获取用户信息
			
			oaNotify.setCreateBy(createBy);
		}

		model.addAttribute("oaNotify", oaNotify);
		return "modules/oa/oaNotifyForm";
	}

	@RequiresPermissions("oa:oaNotify:edit")
	@RequestMapping(value = "save")
	public String save(OaNotify oaNotify, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, oaNotify)) {
			return form(oaNotify, model);
		}
		// 如果是修改，但状态为已发布，则不能再进行操作
		if (StringUtils.isNotBlank(oaNotify.getId())) {
			OaNotify e = oaNotifyService.get(oaNotify.getId());
			if ("1".equals(e.getStatus())) {
				addMessage(redirectAttributes, "已发布，不能操作！");
				return "redirect:" + adminPath + "/oa/oaNotify/form?id=" + oaNotify.getId();
			}
		}
		oaNotifyService.save(oaNotify);
		addMessage(redirectAttributes, "保存通知成功");
		return "redirect:" + adminPath + "/oa/oaNotify/?repage";
	}

	/**
	 * 删除
	 */
/*	@RequiresPermissions("oa:oaNotify:edit")*/
	@RequestMapping(value = "delete")
	public String delete(OaNotify oaNotify, RedirectAttributes redirectAttributes) {
		oaNotifyService.deleteMyNoticeByOaNotifyId(oaNotify.getId(),UserUtils.getUser().getId());
		addMessage(redirectAttributes, "删除通知成功！");
		return "redirect:" + adminPath + "/oa/oaNotify/?repage";
	}

	/**
	 * 批量删除我发布的通告
	 */
/*	@RequiresPermissions("sys:oaNotify:edit")*/
	@RequestMapping(value = "deleteAll")
	public String deleteAll(String ids, RedirectAttributes redirectAttributes) {
		String idArray[] =ids.split(",");
		for(String id : idArray){
			OaNotify oaNotify = oaNotifyService.get(id);
			if(Global.isDemoMode()){
				addMessage(redirectAttributes, "演示模式，不允许操作！");
				return "redirect:" + adminPath + "/sys/user/list?repage";
			}		
			oaNotifyService.delete(oaNotify);
				addMessage(redirectAttributes, "删除通知成功");			
		}
		
		return  "redirect:" + adminPath + "/oa/oaNotify/?repage";
	}	
	/**
	 * 批量删除我的消息
	 */
/*	@RequiresPermissions("sys:oaNotify:edit")*/
	@RequestMapping(value = "deleteAllSelf")
	public String deleteAllSelf(String ids, RedirectAttributes redirectAttributes) {
		String idArray[] =ids.split(",");
		for(String id : idArray){
			OaNotify oaNotify = oaNotifyService.get(id);
			if(Global.isDemoMode()){
				addMessage(redirectAttributes, "演示模式，不允许操作！");
				return "redirect:" + adminPath + "/sys/user/list?repage";
			}		
			oaNotifyService.deleteMyNoticeByOaNotifyId(oaNotify.getId(),UserUtils.getUser().getId());
				addMessage(redirectAttributes, "删除通知成功");			
		}		
		return  "redirect:" + adminPath + "/oa/oaNotify/self?repage";
	}	
	/**
	 * 批量修改阅读状态
	 */
/*	@RequiresPermissions("sys:oaNotify:edit")*/
	@RequestMapping(value = "updateReadFlag")
	public String updateReadFlag(String ids, RedirectAttributes redirectAttributes) {
		String idArray[] =ids.split(",");
		for(String id : idArray){
			OaNotify oaNotify = oaNotifyService.get(id);
			if(Global.isDemoMode()){
				addMessage(redirectAttributes, "演示模式，不允许操作！");
				return "redirect:" + adminPath + "/sys/user/list?repage";
			}	
			if (!StringUtils.equals(oaNotify.getType(),"5"))
			{
				oaNotifyService.updateReadFlag(oaNotify);
			}
				addMessage(redirectAttributes, "设置已读成功！");			
		}		
		return  "redirect:self";
	}	

	
	@RequestMapping(value = "deleteNoticeSelf")
	public String deleteNoticeSelf(String ids, RedirectAttributes redirectAttributes) {
		String idArray[] =ids.split(",");
		for(String id : idArray){
			OaNotify oaNotify = oaNotifyService.get(id);
			if(Global.isDemoMode()){
				addMessage(redirectAttributes, "演示模式，不允许操作！");
				return "redirect:" + adminPath + "/sys/user/list?repage";
			}		
			oaNotifyService.delete(oaNotify);
				addMessage(redirectAttributes, "删除通知成功");			
		}		
		return  "redirect:" + adminPath + "/oa/oaNotify/selfList?repage";
	}

	/**
	 * 批量收藏消息
	 * 
	 * @param request
	 * @param response
	 * @param redirectAttributes
	 * @return
	 */
	/*@RequiresPermissions("oa:oaNotify:edit")*/
	@RequestMapping(value = "/storeMessage")
	public String storeMessage(String ids,
			RedirectAttributes redirectAttributes) {
		//String items = request.getParameter("delitem");
		String[] item = ids.split(",");
		for (int i = 0; i < item.length; i++) {
			
			OaNotify oaNotify = oaNotifyService.get(item[i]);
			
			if (!StringUtils.equals(oaNotify.getType(),"5"))
			{
				String title = oaNotify.getTitle();
				String type = "消息中心";
				String sign = item[i];
				String url = "/oa/oaNotify/view?id=" + item[i];
				UserFavorite userFavorite = new UserFavorite();
				userFavorite.setTitle(title);// 设置收藏标题
				userFavorite.setType(type);// 设置收藏类型
				userFavorite.setUrl(url);// 设置收藏url
				userFavorite.setSign(sign);
				userFavoriteService.save(userFavorite);
			}
			else
			{
				addMessage(redirectAttributes, "群消息不能收藏，请重新选择！");	
				return "redirect:self";
			}
			
		}
		addMessage(redirectAttributes, "收藏成功！");	
		return "redirect:self";
	}
	/**
	 * 批量收藏通知
	 * 
	 * @param request
	 * @param response
	 * @param redirectAttributes
	 * @return
	 */
	/*@RequiresPermissions("oa:oaNotify:edit")*/
	@RequestMapping(value = "/storeNotice")
	public String storeNotice(String ids,
			RedirectAttributes redirectAttributes) {
		//String items = request.getParameter("delitem");
		String[] item = ids.split(",");
		for (int i = 0; i < item.length; i++) {
			OaNotify oaNotify = oaNotifyService.get(item[i]);
			String title = oaNotify.getTitle();
			String type = "通知公告";
			String sign = item[i];
			String url = "/oa/oaNotify/view?id=" + item[i];
			UserFavorite userFavorite = new UserFavorite();
			userFavorite.setTitle(title);// 设置收藏标题
			userFavorite.setType(type);// 设置收藏类型
			userFavorite.setUrl(url);// 设置收藏url
			userFavorite.setSign(sign);
			userFavoriteService.save(userFavorite);
		}
		addMessage(redirectAttributes, "收藏成功！");	
		return "redirect:selfList";
	}

	/**
	 * 我的消息
	 */
	@RequestMapping(value = "self")
	public String selfList(OaNotify oaNotify, HttpServletRequest request, HttpServletResponse response, Model model) {
		oaNotify.setSelf(true);		
		Page<OaNotify> page = oaNotifyService.find(new Page<OaNotify>(request, response), oaNotify);
		model.addAttribute("page", page);
		return "modules/oa/oaNotifyList";
	}
	/**
	 * 我的通知
	 */
	@RequestMapping(value = "selfList")
	public String selOaNotifyList(OaNotify oaNotify, HttpServletRequest request, HttpServletResponse response, Model model) {
		oaNotify.setSelf(true);		
		Page<OaNotify> page = oaNotifyService.findMyList(new Page<OaNotify>(request, response), oaNotify);
		model.addAttribute("page", page);
		return "modules/oa/myOaNotifyList";
	}

	/**
	 * 我的通知列表-数据
	 */
	@RequiresPermissions("oa:oaNotify:view")
	@RequestMapping(value = "selfData")
	@ResponseBody
	public Page<OaNotify> listData(OaNotify oaNotify, HttpServletRequest request, HttpServletResponse response,
			Model model) {
		oaNotify.setSelf(true);
		Page<OaNotify> page = oaNotifyService.findMyList(new Page<OaNotify>(request, response), oaNotify);
		return page;
	}

	/**
	 * 查看我的通知
	 */
	@RequestMapping(value = "view")
	public String view(OaNotify oaNotify, Model model) {
		if (StringUtils.isNotBlank(oaNotify.getId())) {
			oaNotifyService.updateReadFlag(oaNotify);
			
			oaNotify = oaNotifyService.get(oaNotify.getId());
			
			oaNotify = oaNotifyService.getRecordList(oaNotify);
			User createBy = UserUtils.get(oaNotify.getCreateBy().getId());// 通过用户id获取用户信息
			oaNotify.setCreateBy(createBy);
			/*oaNotify.setReadNum(String.valueOf(oaNotifyService.findCount(oaNotify)));*///已读通告数目
			/*String content=oaNotify.getContent().replace("&lt;p&gt;", "").replace("&lt;/p&gt;","").trim();
			oaNotify.setContent(content);*/
			model.addAttribute("oaNotify", oaNotify);
			return "modules/oa/oaNotifyForm";
		}
		return "redirect:" + adminPath + "/oa/oaNotify/self?repage";
	}

	/**
	 * 查看我的通知-数据
	 */
	@RequestMapping(value = "viewData")
	@ResponseBody
	public OaNotify viewData(OaNotify oaNotify, Model model) {
		if (StringUtils.isNotBlank(oaNotify.getId())) {
			oaNotifyService.updateReadFlag(oaNotify);
			return oaNotify;
		}
		return null;
	}

	/**
	 * 查看我的通知-发送记录
	 */
	@RequestMapping(value = "viewRecordData")
	@ResponseBody
	public OaNotify viewRecordData(OaNotify oaNotify, Model model) {
		if (StringUtils.isNotBlank(oaNotify.getId())) {
			oaNotify = oaNotifyService.getRecordList(oaNotify);
			return oaNotify;
		}
		return null;
	}

	/**
	 * 获取我的通知数目
	 */
	@RequestMapping(value = "self/count")
	@ResponseBody
	public String selfCount(OaNotify oaNotify, Model model) {
		oaNotify.setSelf(true);
		oaNotify.setReadFlag("0");
		return String.valueOf(oaNotifyService.findCount(oaNotify));
	}
}