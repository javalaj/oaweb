package com.thinkgem.jeesite.mobile.modules.user.web.userWorkPlan;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import java.math.BigDecimal;
import java.math.MathContext;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.activiti.engine.task.Task;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.utils.DateUtils;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.act.service.ActTaskService;
import com.thinkgem.jeesite.modules.oa.actRouting.ActRouting;
import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.modules.sys.service.OfficeService;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;
import com.thinkgem.jeesite.modules.user.entity.UserMonthrecord;
import com.thinkgem.jeesite.modules.user.entity.UserMonthsum;
import com.thinkgem.jeesite.modules.user.entity.UserWeekplan;
import com.thinkgem.jeesite.modules.user.entity.UserWeekrecord;
import com.thinkgem.jeesite.modules.user.entity.UserWorkrecord;
import com.thinkgem.jeesite.modules.user.service.UserWeekplanService;
import com.thinkgem.jeesite.modules.user.service.UserWeekrecordService;
/**
 *周计划Controller
 * 
 * @author cz
 * @version 2017-05-10
 */
@Controller
@RequestMapping(value = "${adminPath}${mobilePath}/user/userWeekplan")
public class userWorkPlanControllerMobile extends BaseController {
		@Autowired
		private UserWeekplanService userWeekplanService;
		@Autowired
		private UserWeekrecordService userWeekrecordService;
		private OfficeService officeService;
		@Autowired

		@ModelAttribute
		public UserWeekplan get(@RequestParam(required = false) String id) {
			UserWeekplan entity = null;
			if (StringUtils.isNotBlank(id)) {
				entity = userWeekplanService.get(id);
			}
			if (entity == null) {
				entity = new UserWeekplan();
			}
			return entity;
		}

		@RequestMapping(value = "delete")
		public String deleteuserWorkrecord(UserWeekrecord userWeekrecord, String[] id, Model model,
				RedirectAttributes redirectAttributes, UserWeekplan userWeekplan) {
			if (id.length != 0) {
				for (int i = 0; i < id.length; i++) {
					userWeekrecord.setId(id[i]);
					userWeekrecordService.delete(userWeekrecord);
					UserWeekrecord u = userWeekrecordService.get(userWeekrecord);
					userWeekrecordService.getweekPlanList(u);
					if(userWeekrecordService.getweekPlanList(u).size()==1){
					userWeekplan.setId(u.getWeekplanId());
					userWeekplanService.delete(userWeekplan);}
				}
			}

			return "redirect:" + Global.getAdminPath() + "/user/userWeekplan/?repage";
		}

