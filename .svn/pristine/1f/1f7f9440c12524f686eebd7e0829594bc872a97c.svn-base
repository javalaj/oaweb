/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.web.coding;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.utils.DateUtils;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.mobile.modules.oa.web.coding.comparator.OaCollectCodingComparator;
import com.thinkgem.jeesite.modules.oa.entity.coding.OaCollectCoding;
import com.thinkgem.jeesite.modules.oa.service.coding.OaCollectCodingService;
import com.thinkgem.jeesite.modules.sys.service.SystemService;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;

/**
 * 整理后每日打卡资料Controller
 * 
 * @author 李廷龙
 * @version 2016-11-07
 */
@Controller
@RequestMapping(value = "${adminPath}/oa/coding/oaCollectCoding")
public class OaCollectCodingController extends BaseController {

	@Autowired
	private OaCollectCodingService oaCollectCodingService;

	@Autowired
	private SystemService systemService;

	@ModelAttribute
	public OaCollectCoding get(@RequestParam(required = false) String id) {
		OaCollectCoding entity = null;
		if (StringUtils.isNotBlank(id)) {
			entity = oaCollectCodingService.get(id);
		}
		if (entity == null) {
			entity = new OaCollectCoding();
		}
		return entity;
	}

	@RequiresPermissions("oa:coding:oaCollectCoding:view")
	@RequestMapping(value = { "list", "" })
	public String list(OaCollectCoding oaCollectCoding,
			HttpServletRequest request, HttpServletResponse response,
			Model model, String userId) throws ParseException {
		
		Date searchDate = oaCollectCoding.getSearchDate();
		if (searchDate == null) {
			searchDate=new Date();
			oaCollectCoding.setSearchDate(searchDate);
		}
		if (userId == null) {
			userId = UserUtils.getUser().getNo();
		}
		String strToday=DateUtils.formatDate(new Date(), "yyyy-MM-dd");
		List<OaCollectCoding> list = oaCollectCodingService.getListByUserNoAndDate(userId, searchDate);
		list=getFullList(searchDate, list);
		for (OaCollectCoding oaCollectCoding2 : list) {
			if(DateUtils.CheckDateIsornotWeekend(oaCollectCoding2.getCodingBegindate())){
				oaCollectCoding2.setElseType("weekend");
			}
			Date temp=oaCollectCoding2.getCodingBegindate();
			String strTemp=DateUtils.formatDate(temp, "yyyy-MM-dd");
			if(StringUtils.equals(strTemp, strToday)){
				oaCollectCoding2.setElseType("today");
			}
		}
		Collections.sort(list, new OaCollectCodingComparator());
		model.addAttribute("list", list);
		model.addAttribute("user", systemService.getUserByUserNo(userId));
		model.addAttribute("oaCollectCoding", oaCollectCoding);
		
		return "modules/oa/coding/oaCollectCodingView";

	}
	
	public List<OaCollectCoding> getFullList(Date searchDate,List<OaCollectCoding> list) throws ParseException{
		String base=DateUtils.formatDate(searchDate, "yyyy-MM");
		int day=DateUtils.getDaysOfMonth(searchDate);
		List<OaCollectCoding> temp=new ArrayList<OaCollectCoding>();
		for (OaCollectCoding oaCollectCoding : list) {
			temp.add(oaCollectCoding);
		}
		for (int i = 1; i <= day; i++) {
			String full=base+"-"+i;
			Date date=DateUtils.parseDate(full, "yyyy-MM-dd");
			if(!checkIsDateInList(date, list)){
				OaCollectCoding oaCollectCoding=new OaCollectCoding();
				oaCollectCoding.setCodingBegindate(date);
				oaCollectCoding.setWorkingType("-");
				temp.add(oaCollectCoding);
			}
		}
		return temp;
	}
	
	public boolean checkIsDateInList(Date date,List<OaCollectCoding> list){
		for (OaCollectCoding oaCollectCoding : list) {
			Date temp=oaCollectCoding.getCodingBegindate();
			String strTemp=DateUtils.formatDate(temp, "yyyy-MM-dd");
			String strDate=DateUtils.formatDate(date, "yyyy-MM-dd");
			if(StringUtils.equals(strTemp, strDate)){
				return true;
			}
		}
		return false;
	}	

	@RequiresPermissions("oa:coding:oaCollectCoding:view")
	@RequestMapping(value = "form")
	public String form(OaCollectCoding oaCollectCoding, Model model) {
		model.addAttribute("oaCollectCoding", oaCollectCoding);
		return "modules/oa/coding/oaCollectCodingForm";
	}

	@RequiresPermissions("oa:coding:oaCollectCoding:edit")
	@RequestMapping(value = "save")
	public String save(OaCollectCoding oaCollectCoding, Model model,
			RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, oaCollectCoding)) {
			return form(oaCollectCoding, model);
		}
		oaCollectCodingService.save(oaCollectCoding);
		addMessage(redirectAttributes, "保存整理后每日打卡资料成功");
		return "redirect:" + Global.getAdminPath()
				+ "/oa/coding/oaCollectCoding/?repage";
	}

	@RequiresPermissions("oa:coding:oaCollectCoding:edit")
	@RequestMapping(value = "delete")
	public String delete(OaCollectCoding oaCollectCoding,
			RedirectAttributes redirectAttributes) {
		oaCollectCodingService.delete(oaCollectCoding);
		addMessage(redirectAttributes, "删除整理后每日打卡资料成功");
		return "redirect:" + Global.getAdminPath()
				+ "/oa/coding/oaCollectCoding/?repage";
	}

}