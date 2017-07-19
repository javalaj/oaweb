/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.web.mytask;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.common.utils.IdGen;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.oa.entity.OaNotify;
import com.thinkgem.jeesite.modules.oa.entity.OaTaskRecord;
import com.thinkgem.jeesite.modules.oa.entity.mytask.MeetingRecord;
import com.thinkgem.jeesite.modules.oa.entity.mytask.OaPlan;
import com.thinkgem.jeesite.modules.oa.entity.project.OaProject;
import com.thinkgem.jeesite.modules.oa.service.OaNotifyService;
import com.thinkgem.jeesite.modules.oa.service.mytask.MeetingRecordService;
import com.thinkgem.jeesite.modules.oa.service.mytask.OaPlanService;
import com.thinkgem.jeesite.modules.oa.service.project.OaProjectService;
import com.thinkgem.jeesite.modules.oa.web.mytask.utis.SendEmail;
import com.thinkgem.jeesite.modules.oa.web.mytask.utis.Timeru;
import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;

/**
 * 我的日程Controller
 * 
 * @author chenzhang
 * @version 2016-12-01
 */
@Controller
@RequestMapping(value = "${adminPath}/oa/mytask/oaPlan")
public class OaPlanController extends BaseController implements ServletContextListener {

	@Autowired
	private OaPlanService oaPlanService;
	@Autowired
	private OaNotifyService oanotifyservice;// 通告service

	@ModelAttribute
	public OaPlan get(@RequestParam(required = false) String id) {
		OaPlan entity = null;
		if (StringUtils.isNotBlank(id)) {
			entity = oaPlanService.get(id);
		}
		if (entity == null) {
			entity = new OaPlan();
		}
		return entity;
	}