		/**
		 * 
		 * 查询周计划，月度总结，判断是否为第一周，判断是否为新的一周
		 */
		@RequiresPermissions("sys:user:userWorklog:view")
		@RequestMapping(value = { "form", "" })
		public String form(UserWeekplan userWeekplan, UserWeekrecord userWeekrecord, UserMonthsum userMonthsum,
				UserMonthrecord userMonthrecord, Date plandate, Model model) {
			// 开始判断是否要新创建，提供周计划页面表单
			// boolean canUpdate = false;// 能否更新数据
			String canUpdateStr = null;// 能否更新数据的日期
			boolean canInsert = false;// 能够创建新数据
			Calendar c = Calendar.getInstance();// 获得今天的日期
			userWeekplan.setCreateBy(UserUtils.getUser());
			// 星期五 6、星期六 7、星期天 1、 可以写下一周的计划
			// 星期一（2） 到 星期四（5）可以写本周的计划
			// if (c.get(Calendar.DAY_OF_WEEK) == 1 || c.get(Calendar.DAY_OF_WEEK)
			// == 6 || c.get(Calendar.DAY_OF_WEEK) == 7) {
			// 可以写下一周的计划
			// 并且自动控制周一的日期
			userWeekplan.setFirstdate(initFirstdate());
			UserWeekplan newUserWeekplan = null;
			if (userWeekplanService.findCountByPlandate(userWeekplan) == 0) {
				newUserWeekplan = new UserWeekplan();
				// 未创建过下周计划
				canInsert = true;
				// canUpdate = true;
				Calendar cc = Calendar.getInstance();
				cc.setTime(userWeekplan.getFirstdate());
				newUserWeekplan.setFirstdate(userWeekplan.getFirstdate());
				newUserWeekplan.setWeeksign(getWeeksign(cc.get(Calendar.DAY_OF_MONTH)));// 新的日期标志
				cc.set(Calendar.DAY_OF_MONTH, 1);
				newUserWeekplan.setPlandate(cc.getTime());
			} else {
				// 已经创建过下周计划
				canInsert = false;
				// 可以修改，其次通过是否为草稿控制
				// canUpdate = true;
				// 可以修改的日期，其次通过是否为草稿控制
				canUpdateStr = userWeekplan.getFirstdate().getTime() + "";
			}
			// }
			// 开始查询
			c.set(c.get(Calendar.YEAR), c.get(Calendar.MONTH), 1, 0, 0, 0);
			Date today = c.getTime();
			if (plandate != null) {
				c.setTime(plandate);
			}
			c.set(c.get(Calendar.YEAR), c.get(Calendar.MONTH), 1, 0, 0, 0);
			userWeekplan.setPlandate(c.getTime());// 设置查询日期
			List<UserWeekplan> list1 = userWeekplanService.findList(userWeekplan);
			List<List<UserWeekrecord>> list2 = new ArrayList<List<UserWeekrecord>>();
			for (UserWeekplan userweekplan : list1) {
				userWeekrecord.setWeekplanId(userweekplan.getId());
				list2.add(userWeekrecordService.findList(userWeekrecord));
			}
			model.addAttribute("newUserWeekplan", newUserWeekplan);
			model.addAttribute("list1", list1);
			model.addAttribute("list2", list2);
			model.addAttribute("canUpdateStr", canUpdateStr);
			model.addAttribute("canInsert", canInsert);
			//
			model.addAttribute("plandate", c.getTime());
			model.addAttribute("isToday", isToday(c.getTime(), today));
			return "mobile/modules/user/userWorkPlan/userWorkPlanList";
		}
		@RequestMapping(value = { "newform", "" })
		public String newform(UserWeekplan userWeekplan, UserWeekrecord userWeekrecord, UserMonthsum userMonthsum,
				UserMonthrecord userMonthrecord, Date plandate, Model model) {
			// 开始判断是否要新创建，提供周计划页面表单
			// boolean canUpdate = false;// 能否更新数据
			String canUpdateStr = null;// 能否更新数据的日期
			boolean canInsert = false;// 能够创建新数据
			Calendar c = Calendar.getInstance();// 获得今天的日期
			userWeekplan.setCreateBy(UserUtils.getUser());
			// 星期五 6、星期六 7、星期天 1、 可以写下一周的计划
			// 星期一（2） 到 星期四（5）可以写本周的计划
			// if (c.get(Calendar.DAY_OF_WEEK) == 1 || c.get(Calendar.DAY_OF_WEEK)
			// == 6 || c.get(Calendar.DAY_OF_WEEK) == 7) {
			// 可以写下一周的计划
			// 并且自动控制周一的日期
			userWeekplan.setFirstdate(initFirstdate());
			UserWeekplan newUserWeekplan = null;
			if (userWeekplanService.findCountByPlandate(userWeekplan) == 0) {
				newUserWeekplan = new UserWeekplan();
				// 未创建过下周计划
				canInsert = true;
				// canUpdate = true;
				Calendar cc = Calendar.getInstance();
				cc.setTime(userWeekplan.getFirstdate());
				newUserWeekplan.setFirstdate(userWeekplan.getFirstdate());
				newUserWeekplan.setWeeksign(getWeeksign(cc.get(Calendar.DAY_OF_MONTH)));// 新的日期标志
				cc.set(Calendar.DAY_OF_MONTH, 1);
				newUserWeekplan.setPlandate(cc.getTime());
			} else {
				// 已经创建过下周计划
				canInsert = false;
				// 可以修改，其次通过是否为草稿控制
				// canUpdate = true;
				// 可以修改的日期，其次通过是否为草稿控制
				canUpdateStr = userWeekplan.getFirstdate().getTime() + "";
			}
			// 开始查询
			c.set(c.get(Calendar.YEAR), c.get(Calendar.MONTH), 1, 0, 0, 0);
			Date today = c.getTime();
			if (plandate != null) {
				c.setTime(plandate);
			}
			c.set(c.get(Calendar.YEAR), c.get(Calendar.MONTH), 1, 0, 0, 0);
			userWeekplan.setPlandate(c.getTime());// 设置查询日期
			List<UserWeekplan> list1 = userWeekplanService.findList(userWeekplan);
			List<List<UserWeekrecord>> list2 = new ArrayList<List<UserWeekrecord>>();
			for (UserWeekplan userweekplan : list1) {
				userWeekrecord.setWeekplanId(userweekplan.getId());
				list2.add(userWeekrecordService.findList(userWeekrecord));
			}
			model.addAttribute("newUserWeekplan", newUserWeekplan);
			model.addAttribute("list1", list1);
			model.addAttribute("list2", list2);
			model.addAttribute("canUpdateStr", canUpdateStr);
			model.addAttribute("canInsert", canInsert);
			//
			model.addAttribute("plandate", c.getTime());
			model.addAttribute("isToday", isToday(c.getTime(), today));
			return "mobile/modules/user/userWorkPlan/userWorkPlanForm";
		}
		//周计划编辑
		@RequestMapping(value = "editor")
		public String editor(String id, String wrid, Model model,
				RedirectAttributes redirectAttributes, UserWeekplan userWeekplan, UserWeekrecord userWeekrecord) {
			userWeekrecord=userWeekrecordService.get(id);
			userWeekplan.setId(userWeekrecord.getWeekplanId());
		UserWeekplan list1 = userWeekplanService.get(userWeekplan);
			model.addAttribute("list1", list1);
			model.addAttribute("now", userWeekrecord);
			model.addAttribute("canInsert", false);
			if(userWeekplanService.get(userWeekplan).getIsdraft().equals("0")){
				model.addAttribute("Isdraft", 0);
			}else{
				model.addAttribute("Isdraft", 1);
			}
			return "mobile/modules/user/userWorkPlan/userWorkPlanFormEditor";
			
		}
		
		
		
		
		@Autowired
		ActTaskService actTaskService;

