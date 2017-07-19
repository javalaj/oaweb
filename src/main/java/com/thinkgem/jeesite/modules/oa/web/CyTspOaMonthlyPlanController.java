/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.web;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.activiti.engine.ProcessEngine;
import org.activiti.engine.ProcessEngines;
import org.activiti.engine.task.Task;
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
import com.thinkgem.jeesite.common.utils.DateUtils;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.act.entity.Act;
import com.thinkgem.jeesite.modules.act.service.ActTaskService;
import com.thinkgem.jeesite.modules.oa.entity.CyTspOaAddress;
import com.thinkgem.jeesite.modules.oa.entity.CyTspOaMonthlyPlan;
import com.thinkgem.jeesite.modules.oa.entity.OaNotify;
import com.thinkgem.jeesite.modules.oa.service.CyTspOaMonthlyPlanService;
import com.thinkgem.jeesite.modules.oa.service.OaNotifyService;
import com.thinkgem.jeesite.modules.sys.entity.Office;
import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.modules.sys.service.OfficeService;
import com.thinkgem.jeesite.modules.sys.service.SystemService;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;
import com.thinkgem.jeesite.modules.user.entity.UserMonthrecord;
import com.thinkgem.jeesite.modules.user.entity.UserMonthsum;
import com.thinkgem.jeesite.modules.user.entity.UserWeekplan;
import com.thinkgem.jeesite.modules.user.entity.UserWeekrecord;
import com.thinkgem.jeesite.modules.user.entity.UserWorkrecord;
import com.thinkgem.jeesite.modules.user.entity.to.UserTotalrecords;
import com.thinkgem.jeesite.modules.user.service.UserWeekplanService;
import com.thinkgem.jeesite.modules.user.service.UserWeekrecordService;
import com.thinkgem.jeesite.modules.user.service.to.UserTotalrecordsService;

/**
 * 月计划Controller
 * 
 * @author cz
 * @version 2016-11-08
 */
@Controller
@RequestMapping(value = "${adminPath}/oa/cyTspOaMonthlyPlan")
public class CyTspOaMonthlyPlanController extends BaseController {

	@Autowired
	private CyTspOaMonthlyPlanService cyTspOaMonthlyPlanService;

