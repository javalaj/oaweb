package com.thinkgem.jeesite.modules.oa.web;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.oa.entity.CyTspOaMonthlyPlan;
import com.thinkgem.jeesite.modules.oa.service.CyTspOaMonthlyPlanService;
import com.thinkgem.jeesite.modules.sys.entity.Office;
import com.thinkgem.jeesite.modules.sys.service.OfficeService;

/**
 * 员工绩效
 *  
 * */
@Controller
@RequestMapping(value = "${adminPath}/oa/emper")
public class EmPermanceController {
@Autowired
OfficeService officeService;
@Autowired
CyTspOaMonthlyPlanService cytspoamonthlyplanservice;
 @RequestMapping(value ="list")
 public String list(){
	 return "modules/oa/emPerZtree";
 }

 
 
    @RequestMapping(value ="eplist")
    public String eplist(CyTspOaMonthlyPlan cyTspOaMonthlyPlan,HttpServletRequest request,HttpServletResponse response, Model model){
    	 DateFormat format=new SimpleDateFormat("yyyy");
    	  String time=format.format(new Date());
    	Calendar calendar = Calendar.getInstance(); 
    	calendar.add(Calendar.DATE, -1);    //得到前一天 
    	calendar.add(Calendar.MONTH, -1);    //得到前一个月 
    	int month = calendar.get(Calendar.MONTH)+1;
    	
    	String offid=request.getParameter("id");
    	if(offid==null||offid.equals("")){

        	String startTime=time+"-"+month;
        	cyTspOaMonthlyPlan.setOfficeId(offid);
        	cyTspOaMonthlyPlan.setStartTime(startTime);
        	Page<CyTspOaMonthlyPlan> page=cytspoamonthlyplanservice.epList(new Page<CyTspOaMonthlyPlan>(request, response), cyTspOaMonthlyPlan);
        	model.addAttribute("page", page);
        	model.addAttribute("month", month);
    	}else{
    		String startTime=time+"-"+month;
        	cyTspOaMonthlyPlan.setOfficeId(offid);
        	cyTspOaMonthlyPlan.setStartTime(startTime);
        	Page<CyTspOaMonthlyPlan> page=cytspoamonthlyplanservice.epList(new Page<CyTspOaMonthlyPlan>(request, response), cyTspOaMonthlyPlan);
        	model.addAttribute("page", page);
        	model.addAttribute("month", month);
        	Office off=officeService.get(offid);
    		String offname=off.getName();

        	model.addAttribute("offname", offname);
    	
    	}
    		
    	
    	return "modules/oa/emPerformanceList";
    	
    }
 
 
 
 
 
 
    @RequiresPermissions("user")
	@ResponseBody
	@RequestMapping(value = "treeData")
	public List<Map<String, Object>> treeData(
			@RequestParam(required = false) String extId,
			@RequestParam(required = false) String type,
			@RequestParam(required = false) Long grade,
			@RequestParam(required = false) Boolean isAll,
			HttpServletResponse response) {
		List<Map<String, Object>> mapList = Lists.newArrayList();
		List<Office> list = officeService.findList(isAll);		
		for (int i = 0; i < list.size(); i++) {
			Office e = list.get(i);
			if ((StringUtils.isBlank(extId) || (extId != null
					&& !extId.equals(e.getId()) && e.getParentIds().indexOf(
					"," + extId + ",") == -1))
					&& (type == null || (type != null && (type.equals("1") ? type
							.equals(e.getType()) : true)))
					&& (grade == null || (grade != null && Integer.parseInt(e
							.getGrade()) <= grade.intValue()))
					&& Global.YES.equals(e.getUseable())) {
				Map<String, Object> map = Maps.newHashMap();
				map.put("id", e.getId());
				map.put("pId", e.getParentId());
				map.put("pIds", e.getParentIds());
				map.put("name", e.getName());
				if (type != null && "3".equals(type)) {
					map.put("isParent", true);
				}
				mapList.add(map);
			}
		}
	
		return mapList;
	}
	
}
