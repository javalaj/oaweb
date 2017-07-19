/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.mobile.modules.user.web;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;
import com.thinkgem.jeesite.modules.user.entity.UserFavorite;
import com.thinkgem.jeesite.modules.user.service.UserFavoriteService;
import com.thinkgem.jeesite.modules.user.util.FavoriteMapUtil;

/**
 * 用户收藏夹Controller
 * 
 * @author liuxin
 * @version 2016-11-15
 */
@Controller
@RequestMapping(value = "${adminPath}${mobilePath}/user/userFavorite")
public class UserFavoriteControllerMobile extends BaseController {

	@Autowired
	private UserFavoriteService userFavoriteService;

	@ModelAttribute
	public UserFavorite get(@RequestParam(required = false) String id) {
		UserFavorite entity = null;
		if (StringUtils.isNotBlank(id)) {
			entity = userFavoriteService.get(id);
		}
		if (entity == null) {
			entity = new UserFavorite();
		}
		return entity;
	}

	@RequiresPermissions("sys:user:userFavorite:view")
	@RequestMapping(value = { "list", "" })
	public String list(UserFavorite userFavorite, String[] types, String title, HttpServletRequest request,
			HttpServletResponse response, Model model, String flag) {
		String type = "";
		if (types != null) {
			for (String str : types) {
				type += "\'" + str + "\',";
			}
			type = type.substring(0, type.length() - 1);
		}
		userFavorite.setType(type);
		userFavorite.setTitle(title);
		userFavorite.setCreateBy(UserUtils.getUser());
		Page<UserFavorite> page = userFavoriteService.findPage(new Page<UserFavorite>(request, response), userFavorite);
		model.addAttribute("page", page);
		// 查询所有收藏类别和对应收藏数目
		List<FavoriteMapUtil> typeNum = userFavoriteService.findTypeList(UserUtils.getUser());
		model.addAttribute("typeNum", typeNum);
		if (flag != null && flag.equals("del")) {
			model.addAttribute("msg", "收藏删除成功。");
		}
		return "mobile/modules/user/userFavoriteList";
	}

	/**
	 * 手机端支持的，查询方法，要进行utf-8转码
	 * 
	 * @throws UnsupportedEncodingException
	 */
	@RequiresPermissions("sys:user:userFavorite:view")
	@RequestMapping(value = "MobileList")
	public String MobileList(UserFavorite userFavorite, String types, String title, HttpServletRequest request,
			HttpServletResponse response, Model model, String flag) throws UnsupportedEncodingException {
		if (StringUtils.isNotBlank(types)) {
			types = URLDecoder.decode(types, "utf-8");
			model.addAttribute("types", types);
			userFavorite.setType("\'" + types + "\'");
		} else {
			types = null;
			model.addAttribute("types", types);
			userFavorite.setType(types);
		}
		userFavorite.setTitle(title);
		userFavorite.setCreateBy(UserUtils.getUser());
		Page<UserFavorite> page = userFavoriteService.findPage(new Page<UserFavorite>(request, response), userFavorite);
		model.addAttribute("page", page);
		// 查询所有收藏类别和对应收藏数目
		List<FavoriteMapUtil> typeNum = userFavoriteService.findTypeList(UserUtils.getUser());
		model.addAttribute("typeNum", typeNum);
		if (flag != null && flag.equals("del")) {
			model.addAttribute("msg", "收藏删除成功。");
		}
		return "mobile/modules/user/userFavoriteList";
	}

	/**
	 * 响应json数据
	 * 
	 * @param userFavorite
	 * @param types
	 * @param title
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequiresPermissions("sys:user:userFavorite:view")
	@RequestMapping(value = "listjson", method = RequestMethod.POST)
	@ResponseBody
	public Page<UserFavorite> listjson(UserFavorite userFavorite, String[] types, String title,
			HttpServletRequest request, HttpServletResponse response, Model model) {
		String type = "";
		if (types != null) {
			for (String str : types) {
				type += "\'" + str + "\',";
			}
			type = type.substring(0, type.length() - 1);
		}
		userFavorite.setType(type);
		userFavorite.setTitle(title);
		userFavorite.setCreateBy(UserUtils.getUser());
		Page<UserFavorite> page = userFavoriteService.findPage(new Page<UserFavorite>(request, response), userFavorite);
		model.addAttribute("page", page);
		// 查询所有收藏类别和对应收藏数目
		List<FavoriteMapUtil> typeNum = userFavoriteService.findTypeList(UserUtils.getUser());
		model.addAttribute("typeNum", typeNum);
		return page;
	}

	@RequiresPermissions("sys:user:userFavorite:edit")
	@RequestMapping(value = "save")
	public String save(UserFavorite userFavorite, Model model, RedirectAttributes redirectAttributes) {
		userFavoriteService.save(userFavorite);
		addMessage(redirectAttributes, "保存收藏成功");
		return "redirect:" + Global.getAdminPath() + "/user/userFavorite/?repage";
	}

	/**
	 * 多选删操作
	 */
	@RequiresPermissions("sys:user:userFavorite:edit")
	@RequestMapping(value = "delete")
	public String delete(String ids, UserFavorite userFavorite, RedirectAttributes redirectAttributes) {
		String[] ids2 = ids.split(",");
		for (String id : ids2) {
			userFavorite.setId(id);
			userFavoriteService.delete(userFavorite);
		}
		return "redirect:" + Global.getAdminPath() + "/user/userFavorite/?repage&flag=del";
	}

	/**
	 * AJAX接受页面 新增 收藏操作的请求
	 */
	@RequiresPermissions("sys:user:userFavorite:edit")
	@RequestMapping(value = "ajaxSave")
	@ResponseBody
	public String ajaxSave(@RequestBody UserFavorite userFavorite) {
		userFavoriteService.save(userFavorite);
		return "success";
	}

	/**
	 * AJAX接受页面 取消 收藏操作的请求
	 */
	@RequiresPermissions("sys:user:userFavorite:edit")
	@RequestMapping(value = "ajaxDel")
	@ResponseBody
	public String ajaxDel(@RequestBody UserFavorite userFavorite) {
		userFavoriteService.deleteBySign(userFavorite);
		return "success";
	}
}