	@ModelAttribute
	public CyTspOaMonthlyPlan get(@RequestParam(required = false) String id) {
		CyTspOaMonthlyPlan entity = null;
		if (StringUtils.isNotBlank(id)) {
			entity = cyTspOaMonthlyPlanService.get(id);
		}
		if (entity == null) {
			entity = new CyTspOaMonthlyPlan();
		}
		return entity;
	}
	@Autowired
	private UserWeekrecordService userWeekrecordService;
	@RequestMapping(value = { "list", "" })
	public String list(CyTspOaMonthlyPlan cyTspOaMonthlyPlan,
			HttpServletRequest request, HttpServletResponse response,
			Model model) {
		List<Office> offices = officeService.findByParentIdsplan(cyTspOaMonthlyPlan.getCurrentUser().getId());
		List<List<User>> users = new ArrayList<List<User>>();
		List<List<Integer>> submits = new ArrayList<List<Integer>>();
		List<User> usersTemp = new ArrayList<User>();
		for (Office office : offices) {
			List<Integer> submitsTemp = new ArrayList<Integer>();
			usersTemp = systemService.findUserByOfficeId(office.getId());
			users.add(usersTemp);
			submits.add(submitsTemp);
		}
		List< List<UserWeekrecord>> us=new ArrayList< List<UserWeekrecord>>();
		for (List<User> list : users) {
			for (User object : list) {
				User ue=object;
				List<UserWeekrecord> userweekrecord =userWeekrecordService.grouplist(ue.getId());
//	 if( userweekrecord.size()==0){
//		 break;
//	 }
	String name=  UserUtils.get(ue.getId()).getName();
	for(int j=0;j<userweekrecord.size();j++){
		userweekrecord.get(j).setCreatName(name);
	}
	if(userweekrecord.size()!=0){
		  us.add(userweekrecord);
	}
}
			}
	  if(us.size()!=0){
		  model.addAttribute("us", us);
	  }else{
		  model.addAttribute("cz","1");
	  }
		return "modules/oa/monthperformance/oaMonthlyPlanList";

	}
	/**
	 *  公司领导查看所有绩效考核
	 * 
	 * */
	@RequestMapping(value = {"index"})
	public String index(User user, Model model) {
		return "modules/oa/monthperformance/allIndex";	
	}
	@Autowired
	UserWeekplanService userweekplanservice;
	@RequestMapping(value = {"allList"})
	public String allList(User user, Model model,HttpServletRequest request, HttpServletResponse response,UserWeekrecord userweekrecord,Office office,UserWeekplan userWeekplan,String offid) {
		SimpleDateFormat sfd = new SimpleDateFormat("yyyy-MM");
		if(userWeekplan.getPlandate()==null){
		
			String end=sfd.format(new Date())+"-01";
			userWeekplan.setDate(end);
		}else{
			String end=sfd.format(userWeekplan.getPlandate())+"-01";
			model.addAttribute("end", userWeekplan.getPlandate());
			userWeekplan.setDate(end);
		}
//		if(offid==null||offid.equals("")){
//			Page<UserWeekplan> listWeekPlan=userweekplanservice.allListWeekPlan(new Page<UserWeekplan>(request, response),userWeekplan);
//		for(int i=0;i<listWeekPlan.getList().size();i++){
//			listWeekPlan.getList().get(i).setName(UserUtils.get(listWeekPlan.getList().get(i).getCreateBy().getId()).getName());
//			listWeekPlan.getList().get(i).setOfficeName(UserUtils.get(listWeekPlan.getList().get(i).getCreateBy().getId()).getOffice().getName());
//			userweekrecord=new UserWeekrecord();
//			userweekrecord.setWeekplanId(listWeekPlan.getList().get(i).getId());
//			List<UserWeekrecord> listWeekrecord=userWeekrecordService.allWeekPlanWeekid(userweekrecord);
//			int sum=0;
//			for(int j=0;j<listWeekrecord.size();j++){
//				listWeekrecord.get(j).setTestScore(listWeekrecord.get(j).getTestScore().substring(0,listWeekrecord.get(j).getTestScore().lastIndexOf(".")+2));
//				Integer week=Integer.valueOf(listWeekrecord.get(j).getTestScore().substring(0,listWeekrecord.get(j).getTestScore().lastIndexOf("."))).intValue();
//				sum+=week;
//			}
//				listWeekPlan.getList().get(i).setUserweekrecord(listWeekrecord);
//				listWeekPlan.getList().get(i).setWeekSum(sum);
//		}
//		model.addAttribute("listWeekPlan", listWeekPlan);
//		}else{
		
		String id="1";
		if(offid==null||offid.equals("")){
			offid=id;
		}
			office=officeService.get(offid);
			List<User> usersTemp = new ArrayList<User>();
			usersTemp = systemService.findUserByOfficeId(office.getId());
			Map<Integer, List<UserWeekplan >> map=new HashMap<Integer, List<UserWeekplan >>();
//			Page<UserWeekplan>  listWeekPlanpage=new Page<UserWeekplan>(request, response);
			for(int k=0;k<usersTemp.size();k++){
				List<UserWeekplan > list=new ArrayList<UserWeekplan>();
				userWeekplan.setCreateBy(usersTemp.get(k));
				List<UserWeekplan>  listWeekPlan=userweekplanservice.allListWeekPlanOfficeId(userWeekplan);
				int sumWeekScore=0;
				for(int i=0;i<listWeekPlan.size();i++){
					listWeekPlan.get(i).setName(UserUtils.get(listWeekPlan.get(i).getCreateBy().getId()).getName());
					listWeekPlan.get(i).setOfficeName(UserUtils.get(listWeekPlan.get(i).getCreateBy().getId()).getOffice().getName());
					userweekrecord=new UserWeekrecord();
					userweekrecord.setWeekplanId(listWeekPlan.get(i).getId());
					List<UserWeekrecord> listWeekrecord=userWeekrecordService.allWeekPlanWeekid(userweekrecord);
					int sum=0;
					for(int j=0;j<listWeekrecord.size();j++){
						listWeekrecord.get(j).setTestScore(listWeekrecord.get(j).getTestScore().substring(0,listWeekrecord.get(j).getTestScore().lastIndexOf(".")+2));
						Integer week=Integer.valueOf(listWeekrecord.get(j).getTestScore().substring(0,listWeekrecord.get(j).getTestScore().lastIndexOf("."))).intValue();
						sum+=week;
					}
						listWeekPlan.get(i).setUserweekrecord(listWeekrecord);
						listWeekPlan.get(i).setWeekSum(sum);
						list.add(listWeekPlan.get(i));
						sumWeekScore+=listWeekPlan.get(i).getWeekSum();
							
					}
				if(listWeekPlan.size()!=0){
					int countWeek=listWeekPlan.size();//周次数
					int avgWeekScore=sumWeekScore/countWeek;
					map.put(avgWeekScore, list);
				}
			
			}
			
//		
//			userWeekplan.setPage(listWeekPlanpage);
//			listWeekPlanpage.setList(list);
//			listWeekPlanpage.setCount(list.size());
			model.addAttribute("map", map);
			model.addAttribute("offid", offid);
//		}
	
		return "modules/oa/monthperformance/allList";	
	}

