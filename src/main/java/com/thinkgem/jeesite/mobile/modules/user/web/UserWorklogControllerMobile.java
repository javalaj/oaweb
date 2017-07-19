/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.mobile.modules.user.web;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.Iterator;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.mobile.modules.user.entity.UserWorklogJson;
import com.thinkgem.jeesite.modules.sys.entity.Office;
import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.modules.sys.service.OfficeService;
import com.thinkgem.jeesite.modules.sys.service.SystemService;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;
import com.thinkgem.jeesite.modules.user.entity.UserWorklog;
import com.thinkgem.jeesite.modules.user.entity.UserWorkrecord;
import com.thinkgem.jeesite.modules.user.service.UserWorklogService;
import com.thinkgem.jeesite.modules.user.service.UserWorkrecordService;

/**
 * 我的日志整体外部，不包含工作记录细节Controller
 * 
 * @author liuxin
 * @version 2017-1-10
 */
@Controller
@RequestMapping(value = "${adminPath}${mobilePath}/user/userWorklog")
public class UserWorklogControllerMobile extends BaseController {

	@Autowired
	private UserWorklogService userWorklogService;
	@Autowired
	private UserWorkrecordService userWorkrecordService;
	@Autowired
	private SystemService systemService;
	@Autowired
	private OfficeService officeService;

	@ModelAttribute
	public UserWorklog get(@RequestParam(required = false) String id) {
		UserWorklog entity = null;
		if (StringUtils.isNotBlank(id)) {
			entity = userWorklogService.get(id);
		}
		if (entity == null) {
			entity = new UserWorklog();
		}
		return entity;
	}

	// /**
	// *
	// * 未解决的问题，改变为已解决
	// *
	// */
	// @RequiresPermissions("sys:user:userWorklog:edit")
	// @RequestMapping(value = "done")
	// public String done(String uwlid, String uwrid) {
	// userWorkrecordService.done(uwrid);
	// return "redirect:" + Global.getAdminPath() +
	// "/mobile/user/userWorklog/form?repage&id=" + uwlid;
	// }
	//
	// /**
	// * 查看他人日志，并且对未提交的人员以红色名字处理
	// */
	// @RequiresPermissions("log:logWorklogOtherList:edit")
	// @RequestMapping(value = "seeOtherList")
	// public String seeOtherList(Date begindate, Date enddate, String
	// otherUserId, Model model,
	// HttpServletRequest request, HttpServletResponse response, UserWorkrecord
	// userWorkrecord,
	// UserWorklog userWorklog, String otherUserName) {
	// if (otherUserId == null || otherUserId.trim().equals("")) {
	// otherUserId = UserUtils.getPrincipal().getId();
	// }
	// // 获取查询条件，查询出用户名，用户的日志，以及日志具体内容
	// Page<UserWorklog> inpage = new Page<UserWorklog>(request, response);
	// inpage.setOrderBy("a.workdate DESC");
	// userWorklog.setCreateBy(UserUtils.get(otherUserId));
	//
	// Calendar endc = Calendar.getInstance();
	// // endc.set(endc.get(Calendar.YEAR), endc.get(Calendar.MONTH),
	// // endc.get(Calendar.DAY_OF_MONTH), 0, 0, 0);
	// // endc.set(Calendar.MILLISECOND, 0);
	// userWorklog.setEnd(endc.getTime());
	//
	// Page<UserWorklog> page = userWorklogService.findPage(inpage,
	// userWorklog);
	// List<List<UserWorkrecord>> userWorkrecords = new
	// ArrayList<List<UserWorkrecord>>();
	// for (UserWorklog userWorklog2 : page.getList()) {
	// userWorkrecord.setWorklogId(userWorklog2.getId());
	// userWorkrecords.add(userWorkrecordService.findList(userWorkrecord));
	// }
	// // model.addAttribute("otherUserName",
	// // UserUtils.get(otherUserId).getName());
	// model.addAttribute("page", page);
	// model.addAttribute("userWorkrecords", userWorkrecords);
	// // 查询部门
	// List<Office> offices =
	// officeService.findChildList(UserUtils.getUser().getOffice());
	// model.addAttribute("offices", offices);
	// // 依据部门，查询人员结构
	// List<List<User>> users = new ArrayList<List<User>>();
	// List<List<Integer>> submits = new ArrayList<List<Integer>>();
	// Calendar c = Calendar.getInstance();
	// // 若今天为星期一，则 查看上个星期五的
	// long endTime = 0l;
	// if (c.get(Calendar.DAY_OF_WEEK) == 2) {
	// // 星期一 则查看上个星期五
	// c.setTimeInMillis(c.getTime().getTime() - 86400000 * 3);
	// endTime = 86400000 * 2l;
	// } else {
	// c.setTimeInMillis(c.getTime().getTime() - 86400000);
	// endTime = 0l;
	// }
	// // 日清日结查询代码
	// c.set(c.get(Calendar.YEAR), c.get(Calendar.MONTH),
	// c.get(Calendar.DAY_OF_MONTH), 0, 0, 0);
	// Date workdate = c.getTime();
	// Date end = new Date(workdate.getTime() + 117000000 + endTime);// 第二天的
	// // 8:30
	// // 9:30 120600000
	// // 8:30 1170000000
	// for (Office office : offices) {
	// List<User> usersTemp = new ArrayList<User>();
	// List<Integer> submitsTemp = new ArrayList<Integer>();
	// usersTemp = systemService.findUserByOfficeId(office.getId());
	// users.add(usersTemp);
	// for (User user : usersTemp) {
	// // 查询出人员是否提交日志
	// submitsTemp.add(userWorklogService.findUserWorklogSubmit(user.getId(),
	// workdate, "1", workdate, end));
	// }
	// submits.add(submitsTemp);
	// }
	// model.addAttribute("resultdate", workdate);
	// model.addAttribute("submits", submits);
	// model.addAttribute("users", users);
	// model.addAttribute("begindate", begindate);
	// model.addAttribute("enddate", enddate);
	// model.addAttribute("otherUserId", otherUserId);
	// if (StringUtils.isBlank(otherUserName)) {
	// otherUserName = UserUtils.getUser().getName();
	// }
	// model.addAttribute("otherUserName", otherUserName);
	// return "mobile/modules/user/seeOtherWorklogList";
	// }

