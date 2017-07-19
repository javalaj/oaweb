/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.web.coding;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.oa.entity.OaNotify;
import com.thinkgem.jeesite.modules.oa.entity.coding.OaCoding;
import com.thinkgem.jeesite.modules.oa.entity.coding.OaViewCoding;
import com.thinkgem.jeesite.modules.oa.entity.doc.OaDocReadApply;
import com.thinkgem.jeesite.modules.oa.service.coding.OaCodingService;
import com.thinkgem.jeesite.modules.oa.service.coding.OaCollectCodingService;
import com.thinkgem.jeesite.modules.oa.service.coding.OaViewCodingService;
import com.thinkgem.jeesite.modules.sys.service.OfficeService;

/**
 * 从打卡机导出的数据存储Controller
 * 
 * @author 李廷龙
 * @version 2016-11-04
 */
@Controller
@RequestMapping(value = "${adminPath}/oa/coding/oaCoding")
public class OaCodingController extends BaseController {

	@Autowired
	private OaCodingService oaCodingService;

	@Autowired
	private OaViewCodingService oaViewCodingService;

	@Autowired
	private OaCollectCodingService oaCollectCodingService;
	
	@Autowired
	private OfficeService officeService;
	
	@ModelAttribute
	public OaCoding get(@RequestParam(required = false) String id) {
		OaCoding entity = null;
		if (StringUtils.isNotBlank(id)) {
			entity = oaCodingService.get(id);
		}
		if (entity == null) {
			entity = new OaCoding();
		}
		return entity;
	}