		/** 循环保存，提交页面周计划多条记录 */
		@RequiresPermissions("sys:user:userWorklog:edit")
		@RequestMapping(value = "save")
		public String save(String id, String isdraft, Date plandate, String weeksign, Date firstdate, String[] wrid,
				String[] beginday, String[] endday, String[] content, String[] delFlag, String[] deliverables, Model model,
				RedirectAttributes redirectAttributes, UserWeekplan userWeekplan, UserWeekrecord userWeekrecord) {
			userWeekplan.setId(id);
			userWeekplan.setIsdraft(isdraft);
			userWeekplan.setPlandate(plandate);
			userWeekplan.setWeeksign(weeksign);
			userWeekplan.setDelFlag("0");
			userWeekplan.setFirstdate(firstdate);
			userWeekplanService.save(userWeekplan);
			if (delFlag != null) {
				if (userWeekplan.getIsdraft().equals("1")) {
					UUID uuid = UUID.randomUUID();
					String communid = uuid.toString();
					for (int i = 0; i < delFlag.length; i++) {
						User currentUser = userWeekplan.getCurrentUser();
						String processDefinitionKey = "WeeklyPlan";// 流程key
						Map<String, Object> variables = new HashMap<String, Object>();
						variables.put("apply", currentUser.getLoginName());
						String use = UserUtils.get(currentUser.getOffice().getPrimaryPerson().getId()).getLoginName();
						variables.put("applyUserIds", ActRouting.getUpper(UserUtils.getUser().getId()));
						variables.put("communid", communid);
						if (StringUtils.isBlank(userWeekrecord.getProcInsId())) {
							// 流程关联id为null所以为第一次创建
							userWeekrecord.setProcInsId(actTaskService
									.startProcess(processDefinitionKey, "user_weekrecord", userWeekrecord.getId(),
											"【" + userWeekplan.getCurrentUser().getOffice().getName() + " "
													+ currentUser.getName() + "】周计划【" + DateUtils.getDate() + "】",
											variables));
							// 线程暂停两秒，使得流程流转信息排序正确，防止开始和申请排序颠倒
							try {
								Thread.sleep(2000);
							} catch (InterruptedException e) {
								e.printStackTrace();
							}
							// 执行下一步
							List<Task> list = actTaskService.getProcessEngine().getTaskService().createTaskQuery()
									.taskAssignee(UserUtils.getUser().getLoginName())
									.processInstanceId(userWeekrecord.getProcInsId()).list();
							if (list.size() > 0) {
								actTaskService.complete(list.get(0).getId(), userWeekrecord.getProcInsId(), "【申请】", null,
										variables);
							}
						}
						if (!(delFlag[i].equals("1") && wrid[i].equals("null"))) {
							// 非新创建删除的
							if (wrid[i].equals("null")) {
								wrid[i] = "";
							}
							userWeekrecord.setCommonid(communid);
							userWeekrecord.setId(wrid[i]);
							userWeekrecord.setBeginday(beginday[i]);
							userWeekrecord.setEndday(endday[i]);
							if (content.length == 0) {
								userWeekrecord.setContent("");
							} else {
								userWeekrecord.setContent(content[i]);
							}
							if (deliverables.length == 0) {
								userWeekrecord.setDeliverables("");
							} else {
								userWeekrecord.setDeliverables(deliverables[i]);
							}
							userWeekrecord.setDelFlag(delFlag[i]);
							userWeekrecord.setWeekplanId(userWeekplan.getId());
							userWeekrecordService.save(userWeekrecord);
						}
					}

				} else {
					for (int i = 0; i < delFlag.length; i++) {
						if (!(delFlag[i].equals("1") && wrid[i].equals("null"))) {
							// 非新创建删除的
							if (wrid[i].equals("null")) {
								wrid[i] = "";
							}
							userWeekrecord.setId(wrid[i]);
							userWeekrecord.setBeginday(beginday[i]);
							userWeekrecord.setEndday(endday[i]);
							if (content.length == 0) {
								userWeekrecord.setContent("");
							} else {
								userWeekrecord.setContent(content[i]);
							}
							if (deliverables.length == 0) {
								userWeekrecord.setDeliverables("");
							} else {
								userWeekrecord.setDeliverables(deliverables[i]);
							}
							userWeekrecord.setDelFlag(delFlag[i]);
							userWeekrecord.setWeekplanId(userWeekplan.getId());
							userWeekrecordService.save(userWeekrecord);
						}
					}

				}

			}

			return "redirect:" + Global.getAdminPath() + Global.getMobilePath() +  "/user/userWeekplan/form";

		}

