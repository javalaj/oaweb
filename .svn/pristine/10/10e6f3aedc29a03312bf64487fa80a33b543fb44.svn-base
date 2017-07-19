/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.user.web;

import java.util.ArrayList;
import java.util.Calendar;
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
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.web.BaseController;
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
 * @version 2016-11-02
 */
@Controller
@RequestMapping(value = "${adminPath}/user/userWorklog")
public class UserWorklogController extends BaseController {

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

	/**
	 * 
	 * 未解决的问题，改变为已解决
	 * 
	 */
	@RequiresPermissions("sys:user:userWorklog:edit")
	@RequestMapping(value = "done")
	public String done(String uwlid, String uwrid) {
		userWorkrecordService.done(uwrid);
		return "redirect:" + Global.getAdminPath() + "/user/userWorklog/form?repage&id=" + uwlid;
	}

	/**
	 * 查看他人日志，并且对未提交的人员以红色名字处理
	 */
	@RequiresPermissions("log:logWorklogOtherList:edit")
	@RequestMapping(value = "seeOtherList")
	public String seeOtherList(Date begindate, Date enddate, String otherUserId, Model model,
			HttpServletRequest request, HttpServletResponse response, UserWorkrecord userWorkrecord,
			UserWorklog userWorklog, String otherUserName) {
		if (otherUserId == null || otherUserId.trim().equals("")) {
			otherUserId = UserUtils.getPrincipal().getId();
		}
		// 获取查询条件，查询出用户名，用户的日志，以及日志具体内容
		Page<UserWorklog> inpage = new Page<UserWorklog>(request, response);
		inpage.setOrderBy("a.workdate DESC");
		userWorklog.setCreateBy(UserUtils.get(otherUserId));

		Calendar endc = Calendar.getInstance();
		// endc.set(endc.get(Calendar.YEAR), endc.get(Calendar.MONTH),
		// endc.get(Calendar.DAY_OF_MONTH), 0, 0, 0);
		// endc.set(Calendar.MILLISECOND, 0);
		userWorklog.setEnd(endc.getTime());
		userWorklog.setIsdraft("1");// 已提交
		Page<UserWorklog> page = userWorklogService.findPage(inpage, userWorklog);
		List<List<UserWorkrecord>> userWorkrecords = new ArrayList<List<UserWorkrecord>>();
		for (UserWorklog userWorklog2 : page.getList()) {
			userWorkrecord.setWorklogId(userWorklog2.getId());
			userWorkrecords.add(userWorkrecordService.findList(userWorkrecord));
		}
		// model.addAttribute("otherUserName",
		// UserUtils.get(otherUserId).getName());
		model.addAttribute("page", page);
		model.addAttribute("userWorkrecords", userWorkrecords);
		// 查询部门
		List<Office> offices = officeService.findChildList(UserUtils.getUser().getOffice());
		model.addAttribute("offices", offices);
		// 依据部门，查询人员结构
		List<List<User>> users = new ArrayList<List<User>>();
		List<List<Integer>> submits = new ArrayList<List<Integer>>();
		Calendar c = Calendar.getInstance();
		// 若今天为星期一，则 查看上个星期五的
		long endTime = 0l;
		if (c.get(Calendar.DAY_OF_WEEK) == 2) {
			// 星期一 则查看上个星期五
			c.setTimeInMillis(c.getTime().getTime() - 86400000 * 3);
			endTime = 86400000 * 2l;
		} else {
			c.setTimeInMillis(c.getTime().getTime() - 86400000);
			endTime = 0l;
		}
		// 日清日结查询代码
		c.set(c.get(Calendar.YEAR), c.get(Calendar.MONTH), c.get(Calendar.DAY_OF_MONTH), 0, 0, 0);
		c.set(Calendar.MILLISECOND, 0);
		Date workdate = c.getTime();
		Date end = new Date(workdate.getTime() + 117000000 + endTime);// 第二天的
																		// 8:30
		// 9:30 120600000
		// 8:30 1170000000
		for (Office office : offices) {
			List<User> usersTemp = new ArrayList<User>();
			List<Integer> submitsTemp = new ArrayList<Integer>();
			usersTemp = systemService.findUserByOfficeId(office.getId());
			users.add(usersTemp);
			for (User user : usersTemp) {
				// 查询出人员是否提交日志
				submitsTemp.add(userWorklogService.findUserWorklogSubmit(user.getId(), workdate, "1", workdate, end));
			}
			submits.add(submitsTemp);
		}
		model.addAttribute("resultdate", workdate);
		model.addAttribute("submits", submits);
		model.addAttribute("users", users);
		model.addAttribute("begindate", begindate);
		model.addAttribute("enddate", enddate);
		model.addAttribute("otherUserId", otherUserId);
		if (StringUtils.isBlank(otherUserName)) {
			otherUserName = UserUtils.getUser().getName();
		}
		model.addAttribute("otherUserName", otherUserName);
		return "modules/user/seeOtherWorklogList";
	}