	@RequiresPermissions("oa:coding:oaCoding:view")
	@RequestMapping(value = { "list", "" })
	public String list(OaCoding oaCoding, HttpServletRequest request,
			HttpServletResponse response, Model model, String deptid,
			String timerec,String isDetail,String showQingjia) {
		//是否显示详情
		model.addAttribute("isDetail",isDetail);
		
		model.addAttribute("showQingjia",showQingjia);
		
		if (timerec == null || "".equals(timerec)) {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM");
			timerec = sdf.format(new Date());
		}
		if (deptid == null || "".equals(deptid)) {
			deptid = null;
		} else {
			model.addAttribute("deptname", officeService.get(deptid).getName());
		}
		OaViewCoding oaViewCoding = new OaViewCoding();
		oaViewCoding.setDeptName(deptid);
		oaViewCoding.setRemarks(timerec);
		Page<OaViewCoding> page = oaViewCodingService.getDetailViewByDeptAndTime(
				new Page<OaViewCoding>(request, response), oaViewCoding);
		model.addAttribute("page", page);
		model.addAttribute("timerec", timerec);
		model.addAttribute("deptid", deptid);
		String[] days = null;
		try {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			days = oaViewCodingService.getDaysAndWeekendOfDateForHTML(sdf
					.parse(timerec + "-01"));
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
			model.addAttribute("days", days);
			model.addAttribute("daysLength", days.length);
			
		return "modules/oa/coding/oaCodingList";
	}
	
	
	@RequiresPermissions("oa:coding:oaCoding:edit")
	@RequestMapping(value="analysis")
	public @ResponseBody Map<String,String> analysis(String timerec){
		Map<String,String> map=new HashMap<String,String>();
		map.put("result", "ok");
		try {
			oaCollectCodingService.updateAnalysis(new SimpleDateFormat("yyyy-MM").parse(timerec));
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			map.put("info", "日期格式不正确");
			map.put("result", "wrong");
		}
		
		return map;
	}

	@RequiresPermissions("oa:coding:oaCoding:view")
	@RequestMapping(value = "form")
	public String form(OaCoding oaCoding, Model model) {
		model.addAttribute("oaCoding", oaCoding);
		return "modules/oa/coding/oaCodingForm";
	}

	@RequiresPermissions("oa:coding:oaCoding:view")
	@RequestMapping(value = "detail")
	public String detail(HttpServletRequest request,
			HttpServletResponse response, OaCoding oaCoding, Model model,
			String deptid, String timerec) {
		// model.addAttribute("oaCoding", oaCoding);
		if (timerec == null || "".equals(timerec)) {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM");
			timerec = sdf.format(new Date());
		}
		if (deptid == null || "".equals(deptid)) {
			deptid = null;
		} else {
			model.addAttribute("deptname", officeService.get(deptid).getName());
		}
		OaViewCoding oaViewCoding = new OaViewCoding();
		oaViewCoding.setDeptName(deptid);
		oaViewCoding.setRemarks(timerec);
		Page<OaViewCoding> page = oaViewCodingService
				.getDetailViewByDeptAndTime(new Page<OaViewCoding>(request,
						response), oaViewCoding);

		model.addAttribute("page", page);
		model.addAttribute("timerec", timerec);
		model.addAttribute("deptid", deptid);
		String[] days = null;
		try {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			days = oaViewCodingService.getDaysAndWeekendOfDateForHTML(sdf
					.parse(timerec + "-01"));
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
			model.addAttribute("days", days);
		return "redirect:" + Global.getAdminPath() + "/oa/coding/oaCoding/?repage";
	}
	


	@RequestMapping(value = "fileUpload")
	public String fileUpload(HttpServletRequest request, MultipartFile file) {
		if ("application/vnd.ms-excel".equals(file.getContentType())) {
			try {
				oaCodingService.saveAsPOIByMutiFile(file);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return "redirect:" + Global.getAdminPath() + "/oa/coding/oaCoding/?repage";
	}
	
	/**
	 * 打卡数据EXCEL导入(NET)
	 * @param request
	 * @param file
	 * @return
	 */
	@RequiresPermissions("oa:coding:oaCoding:edit")
	@RequestMapping(value = "fileUploadx")
	public String fileUploadx(HttpServletRequest request, MultipartFile file) {
		if ("application/vnd.ms-excel".equals(file.getContentType())) {
			try {
				oaCodingService.saveAsPOIByMutiFilex(file);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return "redirect:" + Global.getAdminPath() + "/oa/coding/oaCoding/?repage";
	}
	
	/**
	 * 打卡数据EXCEL导入(DISK)
	 * @param request
	 * @param file
	 * @return
	 */
	@RequiresPermissions("oa:coding:oaCoding:edit")
	@RequestMapping(value = "fileUploady")
	public String fileUploady(HttpServletRequest request, MultipartFile file) {
		if ("application/vnd.ms-excel".equals(file.getContentType())) {
			try {
				oaCodingService.saveAsPOIByMutiFiley(file);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return "redirect:" + Global.getAdminPath() + "/oa/coding/oaCoding/?repage";
	}

	@RequiresPermissions("oa:coding:oaCoding:edit")
	@RequestMapping(value = "save")
	public String save(OaCoding oaCoding, Model model,
			RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, oaCoding)) {
			return form(oaCoding, model);
		}
		oaCodingService.save(oaCoding);
		addMessage(redirectAttributes, "保存打卡记录成功");
		return "redirect:" + Global.getAdminPath() + "/oa/coding/oaCoding/?repage";
	}

	@RequiresPermissions("oa:coding:oaCoding:edit")
	@RequestMapping(value = "delete")
	public String delete(OaCoding oaCoding,
			RedirectAttributes redirectAttributes) {
		oaCodingService.delete(oaCoding);
		addMessage(redirectAttributes, "删除打卡记录成功");
		return "redirect:" + Global.getAdminPath() + "/oa/coding/oaCoding/?repage";
	}
	
	@RequiresPermissions("oa:coding:oaCoding:edit")
	@RequestMapping(value = "asyncHsqkCloud")
	public @ResponseBody Map<String,String> asyncHsqkCloud(String timerec){
		Map<String,String> map=new HashMap<String,String>();
		map.put("result", "ok");
		long yesterday=new Date().getTime()-24*60*60*1000;
		Date yesterdayDate=new Date(yesterday);
		try {
			oaCollectCodingService.asyncHsqkCloud(yesterdayDate);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			map.put("info", "同步异常");
			map.put("result", "wrong");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			map.put("info", "同步异常");
			map.put("result", "wrong");
		}
		
		return map;
	}
	

}