	@RequiresPermissions("oa:mytask:oaPlan:view")
	@RequestMapping(value = { "list", "" })
	public String list(OaPlan oaPlan, HttpServletRequest request, HttpServletResponse response, Model model) {
		oaPlan.setCreateBy(oaPlan.getCurrentUser());
		SimpleDateFormat sfd = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
		List<OaPlan> listi = oaPlanService.listhuiyipu(oaPlan);
		for (int i = 0; i < listi.size(); i++) {
			OaPlan oaPlani = listi.get(i);
			try {
				String sd = sf.format(oaPlani.getStartDay());// 开始日期
				String st = oaPlani.getStartTime();// 开始时间
				String std = sd + " " + st+":00";
				if (sfd.parse(std).getTime() < new Date().getTime()) {
					oaPlanService.uphuiyi(oaPlani.getId());
				}
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		Page<OaPlan> page = oaPlanService.pagefindList(new Page<OaPlan>(request, response), oaPlan);
		List<OaPlan> lit = page.getList();
		for (int i = 0; i < lit.size(); i++) {

			lit.get(i).setPlanTitle(lit.get(i).getPlanTitle().substring(0, 2));
		}
		page.setList(lit);
		model.addAttribute("page", page);
		return "modules/oa/mytask/oaPlanList";
	}

	@Autowired
	private OaProjectService oaProjectService;

	@RequiresPermissions("oa:mytask:oaPlan:view")
	@RequestMapping(value = "form")
	public String form(OaPlan oaPlan, Model model, OaProject oaProject, HttpServletRequest request,
			HttpServletResponse response) {
		List<OaProject> page = oaProjectService.findList(oaProject);
		model.addAttribute("page", page);
		oaPlan.setPlanType("2");
		oaPlan.setIsback("0");
		model.addAttribute("oaPlan", oaPlan);
		return "modules/oa/mytask/oaPlanForm";
	}

	@RequestMapping(value = "oaformview")
	public String oalist(OaPlan oaPlan, Model model, OaProject oaProject, HttpServletRequest request,
			HttpServletResponse response, MeetingRecord meetingrecord) {
		String id = request.getParameter("id");
		String Compere = request.getParameter("Compere");
		String cruse = request.getParameter("cruser");
		oaPlan = oaPlanService.get(id);
		String Comperename = UserUtils.get(Compere).getName();
		String[] Actorn = oaPlan.getActor().getId().split(",");
		String[] Actorname = new String[Actorn.length];
		for (int i = 0; i < Actorn.length; i++) {
			String name = UserUtils.get(Actorn[i]).getName();
			Actorname[i] = name;
		}
		model.addAttribute("oaPlan", oaPlan);
		model.addAttribute("Comperename", Comperename);// 主持人
		model.addAttribute("Actorname", Actorname);// 参与人
		model.addAttribute("cruse", cruse);// 发起人

		meetingrecord.setPlanId(id);
		meetingrecord.setUserId(meetingrecord.getCurrentUser().getId());
		meetingrecord = meetingrecordservice.getMeetingRecord(meetingrecord);
		if(oaPlan.getIsback().equals("0")){
			if (meetingrecord.getState().equals("0")) {
				return "modules/oa/mytask/myTaskIndex";
			} else {
				return "modules/oa/mytask/view";
			}
		}else{
			return "modules/oa/mytask/view";
		}
	

		// String id=request.getParameter("id");
		// String Compere=request.getParameter("Compere");
		//
		// String cruse=request.getParameter("cruser");
		// oaPlan =oaPlanService.get(id);
		//
		// String Comperename=UserUtils.get(Compere).getName();
		// String[] Actorn=request.getParameter("Actorn").split(",");
		// String[] Actorname=new String[Actorn.length];
		// for(int i=0;i<Actorn.length;i++){
		// String name=UserUtils.get(Actorn[i]).getName();
		// Actorname[i]=name;
		// }
		// model.addAttribute("oaPlan", oaPlan);
		// model.addAttribute("Comperename", Comperename);//主持人
		// model.addAttribute("Actorname", Actorname);//参与人
		// model.addAttribute("cruse", cruse);//发起人

	}

	@Autowired
	MeetingRecordService meetingrecordservice;

	@RequiresPermissions("oa:mytask:oaPlan:edit")
	@RequestMapping(value = "save")
	public String save(OaPlan oaPlan, OaNotify oanotify, Model model, RedirectAttributes redirectAttributes,
			MeetingRecord meetingrecord) {
		oaPlan.setState("1");
		oaPlanService.save(oaPlan);
		String type = oaPlan.getPlanType();
		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat sfd = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		// 如果当前添加日程为会议
		if (type.equals("2")) {
			String sd = sf.format(oaPlan.getStartDay());// 开始日期
			String st = oaPlan.getStartTime();// 开始时间
			String std = sd + " " + st+":00";
			String title = oaPlan.getPlanTitle();// 标题
			String cruse = oaPlan.getCurrentUser().getId();// 创建人
			String  flag="1";
			try {
				if (oaPlan.getTip().equals("0")) {
					// 提醒十分钟
					String count = "会议将于十分钟后开始！！！！！！！！！";
					Date f = new Date(sfd.parse(std).getTime() - 600000);
					String tt = sfd.format(f);
					Timeru.autoExe(tt, title, cruse, count,flag);
				} else if (oaPlan.getTip().equals("1")) {
					// 提前二十分钟
					String count = "会议将于二十分钟后开始！！！！！！！！！";
					Date f = new Date(sfd.parse(std).getTime() - 1200000);
					String tt = sfd.format(f);
					Timeru.autoExe(tt, title, cruse, count,flag);
				} else if (oaPlan.getTip().equals("2")) {
					// 提前三十分钟
					String count = "会议将于三十分钟后开始！！！！！！！！！";
					Date f = new Date(sfd.parse(std).getTime() - 1800000);
					String tt = sfd.format(f);
					Timeru.autoExe(tt, title, cruse, count,flag);
				} else if (oaPlan.getTip().equals("3")) {
					// 提前一天
					String count = "会议将于一天后开始！！！！！！！！！";
					Date f = new Date(sfd.parse(std).getTime() - 864000000);
					String tt = sfd.format(f);
					Timeru.autoExe(tt, title, cruse, count,flag);
				}
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			String id = oaPlan.getActor().getId();
			String[] actorid = id.split(",");
			if(oaPlan.getIsback().equals("0")){
			for (int k = 0; k < actorid.length; k++) {
				if(!actorid[k].equals(oaPlan.getCompere().getId())){
				meetingrecord=new MeetingRecord();
				meetingrecord.setPlanId(oaPlan.getId());
				meetingrecord.setUserId(actorid[k]);
				meetingrecord.setState("0");
				meetingrecordservice.save(meetingrecord);
				}
			}
					meetingrecord=new MeetingRecord();
					meetingrecord.setPlanId(oaPlan.getId());
					meetingrecord.setUserId(oaPlan.getCompere().getId());
					meetingrecord.setState("0");
					meetingrecordservice.save(meetingrecord);
			}
          if(oaPlan.getIsback().equals("0")){
          oanotify.setTitle("【会议："+oaPlan.getPlanTitle()+"】-需要回执");// 标题
          }else{
        	   oanotify.setTitle("【会议："+oaPlan.getPlanTitle()+"】-无需回执");// 标题
          }
			oanotify.setType("4");// 设置成协同通告
			oanotify.setStatus("1");
			
			oanotify.setFiles(oaPlan.getFiles());// 附件
			String oaNotifyRecordIds=oaPlan.getCompere().getId()+","+oaPlan.getActor().getId();//发送给主持人和参与人
			oanotify.setOaNotifyRecordIds(oaNotifyRecordIds);// 通知
			oanotify.setContent("@@proNotify@@/oa/a/oa/mytask/oaPlan/oaformview?id=" + oaPlan.getId() + "&Compere="
					+ oaPlan.getCompere().getId() + "&cruser="
					+ oaPlan.getCurrentUser().getId());
			oanotifyservice.save(oanotify);
//			List planname = new ArrayList();
//			for (int i = 0; i < actorid.length; i++) {
//				String name = UserUtils.get(actorid[i]).getLoginName();
//				planname.add(name);
//			}
//			HashMap<String, Object> map = new HashMap<String, Object>();
//			SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd");
//			String str1 = sdf1.format(oaPlan.getStartDay());
//			SimpleDateFormat sdf2 = new SimpleDateFormat("HH:mm:ss");
//			String str2 = sdf2.format(oaPlan.getStartDay());
//			map.put("title", oaPlan.getPlanTitle());
//			map.put("StartDay", str1);
//			map.put("StartTime", str2);
//			map.put("planName", planname);
//			String[] toMailAddr = new String[actorid.length];
//			for (int i = 0; i < actorid.length; i++) {
//				User use = UserUtils.get(oaPlan.getActor().getId());
//				if (use != null) {
//					String name = use.getEmail();
//					toMailAddr[i] = name;
//				}
//			}
//			// 收件人地址
//		String subject = "楚誉科技工作会议";
//			String templatePath = "mailtemplate/test.ftl";
//			String username = "cz_asd19940729@163.com";
//			String password = "chenzhang.";
//		String smtp = "smtp.163.com";
//			String from = "cz_asd19940729@163.com";		
//			String[] to = toMailAddr;
//		String[] filename = {};
//		SendEmail.sendAndCc(smtp, from, to, subject, map, username, password, filename, templatePath);
////			 }
		} else if (type.equals("1")) {
			// 私人会议
			String sd = sf.format(oaPlan.getStartDay());// 开始日期
			String st = oaPlan.getStartTime();// 开始时间
			String std = sd + " " + st+":00";
			String title = oaPlan.getPlanTitle();// 标题
			String cruse = oaPlan.getCurrentUser().getId();// 创建人
			String  flag="0";
			try {
				if (oaPlan.getTip().equals("0")) {
					// 提醒十分钟
					String count = "私人活动将于十分钟后开始！！！！！！！！！";
					Date f = new Date(sfd.parse(std).getTime() - 600000);
					String tt = sfd.format(f);
					Timeru.autoExe(tt, title, cruse, count,flag);
				} else if (oaPlan.getTip().equals("1")) {
					// 提前二十分钟
					String count = "私人活动将于二十分钟后开始！！！！！！！！！";
					Date f = new Date(sfd.parse(std).getTime() - 1200000);
					String tt = sfd.format(f);
					Timeru.autoExe(tt, title, cruse, count,flag);
				} else if (oaPlan.getTip().equals("2")) {
					// 提前三十分钟
					String count = "私人活动将于三十分钟后开始！！！！！！！！！";
					Date f = new Date(sfd.parse(std).getTime() - 1800000);
					String tt = sfd.format(f);
					Timeru.autoExe(tt, title, cruse, count,flag);
				} else if (oaPlan.getTip().equals("3")) {
					// 提前一天
					String count = "私人活动将于一天后开始！！！！！！！！！";
					Date f = new Date(sfd.parse(std).getTime() - 864000000);
					String tt = sfd.format(f);
					Timeru.autoExe(tt, title, cruse, count,flag);
				}
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		addMessage(redirectAttributes, "保存日程成功");
		return "redirect:" + Global.getAdminPath() + "/oa/mytask/oaPlan/?repage";
	}

	@RequiresPermissions("oa:mytask:oaPlan:edit")
	@RequestMapping(value = "delete")
	public String delete(OaPlan oaPlan, RedirectAttributes redirectAttributes, HttpServletRequest request) {
		String id = request.getParameter("id");
		OaPlan oaPlannew=	oaPlanService.get(id);
		if(oaPlannew.getPlanType().equals("0")){
			oaPlan.setParentId(oaPlannew.getParentId());
			List<OaPlan> list = oaPlanService.getparlist(oaPlan);
			if (list.size() > 0) {
				// 该选择的任务有子任务
				for (int j = 0; j < list.size(); j++) {
					OaPlan oa = new OaPlan();
					OaPlan suboa = new OaPlan();
					oa.setId(list.get(j).getId());
					oaPlanService.delete(oa);
					suboa.setId(id);
					oaPlanService.delete(suboa);
					oaPlanService.deleteByOaTaskId(id);
				}
			} else {
				OaPlan oa = new OaPlan();
				oa.setId(id);
				oaPlanService.delete(oa);
				oaPlanService.deleteByOaTaskId(id);
			}
		}else{
		oaPlan.setId(id);
		oaPlan.setDelFlag("1");
		oaPlanService.delete(oaPlan);
		}
		addMessage(redirectAttributes, "删除日程成功");
		return "redirect:" + Global.getAdminPath() + "/oa/mytask/oaPlan/?repage";
	}

	/**
	 * 
	 * 选择不同的日程类型进入不同的页面
	 * 
	 */
	@RequiresPermissions("oa:mytask:oaPlan:view")
	@RequestMapping(value = "href")
	public String privatelist(Model model, OaPlan oaPlan) {
		oaPlan.setPlanType("1");
		model.addAttribute("oaPlan", oaPlan);
		return "modules/oa/mytask/privateList";
	}

	/**
	 * 每日日程列表
	 * 
	 */
	@RequiresPermissions("oa:mytask:oaPlan:view")
	@RequestMapping(value = "datelist", method = RequestMethod.GET)
	@ResponseBody
	public List<OaPlan> datelist(OaPlan oaPlan, Model model, OaProject oaProject, HttpServletRequest request,
			HttpServletResponse response) {
		oaPlan.setCreateBy(oaPlan.getCurrentUser());
		String date = request.getParameter("date");
		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd", Locale.ENGLISH);
		try {
			Date d = sf.parse(date);
			oaPlan.setStartDay(d);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		List<OaPlan> list = oaPlanService.selectDate(oaPlan);
		return list;
		// try {
		// PrintWriter writer= response.getWriter();
		// writer.print(list);
		// } catch (IOException e) {
		// // TODO Auto-generated catch block
		// e.printStackTrace();
		// }

	}
	// 是否参加会议
	@RequestMapping(value = "take", method = RequestMethod.POST)
	public String take(OaNotify oanotify, Model model, MeetingRecord meetingrecord, OaProject oaProject,
			HttpServletRequest request, HttpServletResponse response,OaPlan oaPlan) {
		String c = request.getParameter("c");
		String cruse = request.getParameter("cruse");
		String planTitle = request.getParameter("planTitle");
		String id = request.getParameter("id");
		if (c.equals("2")) {
			oanotify=new OaNotify();
			oanotify.setTitle("【会议："+planTitle+"】-【"+UserUtils.get(meetingrecord.getCurrentUser().getId()).getName()+"】-参加");// 标题
			oanotify.setType("4");// 设置成会议通告
			oanotify.setStatus("1");
			oanotify.setOaNotifyRecordIds(cruse);// 通知
			oanotify.setContent("参加");
			oanotify.setSelf(true);
			oanotifyservice.save(oanotify);
			meetingrecord.setPlanId(id);
			meetingrecord.setUserId(meetingrecord.getCurrentUser().getId());
			meetingrecordservice.updateMeetingRecord(meetingrecord);
			// oaPlanService.upisback(id);
		} else if (c.equals("1")) {
			oanotify=new OaNotify();
			oanotify.setTitle("【会议："+planTitle+"】-【"+UserUtils.get(meetingrecord.getCurrentUser().getId()).getName()+"】-不参加");// 标题
			oanotify.setType("4");// 设置成会议通告
			oanotify.setStatus("1");
			oanotify.setSelf(true);
			oanotify.setOaNotifyRecordIds(cruse);// 通知
			oanotify.setContent("不参加");
			oanotifyservice.save(oanotify);
			meetingrecord.setPlanId(id);
			meetingrecord.setUserId(meetingrecord.getCurrentUser().getId());
			meetingrecordservice.updateMeetingRecord(meetingrecord);
			// oaPlanService.upisback(id);
		}
		Page<OaNotify> page = oanotifyservice.find(new Page<OaNotify>(request, response), oanotify);
		model.addAttribute("page", page);
		return "redirect:" + adminPath + "/oa/oaNotify/self?repage";
	}

	@Override
	public void contextDestroyed(ServletContextEvent arg0) {
		// TODO Auto-generated method stub
	}
	@Override
	public void contextInitialized(ServletContextEvent arg0) {
		// TODO Auto-generated method stub
	}

	@RequiresPermissions("oa:mytask:oaPlan:edit")
	@RequestMapping(value = "mytasksave")
	public String mytasksave(OaPlan oaPlan, Model model, RedirectAttributes redirectAttributes,
			OaTaskRecord oaTaskRecord,String Fruit,String startDaytime,String prefer) {
		
		if(Fruit.equals("0")){
			oaPlan.setIssueState("1");//发布
		}else{
			oaPlan.setIssueState("0");
		}
		SimpleDateFormat sfd = new SimpleDateFormat("yyyy-MM-dd");
		try {
			oaPlan.setStartDay(sfd.parse(startDaytime));
			oaPlan.setStartTime(startDaytime.substring(11));
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		oaPlan.setPlanType("0");
		oaPlan.setPrefer(prefer);
		oaPlan.setState("1");
		oaPlanService.save(oaPlan);
		if(oaPlan.getIssueState().equals("1")){
		String[] Actorn = oaPlan.getActor().getId().split(",");
		oaTaskRecord.setOaTaskId(oaPlan.getId());
		if (Actorn.length > 0) {
			List<OaTaskRecord> list = oaPlanService.geti(oaTaskRecord);
			if (list.size() <= 0) {
				for (int i = 0; i < Actorn.length; i++) {
					String acid = Actorn[i];
					if (!acid.equals(oaPlan.getCurrentUser().getId())) {
						oaTaskRecord.setId(IdGen.uuid());
						oaTaskRecord.setUserId(Actorn[i]);
						oaTaskRecord.setOaTaskId(oaPlan.getId());
						oaTaskRecord.setTaskFlag("1");
						oaPlanService.insertAll(oaTaskRecord);
					}
				}
			} else {
				for (int i = 0; i < Actorn.length; i++) {
					oaPlanService.updateuser(Actorn[i], oaPlan.getId());
				}
			}
		}
		if(Fruit.equals("0")){
		if (Actorn.length > 0) {
		OaNotify oanotify = new OaNotify();
		oanotify.setTitle("【您收到一条任务："+oaPlan.getPlanTitle()+"】-【发布人："+UserUtils.get(oaPlan.getCurrentUser().getId()).getName()+"】");// 标题
		oanotify.setType("4");// 设置成会议通知
		oanotify.setStatus("1");
		oanotify.setOaNotifyRecordIds(oaPlan.getActor().getId());// 通知
		oanotify.setContent("@@planNotify@@/oa/a/oa/mytask/myTask/myup?id="+oaPlan.getId());
		oanotifyservice.save(oanotify);
		}else{
			for (int i = 0; i < Actorn.length; i++) {
				OaNotify oanotify = new OaNotify();
				oanotify.setTitle("【您收到一条任务："+oaPlan.getPlanTitle()+"】-【发布人："+UserUtils.get(oaPlan.getCurrentUser().getId()).getName()+"】");// 标题
				oanotify.setType("4");// 设置成会议通知
				oanotify.setStatus("1");
				oanotify.setOaNotifyRecordIds(Actorn[i]);// 通知
				oanotify.setContent("@@planNotify@@/oa/a/oa/mytask/myTask/myup?id="+oaPlan.getId());
				oanotifyservice.save(oanotify);
			}
		}
		}
		addMessage(redirectAttributes, "发布此任务成功");
		return "redirect:" + Global.getAdminPath() + "/oa/mytask/myTask/?repage";
		}else{
			addMessage(redirectAttributes, "保存此任务为草稿成功");
			return "redirect:" + Global.getAdminPath() + "/oa/mytask/myTask/?repage";
		}
		
	}

	@RequestMapping(value = "subtasksave")
	public String subtasksave(OaTaskRecord oaTaskRecord, OaPlan oaPlan, OaProject oaProject, HttpServletRequest request,
			HttpServletResponse response, Model model, RedirectAttributes redirectAttributes,String Fruit,String startDaytime,String prefer) {
		String items = request.getParameter("reid");// 主任务ID
		oaPlan.setParentId(items);
		if(Fruit.equals("0")){
			oaPlan.setIssueState("1");//发布
		}else{
			oaPlan.setIssueState("0");
		}
		SimpleDateFormat sfd = new SimpleDateFormat("yyyy-MM-dd");
		try {
			oaPlan.setStartDay(sfd.parse(startDaytime));
			oaPlan.setStartTime(startDaytime.substring(11));
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		oaPlan.setPlanType("0");
		oaPlan.setPrefer(prefer);
		oaPlan.setState("1");
		oaPlanService.save(oaPlan);
		if(oaPlan.getIssueState().equals("1")){
		String[] Actorn = oaPlan.getActor().getId().split(",");
		for (int i = 0; i < Actorn.length; i++) {
			String acid = Actorn[i];
			if (!acid.equals(oaPlan.getCurrentUser().getId())) {
				oaTaskRecord.setId(IdGen.uuid());
				oaTaskRecord.setUserId(Actorn[i]);
				oaTaskRecord.setOaTaskId(oaPlan.getId());
				oaTaskRecord.setTaskFlag("1");
				oaPlanService.insertAll(oaTaskRecord);
			}
		}
		if(Fruit.equals("0")){
		if (Actorn.length > 0) {
			OaNotify oanotify = new OaNotify();
			oanotify.setTitle("【您收到一条任务："+oaPlan.getPlanTitle()+"】-【发布人："+UserUtils.get(oaPlan.getCurrentUser().getId()).getName()+"】");// 标题
			oanotify.setType("4");// 设置成会议通知
			oanotify.setStatus("1");
			oanotify.setOaNotifyRecordIds(oaPlan.getActor().getId());// 通知
			oanotify.setContent("@@planNotify@@/oa/a/oa/mytask/myTask/myup?id="+oaPlan.getId());
			oanotifyservice.save(oanotify);
			}else{
				for (int i = 0; i < Actorn.length; i++) {
					OaNotify oanotify = new OaNotify();
					oanotify.setTitle("【您收到一条任务："+oaPlan.getPlanTitle()+"】-【发布人："+UserUtils.get(oaPlan.getCurrentUser().getId()).getName()+"】");// 标题
					oanotify.setType("4");// 设置成会议通知
					oanotify.setStatus("1");
					oanotify.setOaNotifyRecordIds(Actorn[i]);// 通知
					oanotify.setContent("@@planNotify@@/oa/a/oa/mytask/myTask/myup?id="+oaPlan.getId());
					oanotifyservice.save(oanotify);
				}
			}
		}
		addMessage(redirectAttributes, "发布该任务的子任务成功");
		return "redirect:" + Global.getAdminPath() + "/oa/mytask/myTask/?repage";
		
		}else{
			addMessage(redirectAttributes, "保存该任务的子任务为草稿成功");
			return "redirect:" + Global.getAdminPath() + "/oa/mytask/myTask/?repage";
		}
	}

	@RequestMapping(value = "/deletemore", method = RequestMethod.GET)
	public String deletemore(OaPlan oaPlan, HttpServletRequest request, HttpServletResponse response, Model model,
			RedirectAttributes redirectAttributes) {

		String items = request.getParameter("delitem");
		String[] item = items.split(",");
		for (int i = 0; i < item.length; i++) {
			oanotifyservice.deleteByContent("@@planNotify@@/oa/a/oa/mytask/myTask/myup?id="+item[i]);
			oaPlan.setParentId(item[i]);
			List<OaPlan> list = oaPlanService.getparlist(oaPlan);
			if (list.size() > 0) {
				// 该选择的任务有子任务
				for (int j = 0; j < list.size(); j++) {
					OaPlan oa = new OaPlan();
					OaPlan suboa = new OaPlan();
					oa.setId(list.get(j).getId());
					oaPlanService.delete(oa);
					suboa.setId(item[i]);
					oaPlanService.delete(suboa);
					oaPlanService.deleteByOaTaskId(item[i]);
				}
			} else {
				OaPlan oa = new OaPlan();
				oa.setId(item[i]);
				oaPlanService.delete(oa);
				oaPlanService.deleteByOaTaskId(item[i]);
			}

		}
		if(request.getSession().getAttribute("th")==null){
			addMessage(redirectAttributes, "删除该任务成功");
			return "redirect:" + Global.getAdminPath() + "/oa/mytask/myTask/?repage";
		}else{
			addMessage(redirectAttributes, "删除该任务成功");
			return "redirect:" + Global.getAdminPath() + "/oa/mytask/myTask/mylist?repage";
		}
	
	}

	@RequestMapping(value = "upPaln")
	public String upPlan(OaPlan oaPlan,OaProject oaProject, HttpServletRequest request, HttpServletResponse response, Model model,
			RedirectAttributes redirectAttributes) {
		SimpleDateFormat sfd = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
		String id = request.getParameter("id");
		oaPlan = oaPlanService.get(id);
		if (oaPlan.getPlanType().equals("2")) {
			if (oaPlan.getState().equals("3") && oaPlan.getState() != null) {
				addMessage(redirectAttributes, "当前会议已经开始不能够编辑");
				return "redirect:" + Global.getAdminPath() + "/oa/mytask/oaPlan/?repage";
			}
			String[] name = oaPlan.getActor().getId().split(",");
			if (name.length > 0) {
				String[] namei = new String[name.length];
				for (int i = 0; i < name.length; i++) {
					namei[i] = UserUtils.get(name[i]).getName();
				}

				String namee = StringUtils.join(namei, ",");
				model.addAttribute("name", namee);
			}
			String[] nam = oaPlan.getCompere().getId().split(",");
			if (nam.length > 0) {
				String[] namez = new String[nam.length];
				for (int i = 0; i < nam.length; i++) {
					namez[i] = UserUtils.get(nam[i]).getName();
				}

				String cname = StringUtils.join(namez, ",");
				model.addAttribute("cname", cname);
			}
			try {
				String sd = sf.format(oaPlan.getStartDay());// 开始日期
				String st = oaPlan.getStartTime() + ":02";// 开始时间
				String std = sd + " " + st;
				model.addAttribute("startime", sfd.parse(std));
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			model.addAttribute("oaPlan", oaPlan);
			return  "modules/oa/mytask/oaoPlanUp";
		} else if (oaPlan.getPlanType().equals("0")) {
			SimpleDateFormat sfs = new SimpleDateFormat("yyyy-MM-dd");
			SimpleDateFormat sfds = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String ids= request.getParameter("id");
			oaPlan = oaPlanService.get(ids);
			// 当该任务没有主任务时候
			if (oaPlan.getParentId() == null) {
				String[] name = oaPlan.getActor().getId().split(",");
				if (name.length > 0) {
					String[] namei = new String[name.length];
					for (int i = 0; i < name.length; i++) {
						namei[i] = UserUtils.get(name[i]).getName();
					}

					String namee = StringUtils.join(namei, ",");
					model.addAttribute("name", namee);
				}
				if (oaPlan.getState().equals("2") || oaPlan.getIssueState().equals("1")) {
					List<OaPlan> oaPlanChild = oaPlanService.getChild(id);
					if (oaPlanChild.size() > 0) {
						List<OaPlan> oaPlanChilds = new ArrayList<OaPlan>();
						for (int q = 0; q < oaPlanChild.size(); q++) {
							OaPlan oaPlanChild1 = new OaPlan();
							oaPlanChild1 = oaPlanService.get(oaPlanChild.get(q).getId());
							String[] nameiChild = oaPlanChild1.getActor().getId().split(",");
							if (nameiChild.length > 0) {
								String[] nameiiChild = new String[nameiChild.length];
								for (int j = 0; j < nameiChild.length; j++) {
									nameiiChild[j] = UserUtils.get(nameiChild[j]).getName();
								}
								String nameeChild = StringUtils.join(nameiiChild, ",");
								oaPlanChild1.setActName(nameeChild);
							}
							OaProject oaProjectiChild = new OaProject();
							oaProjectiChild = oaProjectService.get(oaPlanChild1.getProjectid());
							if (oaProjectiChild != null) {
								oaPlanChild1.setProname(oaProjectiChild.getProjectName());
							}	
							oaPlanChild1.setChildActName(UserUtils.get(oaPlanChild1.getCreateBy().getId()).getName());
							oaPlanChilds.add(oaPlanChild1);
							List<OaPlan> oaPlanChildlist1 = oaPlanService.getChild(oaPlanChild1.getId());
							if (oaPlanChildlist1.size() > 0) {
								for (int w = 0; w < oaPlanChildlist1.size(); w++) {
									OaPlan oaPlanChild2 = new OaPlan();
									oaPlanChild2 = oaPlanService.get(oaPlanChildlist1.get(w).getId());
									String[] nameiChild2 = oaPlanChild2.getActor().getId().split(",");
									if (nameiChild2.length > 0) {
										String[] nameiiChild2 = new String[nameiChild2.length];
										for (int j = 0; j < nameiChild2.length; j++) {
											nameiiChild2[j] = UserUtils.get(nameiChild2[j]).getName();
										}
										String nameeChild = StringUtils.join(nameiiChild2, ",");
										oaPlanChild2.setActName(nameeChild);
									}
									OaProject oaProjectiChild1 = new OaProject();
									oaProjectiChild1 = oaProjectService.get(oaPlanChild2.getProjectid());
									if (oaProjectiChild1 != null) {
										oaPlanChild2.setProname(oaProjectiChild.getProjectName());
									}
									oaPlanChild2.setChildActName(UserUtils.get(oaPlanChild2.getCreateBy().getId()).getName());
									oaPlanChilds.add(oaPlanChild2);
									List<OaPlan> oaPlanChildlist2 = oaPlanService.getChild(oaPlanChild2.getId());
									if (oaPlanChildlist2.size() > 0) {
										for (int i = 0; i < oaPlanChildlist2.size(); i++) {
											OaPlan oaPlanChild3 = new OaPlan();
											oaPlanChild3 = oaPlanService.get(oaPlanChildlist2.get(i).getId());
											String[] nameiChild3 = oaPlanChild3.getActor().getId().split(",");
											if (nameiChild3.length > 0) {
												String[] nameiiChild3 = new String[nameiChild3.length];
												for (int j = 0; j < nameiChild3.length; j++) {
													nameiiChild3[j] = UserUtils.get(nameiChild3[j]).getName();
												}
												String nameeChild = StringUtils.join(nameiiChild3, ",");
												oaPlanChild3.setActName(nameeChild);
											}
											OaProject oaProjectiChild2 = new OaProject();
											oaProjectiChild2 = oaProjectService.get(oaPlanChild3.getProjectid());
											if (oaProjectiChild2 != null) {
												oaPlanChild3.setProname(oaProjectiChild.getProjectName());
											}
											oaPlanChild3.setChildActName(UserUtils.get(oaPlanChild3.getCreateBy().getId()).getName());
											oaPlanChilds.add(oaPlanChild3);
										}
									}
								}
							}
						}
						System.out.println(oaPlanChilds.size());
						model.addAttribute("oaPlanChild", oaPlanChilds);
						
					}

					//
					// if(oaPlanChild.size()>0){
					// List<OaPlan> oaPlanChilds =new ArrayList<OaPlan>();
					// for(int i=0;i<oaPlanChild.size();i++){
					// OaPlan oaPlanChild1=new OaPlan();
					// oaPlanChild1 =oaPlanService.get(oaPlanChild.get(i).getId());
					// String[] nameiChild=
					// oaPlanChild1.getActor().getId().split(",");
					// if (nameiChild.length > 0) {
					// String[] nameiiChild = new String[nameiChild.length];
					// for (int j = 0; j < nameiChild.length; j++) {
					// nameiiChild[j] = UserUtils.get(nameiChild[j]).getName();
					// }
					// String nameeChild = StringUtils.join(nameiiChild, ",");
					// oaPlanChild1.setActName(nameeChild);
					// }
					// OaProject oaProjectiChild = new OaProject();
					// oaProjectiChild =
					// oaProjectService.get(oaPlanChild.get(i).getProjectid());
					// if(oaProjectiChild!=null){
					// oaPlanChild1.setProname(oaProjectiChild.getProjectName());
					// }
					// oaPlanChilds.add(oaPlanChild1);
					// }
					// model.addAttribute("oaPlanChild", oaPlanChilds);
					// }
				
					String[] masterName = oaPlan.getActor().getId().split(",");
					String[] masterName1=new String[masterName.length];
					for (int j = 0; j < masterName.length; j++) {
						masterName1[j] = UserUtils.get(masterName[j]).getName();
					}
					model.addAttribute("actName", UserUtils.get(oaPlan.getCreateBy().getId()).getName());//主任务发布人
					model.addAttribute("masterName",StringUtils.join(masterName1, ","));
					oaProject = oaProjectService.get(oaPlan.getProjectid());
					model.addAttribute("oaProject", oaProject);
					model.addAttribute("oaPlan", oaPlan);
					return "modules/oa/mytask/oaTasklistO";
				} else {
					List<OaProject> page = oaProjectService.findList(oaProject);
					oaProject = oaProjectService.get(oaPlan.getProjectid());
					String sd = sfs.format(oaPlan.getStartDay());// 开始日期
					String st = oaPlan.getStartTime();
					String std = sd + " " + st;
					String et = oaPlan.getEndTime();
					try {
						Date etr = sfds.parse(et);
						model.addAttribute("startDaytime",  sfds.parse(std));
						model.addAttribute("etr", etr);
					} catch (ParseException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					model.addAttribute("oaProject", oaProject);
					model.addAttribute("page", page);
					model.addAttribute("oaPlan", oaPlan);
					return "modules/oa/mytask/oaTaskForm";
				}
			} else {
				OaPlan oaPlani = new OaPlan();
				oaPlani = oaPlanService.get(oaPlan.getParentId());
				String[] name = oaPlani.getActor().getId().split(",");
				if (name.length > 0) {
					String[] namei = new String[name.length];
					for (int i = 0; i < name.length; i++) {
						namei[i] = UserUtils.get(name[i]).getName();
					}
					String name1 = StringUtils.join(namei, ",");
					model.addAttribute("nameMain", name1);//主任务分配人员
				}
				if (oaPlan.getState().equals("2") || oaPlan.getIssueState().equals("1")) {
					String[] sname = oaPlan.getActor().getId().split(",");
					if (sname.length > 0) {
						String[] namei = new String[sname.length];
						for (int i = 0; i < sname.length; i++) {
							namei[i] = UserUtils.get(sname[i]).getName();
						}
						String name2 = StringUtils.join(namei, ",");
						model.addAttribute("nameChilds", name2);//子任务分类人员
					}
					// 当前子任务下还有没有分配子任务
					List<OaPlan> oaPlanChild = oaPlanService.getChild(id);
					if (oaPlanChild.size() > 0) {
						List<OaPlan> oaPlanChilds = new ArrayList<OaPlan>();
						for (int i = 0; i < oaPlanChild.size(); i++) {
							OaPlan oaPlanChild1 = new OaPlan();
							oaPlanChild1 = oaPlanService.get(oaPlanChild.get(i).getId());
							String[] nameiChild = oaPlanChild1.getActor().getId().split(",");
							if (nameiChild.length > 0) {
								String[] nameiiChild = new String[nameiChild.length];
								for (int j = 0; j < nameiChild.length; j++) {
									nameiiChild[j] = UserUtils.get(nameiChild[j]).getName();
								}
								String nameeChild = StringUtils.join(nameiiChild, ",");
								oaPlanChild1.setActName(nameeChild);//子任务的子任务的分配人员
							}
							oaPlanChild1.setChildActName(UserUtils.get(oaPlanChild1.getCreateBy().getId()).getName());
							OaProject oaProjectiChild = new OaProject();
							oaProjectiChild = oaProjectService.get(oaPlanChild.get(i).getProjectid());
							if (oaProjectiChild != null) {
								oaPlanChild1.setProname(oaProjectiChild.getProjectName());
							}
							oaPlanChilds.add(oaPlanChild1);
						}
						model.addAttribute("oaPlanChild", oaPlanChilds);//子任务的子任务
					}
//					String[] masterName = oaPlan.getActor().getId().split(",");
//					String[] masterName1=new String[masterName.length];
//					for (int j = 0; j < masterName.length; j++) {
//						masterName1[j] = UserUtils.get(masterName[j]).getName();
//					}
//					model.addAttribute("masterName",StringUtils.join(masterName1, ","));
					OaProject oaProjectChilds=new OaProject();
					oaProjectChilds = oaProjectService.get(oaPlan.getProjectid());
					OaProject oaProjectMain=new OaProject();
					oaProjectMain = oaProjectService.get(oaPlani.getProjectid());
					model.addAttribute("oaProjectChilds", oaProjectChilds);
					model.addAttribute("oaProjectMain", oaProjectMain);
					model.addAttribute("oaPlanChilds", oaPlan);
					
					model.addAttribute("childsActName", UserUtils.get(oaPlan.getCreateBy().getId()).getName());
					model.addAttribute("mainActName", UserUtils.get(oaPlani.getCreateBy().getId()).getName());//主任务发布者
					model.addAttribute("oaPlanMain", oaPlani);
					return "modules/oa/mytask/subTaskList";
				} else {
					if (name.length > 0) {
						String[] namei = new String[name.length];
						for (int i = 0; i < name.length; i++) {
							namei[i] = UserUtils.get(name[i]).getName();
						}

						String namee = StringUtils.join(namei, ",");
						model.addAttribute("name", namee);
					}
					List<OaProject> page = oaProjectService.findList(oaProject);
					oaProject = oaProjectService.get(oaPlan.getProjectid());
					String sd = sfs.format(oaPlan.getStartDay());// 开始日期
					String st = oaPlan.getStartTime();
					String std = sd + " " + st;
					String et = oaPlan.getEndTime();
					try {
						Date etr = sfds.parse(et);
						model.addAttribute("startDaytime",  sfds.parse(std));
						model.addAttribute("etr", etr);
					} catch (ParseException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					model.addAttribute("oaProject", oaProject);
					model.addAttribute("page", page);
					model.addAttribute("oaPlan", oaPlan);
					return "modules/oa/mytask/oaTaskForm";
				}

			}
		} else {

			try {
				String sd = sf.format(oaPlan.getStartDay());// 开始日期
				String st = oaPlan.getStartTime() + ":02";// 开始时间
				String std = sd + " " + st;
				String enst = oaPlan.getEndTime() + ":02";
				String enstd = sd + " " + enst;
				model.addAttribute("startime", sfd.parse(std));
				model.addAttribute("endtime", sfd.parse(enstd));
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			model.addAttribute("oaPlan", oaPlan);
			return  "modules/oa/mytask/oaPrivateUp";
		}
		

	}

}