	/**
	 * 获取日志初略信息列表
	 */
	@RequiresPermissions("sys:user:userWorklog:view")
	@RequestMapping(value = { "list", "" })
	public String list(UserWorklog userWorklog, HttpServletRequest request, HttpServletResponse response, Model model,
			String flag, UserWorkrecord userWorkrecord) {
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
		model.addAttribute("msg", flag);
		return "modules/user/userWorklogList";
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
		return "modules/user/userWorklogList";
	}

	/**
	 * 修改提交
	 */
	@RequiresPermissions("sys:user:userWorklog:view")
	@RequestMapping(value = "form")
	public String form(UserWorklog userWorklog, UserWorkrecord userWorkrecord, Model model, String fromindex) {
		userWorkrecord.setWorklogId(userWorklog.getId());
		List<UserWorkrecord> list = userWorkrecordService.findList(userWorkrecord);
		userWorklogService.get(userWorklog);
		model.addAttribute("userWorkrecords", list);
		model.addAttribute("userWorklog", userWorklog);
		model.addAttribute("fromindex", fromindex);
		return "modules/user/userWorklogForm";
	}

	/**
	 * 循环保存页面多条记录
	 */
	@RequiresPermissions("sys:user:userWorklog:edit")
	@RequestMapping(value = "save")
	public String save(String id, Date workdate, String[] remarks, String isdraft, String[] wrid, String[] begintime,
			String[] endtime, String[] content, String[] isdone, String[] delFlag, UserWorklog userWorklog,
			UserWorkrecord userWorkrecord, Model model, RedirectAttributes redirectAttributes, String[] type) {
		// 判断是否超前写日志
		userWorklog.setCreateBy(UserUtils.getUser());
		Calendar c0 = Calendar.getInstance();
		c0.set(c0.get(Calendar.YEAR), c0.get(Calendar.MONTH), c0.get(Calendar.DAY_OF_MONTH), 0, 0, 0);
		c0.set(Calendar.MILLISECOND, 0);
		String resultId = userWorklogService.findByWorkdate(userWorklog);
		if (workdate.getTime() > c0.getTime().getTime() && userWorklogService.findUserState(UserUtils.getUser())) {
			model.addAttribute("msg", "future");
			Calendar c = Calendar.getInstance();
			c.setTime(workdate);
			// 保存
			userWorklog.setId(id);
			userWorklog.setWorkdate(workdate);
			// userWorklog.setRemarks(remarks);
			userWorklog.setDelFlag("0");
			userWorklog.setIsdraft("0");// 草稿状态
			List<UserWorkrecord> list = new ArrayList<UserWorkrecord>();
			if (delFlag != null) {
				for (int i = 0; i < delFlag.length; i++) {
					// 循环输出id和前面的单独输出id不同，不能在页面传“”
					if (!(wrid[i].equals("null") && delFlag[i].equals("1"))) {
						// 非新创建删除的
						userWorkrecord = new UserWorkrecord();
						userWorkrecord.setId(wrid[i]);
						c.set(Calendar.HOUR_OF_DAY, Integer.parseInt(begintime[i].substring(0, 2)));// 设置小时
						c.set(Calendar.MINUTE, Integer.parseInt(begintime[i].substring(3, 5)));// 设置分钟
						userWorkrecord.setBegintime(c.getTime());
						// System.err.println(c.getTime()+"
						// "+begintime[i].substring(0, 2)+"
						// "+begintime[i].substring(3, 5));
						c.set(Calendar.HOUR_OF_DAY, Integer.parseInt(endtime[i].substring(0, 2)));// 设置小时
						c.set(Calendar.MINUTE, Integer.parseInt(endtime[i].substring(3, 5)));// 设置分钟
						// System.err.println(c.getTime()+"
						// "+endtime[i].substring(0, 2)+"
						// "+endtime[i].substring(3, 5));
						userWorkrecord.setEndtime(c.getTime());
						if (content.length == 0) {
							userWorkrecord.setContent("");
						} else {
							userWorkrecord.setContent(content[i]);
						}
						if (remarks.length == 0) {
							userWorkrecord.setRemarks("");
						} else {
							userWorkrecord.setRemarks(remarks[i]);
						}
						userWorkrecord.setIsdone(isdone[i]);
						userWorkrecord.setType(type[i]);
						userWorkrecord.setDelFlag(delFlag[i]);
						userWorkrecord.setWorklogId(userWorklog.getId());
						list.add(userWorkrecord);
					}
				}
			}
			model.addAttribute("userWorkrecords", list);
			model.addAttribute("userWorklog", userWorklog);
			// return "modules/user/userWorklogForm";//旧版本的方式不兼容。
			return "redirect:" + Global.getAdminPath() + "/user/userWorklog/?repage&flag=future";
		} else if (StringUtils.isNotBlank(resultId) && !(resultId.equals(id))) {
			// 判断是否已经存在该日期的日志
			model.addAttribute("msg", "exists");
			Calendar c = Calendar.getInstance();
			c.setTime(workdate);
			// 保存
			userWorklog.setId(id);
			userWorklog.setWorkdate(workdate);
			// userWorklog.setRemarks(remarks);
			userWorklog.setDelFlag("0");
			userWorklog.setIsdraft("0");// 草稿状态
			List<UserWorkrecord> list = new ArrayList<UserWorkrecord>();
			if (delFlag != null) {
				for (int i = 0; i < delFlag.length; i++) {
					// 循环输出id和前面的单独输出id不同，不能在页面传“”
					if (!(wrid[i].equals("null") && delFlag[i].equals("1"))) {
						// 非新创建删除的
						userWorkrecord = new UserWorkrecord();
						userWorkrecord.setId(wrid[i]);
						c.set(Calendar.HOUR_OF_DAY, Integer.parseInt(begintime[i].substring(0, 2)));// 设置小时
						c.set(Calendar.MINUTE, Integer.parseInt(begintime[i].substring(3, 5)));// 设置分钟
						userWorkrecord.setBegintime(c.getTime());
						// System.err.println(c.getTime()+"
						// "+begintime[i].substring(0, 2)+"
						// "+begintime[i].substring(3, 5));
						c.set(Calendar.HOUR_OF_DAY, Integer.parseInt(endtime[i].substring(0, 2)));// 设置小时
						c.set(Calendar.MINUTE, Integer.parseInt(endtime[i].substring(3, 5)));// 设置分钟
						// System.err.println(c.getTime()+"
						// "+endtime[i].substring(0, 2)+"
						// "+endtime[i].substring(3, 5));
						userWorkrecord.setEndtime(c.getTime());
						if (content.length == 0) {
							userWorkrecord.setContent("");
						} else {
							userWorkrecord.setContent(content[i]);
						}
						if (remarks.length == 0) {
							userWorkrecord.setRemarks("");
						} else {
							userWorkrecord.setRemarks(remarks[i]);
						}
						userWorkrecord.setIsdone(isdone[i]);
						userWorkrecord.setType(type[i]);
						userWorkrecord.setDelFlag(delFlag[i]);
						userWorkrecord.setWorklogId(userWorklog.getId());
						list.add(userWorkrecord);
					}
				}
			}
			model.addAttribute("userWorkrecords", list);
			model.addAttribute("userWorklog", userWorklog);
			// return "modules/user/userWorklogForm";//旧版本方式不兼容
			return "redirect:" + Global.getAdminPath() + "/user/userWorklog/?repage&flag=exists";
		} else {
			// 公司上班
			Calendar c = Calendar.getInstance();
			c.setTime(workdate);
			// 保存
			userWorklog.setId(id);
			userWorklog.setWorkdate(workdate);
			// userWorklog.setRemarks(remarks);
			userWorklog.setDelFlag("0");
			if (workdate.getTime() > c0.getTime().getTime()) {
				userWorklog.setUpdateDate(random(workdate));
			} else {
				userWorklog.setUpdateDate(null);
			}
			userWorklog.setIsdraft(isdraft);// 草稿状态
			if (!beanValidator(model, userWorklog)) {
				return form(userWorklog, userWorkrecord, model, null);
			}
			userWorklogService.save(userWorklog);
			if (delFlag != null) {
				for (int i = 0; i < delFlag.length; i++) {
					// 循环输出id和前面的单独输出id不同，不能在页面传“”
					if (!(wrid[i].equals("null") && delFlag[i].equals("1"))) {
						// 非新创建删除的
						if (wrid[i].equals("null")) {
							wrid[i] = "";
						}
						userWorkrecord.setId(wrid[i]);
						c.set(Calendar.HOUR_OF_DAY, Integer.parseInt(begintime[i].substring(0, 2)));// 设置小时
						c.set(Calendar.MINUTE, Integer.parseInt(begintime[i].substring(3, 5)));// 设置分钟
						userWorkrecord.setBegintime(c.getTime());
						// System.err.println(c.getTime()+"
						// "+begintime[i].substring(0, 2)+"
						// "+begintime[i].substring(3, 5));
						c.set(Calendar.HOUR_OF_DAY, Integer.parseInt(endtime[i].substring(0, 2)));// 设置小时
						c.set(Calendar.MINUTE, Integer.parseInt(endtime[i].substring(3, 5)));// 设置分钟
						// System.err.println(c.getTime()+"
						// "+endtime[i].substring(0, 2)+"
						// "+endtime[i].substring(3, 5));
						userWorkrecord.setEndtime(c.getTime());
						if (content.length == 0) {
							userWorkrecord.setContent("");
						} else {
							userWorkrecord.setContent(content[i]);
						}
						if (remarks.length == 0) {
							userWorkrecord.setRemarks("");
						} else {
							userWorkrecord.setRemarks(remarks[i]);
						}
						userWorkrecord.setIsdone(isdone[i]);
						userWorkrecord.setType(type[i]);
						userWorkrecord.setDelFlag(delFlag[i]);
						userWorkrecord.setWorklogId(userWorklog.getId());
						userWorkrecordService.save(userWorkrecord);
					}
				}
			}
			logger.debug("--" + redirectAttributes);
			addMessage(redirectAttributes, "保存日志成功");

		}
		return "redirect:" + Global.getAdminPath() + "/user/userWorklog/?repage&flag=save";
	}

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
		return "redirect:" + Global.getAdminPath() + "/user/userWorklog/?repage&flag=del";
	}

	private Date random(Date date) {
		// 17:35 63300000
		// 23:55 86100000
		long r = 63300000l + (long) (Math.random() * 22800000l);
		return new Date(date.getTime() + r);
	}
}