package com.thinkgem.jeesite.modules.oa.web.mytask;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.oa.entity.mytask.OaPlan;
import com.thinkgem.jeesite.modules.oa.entity.project.OaProject;
import com.thinkgem.jeesite.modules.oa.service.mytask.OaPlanService;
import com.thinkgem.jeesite.modules.oa.service.project.OaProjectService;
import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;
import com.thinkgem.jeesite.modules.user.entity.UserFavorite;
import com.thinkgem.jeesite.modules.user.service.UserFavoriteService;


/**
 * 我的任務Controller
 * 
 * @author cz
 * @version 2016-12-5
 */
@Controller
@RequestMapping(value = "${adminPath}/oa/mytask/myTask")
public class MyTaskController extends BaseController {
	@Autowired
	private OaPlanService oaPlanService;
	@Autowired
	private OaProjectService oaProjectService;

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

	/**
	 * 任務列表
	 * 
	 * @param oatask
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequiresPermissions("oa:mytask:mytask:view")
	@RequestMapping(value = { "list", "" })
	public String list(OaPlan oaPlan, HttpServletRequest request, HttpServletResponse response, Model model) {

		request.getSession().removeAttribute("th");

		oaPlan.setCreateBy(oaPlan.getCurrentUser());
		SimpleDateFormat sfd = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		List<OaPlan> listi = oaPlanService.ListTask(oaPlan);
		for (int i = 0; i < listi.size(); i++) {
			OaPlan oaPlani = listi.get(i);
			try {
				// 判断没有完成的任务
				if (!oaPlani.getState().equals("2")) {
					if (sfd.parse(oaPlani.getEndTime()).getTime() < new Date().getTime()) {
						oaPlanService.upi(oaPlani.getId());
					}
				}
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} // 开始日期

		}
		Page<OaPlan> pagei = oaPlanService.findListTask(new Page<OaPlan>(request, response), oaPlan);
	
		Page<OaPlan> page = oaPlanService.findListTask(new Page<OaPlan>(request, response), oaPlan);
		List<OaPlan> list = page.getList();
		for (int i = 0; i < list.size(); i++) {
			String uid = list.get(i).getCreateBy().getId();
			String pid = list.get(i).getProjectid().getId();
			String[] acid = list.get(i).getActor().getId().split(",");
			String[] acnme = new String[acid.length];
			for (int j = 0; j < acid.length; j++) {
				acnme[j] = UserUtils.get(acid[j]).getName();
			}
			User use = new User();
			String namee = StringUtils.join(acnme, ",");
			use.setName(namee);
			list.get(i).setActor(use);
			User createBy = UserUtils.get(uid);// 通过用户id获取用户信息

			list.get(i).setCreateBy(createBy);

			if (!pid.equals("0") & !pid.equals("")) {
				OaProject oaProject = oaProjectService.get(pid);
				list.get(i).setProjectid(oaProject);
			}
			try {
				list.get(i).setEndDate(	sfd.parse(list.get(i).getEndTime()));
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		Map<String, String> map = oaPlanService.cnmylist(oaPlan);// 我布置的任务
		Map<String, String> mapi = oaPlanService.recnmylist(oaPlan.getCurrentUser().getId());
//		Map<String, String> mapa = oaPlanService.statea(oaPlan);// 进行中
		Map<String, String> mapb = oaPlanService.stateb(oaPlan);// 完成
//		Map<String, String> mapc = oaPlanService.statec(oaPlan);// 已超期
		pagei.setList(list);
		model.addAttribute("map", map);
		model.addAttribute("mapi", mapi);
		model.addAttribute("page", pagei);
//		model.addAttribute("mapa", mapa);
		model.addAttribute("mapb", mapb);
//		model.addAttribute("mapc", mapc);

		return "modules/oa/mytask/oaTaskList";
	}

	@RequestMapping(value = "selectmylist")
	public String mytasklist(OaPlan oaPlan, HttpServletRequest request, HttpServletResponse response, Model model) {
		String th = (String) request.getSession().getAttribute("th");
		if (th == null) {
			oaPlan.setCreateBy(oaPlan.getCurrentUser());
			SimpleDateFormat sfd = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			List<OaPlan> listi = oaPlanService.ListTask(oaPlan);
			for (int i = 0; i < listi.size(); i++) {
				OaPlan oaPlani = listi.get(i);
				try {
					// 判断没有完成的任务
					if (!oaPlani.getState().equals("2")) {
						if (sfd.parse(oaPlani.getEndTime()).getTime() < new Date().getTime()) {
							oaPlanService.upi(oaPlani.getId());
						}
					}
				} catch (ParseException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} // 开始日期

			}
			Page<OaPlan> pagei = oaPlanService.findListTask(new Page<OaPlan>(request, response), oaPlan);
			Page<OaPlan> page = oaPlanService.findListTask(new Page<OaPlan>(request, response), oaPlan);
			List<OaPlan> list = page.getList();
			for (int i = 0; i < list.size(); i++) {
				String uid = list.get(i).getCreateBy().getId();
				String pid = list.get(i).getProjectid().getId();
				String[] acid = list.get(i).getActor().getId().split(",");
				String[] acnme = new String[acid.length];
				for (int j = 0; j < acid.length; j++) {
					acnme[j] = UserUtils.get(acid[j]).getName();
				}
				User use = new User();
				String namee = StringUtils.join(acnme, ",");
				use.setName(namee);
				list.get(i).setActor(use);
				User createBy = UserUtils.get(uid);// 通过用户id获取用户信息

				list.get(i).setCreateBy(createBy);

				if (!pid.equals("0") & !pid.equals("")) {
					OaProject oaProject = oaProjectService.get(pid);
					list.get(i).setProjectid(oaProject);
				}
			}
			Map<String, String> map = oaPlanService.cnmylist(oaPlan);// 我布置的任务
			Map<String, String> mapi = oaPlanService.recnmylist(oaPlan.getCurrentUser().getId());
			Map<String, String> mapa = oaPlanService.statea(oaPlan);// 进行中
			Map<String, String> mapb = oaPlanService.stateb(oaPlan);// 完成
			Map<String, String> mapc = oaPlanService.statec(oaPlan);// 已超期
			pagei.setList(list);
			model.addAttribute("map", map);
			model.addAttribute("mapi", mapi);
			model.addAttribute("mapa", mapa);
			model.addAttribute("mapb", mapb);
			model.addAttribute("mapc", mapc);
			model.addAttribute("page", pagei);
			return "modules/oa/mytask/oaTaskList";
		} else {
			oaPlan.setCruserid(oaPlan.getCurrentUser().getId());
			oaPlan.setCreateBy(oaPlan.getCurrentUser());
			SimpleDateFormat sfd = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			List<OaPlan> listi = oaPlanService.ListTask(oaPlan);
			for (int i = 0; i < listi.size(); i++) {
				OaPlan oaPlani = listi.get(i);
				try {
					// 判断没有完成的任务
					if (!oaPlani.getState().equals("2")) {
						if (sfd.parse(oaPlani.getEndTime()).getTime() < new Date().getTime()) {
							oaPlanService.upi(oaPlani.getId());
						}
					}
				} catch (ParseException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} // 开始日期

			}
			Page<OaPlan> pagei = oaPlanService.myfindListTask(new Page<OaPlan>(request, response), oaPlan);
			Page<OaPlan> page = oaPlanService.myfindListTask(new Page<OaPlan>(request, response), oaPlan);
			List<OaPlan> list = page.getList();
			for (int i = 0; i < list.size(); i++) {
				String uid = list.get(i).getCreateBy().getId();
				String pid = list.get(i).getProjectid().getId();
				String[] acid = list.get(i).getActor().getId().split(",");
				String[] acnme = new String[acid.length];
				for (int j = 0; j < acid.length; j++) {
					acnme[j] = UserUtils.get(acid[j]).getName();
				}
				User use = new User();
				String namee = StringUtils.join(acnme, ",");
				use.setName(namee);
				list.get(i).setActor(use);
				User createBy = UserUtils.get(uid);// 通过用户id获取用户信息

				list.get(i).setCreateBy(createBy);

				if (!pid.equals("0") & !pid.equals("")) {
					OaProject oaProject = oaProjectService.get(pid);
					list.get(i).setProjectid(oaProject);
				}
			}
			Map<String, String> map = oaPlanService.cnmylist(oaPlan);// 我布置的任务
			Map<String, String> mapi = oaPlanService.recnmylist(oaPlan.getCurrentUser().getId());
			Map<String, String> mapa = oaPlanService.mystatea(oaPlan.getCurrentUser().getId());// 进行中
			Map<String, String> mapb = oaPlanService.mystateb(oaPlan.getCurrentUser().getId());// 完成
			Map<String, String> mapc = oaPlanService.mystatec(oaPlan.getCurrentUser().getId());// 已超期
			pagei.setList(list);
			model.addAttribute("map", map);
			model.addAttribute("mapi", mapi);
			model.addAttribute("mapa", mapa);
			model.addAttribute("mapb", mapb);
			model.addAttribute("mapc", mapc);
			model.addAttribute("page", pagei);
			return "modules/oa/mytask/oaTaskList";
		}
	}

	/**
	 * 新建任務
	 * 
	 * @param oatask
	 * @param model
	 * @param oaProject
	 * @param request
	 * @param response
	 * @return
	 */
	@RequiresPermissions("oa:mytask:mytask:view")
	@RequestMapping(value = "form")
	public String form(OaPlan oaPlan, Model model, OaProject oaProject, HttpServletRequest request,
			HttpServletResponse response) {

		String id = request.getParameter("id");
		if (id == null) {
			oaPlan.setActor(oaPlan.getCurrentUser());
//			String Acname = UserUtils.get(oaPlan.getCurrentUser().getId()).getName();
			oaPlan.setActor(oaPlan.getCurrentUser());
			oaPlan.setPrefer("0");
			List<OaProject> page = oaProjectService.findList(oaProject);
			model.addAttribute("page", page);
			oaPlan.setPlanType("0");
			model.addAttribute("oaPlan", oaPlan);
//			model.addAttribute("name", Acname);
			return "modules/oa/mytask/oaTaskForm";
		} else {

			oaPlan = oaPlanService.get(id);
			oaProject = oaProjectService.get(oaPlan.getProjectid());
			model.addAttribute("oaProject", oaProject);
			model.addAttribute("oaPlan", oaPlan);
			return "modules/oa/mytask/oaTasklistO";
		}

	}