	/**
	 * 获取日志初略信息列表
	 */
	@RequiresPermissions("sys:user:userWorklog:view")
	@RequestMapping(value = { "list", "" })
	public String list(UserWorklog userWorklog, String pageNo1, String pageSize1, String pageNo2, String pageSize2,
			Model model, UserWorkrecord userWorkrecord, String flag, Date begindate, Date enddate, String result) {

		model.addAttribute("begindate", begindate);
		model.addAttribute("enddate", enddate);

		/* flag 0:我的日志翻页，1：他人日志翻页 */
		if (pageNo1 == null) {
			pageNo1 = "0";
			pageNo2 = "0";
			pageSize1 = "30";
			pageSize2 = "30";
			flag = "0";
		}
		/* 拿到个人日志填充 */
		Page<UserWorklog> inpage = new Page<UserWorklog>(Integer.parseInt(pageNo1), Integer.parseInt(pageSize1));
		userWorklog.setCreateBy(UserUtils.getUser());
		Page<UserWorklog> page = userWorklogService.findPage(inpage, userWorklog);
		model.addAttribute("page", page);
		List<List<UserWorkrecord>> userWorkrecords = new ArrayList<List<UserWorkrecord>>();
		for (UserWorklog userWorklog2 : page.getList()) {
			userWorkrecord.setWorklogId(userWorklog2.getId());
			userWorkrecords.add(userWorkrecordService.findList(userWorkrecord));
		}
		model.addAttribute("userWorkrecords", userWorkrecords);
		/* 填充他人日志 */
		/**/
		// 查询部门
		List<Office> offices = officeService.findChildList(UserUtils.getUser().getOffice());
		// model.addAttribute("offices", offices);
		// 依据部门，获取人员信息
		// List<List<User>> users = new ArrayList<List<User>>();
		StringBuilder users = new StringBuilder();
		users.append("(");
		for (Office office : offices) {
			for (User user : systemService.findUserByOfficeId(office.getId())) {
				users.append("\'");
				users.append(user.getId());
				users.append("\',");
			}
		}
		users.delete(users.length() - 1, users.length());
		users.append(")");
		// 时间，人，未删除，提交,end
		Calendar c0 = Calendar.getInstance();
		Calendar c1 = Calendar.getInstance();
		if (c0.get(Calendar.DAY_OF_WEEK) == 2) {
			// 星期一 则查看上个星期五
			c1.setTimeInMillis(c0.getTimeInMillis() - 86400000L * 3);
		} else {
			c1.setTimeInMillis(c0.getTimeInMillis() - 86400000L);
		}
		c1.set(c1.get(Calendar.YEAR), c1.get(Calendar.MONTH), c1.get(Calendar.DAY_OF_MONTH), 0, 0, 0);
		c1.set(Calendar.MILLISECOND, 0);
		// System.err.println(users.toString());
		userWorklog.setEnd(c0.getTime());
		userWorklog.setIsdraft("1");
		userWorklog.setWorkdate(c1.getTime());
		userWorklog.setUsers(users.toString());
		Page<UserWorklog> inpage2 = new Page<UserWorklog>(Integer.parseInt(pageNo2), Integer.parseInt(pageSize2));
		Page<UserWorklog> page2 = userWorklogService.getOtherLogList(inpage2, userWorklog);
		model.addAttribute("page2", page2);
		List<List<UserWorkrecord>> userWorkrecords2 = new ArrayList<List<UserWorkrecord>>();
		for (UserWorklog userWorklog3 : page2.getList()) {
			userWorkrecord.setWorklogId(userWorklog3.getId());
			userWorkrecords2.add(userWorkrecordService.findList(userWorkrecord));
		}
		model.addAttribute("userWorkrecords2", userWorkrecords2);
		model.addAttribute("flag", flag);
		model.addAttribute("result", result);
		return "mobile/modules/user/userWorklogList";
	}