		// 上级领导审核
		@RequestMapping(value = "viewMonthsum")
		public String view(String sameid, UserMonthsum userMonthsum, UserWeekrecord userWeekrecord,
				UserMonthrecord userMonthrecord, UserWeekplan userWeekplan, Model model,
				RedirectAttributes redirectAttributes, Date begindate, Date enddate, String otherUserId,
				HttpServletRequest request, HttpServletResponse response, UserWorkrecord userWorkrecord,
				String otherUserName) {

			List<UserWeekrecord> listOaEnter = userWeekrecordService.comList(sameid);
			userWeekplan = userWeekplanService.get(userWeekrecordService.comList(sameid).get(0).getWeekplanId());

			String name = UserUtils.get(userWeekplan.getCreateBy().getId()).getName();
			String officeName = userWeekplan.getCurrentUser().getOffice().getName();
			model.addAttribute("userWeekplan",
					userWeekplanService.get(userWeekrecordService.comList(sameid).get(0).getWeekplanId()));
			model.addAttribute("name", name);
			model.addAttribute("officeName", officeName);
			model.addAttribute("userWeekrecord", listOaEnter);

			String view = "mobile/modules/user/userWorkPlan/userWeekPlanChieView";// 默认去查看页面
			if (userWeekrecordService.isDeal(listOaEnter.get(0))) {
				view = "mobile/modules/user/userWorkPlan/userWeekPlanChiefFrom";// 有权限的人去审核页面
			}
//			String a = UserUtils.get(userWeekrecord.getCurrentUser().getId()).getOffice().getParentId();
//			String ofName = officeService.get(a).getName();
//			if (ofName.equals("研发部")) {
//				model.addAttribute("turneddownFlag", "1");
//			} else {
//				model.addAttribute("turneddownFlag", "2");
//			}

			addTask(model, listOaEnter.get(0));
			return view;
		}

		// 打分
		@RequestMapping(value = "supSave")
		public String supSave(String sameid, UserMonthsum userMonthsum, UserWeekrecord userWeekrecord,
				UserMonthrecord userMonthrecord, UserWeekplan userWeekplan, Model model,
				RedirectAttributes redirectAttributes, Date begindate, Date enddate, String otherUserId,
				HttpServletRequest request, HttpServletResponse response, UserWorkrecord userWorkrecord,
				String otherUserName, String[] wekid, String[] important, String[] schedule) {
			for (int i = 0; i < wekid.length; i++) {
				UserWeekrecord userweekrecord = userWeekrecordService.get(wekid[i]);
				Map<String, Object> vars = new HashMap<String, Object>();
				String examtext = "通过";
				List<Task> list = actTaskService.getProcessEngine().getTaskService().createTaskQuery()
						.taskAssignee(UserUtils.getUser().getLoginName()).processInstanceId(userweekrecord.getProcInsId())
						.list();
				if (list.size() > 0) {
					actTaskService.complete(list.get(0).getId(), userweekrecord.getProcInsId(), examtext, null, vars);
				}
				userWeekrecord.setId(wekid[i]);
				userWeekrecord.setImportant(important[i]);
				userWeekrecord.setSchedule(schedule[i]);
				userWeekrecord.setProcinsFlag("1");// 记录本周审核完成
				userWeekrecordService.upweek(userWeekrecord);
			}
			return "redirect:" + Global.getAdminPath() + Global.getMobilePath() +"/act/task/historic/?repage";
		}