	@RequiresPermissions("oa:mytask:mytask:view")
	@RequestMapping(value = "up")
	public String up(OaPlan oaPlan, Model model, OaProject oaProject, HttpServletRequest request,
			HttpServletResponse response) {
		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat sfd = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String id = request.getParameter("id");
		oaPlan = oaPlanService.get(id);
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
				String sd = sf.format(oaPlan.getStartDay());// 开始日期
				String st = oaPlan.getStartTime();
				String std = sd + " " + st;
				String et = oaPlan.getEndTime();
				try {
					Date etr = sfd.parse(et);
					model.addAttribute("startDaytime",  sfd.parse(std));
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
//				String[] masterName = oaPlan.getActor().getId().split(",");
//				String[] masterName1=new String[masterName.length];
//				for (int j = 0; j < masterName.length; j++) {
//					masterName1[j] = UserUtils.get(masterName[j]).getName();
//				}
//				model.addAttribute("masterName",StringUtils.join(masterName1, ","));
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
				String sd = sf.format(oaPlan.getStartDay());// 开始日期
				String st = oaPlan.getStartTime();
				String std = sd + " " + st;
				String et = oaPlan.getEndTime();
				try {
					Date etr = sfd.parse(et);
					model.addAttribute("startDaytime",  sfd.parse(std));
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

	}

	@RequiresPermissions("oa:mytask:mytask:view")
	@RequestMapping(value = "myup")
	public String myup(OaPlan oaPlan, Model model, OaProject oaProject, HttpServletRequest request,
			HttpServletResponse response) {
		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat sfd = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String id = request.getParameter("id");
		oaPlan = oaPlanService.get(id);
		// 当该任务没有主任务时候
		if (oaPlan.getParentId() == null) {
			String[] name = oaPlan.getActor().getId().split(",");
			if (name.length > 0) {
				String[] namei = new String[name.length];
				for (int i = 0; i < name.length; i++) {
					namei[i] = UserUtils.get(name[i]).getName();
				}
				String namee = StringUtils.join(namei, ",");
				model.addAttribute("masterName", namee);
			}
			if (oaPlan.getState().equals("2")) {
				oaProject = oaProjectService.get(oaPlan.getProjectid());
				model.addAttribute("oaProject", oaProject);
				model.addAttribute("actName", UserUtils.get(oaPlan.getCreateBy().getId()).getName());
				model.addAttribute("oaPlan", oaPlan);
				return "modules/oa/mytask/oaTasklistO";
			} else {
				List<OaProject> page = oaProjectService.findList(oaProject);
				oaProject = oaProjectService.get(oaPlan.getProjectid());
				String sd = sf.format(oaPlan.getStartDay());// 开始日期
				String st = oaPlan.getStartTime();
				String std = sd + " " + st;
				String et = oaPlan.getEndTime();
				try {
					Date str = sfd.parse(std);
					Date etr = sfd.parse(et);
					model.addAttribute("str", str);
					model.addAttribute("etr", etr);
				} catch (ParseException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				model.addAttribute("acName",UserUtils.get(oaPlan.getCreateBy().getId()).getName() );
				model.addAttribute("oaProject", oaProject);
				model.addAttribute("page", page);
				model.addAttribute("oaPlanMian", oaPlan);
				return "modules/oa/mytask/myGetTaskForm";
			}
		} else {
			OaPlan oaPlani = new OaPlan();
			oaPlani = oaPlanService.get(oaPlan.getParentId());
//			if (oaPlan.getState().equals("2")) {
//				String[] sname = oaPlan.getActor().getId().split(",");
//				if (sname.length > 0) {
//					String[] namei = new String[sname.length];
//					for (int i = 0; i < sname.length; i++) {
//						namei[i] = UserUtils.get(sname[i]).getName();
//
//					}
//
//					String namee = StringUtils.join(namei, ",");
//					model.addAttribute("name", namee);
//				}
//				oaProject = oaProjectService.get(oaPlan.getProjectid());
//				model.addAttribute("oaProject", oaProject);
//				model.addAttribute("oaPlan", oaPlan);
//				model.addAttribute("oaPlanI", oaPlani);
//				return "modules/oa/mytask/subTaskList";
//			} else {
				List<OaProject> page = oaProjectService.findList(oaProject);
				oaProject = oaProjectService.get(oaPlani.getProjectid());
				String sd = sf.format(oaPlani.getStartDay());// 开始日期
				String st = oaPlani.getStartTime();
				String std = sd + " " + st;
				String et = oaPlani.getEndTime();
				try {
					Date str = sfd.parse(std);
					Date etr = sfd.parse(et);
					model.addAttribute("strMain", str);
					model.addAttribute("etrMain", etr);
				} catch (ParseException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				String[] actNameMain = oaPlani.getActor().getId().split(",");
				if (actNameMain.length > 0) {
					String[] actNameMains = new String[actNameMain.length];
					for (int i = 0; i < actNameMain.length; i++) {
						actNameMains[i] = UserUtils.get(actNameMain[i]).getName();
					}

					String actNameMainss = StringUtils.join(actNameMains, ",");
					model.addAttribute("actNameMainsss", actNameMainss);
				}
				model.addAttribute("oaProjectMain", oaProject);
				model.addAttribute("pageMain", page);
				model.addAttribute("actNameMain", UserUtils.get(oaPlani.getCreateBy().getId()).getName());
				model.addAttribute("oaPlanMain", oaPlani);

				// 显示子任务
				String[] nameChildss = oaPlan.getActor().getId().split(",");
				if (nameChildss.length > 0) {
					String[] nameChildsss = new String[nameChildss.length];
					for (int i = 0; i < nameChildss.length; i++) {
						nameChildsss[i] = UserUtils.get(nameChildss[i]).getName();
					}

					String nameChilds = StringUtils.join(nameChildsss, ",");
					model.addAttribute("nameChilds", nameChilds);
				}
				OaProject oaProjecti = new OaProject();
				List<OaProject> pagei = oaProjectService.findList(oaProjecti);
				oaProjecti = oaProjectService.get(oaPlan.getProjectid());
				String sdsub = sf.format(oaPlan.getStartDay());// 开始日期
				String stsub = oaPlan.getStartTime();
				String stdsub = sdsub + " " + stsub;
				String etsub = oaPlan.getEndTime();
				try {
					Date strsub = sfd.parse(stdsub);
					Date etrsub = sfd.parse(etsub);
					model.addAttribute("strChilds", strsub);
					model.addAttribute("etrChilds", etrsub);
				} catch (ParseException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				model.addAttribute("oaProjectChilds", oaProjecti);
				model.addAttribute("actNameChilds", UserUtils.get(oaPlan.getCreateBy().getId()).getName());
				model.addAttribute("pagei", pagei);
				model.addAttribute("oaPlanChilds", oaPlan);
				model.addAttribute("oaPlanChildsFiles", oaPlan.getBackfiles());

				return "modules/oa/mytask/mychildTaskForm";
//			}

		}

	}

	@Autowired
	private UserFavoriteService userFavoriteService;

	// 收藏
	@RequestMapping(value = "/store", method = RequestMethod.POST)
	public String store(HttpServletRequest request, HttpServletResponse response,
			RedirectAttributes redirectAttributes) {
		String items = request.getParameter("delitem");
		String[] item = items.split(",");
		for (int i = 0; i < item.length; i++) {
			OaPlan oaPlan = oaPlanService.get(item[i]);
			String title = oaPlan.getPlanTitle();
			String type = "我的任务";
			String sign = item[i];
			String url = "/oa/a/oa/mytask/myTask/form?id=" + item[i];
			UserFavorite userFavorite = new UserFavorite();
			userFavorite.setTitle(title);// 设置收藏标题
			userFavorite.setType(type);// 设置收藏类型
			userFavorite.setUrl(url);// 设置收藏url
			userFavorite.setSign(sign);
			userFavoriteService.save(userFavorite);
		}
		return "redirect:list";
	}

	// 我收到的任务列表
	@RequestMapping(value = "mylist")
	public String mylist(OaPlan oaPlan, HttpServletRequest request, HttpServletResponse response, Model model) {
		oaPlan.setCreateBy(oaPlan.getCurrentUser());
		Page<OaPlan> pagei = oaPlanService.relist(new Page<OaPlan>(request, response), oaPlan);
		Page<OaPlan> page = oaPlanService.relist(new Page<OaPlan>(request, response), oaPlan);
		List<OaPlan> list = page.getList();
		for (int i = 0; i < list.size(); i++) {
			String uid = list.get(i).getCreateBy().getId();
			String pid = list.get(i).getProjectid().getId();
			String[] acid = list.get(i).getActor().getId().split(",");
			String[] acnme = new String[acid.length];
			for (int j = 0; j < acid.length; j++) {
				acnme[j] = UserUtils.get(acid[j]).getName();
			}
			User use = new User();
			String namee = StringUtils.join(acnme, ",");
			use.setName(namee);
			list.get(i).setActor(use);
			User createBy = UserUtils.get(uid);// 通过用户id获取用户信息
			list.get(i).setCreateBy(createBy);
			if (!pid.equals("0") & !pid.equals("")) {
				OaProject oaProject = oaProjectService.get(pid);
				list.get(i).setProjectid(oaProject);
			}
			SimpleDateFormat sfd = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			try {
				list.get(i).setEndDate(sfd.parse(list.get(i).getEndTime()));
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		Map<String, String> map = oaPlanService.cnmylist(oaPlan);// 我布置的任务
		Map<String, String> mapi = oaPlanService.recnmylist(oaPlan.getCurrentUser().getId());
//		Map<String, String> mapa = oaPlanService.mystatea(oaPlan.getCurrentUser().getId());// 进行中
		Map<String, String> mapb = oaPlanService.mystateb(oaPlan.getCurrentUser().getId());// 完成
//		Map<String, String> mapc = oaPlanService.mystatec(oaPlan.getCurrentUser().getId());// 已超期
		pagei.setList(list);
		model.addAttribute("map", map);
		model.addAttribute("mapi", mapi);
//		model.addAttribute("mapa", mapa);
		model.addAttribute("mapb", mapb);
//		model.addAttribute("mapc", mapc);
		model.addAttribute("page", pagei);
		request.getSession().setAttribute("th", "1");// 设置session
		model.addAttribute("th", 1);
		return "modules/oa/mytask/oaTaskList";

	}

	// 查询 进行中(1),完成(2),已超期(3)
	@RequestMapping(value = "taskState")
	public String taskStart(OaPlan oaPlan, HttpServletRequest request, HttpServletResponse response, Model model) {
		String th = (String) request.getSession().getAttribute("th");
		if (th == null) {
			String State = request.getParameter("State");
			oaPlan.setState(State);
			oaPlan.setCreateBy(oaPlan.getCurrentUser());
			Page<OaPlan> pagei = oaPlanService.statelist(new Page<OaPlan>(request, response), oaPlan);
			Page<OaPlan> page = oaPlanService.statelist(new Page<OaPlan>(request, response), oaPlan);
			List<OaPlan> list = page.getList();
			for (int i = 0; i < list.size(); i++) {
				String uid = list.get(i).getCreateBy().getId();
				String pid = list.get(i).getProjectid().getId();
				String[] acid = list.get(i).getActor().getId().split(",");
				String[] acnme = new String[acid.length];
				for (int j = 0; j < acid.length; j++) {
					acnme[j] = UserUtils.get(acid[j]).getName();

				}
				User use = new User();
				String namee = StringUtils.join(acnme, ",");
				use.setName(namee);
				list.get(i).setActor(use);
				User createBy = UserUtils.get(uid);// 通过用户id获取用户信息

				list.get(i).setCreateBy(createBy);
				if (!pid.equals("0") & !pid.equals("")) {
					OaProject oaProject = oaProjectService.get(pid);
					list.get(i).setProjectid(oaProject);
				}
			}
			Map<String, String> map = oaPlanService.cnmylist(oaPlan);// 我布置的任务
			Map<String, String> mapi = oaPlanService.recnmylist(oaPlan.getCurrentUser().getId());// 发布任务
			Map<String, String> mapa = oaPlanService.statea(oaPlan);// 进行中
			Map<String, String> mapb = oaPlanService.stateb(oaPlan);// 完成
			Map<String, String> mapc = oaPlanService.statec(oaPlan);// 已超期
			pagei.setList(list);
			model.addAttribute("map", map);
			model.addAttribute("mapi", mapi);
			model.addAttribute("mapa", mapa);
			model.addAttribute("mapb", mapb);
			model.addAttribute("mapc", mapc);
			model.addAttribute("page", pagei);
		} else {
			String State = request.getParameter("State");
			oaPlan.setState(State);
			oaPlan.setCruserid(oaPlan.getCurrentUser().getId());
			Page<OaPlan> pagei = oaPlanService.mystatelist(new Page<OaPlan>(request, response), oaPlan);
			Page<OaPlan> page = oaPlanService.mystatelist(new Page<OaPlan>(request, response), oaPlan);
			List<OaPlan> list = page.getList();
			for (int i = 0; i < list.size(); i++) {
				String uid = list.get(i).getCreateBy().getId();
				String pid = list.get(i).getProjectid().getId();
				String[] acid = list.get(i).getActor().getId().split(",");
				String[] acnme = new String[acid.length];
				for (int j = 0; j < acid.length; j++) {
					acnme[j] = UserUtils.get(acid[j]).getName();

				}
				User use = new User();
				String namee = StringUtils.join(acnme, ",");
				use.setName(namee);
				list.get(i).setActor(use);
				User createBy = UserUtils.get(uid);// 通过用户id获取用户信息
				list.get(i).setCreateBy(createBy);
				if (!pid.equals("0") & !pid.equals("")) {
					OaProject oaProject = oaProjectService.get(pid);
					list.get(i).setProjectid(oaProject);
				}
			}
			oaPlan.setCreateBy(oaPlan.getCurrentUser());
			Map<String, String> map = oaPlanService.cnmylist(oaPlan);// 我布置的任务
			Map<String, String> mapi = oaPlanService.recnmylist(oaPlan.getCurrentUser().getId());
			Map<String, String> mapa = oaPlanService.mystatea(oaPlan.getCurrentUser().getId());// 进行中
			Map<String, String> mapb = oaPlanService.mystateb(oaPlan.getCurrentUser().getId());// 完成
			Map<String, String> mapc = oaPlanService.mystatec(oaPlan.getCurrentUser().getId());// 已超期
			pagei.setList(list);
			model.addAttribute("map", map);
			model.addAttribute("mapi", mapi);
			model.addAttribute("mapa", mapa);
			model.addAttribute("mapb", mapb);
			model.addAttribute("mapc", mapc);
			model.addAttribute("page", pagei);
		}
		return "modules/oa/mytask/oaTaskList";

	}

	@RequestMapping(value = "/passtask", method = RequestMethod.POST)
	public void  passtask(OaPlan oaPlan, HttpServletRequest request, HttpServletResponse response, Model model,
			RedirectAttributes redirectAttributes) {

		String items = request.getParameter("delitem");
		String[] item = items.split(",");
		int j;
		List<OaPlan> listplan=new ArrayList<OaPlan>();
		for (int i = 0; i < item.length; i++) {
			OaPlan oa=oaPlanService.get(item[i]);
			if(oa.getFactTime()!=null){
				listplan.add(oa);
			}
		}
		if(listplan.size()>0){
			j=1;
		}else{
			for (int i = 0; i < item.length; i++) {
			oaPlan.setFactTime(new Date());
			oaPlan.setId(item[i]);
			oaPlanService.up(oaPlan);
			}
			j=2;
		}
		PrintWriter writer;
		try {
			writer = response.getWriter();
			writer.print(j);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@RequestMapping(value = "/subform")
	public String subform(OaPlan oaPlan, OaProject oaProject, HttpServletRequest request, HttpServletResponse response,
			Model model, RedirectAttributes redirectAttributes) {
		String items = request.getParameter("delitem");

		oaPlan = oaPlanService.get(items);
		if (oaPlan.getState().equals("2")) {
			addMessage(redirectAttributes, "该任务已完结不能编辑子任务");
			return "redirect:" + Global.getAdminPath() + "/oa/mytask/myTask/?repage";
		} else if (oaPlan.getState().equals("2") && oaPlan.getState().equals("3")) {
			addMessage(redirectAttributes, "该任务已完结不能编辑子任务");
			return "redirect:" + Global.getAdminPath() + "/oa/mytask/myTask/?repage";
		} else {
			oaProject = oaProjectService.get(oaPlan.getProjectid());
			model.addAttribute("oaProject", oaProject);
			SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
			SimpleDateFormat sfd = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			oaPlan.setActName(UserUtils.get(oaPlan.getCreateBy().getId()).getName());
			String sd = sf.format(oaPlan.getStartDay());// 开始日期
			String st = oaPlan.getStartTime() ;
			String std = sd + " " + st;
			String et = oaPlan.getEndTime();
				try {
					Date str = sfd.parse(std);
					Date etr = sfd.parse(et);
					model.addAttribute("str", str);
					model.addAttribute("etr", etr);
				} catch (ParseException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				String[] acid =oaPlan.getActor().getId().split(",");
				String[] acnme = new String[acid.length];
				for (int j = 0; j < acid.length; j++) {
					acnme[j] = UserUtils.get(acid[j]).getName();

				}
				String namee = StringUtils.join(acnme, ",");
				model.addAttribute("namee", namee);
				model.addAttribute("acName", 	 UserUtils.get(oaPlan.getCreateBy().getId()).getName());
				String flag= request.getParameter("flag");
				String view=null;
			if(flag.equals("1")){
				model.addAttribute("oaPlan", oaPlan);
				model.addAttribute("remarks", oaPlan.getRemarks());
				view="modules/oa/mytask/replytaskForm";//进入回复页面
			}else{
				model.addAttribute("oaPlanForm", oaPlan);
				view="modules/oa/mytask/subTaskForm";
			}
			return view;
		}

	}

	/**
	 * 
	 * 接受的人不能更改只能保存意见
	 */
	@RequestMapping(value = "UpTaksRemarks")
	public String UpTaksRemarks(OaPlan oaPlan, OaProject oaProject, HttpServletRequest request,
			HttpServletResponse response, Model model, RedirectAttributes redirectAttributes, String reid,String flag,String remarks) {
		if(flag.equals("1")){
			//保存任务反馈
			oaPlan.setId(reid);
			oaPlan.setRemarks(remarks);
			oaPlanService.UpTaksRemarks(oaPlan);
			addMessage(redirectAttributes, "回复此任务成功");
			
		}else{
			//办结任务
			oaPlan.setFactTime(new Date());
			oaPlan.setId(reid);
			oaPlan.setRemarks(remarks);
			oaPlanService.up(oaPlan);
			addMessage(redirectAttributes, "办结此任务成功");
		}
		return "redirect:" + Global.getAdminPath() + "/oa/mytask/myTask/mylist?repage";

	}

//	/**
//	 * 
//	 * 接受的人接受带有子任务的任务不能更改只能保存意见
//	 */
//	@RequestMapping(value = "childUpTaksRemarks")
//	public String childUpTaksRemarks(OaPlan oaPlan, OaProject oaProject, HttpServletRequest request,
//			HttpServletResponse response, Model model, RedirectAttributes redirectAttributes, String reid) {
//		oaPlan.setId(reid);
//		oaPlanService.UpTaksRemarks(oaPlan);
//		addMessage(redirectAttributes, "保存子任务反馈成功");
//		return "redirect:" + Global.getAdminPath() + "/oa/mytask/myTask/?repage";
//
//	}

}