	/**
	 * 条件查询页面
	 *
	 * liuxin
	 */
	@RequiresPermissions("sys:user:userWorklog:view")
	@RequestMapping(value = { "listByDate" })
	public String listByDate(UserWorklog userWorklog, Date begindate, Date enddate, HttpServletRequest request,
			HttpServletResponse response, Model model, UserWorkrecord userWorkrecord) {
		Page<UserWorklog> inpage = new Page<UserWorklog>(request, response);
		userWorklog.setCreateBy(UserUtils.getUser());
		Page<UserWorklog> page = userWorklogService.findPage(inpage, userWorklog);
		model.addAttribute("page", page);
		List<List<UserWorkrecord>> userWorkrecords = new ArrayList<List<UserWorkrecord>>();
		for (UserWorklog userWorklog2 : page.getList()) {
			userWorkrecord.setWorklogId(userWorklog2.getId());
			userWorkrecords.add(userWorkrecordService.findList(userWorkrecord));
		}
		model.addAttribute("userWorkrecords", userWorkrecords);
		model.addAttribute("begindate", begindate);
		model.addAttribute("enddate", enddate);
		return "mobile/modules/user/userWorklogList";
	}

	/**
	 * 修改提交
	 */
	@RequiresPermissions("sys:user:userWorklog:view")
	@RequestMapping(value = "form")
	public String form(UserWorklog userWorklog, UserWorkrecord userWorkrecord, Model model) {
		userWorkrecord.setWorklogId(userWorklog.getId());
		List<UserWorkrecord> list = userWorkrecordService.findList(userWorkrecord);
		userWorklogService.get(userWorklog);
		model.addAttribute("userWorkrecords", list);
		model.addAttribute("userWorklog", userWorklog);
		if (StringUtils.isNotBlank(userWorklog.getId()) && userWorklog.getIsdraft().equals("1")) {
			// 日志有id 且为已提交状态
			return "mobile/modules/user/userWorklogView";
		}
		return "mobile/modules/user/userWorklogForm";
	}

	/**
	 * 循环保存页面多条记录 json格式
	 */
	@RequiresPermissions("sys:user:userWorklog:edit")
	@RequestMapping(value = "saveJson")
	@ResponseBody
	public String saveJson(@RequestBody UserWorklogJson userWorklogJson, HttpServletRequest request) {

		 synchronized (UserUtils.getUser()) {//这里需要找到同意个对象,此处的session不是同一个

		userWorklogJson.getLog().setCreateBy(UserUtils.getUser());
		Calendar c = Calendar.getInstance();
		c.set(c.get(Calendar.YEAR), c.get(Calendar.MONTH), c.get(Calendar.DAY_OF_MONTH), 0, 0, 0);
		c.set(Calendar.MILLISECOND, 0);
		String resultId = userWorklogService.findByWorkdate(userWorklogJson.getLog());

		if (userWorklogJson.getLog().getWorkdate().getTime() > c.getTimeInMillis()
				&& userWorklogService.findUserState(UserUtils.getUser())) {
			// 日志是否超前
			return "future";
		} else if (StringUtils.isNotBlank(resultId) && !(resultId.equals(userWorklogJson.getLog().getId()))) {
			// 日志已经存在
			return "exists";
		} else {
			// 正常保存
			userWorklogJson.getLog().setDelFlag("0");
			if (userWorklogJson.getLog().getWorkdate().getTime() > c.getTimeInMillis()) {
				userWorklogJson.getLog().setUpdateDate(random(userWorklogJson.getLog().getWorkdate()));
			}
			if (StringUtils.isNoneBlank(userWorklogJson.getLog().getId())) {
				userWorkrecordService.deleteAllById(userWorklogJson.getLog().getId());
			}
			userWorklogService.save(userWorklogJson.getLog());
			Iterator<UserWorkrecord> it = userWorklogJson.getList().iterator();
			while (it.hasNext()) {
				UserWorkrecord now = it.next();
				now.setWorklogId(userWorklogJson.getLog().getId());
				userWorkrecordService.save(now);
			}
			return "success";
		}
		 }
	}

