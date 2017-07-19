/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.web;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.oa.entity.CarManagement;
import com.thinkgem.jeesite.modules.oa.service.CarManagementService;

/**
 * 车辆管理Controller
 * @author niting
 * @version 2016-11-16
 */
@Controller
@RequestMapping(value = "${adminPath}/oa/carManagement")
public class CarManagementController extends BaseController {

	@Autowired
	private CarManagementService carManagementService;
	
	@ModelAttribute
	public CarManagement get(@RequestParam(required=false) String id) {
		CarManagement entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = carManagementService.get(id);
		}
		if (entity == null){
			entity = new CarManagement();
		}
		return entity;
	}
	
	@RequiresPermissions("oa:carManagement:view")
	@RequestMapping(value = {"list", ""})
	public String list(CarManagement carManagement, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<CarManagement> page = carManagementService.findPage(new Page<CarManagement>(request, response), carManagement); 
		model.addAttribute("page", page);						
		return "modules/oa/carManagementList";
	}

	@RequiresPermissions("oa:carManagement:view")
	@RequestMapping(value = "form")
	public String form(CarManagement carManagement, Model model) {
		/**取出session对象，点击“添加下一条”时清空上一次添加的数据*/
		HttpSession session = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest().getSession();
		CarManagement car = (CarManagement) session.getAttribute("carM");
				
		if(car!=null){
			carManagement=car;
			session.setAttribute("carM", null);  //carM为空，清空文本
		}
		
		//获取所有的车牌号，添加时判断是否存在此车牌号
		List<CarManagement> listCar =carManagementService.findList(carManagement);
		String plateNum = "";
		for (int i = 0; i<listCar.size();i++) {
			if(i == 0){
				plateNum +=",";
			}
			plateNum += listCar.get(i).getPlatenum()+",";
		}
		model.addAttribute("platenum",plateNum);
		model.addAttribute("carManagement", carManagement);
		return "modules/oa/carManagementForm";
		}

	
		//修改
		@RequiresPermissions("oa:carManagement:edit")
		@RequestMapping(value = "update")	
		public String update(CarManagement carManagement, Model model) {
			return "modules/oa/carManagementUpdate";
		}
		
		
		@RequiresPermissions("oa:carManagement:edit")
		@RequestMapping(value = "saveupdate")
		public String saveUpdate(CarManagement carManagement, Model model, RedirectAttributes redirectAttributes) {
			if (!beanValidator(model, carManagement)){
				return form(carManagement, model);
			}
			carManagementService.save(carManagement);								
			addMessage(redirectAttributes, "修改车辆成功");
			return "redirect:"+Global.getAdminPath()+"/oa/carManagement/list";
		}
	
	
		@RequiresPermissions("oa:carManagement:edit")
		@RequestMapping(value = "save")
		public String save(CarManagement carManagement, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, carManagement)){
			return form(carManagement, model);
		}
		carManagementService.save(carManagement);
		
		/**保存前台页面添加的carM对象存入session**/
		HttpSession session = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest().getSession();
		session.setAttribute("carM", carManagement);
								
		addMessage(redirectAttributes, "保存车辆成功");
		return "redirect:"+Global.getAdminPath()+"/oa/carManagement/form";
//		return "redirect:list";

	}
	
	//车辆报废
	@RequiresPermissions("oa:carManagement:edit")
	@RequestMapping(value = "opdel")
	public String opdel(CarManagement carManagement, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, carManagement)){
			return form(carManagement, model);
		}				
		carManagementService.save(carManagement);
		carManagementService.delete(carManagement);
		return "redirect:list";
	}
	
	@RequiresPermissions("oa:carManagement:view")
	@RequestMapping(value = "detail")
	public String detail(CarManagement carManagement, Model model) {
		model.addAttribute("carManagement", carManagement);
		return "modules/oa/carManagementDetail";
	}
	
	@RequiresPermissions("oa:carManagement:edit")
	@RequestMapping(value = "delete")
	public String delete(CarManagement carManagement, RedirectAttributes redirectAttributes) {
		carManagementService.delete(carManagement);
		addMessage(redirectAttributes, "删除车辆成功");
		return "redirect:"+Global.getAdminPath()+"/oa/carManagement/?repage";
	}
	
	//车辆报废
	@RequiresPermissions("oa:carManagement:view")
	@RequestMapping(value = "operation")
	public String operation(CarManagement carManagement, Model model) {
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy年MM月dd日");
		model.addAttribute("buyd", sdf.format(carManagement.getBuydate()));
		model.addAttribute("carManagement", carManagement);
		return "modules/oa/carManagementOperation";
	}
	
	//车辆启用
	@RequiresPermissions("oa:carManagement:view")
	@RequestMapping(value = "use")
	public String use(CarManagement carManagement, Model model) {
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy年MM月dd日");
		model.addAttribute("buyd", sdf.format(carManagement.getBuydate()));
		model.addAttribute("carManagement", carManagement);
		return "modules/oa/carManaUse";
	}
		
	//车辆停用
	@RequiresPermissions("oa:carManagement:view")
	@RequestMapping(value = "stop")
	public String stop(CarManagement carManagement, Model model) {
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy年MM月dd日");
		model.addAttribute("buyd", sdf.format(carManagement.getBuydate()));
		model.addAttribute("carManagement", carManagement);
		System.out.println(1324657887);
		return "modules/oa/carManaStop";
	}
	
	//车辆启用和停用
	@RequiresPermissions("oa:carManagement:edit")
	@RequestMapping(value = "useAndStop")
	public String useAndStop(CarManagement carManagement, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, carManagement)){
			return form(carManagement, model);
		}
		
		if(carManagement.getState().equals("0")){
			carManagement.setState("1");
		}else if(carManagement.getState().equals("1")){
			carManagement.setState("0");
		}
		carManagementService.save(carManagement);
		return "redirect:list";
	}
}