	// 定义流程引擎
	ProcessEngine processEngine = ProcessEngines.getDefaultProcessEngine();
	@Autowired
	private OfficeService officeService;// 组织机构service
	@Autowired
	private SystemService systemService;// 系统功能相关service
	@Autowired
	ActTaskService actTaskService;
	@Autowired
	 private OaNotifyService oanotifyservice;//通告service
	
	/** 加入工作台对象，用于显示流程图 */
	private void addTaskpre(Model model, UserWeekrecord userWeekrecord) {
		// 如果流程已启动，给出流程图
		
		if (userWeekrecord.getProcInsIdPre() != null && userWeekrecordService.getTaskByprocInsIdPre(userWeekrecord.getProcInsIdPre()) != null) {
			model.addAttribute("task",userWeekrecordService.getTaskByprocInsIdPre(userWeekrecord.getProcInsIdPre()));
		}
	}
	 /**
	    * 
	    *  驳回后重新发起申请
	    * 
	    * */
	@RequestMapping(value = "rejected")
	public String rejected(String sameid ,UserMonthsum userMonthsum, UserWeekrecord userWeekrecord,
			UserMonthrecord userMonthrecord, UserWeekplan userWeekplan, Model model,
			RedirectAttributes redirectAttributes,Date begindate, Date enddate, String otherUserId, 
			HttpServletRequest request, HttpServletResponse response, UserWorkrecord userWorkrecord,
			String otherUserName) {
		String view = "modules/oa/monthperformance/rejectedForm";// 默认去查看页面
		List<UserWeekrecord> listOaEnteri = userWeekrecordService.turnprecomidList(sameid);
		if(listOaEnteri.size()>0){
			for(int j=0;j<listOaEnteri.size();j++){
				User use=new User();
				use.setId(listOaEnteri.get(j).getCreateByid());
			String name=  UserUtils.get(use.getId()).getName();
			listOaEnteri.get(j).setCreatName(name);
			}
			addTaskpre(model, listOaEnteri.get(0));
			model.addAttribute("userWeekrecords", userWeekrecordService.turnprecomidList(sameid).get(0));
			model.addAttribute("us", listOaEnteri);
			UserTotalrecords us=new UserTotalrecords();
			us.setPreCommonid(sameid);
			userTotalrecordsService.delete(us); 
			return view;
			
		}else{
			List<UserWeekrecord> listOaEnter = userWeekrecordService.precomidList(sameid);
			for(int j=0;j<listOaEnter.size();j++){
				User use=new User();
				use.setId(listOaEnter.get(j).getCreateByid());
			String name=  UserUtils.get(use.getId()).getName();
				listOaEnter.get(j).setCreatName(name);
			}
			addTaskpre(model, listOaEnter.get(0));
			model.addAttribute("userWeekrecords", userWeekrecordService.precomidList(sameid).get(0));
			model.addAttribute("us", listOaEnter);
			return view;
		}
	
	}
	