	/**
	 * 查询页面
	 */
	@RequiresPermissions("sys:user:userWorklog:view")
	@RequestMapping(value = "query")
	public String query(UserWorklog userWorklog, HttpServletRequest request, HttpServletResponse response, Model model,
			UserWorkrecord userWorkrecord, String userName, String otherId) {
		Page<UserWorklog> inpage = new Page<UserWorklog>(request, response);
		if (otherId == null) {
			userWorklog.setCreateBy(UserUtils.getUser());
			otherId = UserUtils.getUser().getId();
			userName = UserUtils.get(userWorklog.getCreateBy().getId()).getName();
		} else {
			userWorklog.setCreateBy(UserUtils.get(otherId));
			userName = UserUtils.get(otherId).getName();
		}
		Calendar c0 = Calendar.getInstance();
		userWorklog.setEnd(c0.getTime());
		userWorklog.setIsdraft("1");
		Page<UserWorklog> page = userWorklogService.findPage(inpage, userWorklog);
		model.addAttribute("page", page);
		List<List<UserWorkrecord>> userWorkrecords = new ArrayList<List<UserWorkrecord>>();
		for (UserWorklog userWorklog2 : page.getList()) {
			userWorkrecord.setWorklogId(userWorklog2.getId());
			userWorkrecords.add(userWorkrecordService.findList(userWorkrecord));
		}
		model.addAttribute("userWorkrecords", userWorkrecords);
		model.addAttribute("begindate", userWorklog.getBegindate());
		model.addAttribute("enddate", userWorklog.getEnddate());
		model.addAttribute("otherId", otherId);
		model.addAttribute("userName", userName);

		// 查询部门
		List<Office> offices = officeService.findChildList(UserUtils.getUser().getOffice());
		model.addAttribute("offices", offices);
		// 依据部门，获取人员信息
		List<List<User>> users = new ArrayList<List<User>>();
		for (Office office : offices) {
			users.add(systemService.findUserByOfficeId(office.getId()));
		}
		model.addAttribute("users", users);

		return "mobile/modules/user/userWorklogQuery";
	}