		@RequestMapping(value = "supView")
		public String supView(String sameid, UserMonthsum userMonthsum, UserWeekrecord userWeekrecord,
				UserMonthrecord userMonthrecord, UserWeekplan userWeekplan, Model model,
				RedirectAttributes redirectAttributes, Date begindate, Date enddate, String otherUserId,
				HttpServletRequest request, HttpServletResponse response, UserWorkrecord userWorkrecord) {
			userWeekplan = userWeekplanService.get(userWeekrecordService.comList(sameid).get(0).getWeekplanId());
			String name = UserUtils.get(userWeekplan.getCreateBy().getId()).getName();
			String officeName = userWeekplan.getCurrentUser().getOffice().getName();
			model.addAttribute("userWeekplan",
					userWeekplanService.get(userWeekrecordService.comList(sameid).get(0).getWeekplanId()));
			model.addAttribute("name", name);
			model.addAttribute("officeName", officeName);
			model.addAttribute("userWeekrecord", userWeekrecordService.comList(sameid));
			model.addAttribute("userWeekrecords", userWeekrecordService.comList(sameid).get(0));

			addTask(model, userWeekrecordService.comList(sameid).get(0));
			addHistory(userWeekrecordService.comList(sameid).get(0).getProcInsId(), model);// 装载流转信息
			return "mobile/modules/user/userWorkPlan/userWeekPlanChieView";
		}

		/** 加入工作台对象，用于显示流程图 */
		private void addTask(Model model, UserWeekrecord userWeekrecord) {
			// 如果流程已启动，给出流程图

			if (userWeekrecord.getProcInsId() != null
					&& userWeekrecordService.getTaskByProcInsId(userWeekrecord.getProcInsId()) != null) {
				model.addAttribute("task", userWeekrecordService.getTaskByProcInsId(userWeekrecord.getProcInsId()));
			}
		}
		/**
		 * 查找并且装载，流程流转信息
		 */
		public void addHistory(String procInsId, Model model) {
			if (StringUtils.isNotBlank(procInsId)) {
				// List<Act> temp=actTaskService.histoicFlowList(procInsId, null,
				// null);
				model.addAttribute("historys", actTaskService.histoicFlowList(procInsId, null, null));
			}
		}

		/**
		 * 得到本周的标志值12345
		 */
		private String getWeeksign(int day) {
			String weeksign;
			if (day % 7 == 0) {
				weeksign = (day / 7) + "";
			} else {
				weeksign = (day / 7 + 1) + "";
			}
			return weeksign;
		}

		/**
		 * 获取周一的日期
		 */
		private Date initFirstdate() {
			Calendar c = Calendar.getInstance();
			Date date = null;
			c.set(c.get(Calendar.YEAR), c.get(Calendar.MONTH), c.get(Calendar.DAY_OF_MONTH), 0, 0, 0);
			c.set(Calendar.MILLISECOND, 0);
			switch (c.get(Calendar.DAY_OF_WEEK)) {
			case 6:// 星期五
				date = new Date(c.getTime().getTime() + 3 * 86400000);
				break;
			case 7:// 星期六
				date = new Date(c.getTime().getTime() + 2 * 86400000);
				break;
			case 1:// 星期天
				date = new Date(c.getTime().getTime() + 1 * 86400000);
				break;
			case 2:// 星期一
				date = new Date(c.getTime().getTime() + 0 * 86400000);
				break;
			case 3:// 星期二
				date = new Date(c.getTime().getTime() - 1 * 86400000);
				break;
			case 4:// 星期三
				date = new Date(c.getTime().getTime() - 2 * 86400000);
				break;
			case 5:// 星期四
				date = new Date(c.getTime().getTime() - 3 * 86400000);
				break;
			}
			return date;
		}

		/**
		 * 判断是否为今天
		 */
		private boolean isToday(Date queryDate, Date today) {
			if (queryDate.toString().equals(today.toString())) {
				return true;
			}
			return false;
		}



}