	//申请人完成查看
	@RequestMapping(value = "rejectedView")
	public String rejectedView(String sameid ,UserMonthsum userMonthsum, UserWeekrecord userWeekrecord,
			UserMonthrecord userMonthrecord, UserWeekplan userWeekplan, Model model,
			RedirectAttributes redirectAttributes,Date begindate, Date enddate, String otherUserId, 
			HttpServletRequest request, HttpServletResponse response, UserWorkrecord userWorkrecord,
			String otherUserName) {
		String view = "modules/oa/monthperformance/rejectedView";// 默认去查看页面
		List<UserWeekrecord> listOaEnteri = userWeekrecordService.turnprecomidList(sameid);
		if(listOaEnteri.size()>0){
			for(int j=0;j<listOaEnteri.size();j++){
				User use=new User();
				use.setId(listOaEnteri.get(j).getCreateByid());
			String name=  UserUtils.get(use.getId()).getName();
			listOaEnteri.get(j).setCreatName(name);
			}
			addTaskpre(model, listOaEnteri.get(0));
			model.addAttribute("userWeekrecords", userWeekrecordService.turnprecomidList(sameid).get(0));
			model.addAttribute("us", listOaEnteri);
			return view;
		}else{
			List<UserWeekrecord> listOaEnter = userWeekrecordService.precomidList(sameid);
			for(int j=0;j<listOaEnter.size();j++){
				User use=new User();
				use.setId(listOaEnter.get(j).getCreateByid());
			String name=  UserUtils.get(use.getId()).getName();
				listOaEnter.get(j).setCreatName(name);
			}
			addTaskpre(model, listOaEnter.get(0));
			model.addAttribute("userWeekrecords", userWeekrecordService.precomidList(sameid).get(0));
			model.addAttribute("us", listOaEnter);
			return view;
		}
	
	}
	
	
   /**
    * 
    *  测试部门审核提交申请
    * 
    * */
	@RequestMapping(value = "test")
	public String test(String sameid ,UserMonthsum userMonthsum, UserWeekrecord userWeekrecord,
			UserMonthrecord userMonthrecord, UserWeekplan userWeekplan, Model model,
			RedirectAttributes redirectAttributes,Date begindate, Date enddate, String otherUserId, 
			HttpServletRequest request, HttpServletResponse response, UserWorkrecord userWorkrecord,
			String otherUserName) {
		String view = "modules/oa/monthperformance/csperformanceForm";// 默认去查看页面
		List<UserWeekrecord> listOaEnteri = userWeekrecordService.turnprecomidList(sameid);
		if(listOaEnteri.size()>0){
			for(int j=0;j<listOaEnteri.size();j++){
				User use=new User();
				use.setId(listOaEnteri.get(j).getCreateByid());
			String name=  UserUtils.get(use.getId()).getName();
			listOaEnteri.get(j).setCreatName(name);
			}
			addTaskpre(model, listOaEnteri.get(0));
			model.addAttribute("userWeekrecords", userWeekrecordService.turnprecomidList(sameid).get(0));
			model.addAttribute("us", listOaEnteri);
			UserTotalrecords us=new UserTotalrecords();
			us.setPreCommonid(sameid);
			userTotalrecordsService.delete(us); 
			return view;
		}else{
			try {
				
			
			List<UserWeekrecord> listOaEnter = userWeekrecordService.precomidList(sameid);
			for(int j=0;j<listOaEnter.size();j++){
				User use=new User();
				use.setId(listOaEnter.get(j).getCreateByid());
			String name=  UserUtils.get(use.getId()).getName();
				listOaEnter.get(j).setCreatName(name);
			}
			addTaskpre(model, listOaEnter.get(0));
			
			model.addAttribute("userWeekrecords", userWeekrecordService.precomidList(sameid).get(0));
			model.addAttribute("us", listOaEnter);
			} catch (Exception e) {
				addMessage(redirectAttributes, "该申请数据已丢失，请提醒申请人重新提交申请！");
				return "redirect:" + Global.getAdminPath() + "/act/task/todo/?repage";
			}
			return view;
		}
	}

		
	/**
	    * 
	    *  部门副总测试部门审核查看
	    * 
	    * */
		@RequestMapping(value = "testview")
		public String testview(String sameid ,UserMonthsum userMonthsum, UserWeekrecord userWeekrecord,
				UserMonthrecord userMonthrecord, UserWeekplan userWeekplan, Model model,
				RedirectAttributes redirectAttributes,Date begindate, Date enddate, String otherUserId, 
				HttpServletRequest request, HttpServletResponse response, UserWorkrecord userWorkrecord,
				String otherUserName) {
			List<UserWeekrecord> listOaEnter = userWeekrecordService.precomidList(sameid);
			String view = "modules/oa/monthperformance/performanceView";// 默认去查看页面
			for(int j=0;j<listOaEnter.size();j++){
				User use=new User();
				use.setId(listOaEnter.get(j).getCreateByid());
			String name=  UserUtils.get(use.getId()).getName();
				listOaEnter.get(j).setCreatName(name);
			}
			model.addAttribute("us", listOaEnter);
			addTaskpre(model, listOaEnter.get(0));
			model.addAttribute("userWeekrecords", userWeekrecordService.precomidList(sameid).get(0));
			return view;
		}
		@Autowired
		private UserTotalrecordsService userTotalrecordsService;
	/**
	    * 
	    *  部门副总提交申请
	    * 
	    * */
		@RequestMapping(value = "vicePresident")
		public String vicePresident(String sameid ,UserMonthsum userMonthsum, UserWeekrecord userWeekrecord,
				UserMonthrecord userMonthrecord, UserWeekplan userWeekplan, Model model,
				RedirectAttributes redirectAttributes,Date begindate, Date enddate, String otherUserId, 
				HttpServletRequest request, HttpServletResponse response, UserWorkrecord userWorkrecord,
				String otherUserName,UserTotalrecords userTotalrecords) {
			List<UserWeekrecord> listOaEnter = userWeekrecordService.precomidList(sameid);
			for(int j=0;j<listOaEnter.size();j++){
				User use=new User();
				use.setId(listOaEnter.get(j).getCreateByid());
			String name=  UserUtils.get(use.getId()).getName();
				listOaEnter.get(j).setCreatName(name);
			}
			userTotalrecords.setPreCommonid(sameid);
			List<Map<String, Object>> to  =userTotalrecordsService.toSum(userTotalrecords);
			List<Map<Object, Object>> listto=new ArrayList<Map<Object,Object>>();
		for (Map<String, Object> map : to) {
			Map<Object, Object> mapto=new HashMap<Object, Object>();
			Object sum=map.get("sum");//月总分
			map.get("week");//周次数
			map.get("nameid");//创建者ID
			String sumto=sum.toString();
			String sumi=sumto.substring(0,sumto.lastIndexOf("."));
			Integer sumy=Integer.valueOf(sumi);
			String week=map.get("week").toString();
			Integer weeky=Integer.valueOf(week);
			Integer avg=sumy/weeky;
			User use=new User();
			use.setId(map.get("nameid").toString());
		 String name=  UserUtils.get(use.getId()).getName();
		 mapto.put("sum",sumy);
		 mapto.put("avg", avg);
		 mapto.put("name", name);
		 mapto.put("week", week);
		 listto.add(mapto);
		}
		model.addAttribute("to", listto);
		for(int i=0;i<listOaEnter.size();i++){
			listOaEnter.get(i).setTestScore(listOaEnter.get(i).getTestScore().substring(0,listOaEnter.get(i).getTestScore().lastIndexOf(".")+2));
		}
			model.addAttribute("us", listOaEnter);
			
			if(listOaEnter.get(0).getQualityScore()==null||listOaEnter.get(0).getQualityScore().equals("")){
				model.addAttribute("turneddownFlag", "1");
			}else{
				model.addAttribute("turneddownFlag", "2");
			}
			String view = "modules/oa/monthperformance/vicePresidentForm";// 默认去查看页面
			addTaskpre(model, listOaEnter.get(0));
			model.addAttribute("userWeekrecords", userWeekrecordService.precomidList(sameid).get(0));
			return view;
		}
		/**
		    * 
		    *  部门副总提交申请
		    * 
		    * */
			@RequestMapping(value = "vicePresidentview")
			public String vicePresidentview(String sameid ,UserMonthsum userMonthsum, UserWeekrecord userWeekrecord,
					UserMonthrecord userMonthrecord, UserWeekplan userWeekplan, Model model,
					RedirectAttributes redirectAttributes,Date begindate, Date enddate, String otherUserId, 
					HttpServletRequest request, HttpServletResponse response, UserWorkrecord userWorkrecord,
					String otherUserName,UserTotalrecords userTotalrecords) {
				List<UserWeekrecord> listOaEnter = userWeekrecordService.precomidList(sameid);
				for(int j=0;j<listOaEnter.size();j++){
					User use=new User();
					use.setId(listOaEnter.get(j).getCreateByid());
				String name=  UserUtils.get(use.getId()).getName();
					listOaEnter.get(j).setCreatName(name);
				}
				userTotalrecords.setPreCommonid(sameid);
				List<Map<String, Object>> to  =userTotalrecordsService.toSum(userTotalrecords);
				List<Map<Object, Object>> listto=new ArrayList<Map<Object,Object>>();
			for (Map<String, Object> map : to) {
				Map<Object, Object> mapto=new HashMap<Object, Object>();
				Object sum=map.get("sum");//月总分
				map.get("week");//周次数
				map.get("nameid");//创建者ID
				String sumto=sum.toString();
				String sumi=sumto.substring(0,sumto.lastIndexOf("."));
				Integer sumy=Integer.valueOf(sumi);
				String week=map.get("week").toString();
				Integer weeky=Integer.valueOf(week);
				Integer avg=sumy/weeky;
				User use=new User();
				use.setId(map.get("nameid").toString());
			 String name=  UserUtils.get(use.getId()).getName();
			 mapto.put("sum",sumy);
			 mapto.put("avg", avg);
			 mapto.put("name", name);
			 mapto.put("week", week);
			 listto.add(mapto);
			}
			if(listOaEnter.get(0).getQualityScore()==null||listOaEnter.get(0).getQualityScore().equals("")){
				model.addAttribute("turneddownFlag", "1");
			}else{
				model.addAttribute("turneddownFlag", "2");
			}
			model.addAttribute("to", listto);
				model.addAttribute("us", listOaEnter);
				String view = "modules/oa/monthperformance/vicePresidentView";// 默认去查看页面
				addTaskpre(model, listOaEnter.get(0));
				model.addAttribute("userWeekrecords", userWeekrecordService.precomidList(sameid).get(0));
				return view;
			}
	
	
//    /**
//     * 
//     *   个人月季度总结
//     * 
//     * */
//	@RequestMapping(value = "personal")
//	public String personalList(CyTspOaMonthlyPlan cyTspOaMonthlyPlan,
//			HttpServletRequest request, HttpServletResponse response,
//			Model model,OaNotify oanotify){
//		String commid=request.getParameter("commid");
//		String oanotiyId=request.getParameter("id");
//		User currentUser = cyTspOaMonthlyPlan.getCurrentUser();
//		String use=UserUtils.get(currentUser.getOffice().getPrimaryPerson().getId()).getId();
//		cyTspOaMonthlyPlan.setCommonId(commid);
//		CyTspOaMonthlyPlan c=cyTspOaMonthlyPlanService.transactor(cyTspOaMonthlyPlan).get(0);
//		if(c.getTransactor().equals("2")){
//			cyTspOaMonthlyPlan.setApprovalUserId(currentUser.getId());
//			cyTspOaMonthlyPlan.setCommonId(commid);
//			List<CyTspOaMonthlyPlan> page=cyTspOaMonthlyPlanService.findApprovalListv(cyTspOaMonthlyPlan);
//			if(page.size()<=0){
//				List<CyTspOaMonthlyPlan> pagei=	cyTspOaMonthlyPlanService.passlist(commid);
//				CyTspOaMonthlyPlan cyt =pagei.get(0);
//				String StartTime1 = cyt.getEndTime().substring(0, cyt.getEndTime().lastIndexOf("-"));
//				String StartTime2 =StartTime1.substring(StartTime1.lastIndexOf("-"));
//				Map<Integer, Integer> Scrores = cyTspOaMonthlyPlanService.findScrores(StartTime1,cyt.getUserId() );
//				model.addAttribute("Scrores", Scrores);
//				model.addAttribute("page", pagei);
//				User user=systemService.getUser(cyt.getUserId());
//				String cyname=user.getName();
//				String offid=cyt.getOfficeId();
//				Office off=officeService.get(offid);
//	    		String offname=off.getName();
//				model.addAttribute("cyname", cyname);//姓名
//				model.addAttribute("StartTime2", StartTime2);//月份
//				model.addAttribute("offname", offname);
//				oanotify.setId(oanotiyId);
//				oanotify.setCurrentUser(oanotify.getCurrentUser());
//				oanotifyservice.updateReadFlag(oanotify);
//				return "modules/oa/monthlyPlanTo";
//				}
//			CyTspOaMonthlyPlan cyt =page.get(0);
//			String StartTime1 = cyt.getEndTime().substring(0, cyt.getEndTime().lastIndexOf("-"));
//			String StartTime2 =StartTime1.substring(StartTime1.lastIndexOf("-"));
//			Map<Integer, Integer> Scrores = cyTspOaMonthlyPlanService.findScrores(StartTime1,cyt.getUserId() );
//			model.addAttribute("Scrores", Scrores);
//			model.addAttribute("page", page);
//			User user=systemService.getUser(cyt.getUserId());
//			String offid=cyt.getOfficeId();
//			Office off=officeService.get(offid);
//    		String offname=off.getName();
//    		model.addAttribute("offname", offname);
//			String cyname=user.getName();
//			model.addAttribute("cyname", cyname);//姓名
//			model.addAttribute("StartTime2", StartTime2);//月份
//			oanotify.setId(oanotiyId);
//			oanotify.setCurrentUser(oanotify.getCurrentUser());
//			oanotifyservice.updateReadFlag(oanotify);
//			return "modules/oa/personalMonthlyPlanTotalList";//公司领导层查看的页面
//		}else if(!currentUser.getId().equals(use)){
//			List<CyTspOaMonthlyPlan> pagei=	cyTspOaMonthlyPlanService.passlist(commid);
//			CyTspOaMonthlyPlan cyt =pagei.get(0);
//			String offid=cyt.getOfficeId();
//			Office off=officeService.get(offid);
//    		String offname=off.getName();
//			String StartTime1 = cyt.getEndTime().substring(0, cyt.getEndTime().lastIndexOf("-"));
//			String StartTime2 =StartTime1.substring(StartTime1.lastIndexOf("-"));
//			Map<Integer, Integer> Scrores = cyTspOaMonthlyPlanService.findScrores(StartTime1,cyt.getUserId() );
//			model.addAttribute("Scrores", Scrores);
//			model.addAttribute("page", pagei);
//			User user=systemService.getUser(cyt.getUserId());
//			String cyname=user.getName();
//			model.addAttribute("cyname", cyname);//姓名
//			model.addAttribute("StartTime2", StartTime2);//月份
//			model.addAttribute("offname", offname);//月份
//			oanotify.setId(oanotiyId);
//			oanotify.setCurrentUser(oanotify.getCurrentUser());
//			oanotifyservice.updateReadFlag(oanotify);
//			return "modules/oa/myMonthlyPass";			
//		}else{
//		cyTspOaMonthlyPlan.setApprovalUserId(currentUser.getId());
//		cyTspOaMonthlyPlan.setCommonId(commid);
//		List<CyTspOaMonthlyPlan> page=cyTspOaMonthlyPlanService.findApprovalList(cyTspOaMonthlyPlan);
//		if(page.size()<=0){
//			List<CyTspOaMonthlyPlan> pagei=	cyTspOaMonthlyPlanService.passlist(commid);
//			CyTspOaMonthlyPlan cyt =pagei.get(0);
//			String offid=cyt.getOfficeId();
//			Office off=officeService.get(offid);
//    		String offname=off.getName();
//			String StartTime1 = cyt.getEndTime().substring(0, cyt.getEndTime().lastIndexOf("-"));
//			String StartTime2 =StartTime1.substring(StartTime1.lastIndexOf("-"));
//			Map<Integer, Integer> Scrores = cyTspOaMonthlyPlanService.findScrores(StartTime1,cyt.getUserId() );
//			model.addAttribute("Scrores", Scrores);
//			model.addAttribute("page", pagei);
//			User user=systemService.getUser(cyt.getUserId());
//			String cyname=user.getName();
//			model.addAttribute("cyname", cyname);//姓名
//			model.addAttribute("StartTime2", StartTime2);//月份
//			model.addAttribute("offname", offname);//月份
//			oanotify.setId(oanotiyId);
//			oanotify.setCurrentUser(oanotify.getCurrentUser());
//			oanotifyservice.updateReadFlag(oanotify);
//			return "modules/oa/mothlyPassPlan";
//		}
//		CyTspOaMonthlyPlan cyt =page.get(0);
//		String StartTime1 = cyt.getEndTime().substring(0, cyt.getEndTime().lastIndexOf("-"));
//		String StartTime2 =StartTime1.substring(StartTime1.lastIndexOf("-"));
//		Map<Integer, Integer> Scrores = cyTspOaMonthlyPlanService.findScrores(StartTime1,cyt.getUserId() );
//		model.addAttribute("Scrores", Scrores);
//		model.addAttribute("page", page);
//		User user=systemService.getUser(cyt.getUserId());
//		String cyname=user.getName();
//		model.addAttribute("cyname", cyname);//姓名
//		model.addAttribute("StartTime2", StartTime2);//月份
//		String offid=cyt.getOfficeId();
//		Office off=officeService.get(offid);
//		String offname=off.getName();
//		model.addAttribute("offname", offname);
//		oanotify.setId(oanotiyId);
//		oanotify.setCurrentUser(oanotify.getCurrentUser());
//		oanotifyservice.updateReadFlag(oanotify);
//		return "modules/oa/personalMonthlyPlanList";//部门经理进入的页面
//		}
//	}
	
	
	
	
	//查看详细计划
	@RequestMapping(value = "empList")
	public String empList(CyTspOaMonthlyPlan cyTspOaMonthlyPlan,
			HttpServletRequest request, HttpServletResponse response,
			Model model,OaNotify oanotify){
		String commid=request.getParameter("commid");
		List<CyTspOaMonthlyPlan> pagei=	cyTspOaMonthlyPlanService.passlist(commid);
		CyTspOaMonthlyPlan cyt =pagei.get(0);
		String StartTime1 = cyt.getEndTime().substring(0, cyt.getEndTime().lastIndexOf("-"));
		String StartTime2 =StartTime1.substring(StartTime1.lastIndexOf("-"));
		Map<Integer, Integer> Scrores = cyTspOaMonthlyPlanService.findScrores(StartTime1,cyt.getUserId() );
		model.addAttribute("Scrores", Scrores);
		model.addAttribute("page", pagei);
		User user=systemService.getUser(cyt.getUserId());
		String cyname=user.getName();
		model.addAttribute("cyname", cyname);//姓名
		model.addAttribute("StartTime2", StartTime2);//月份
		String offid=cyt.getOfficeId();
		Office off=officeService.get(offid);
		String offname=off.getName();
		model.addAttribute("offname", offname);
		oanotify.setCurrentUser(oanotify.getCurrentUser());
		oanotifyservice.updateReadFlag(oanotify);
	
		return "modules/oa/mothlyPassPlan";
		
	}
	
}