	// /**
	// * 循环保存页面多条记录
	// */
	// @RequiresPermissions("sys:user:userWorklog:edit")
	// @RequestMapping(value = "save")
	// public String save(String id, Date workdate, String[] remarks, String
	// isdraft, String[] wrid, String[] begintime,
	// String[] endtime, String[] content, String[] isdone, String[] delFlag,
	// UserWorklog userWorklog,
	// UserWorkrecord userWorkrecord, Model model, RedirectAttributes
	// redirectAttributes, String[] type,
	// @RequestBody List<UserWorklogJson> jsonList) {
	//
	// if (true) {
	// // test
	// System.err.println(jsonList);
	// return "true";
	// }
	// // 判断是否超前写日志
	// userWorklog.setCreateBy(UserUtils.getUser());
	// Calendar c0 = Calendar.getInstance();
	// c0.set(c0.get(Calendar.YEAR), c0.get(Calendar.MONTH),
	// c0.get(Calendar.DAY_OF_MONTH), 0, 0, 0);
	// c0.set(Calendar.MILLISECOND, 0);
	// if (workdate.getTime() > c0.getTime().getTime() &&
	// userWorklogService.findUserState(UserUtils.getUser())) {
	// model.addAttribute("msg", "请勿填写未来日期，保存失败。");
	// Calendar c = Calendar.getInstance();
	// c.setTime(workdate);
	// // 保存
	// userWorklog.setId(id);
	// userWorklog.setWorkdate(workdate);
	// // userWorklog.setRemarks(remarks);
	// userWorklog.setDelFlag("0");
	// userWorklog.setIsdraft("0");// 草稿状态
	// List<UserWorkrecord> list = new ArrayList<UserWorkrecord>();
	// if (delFlag != null) {
	// for (int i = 0; i < delFlag.length; i++) {
	// // 循环输出id和前面的单独输出id不同，不能在页面传“”
	// if (!(wrid[i].equals("null") && delFlag[i].equals("1"))) {
	// // 非新创建删除的
	// userWorkrecord = new UserWorkrecord();
	// userWorkrecord.setId(wrid[i]);
	// c.set(Calendar.HOUR_OF_DAY, Integer.parseInt(begintime[i].substring(0,
	// 2)));// 设置小时
	// c.set(Calendar.MINUTE, Integer.parseInt(begintime[i].substring(3, 5)));//
	// 设置分钟
	// userWorkrecord.setBegintime(c.getTime());
	// // System.err.println(c.getTime()+"
	// // "+begintime[i].substring(0, 2)+"
	// // "+begintime[i].substring(3, 5));
	// c.set(Calendar.HOUR_OF_DAY, Integer.parseInt(endtime[i].substring(0,
	// 2)));// 设置小时
	// c.set(Calendar.MINUTE, Integer.parseInt(endtime[i].substring(3, 5)));//
	// 设置分钟
	// // System.err.println(c.getTime()+"
	// // "+endtime[i].substring(0, 2)+"
	// // "+endtime[i].substring(3, 5));
	// userWorkrecord.setEndtime(c.getTime());
	// if (content.length == 0) {
	// userWorkrecord.setContent("");
	// } else {
	// userWorkrecord.setContent(content[i]);
	// }
	// if (remarks.length == 0) {
	// userWorkrecord.setRemarks("");
	// } else {
	// userWorkrecord.setRemarks(remarks[i]);
	// }
	// userWorkrecord.setIsdone(isdone[i]);
	// userWorkrecord.setType(type[i]);
	// userWorkrecord.setDelFlag(delFlag[i]);
	// userWorkrecord.setWorklogId(userWorklog.getId());
	// list.add(userWorkrecord);
	// }
	// }
	// }
	// model.addAttribute("userWorkrecords", list);
	// model.addAttribute("userWorklog", userWorklog);
	// return "mobile/modules/user/userWorklogForm";
	// } else if (StringUtils.isBlank(id) && (int)
	// userWorklogService.findByWorkdate(userWorklog) > 0) {
	// // 判断是否已经存在该日期的日志
	// model.addAttribute("msg", "该日期日志已经存在，保存失败。");
	// Calendar c = Calendar.getInstance();
	// c.setTime(workdate);
	// // 保存
	// userWorklog.setId(id);
	// userWorklog.setWorkdate(workdate);
	// // userWorklog.setRemarks(remarks);
	// userWorklog.setDelFlag("0");
	// userWorklog.setIsdraft("0");// 草稿状态
	// List<UserWorkrecord> list = new ArrayList<UserWorkrecord>();
	// if (delFlag != null) {
	// for (int i = 0; i < delFlag.length; i++) {
	// // 循环输出id和前面的单独输出id不同，不能在页面传“”
	// if (!(wrid[i].equals("null") && delFlag[i].equals("1"))) {
	// // 非新创建删除的
	// userWorkrecord = new UserWorkrecord();
	// userWorkrecord.setId(wrid[i]);
	// c.set(Calendar.HOUR_OF_DAY, Integer.parseInt(begintime[i].substring(0,
	// 2)));// 设置小时
	// c.set(Calendar.MINUTE, Integer.parseInt(begintime[i].substring(3, 5)));//
	// 设置分钟
	// userWorkrecord.setBegintime(c.getTime());
	// // System.err.println(c.getTime()+"
	// // "+begintime[i].substring(0, 2)+"
	// // "+begintime[i].substring(3, 5));
	// c.set(Calendar.HOUR_OF_DAY, Integer.parseInt(endtime[i].substring(0,
	// 2)));// 设置小时
	// c.set(Calendar.MINUTE, Integer.parseInt(endtime[i].substring(3, 5)));//
	// 设置分钟
	// // System.err.println(c.getTime()+"
	// // "+endtime[i].substring(0, 2)+"
	// // "+endtime[i].substring(3, 5));
	// userWorkrecord.setEndtime(c.getTime());
	// if (content.length == 0) {
	// userWorkrecord.setContent("");
	// } else {
	// userWorkrecord.setContent(content[i]);
	// }
	// if (remarks.length == 0) {
	// userWorkrecord.setRemarks("");
	// } else {
	// userWorkrecord.setRemarks(remarks[i]);
	// }
	// userWorkrecord.setIsdone(isdone[i]);
	// userWorkrecord.setType(type[i]);
	// userWorkrecord.setDelFlag(delFlag[i]);
	// userWorkrecord.setWorklogId(userWorklog.getId());
	// list.add(userWorkrecord);
	// }
	// }
	// }
	// model.addAttribute("userWorkrecords", list);
	// model.addAttribute("userWorklog", userWorklog);
	// return "mobile/modules/user/userWorklogForm";
	// } else {
	// // 公司上班
	// Calendar c = Calendar.getInstance();
	// c.setTime(workdate);
	// // 保存
	// userWorklog.setId(id);
	// userWorklog.setWorkdate(workdate);
	// // userWorklog.setRemarks(remarks);
	// userWorklog.setDelFlag("0");
	// if (workdate.getTime() > c0.getTime().getTime()) {
	// userWorklog.setUpdateDate(random(workdate));
	// }
	// userWorklog.setIsdraft(isdraft);// 草稿状态
	// if (!beanValidator(model, userWorklog)) {
	// return form(userWorklog, userWorkrecord, model);
	// }
	// userWorklogService.save(userWorklog);
	// if (delFlag != null) {
	// for (int i = 0; i < delFlag.length; i++) {
	// // 循环输出id和前面的单独输出id不同，不能在页面传“”
	// if (!(wrid[i].equals("null") && delFlag[i].equals("1"))) {
	// // 非新创建删除的
	// if (wrid[i].equals("null")) {
	// wrid[i] = "";
	// }
	// userWorkrecord.setId(wrid[i]);
	// c.set(Calendar.HOUR_OF_DAY, Integer.parseInt(begintime[i].substring(0,
	// 2)));// 设置小时
	// c.set(Calendar.MINUTE, Integer.parseInt(begintime[i].substring(3, 5)));//
	// 设置分钟
	// userWorkrecord.setBegintime(c.getTime());
	// // System.err.println(c.getTime()+"
	// // "+begintime[i].substring(0, 2)+"
	// // "+begintime[i].substring(3, 5));
	// c.set(Calendar.HOUR_OF_DAY, Integer.parseInt(endtime[i].substring(0,
	// 2)));// 设置小时
	// c.set(Calendar.MINUTE, Integer.parseInt(endtime[i].substring(3, 5)));//
	// 设置分钟
	// // System.err.println(c.getTime()+"
	// // "+endtime[i].substring(0, 2)+"
	// // "+endtime[i].substring(3, 5));
	// userWorkrecord.setEndtime(c.getTime());
	// if (content.length == 0) {
	// userWorkrecord.setContent("");
	// } else {
	// userWorkrecord.setContent(content[i]);
	// }
	// if (remarks.length == 0) {
	// userWorkrecord.setRemarks("");
	// } else {
	// userWorkrecord.setRemarks(remarks[i]);
	// }
	// userWorkrecord.setIsdone(isdone[i]);
	// userWorkrecord.setType(type[i]);
	// userWorkrecord.setDelFlag(delFlag[i]);
	// userWorkrecord.setWorklogId(userWorklog.getId());
	// userWorkrecordService.save(userWorkrecord);
	// }
	// }
	// }
	// logger.debug("--" + redirectAttributes);
	// addMessage(redirectAttributes, "保存日志成功");
	//
	// }
	// return "redirect:" + Global.getAdminPath() +
	// "/mobile/user/userWorklog/?repage&flag=save";
	// }

	/**
	 * 多选删操作
	 */
	@RequiresPermissions("sys:user:userWorklog:edit")
	@RequestMapping(value = "delete")
	public String delete(String ids, UserWorklog userWorklog) {
		String[] ids2 = ids.split(",");
		for (String id : ids2) {
			userWorklog.setId(id);
			userWorklogService.delete(userWorklog);
		}
		return "redirect:" + Global.getAdminPath() + "/" + Global.getMobilePath()
				+ "/user/userWorklog/?repage&result=del";
	}

	private Date random(Date date) {
		// 17:35 63300000
		// 23:55 86100000
		long r = 63300000l + (long) (Math.random() * 22800000l);
		return new Date(date.getTime() + r);
	}
}