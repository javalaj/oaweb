/**
 * Copyright &copy; 2015-2020 <a href="http://www.jeeplus.org/">JeePlus</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.iim.web;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.mapper.JsonMapper;
import com.thinkgem.jeesite.common.utils.FileUpload;
import com.thinkgem.jeesite.common.utils.FileUtils;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.common.websocket.utils.Constant;
import com.thinkgem.jeesite.modules.iim.entity.IIMFriend;
import com.thinkgem.jeesite.modules.iim.entity.IIMGroup;
import com.thinkgem.jeesite.modules.iim.entity.IIMInit;
import com.thinkgem.jeesite.modules.iim.entity.IIMMData;
import com.thinkgem.jeesite.modules.iim.entity.IIMMember;
import com.thinkgem.jeesite.modules.iim.entity.IIMdata;
import com.thinkgem.jeesite.modules.iim.entity.IimChatGroup;
import com.thinkgem.jeesite.modules.iim.entity.IimChatGroupUser;
import com.thinkgem.jeesite.modules.iim.entity.LayJson;
import com.thinkgem.jeesite.modules.iim.service.IimChatGroupService;
import com.thinkgem.jeesite.modules.iim.service.IimChatGroupUserService;
import com.thinkgem.jeesite.modules.oa.entity.OaNotify;
import com.thinkgem.jeesite.modules.oa.service.OaNotifyService;
import com.thinkgem.jeesite.modules.sys.dao.UserDao;
import com.thinkgem.jeesite.modules.sys.entity.Office;
import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.modules.sys.service.OfficeService;
import com.thinkgem.jeesite.modules.sys.service.SystemService;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;

import net.sf.json.JSONObject;


/**
 * 联系人Controller
 * @author jeeplus
 * @version 2015-11-09
 */
@Controller
@RequestMapping(value = "${adminPath}/iim/contact")
public class ContactController extends BaseController {

	@Autowired
	private SystemService systemService;
	
	@Autowired
	private UserDao userDao;
	
	@Autowired
	private OfficeService officeService;
	
	
	@Autowired
	private IimChatGroupUserService groupUserService;
	
	@Autowired
	private IimChatGroupService groupService;
	
	@Autowired
	private OaNotifyService oaNotifyService;
	/**
	 * 打开通讯录
	 * @param user
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequestMapping(value = {"index", ""})
	public String index(User user, HttpServletRequest request, HttpServletResponse response, Model model) {
		List<User> list = systemService.findUser(user);
        model.addAttribute("list", list);
		return "modules/iim/contacts";
	}

	@RequestMapping(value = "open")
	@ResponseBody
	public String open(HttpServletRequest request,
			HttpServletResponse response)
	{
		/**session对象*/
		HttpSession session = ((ServletRequestAttributes)RequestContextHolder
				.getRequestAttributes()).getRequest().getSession();
		
		//打开即时通讯次数
		Integer chatOpenNum  = (Integer) session.getAttribute("chatOpenNum");
		
		if (chatOpenNum != null)
		{
			chatOpenNum++;
			
			session.setAttribute("chatOpenNum", chatOpenNum);
		}
		else
		{
			chatOpenNum = 1;
			
			session.setAttribute("chatOpenNum", 1);
		}
				
		return JsonMapper.getInstance().toJson(chatOpenNum == 1 ? true : false);
	}
	
	
	@RequestMapping(value = "close")
	@ResponseBody
	public String close(HttpServletRequest request,
			HttpServletResponse response)
	{
		/**session对象*/
		HttpSession session = ((ServletRequestAttributes)RequestContextHolder
				.getRequestAttributes()).getRequest().getSession();
		
		session.setAttribute("chatOpenNum", null);
		
		return null;
	}
	
	/**
	 * 查找
	 * @param user<":;,'l
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "searchUsers")
	public String searchUsers(User user, HttpServletRequest request, HttpServletResponse response, Model model) {
			List<User> friends = userDao.searchUsers(user);
	        model.addAttribute("list", friends);
		return "modules/iim/search_user";
	}
	
	
//	/**
//	 * 添加好友--->常用联系人
//	 */
//	@RequestMapping(value = "addFriend")
//	public String addFriend(String ids, RedirectAttributes redirectAttributes) {
//		String idArray[] =ids.split(",");
//		User currentUser =  UserUtils.getUser();
//		for(String id : idArray){
//			 if(userDao.findFriend(currentUser.getId(), id) == null){
//			  
//				 userDao.insertFriend(IdGen.uuid(), currentUser.getId(), id);//添加对方为好友
//				// userDao.insertFriend(IdGen.uuid(), id, currentUser.getId());//同时把自己添加为对方的好友
//			 }
//		}
//		addMessage(redirectAttributes, "添加好友成功");
//		return "redirect:"+Global.getAdminPath()+"/iim/contact/myFriends/?repage";
//	}

	
//	/**
//	 * 删除好友
//	 */
//	@RequestMapping(value = "delFriend")
//	public String delFriend(String id, RedirectAttributes redirectAttributes) {
//		  User friend =   UserUtils.get(id);
//		  User currentUser =  UserUtils.getUser();
//		  if(friend != null &&  userDao.findFriend(currentUser.getId(), friend.getId()) != null){
//			  userDao.deleteFriend(currentUser.getId(), friend.getId());//删除好友
//			//  userDao.deleteFriend(friend.getId(), currentUser.getId());//同时把自己从对方的好友列表删除
//		  }
//		
//		return "redirect:"+Global.getAdminPath()+"/iim/contact/myFriends/?repage";
//	}

//	/**
//	 * 打开我的好友列表--->常用联系人列表
//	 * @param user
//	 * @param request
//	 * @param response
//	 * @param model
//	 * @return
//	 */
//	@RequestMapping(value = "myFriends")
//	public String myFriends(User user, HttpServletRequest request, HttpServletResponse response, Model model) {
//		User currentUser =  UserUtils.getUser();
//		List<User>  friends = userDao.findFriends(currentUser);
//        model.addAttribute("list", friends);
//		return "modules/iim/myFriends";
//	}

	
	
	
	
//	/**
//	 * 打开聊天窗口
//	 * @param user
//	 * @param request
//	 * @param response
//	 * @param model
//	 * @return
//	 */
//	@RequestMapping(value = "layerIM")
//	public String layerIM(User user, HttpServletRequest request, HttpServletResponse response, Model model) {
//		List<User> list = systemService.findUser(user);
//        model.addAttribute("list", list);
//		return "modules/iim/layerIM";
//	}
	
	@RequestMapping(value="friend")
	@ResponseBody
	public IIMInit getFriend(User user, HttpServletRequest request, HttpServletResponse response, Model model){
		IIMInit iimInit = new IIMInit();
		IIMdata iimdate = new IIMdata();
		
		User currentUser =  UserUtils.getUser();
		
		if (StringUtils.isEmpty(currentUser.getPhoto()))
			currentUser.setAvatar("/oa/static/images/ph-index.png");
		
		//List<User>  friends = userDao.findFriends(currentUser);
		
		iimdate.setMine(currentUser);
		List<Office> officeList = officeService.findList(true);
		List<IIMFriend> listf = new ArrayList<IIMFriend>();
		for(Office office : officeList){
			user.setOffice(office);
			List<User> users = userDao.findListByOffice(user);
			IIMFriend iimFriend = new IIMFriend();
			
			for (User user1 : users) {
				if (StringUtils.isEmpty(user1.getPhoto()))
					user1.setAvatar("/oa/static/images/ph-index.png");
			}
			
			
			
			iimFriend.setId(office.getId());
			iimFriend.setGroupname(office.getName());
			iimFriend.setList(users);
			listf.add(iimFriend);
		}
		iimdate.setFriend(listf);
		
		List<IimChatGroup> listg = groupUserService.getGroupByuser(currentUser);//根据用户获取群列表
		
		
		iimdate.setGroup(listg);
		
		iimInit.setData(iimdate);
		
		
		return iimInit;
	}
	
	

	
	/***
	 * 群组成员接口
	 * @param user
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	/*@RequestMapping(value="group")
	@ResponseBody
	public IIMMember getGroupUser(IimChatGroup group, HttpServletRequest request, HttpServletResponse response, Model model){
		IIMMember iimmember = new IIMMember();
		List<User> userlist = groupUserService.getUserBygroup(group);
		List<User> list=new ArrayList<User> ();
		IIMMData iimdate = new IIMMData();
		User uiu= UserUtils.getUser();
		
		
		User uu =new User();
		uu.setUsername(uiu.getName());
		uu.setId(uiu.getId());
		uu.setAvatar(uiu.getPhoto());
		uu.setSign(uiu.getSign());
		list.add(uu);
		
		iimmember.setMsg("0");
		for (User user : userlist) {
			if(!user.getId().equals(uiu.getId()))
			{
				User u =new User();
				u.setUsername(user.getName());
				u.setId(user.getId());
				u.setAvatar(user.getPhoto());
				u.setSign(user.getSign());
				list.add(u);
			}
		}
		iimdate.setList(list);
		iimmember.setData(iimdate);
		
		System.out.println(JsonMapper.getInstance().toJson(iimmember));
		return iimmember;
	}*/
	
//	@RequestMapping(value="search")
//	@ResponseBody
//	public LayJson getSearch(User user, HttpServletRequest request, HttpServletResponse response, Model model){
//		LayJson j = new LayJson();
//		j.setStatus(1);
//		
//		List<Office> officeList = officeService.findList(true);
//		int index=1;
//		for(Office office : officeList){
//			user.setOffice(office);
//			List<User> users = userDao.findListByOffice(user);
//			Group group = new Group();
//			group.setName(office.getName());
//			group.setNums(users.size());
//			group.setId(++index);
//			for(User u : users){
//				Friend friend = new Friend();
//				friend.setId(u.getLoginName());
//				friend.setName(u.getName());
//				friend.setFace(u.getPhoto());
//				group.getItem().add(friend);
//			}
//			j.getData().add(group);
//		}
//		user.setOffice(null);
//		List<User> users = userDao.findListByOffice(user);
//		Group group = new Group();
//		group.setName("未分组");
//		group.setNums(users.size());
//		group.setId(++index);
//		for(User u : users){
//			Friend friend = new Friend();
//			friend.setId(u.getLoginName());
//			friend.setName(u.getName());
//			friend.setFace(u.getPhoto());
//			group.getItem().add(friend);
//		}
//		j.getData().add(group);
//		
//		return j;
//	}
	
//	/**
//	 * 群组列表接口 预留待开发
//	 * @return
//	 */
//	@RequestMapping(value="group")
//	@ResponseBody
//	public LayJson getGroup(){
//		LayJson j = new LayJson();
//		j.setStatus(1);
//		return j;
//	}
//	/**
//	 * 最近联系人接口 预留
//	 * @return
//	 */
//	@RequestMapping(value="chatLog")
//	@ResponseBody
//	public LayJson getChatLog(User user, HttpServletRequest request, HttpServletResponse response, Model model){
//		LayJson j = new LayJson();
//		j.setStatus(1);
//		
//		User currentUser =  UserUtils.getUser();
//		ChatHistory chatHistory = new ChatHistory();
//		chatHistory.setUserid1(currentUser.getLoginName());
//		chatHistory.setUserid2(currentUser.getLoginName());
//		List<ChatHistory> lch = chatHistoryService.findNearPerson(chatHistory);
//		List<String> lists = new ArrayList<String>();
//		for (ChatHistory ch : lch) {
//			if(!lists.contains(ch.getUserid1())){
//				lists.add(ch.getUserid1());
//			}
//			if(!lists.contains(ch.getUserid2())){
//				lists.add(ch.getUserid2());
//			}
//		}
//		
//		List<User>  friends = new ArrayList<User>();
//		for (String ls : lists) {
//			user.setLoginName(ls);
//			friends.add(userDao.findFriendLoginName(user));
//		}
//		//最近联系人
//		//List<User>  friends = userDao.findFriends(currentUser);
//		Group friendGroup = new Group();
//		friendGroup.setName("最近联系人");
//		friendGroup.setId(3);
//		friendGroup.setNums(friends.size());
//		for(User u : friends){
//			Friend friend = new Friend();
//			friend.setId(u.getLoginName());
//			friend.setName(u.getName());
//			friend.setFace(u.getPhoto());
//			
//			ChatHistory chatHistory2 = new ChatHistory();
//			chatHistory2.setUserid1(u.getLoginName());
//			chatHistory2.setUserid2(currentUser.getLoginName());
//			SimpleDateFormat sdf = new SimpleDateFormat("MM-dd HH:mm");
//			friend.setTime(sdf.format(chatHistoryService.findNearPerson2(chatHistory2).get(0).getCreateDate()));
//			friendGroup.getItem().add(friend);
//		}
//		j.getData().add(friendGroup);
//		return j;
//	}
	/**
	 * 群组成员接口 预留
	 *  @return
	 */
//	@RequestMapping(value="groups")
//	@ResponseBody
//	public LayJson getGroups(){
//		LayJson j = new LayJson();
//		j.setStatus(1);
//		return j;
//	}
	
	
	
	
	
	
	/**
	 * 聊天中图片的保存
	 * @param file 上传的图片
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequestMapping(value="image")
	@ResponseBody
	public String uploadImage(MultipartFile file , HttpServletRequest request, HttpServletResponse response, Model model){
		String path = FileUpload.imageUpload(file);
		Map<String, Object> m = new HashMap<String, Object>();
		Map<String, Object> m2 = new HashMap<String, Object>();
		m.put("code", 0);
		m.put("msg", "");
		m2.put("src", path);
		m.put("data", m2);
		return JSONObject.fromObject(m).toString();
	}
	
	/**
	 * 聊天中图片的保存
	 * @param file 上传的图片
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequestMapping(value="file")
	@ResponseBody
	public String uploadFile(MultipartFile file , HttpServletRequest request, HttpServletResponse response, Model model){
		String path = FileUpload.fileUpload(file);
		Map<String, Object> m = new HashMap<String, Object>();
		Map<String, Object> m2 = new HashMap<String, Object>();
		m.put("code", 0);
		m.put("msg", "");
		m2.put("src", path);
		m2.put("name", file.getOriginalFilename());
		m.put("data", m2);
		return JSONObject.fromObject(m).toString();
	}
	
	/**
	 * 修改签名
	 * @param sign
	 * @param username
	 * @throws IOException 
	 */
	@RequestMapping(value="updateSign")
	@ResponseBody
	public void updateSign(HttpServletResponse response,String sign,String username) throws IOException{
		User user = systemService.getUserByLoginName(username);
		user.setSign(sign);
		systemService.updateUserInfo(user);
		renderString(response,true);
	}

	
	
	
	
	
	
	
	
	
/*	-----------------------------------------------------------------------------------------------------------------------*/
	


	/**
	 * 群设置
	 */
	@RequestMapping(value = "iimGroup")
	public String iimGroup(HttpServletRequest request, HttpServletResponse response, Model model) {
		return "modules/iim/iim_Group";
	}

	/**
	 * 查找群
	 */
	@RequestMapping(value = "findGroup")
	public String findGroup(HttpServletRequest request, HttpServletResponse response, Model model) {
		IimChatGroup ig = new IimChatGroup();
		List<IimChatGroup> Grouplsit = groupService.findList(ig);

		List<IIMGroup> iimgrouplist = new ArrayList<IIMGroup>();
		for (IimChatGroup iimChatGroup : Grouplsit) {
			IIMGroup gg = new IIMGroup();
			gg.setId(iimChatGroup.getId());
			gg.setAvatar(iimChatGroup.getAvatar());
			gg.setGroupname(iimChatGroup.getGroupname());
			gg.setSign(iimChatGroup.getSign());
			gg.setMaxpeople(iimChatGroup.getMaxpeople());

			List<User> u = groupUserService.getUserBygroup(iimChatGroup);
			gg.setNowpeople(u.size());
			iimgrouplist.add(gg);
		}

		model.addAttribute("grouplist", iimgrouplist);
		return "modules/iim/find_Group";
	}

	/**
	 * 创建群
	 */
	@RequestMapping(value = "newGroup")
	public String newGroup(HttpServletRequest request, HttpServletResponse response, Model model) {
		return "modules/iim/create_Group";
	}

	/**
	 * 群管理
	 */
	@RequestMapping(value = "manageGroup")
	public String manageGroup(HttpServletRequest request, HttpServletResponse response, Model model) {
		// 群管理1.我管理的群，2.我加入的群
		User user = UserUtils.getUser();

		// 我是群主
		List<IimChatGroup> icg1 = groupUserService.getGroup(user.getId(), Constant.group_user_main);

		// 我是管理员
		List<IimChatGroup> icg3 = groupUserService.getGroup(user.getId(), Constant.group_user_manage);

		// 我加入的群
		List<IimChatGroup> icg2 = groupUserService.getGroup(user.getId(), Constant.group_user_off);
		icg2.addAll(icg3);

		model.addAttribute("size1", icg1.size());
		model.addAttribute("size2", icg2.size());
		model.addAttribute("group1", icg1);
		model.addAttribute("group2", icg2);
		return "modules/iim/manage_Group";
	}

	/***
	 * 群组成员接口
	 * 
	 * @param user
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "searchGroup")
	@ResponseBody
	public List serchGroup(String groupname, HttpServletRequest request, HttpServletResponse response, Model model) {
		List<IIMGroup> iimgrouplist = new ArrayList<IIMGroup>();
		List<IimChatGroup> Grouplsit = null;
		if (!"".equals(groupname) || null != groupname) {
			Grouplsit = groupService.getGroupList(groupname);
		} else {
			Grouplsit = groupService.findList(new IimChatGroup());
		}
		for (IimChatGroup iimChatGroup : Grouplsit) {
			IIMGroup gg = new IIMGroup();
			gg.setId(iimChatGroup.getId());
			gg.setAvatar(iimChatGroup.getAvatar());
			gg.setGroupname(iimChatGroup.getGroupname());
			gg.setSign(iimChatGroup.getSign());
			gg.setMaxpeople(iimChatGroup.getMaxpeople());

			List<User> u = groupUserService.getUserBygroup(iimChatGroup);
			gg.setNowpeople(u.size());
			iimgrouplist.add(gg);
		}

		return iimgrouplist;
	}

	/**
	 * 用户头像上传接口
	 * 
	 * @param user
	 * @param model
	 * @return
	 * @throws IOException
	 * @throws IllegalStateException
	 */
	@RequestMapping(value = "uploadGroupImage")
	@ResponseBody
	public LayJson imageUpload(HttpServletRequest request, HttpServletResponse response, MultipartFile file)
			throws IllegalStateException, IOException {
		// 判断文件是否为空
		LayJson json = new LayJson();
		if (!file.isEmpty()) {
			// 文件保存路径
			String realPath = Global.USERFILES_BASE_URL + UserUtils.getPrincipal() + "/images/";
			// 转存文件
			FileUtils.createDirectory(Global.getUserfilesBaseDir() + realPath);
			file.transferTo(new File(Global.getUserfilesBaseDir() + realPath + file.getOriginalFilename()));
			json.setUrl(request.getContextPath() + realPath + file.getOriginalFilename());
		}
		return json;
	}

	/**
	 * 申请加入群
	 * 
	 * @param user
	 * @param model
	 * @return
	 * @throws IOException
	 * @throws IllegalStateException
	 */
	@RequestMapping(value = "addGroup")
	@ResponseBody
	public LayJson addGroup(String groupid, HttpServletRequest request, HttpServletResponse response)
			throws IllegalStateException, IOException {
		User user = UserUtils.getUser();

		IimChatGroup gu = groupService.get(groupid);

		LayJson LJ = new LayJson();
		int i = 0;

		// 判断此群是否存在此人
		List<IimChatGroupUser> ig = groupUserService.booleanGroupUser(groupid, user.getId(), "1", null);
		List<User> u = groupUserService.getUserBygroup(gu);
		if (u.size() + 1 <= gu.getMaxpeople()) {
			if (ig.size() > 0) {
				/**
				 * 判断群里是否有过假删除此人记录
				 */
				IimChatGroupUser gi = ig.get(0);
				gi.setDelFlag("0");
				gi.setIn_date(new Date());
				gi.setState(Constant.group_user_shen);
				groupUserService.updateGroupUser(gi);
				LJ.setStatus(i);

			} else {
				List<IimChatGroupUser> gulist = groupUserService.getGroupUserBygroup(gu);
				for (IimChatGroupUser iimChatGroupUser : gulist) {
					if (iimChatGroupUser.getUser().getId().equals(user.getId())) {
						i = 1;
						break;
					}
				}
				LJ.setStatus(i);
				if (i == 0) {
					/**
					 * 判断是否有过重复的申请群数据
					 */
					List<IimChatGroupUser> igg = groupUserService.booleanGroupUser(groupid, user.getId(), "0", "2");

					if (igg.size() > 0) {
						IimChatGroupUser icgu = igg.get(0);
						groupUserService.save(icgu);

					} else {
						IimChatGroupUser icgu = new IimChatGroupUser();
						icgu.setGroup(gu);
						icgu.setUser(user);
						icgu.setState(Constant.group_user_shen);
						icgu.setIn_date(new Date());
						groupUserService.save(icgu);

						List<IimChatGroupUser> list = groupUserService.findManageUser(gu.getId());

						OaNotify notify = new OaNotify();
						notify.setTitle(
								user.getName() + "申请入群(<font style=\"color:blue\">" + gu.getGroupname() + "</font>)");
						notify.setType("5");
						notify.setContent("/iim/contact/agreeGroup?id=" + icgu.getId());
						notify.setFiles(user.getPhoto());
						notify.setReadNum("0");
						notify.setUnReadNum(list.size() + "");
						notify.setStatus("1");
						notify.setPower("1");
						String id = "";

						for (IimChatGroupUser iimChatGroupUser : list) {
							id += iimChatGroupUser.getUser().getId() + ",";
						}

						notify.setOaNotifyRecordIds(id);

						oaNotifyService.save(notify);

					}

				} else {
					LJ.setMsg("您已经在群里!");
				}
			}
		} else {
			LJ.setStatus(2);
		}
		return LJ;
	}

	/**
	 * 同意入群
	 * 
	 * @param user
	 * @param model
	 * @return
	 * @throws IOException
	 * @throws IllegalStateException
	 */
	@RequestMapping(value = "agreeGroup")
	@ResponseBody
	public LayJson agreeGroup(String id, String oaid, String f, HttpServletRequest request,
			HttpServletResponse response) throws IllegalStateException, IOException {
		LayJson LJ = new LayJson();
		if (f.equals("1")) {
			IimChatGroupUser icgu = groupUserService.get(id);
			icgu.setState(Constant.group_user_off);
			icgu.setIn_date(new Date());
			groupUserService.save(icgu);
		}else{
			IimChatGroupUser icgu = groupUserService.get(id);
			icgu.setState(Constant.group_user_refuse);
			icgu.setIn_date(new Date());
			groupUserService.save(icgu);
		}

		
		OaNotify oaNotify = oaNotifyService.get(oaid);
		if (org.apache.commons.lang3.StringUtils.isNotBlank(oaNotify.getId())){
			oaNotifyService.updateReadFlag(oaNotify);
		}
		LJ.setStatus(1);
		return LJ;
	}

	
	
	/**
	 * 查看通知消息
	 * 
	 * @param user
	 * @param model
	 * @return
	 * @throws IOException
	 * @throws IllegalStateException
	 */
	@RequestMapping(value = "lookOa")
	@ResponseBody
	public LayJson lookOa(String id, HttpServletRequest request,
			HttpServletResponse response) throws IllegalStateException, IOException {
		LayJson LJ = new LayJson();
		OaNotify oaNotify = oaNotifyService.get(id);
		if (org.apache.commons.lang3.StringUtils.isNotBlank(oaNotify.getId())){
			oaNotifyService.updateReadFlag(oaNotify);
		}
		LJ.setStatus(1);
		return LJ;
	}
	/**
	 * 新建群接口
	 * 
	 * @param user
	 * @param model
	 * @return
	 * @throws IOException
	 * @throws IllegalStateException
	 */
	@RequestMapping(value = "createGroup")
	@ResponseBody
	public LayJson createGroup(@RequestBody IimChatGroup group, HttpServletRequest request,
			HttpServletResponse response) throws IllegalStateException, IOException {
		LayJson LJ = new LayJson();
		if (group.getId() != null) {
			List<User> u = groupUserService.getUserBygroup(group);
			if (u.size() > group.getMaxpeople()) {
				LJ.setStatus(1);
			} else {
				groupService.save(group);
				LJ.setStatus(0);
			}
		} else {
			groupService.save(group);
			User user = UserUtils.getUser();
			IimChatGroupUser groupuser = new IimChatGroupUser();
			groupuser.setGroup(group);
			groupuser.setUser(user);
			groupuser.setState(Constant.group_user_main);
			groupuser.setIn_date(new Date());
			groupuser.setCreateDate(new Date());
			groupUserService.save(groupuser);
			LJ.setStatus(0);
		}
		return LJ;
	}

	/***
	 * 解散群managedelGroup
	 */

	@RequestMapping(value = "managedelGroup")
	public String managedelGroup(String id, HttpServletRequest request, HttpServletResponse response, Model model) {
		IimChatGroup icg = groupService.get(id);
		groupService.delete(icg);

		List<IimChatGroupUser> luse = groupUserService.getGroupUserBygroup(icg);

		for (IimChatGroupUser iimChatGroupUser : luse) {
			groupUserService.delete(iimChatGroupUser);
		}

		List<IimChatGroupUser> list = groupUserService.findCommonUser(icg.getId());

		/**
		 * 消息推送
		 */
		OaNotify notify = new OaNotify();
		notify.setTitle("群已解散(<font style=\"color:blue\">" + icg.getGroupname() + "</font>)");
		notify.setType("5");
		notify.setFiles(icg.getAvatar());
		notify.setReadNum("0");
		notify.setUnReadNum(list.size() + "");
		notify.setStatus("1");
		notify.setPower("0");
		String sid = "";

		for (IimChatGroupUser igUser : list) {
			sid += igUser.getUser().getId() + ",";
		}

		notify.setOaNotifyRecordIds(sid);
		return manageGroup(request, response, model);
	}

	/***
	 * 退出群manageGroup
	 */

	@RequestMapping(value = "manageexitGroup")
	public String manageexitGroup(String id, HttpServletRequest request, HttpServletResponse response, Model model) {

		IimChatGroup icg = groupService.get(id);
		User user = UserUtils.getUser();

		List<IimChatGroupUser> gulist = groupUserService.getGroupUserBygroup(icg);
		for (IimChatGroupUser iimChatGroupUser : gulist) {
			if (iimChatGroupUser.getUser().getId().equals(user.getId())) {
				groupUserService.delete(iimChatGroupUser);

				List<IimChatGroupUser> list = groupUserService.findManageUser(icg.getId());

				/**
				 * 消息推送
				 */
				OaNotify notify = new OaNotify();
				notify.setTitle(user.getName() + "退出群(<font style=\"color:blue\">" + icg.getGroupname() + "</font>)");
				notify.setType("5");
				notify.setFiles(user.getPhoto());
				notify.setReadNum("0");
				notify.setUnReadNum(list.size() + "");
				notify.setStatus("1");
				notify.setPower("0");
				String sid = "";

				for (IimChatGroupUser igUser : list) {
					sid += igUser.getUser().getId() + ",";
				}

				notify.setOaNotifyRecordIds(sid);

				oaNotifyService.save(notify);

			}
		}
		return manageGroup(request, response, model);
	}

	/***
	 * 删除群成员delGroupUser
	 */

	@RequestMapping(value = "delGroupUser")
	public String delGroupUser(String userid, String groupid, HttpServletRequest request, HttpServletResponse response,
			Model model) {

		IimChatGroup icg = groupService.get(groupid);

		List<IimChatGroupUser> gulist = groupUserService.getGroupUserBygroup(icg);
		for (IimChatGroupUser iimChatGroupUser : gulist) {
			if (iimChatGroupUser.getUser().getId().equals(userid)) {
				iimChatGroupUser.setState(Constant.group_user_no);
				groupUserService.save(iimChatGroupUser);

				/**
				 * 消息推送
				 */
				OaNotify notify = new OaNotify();
				notify.setTitle("您已被踢出群(<font style=\"color:blue\">" + icg.getGroupname() + "</font>)");
				notify.setType("5");
				notify.setFiles(icg.getAvatar());
				notify.setUnReadNum("1");
				notify.setStatus("1");
				notify.setPower("0");
				notify.setOaNotifyRecordIds(userid);
				oaNotifyService.save(notify);
			}
		}
		return manageUser(groupid, request, response, model);
	}

	/***
	 * 设置群成员为管理员
	 */

	@RequestMapping(value = "setGroupUser")
	public String setGroupUser(String userid, String groupid, String state, HttpServletRequest request,
			HttpServletResponse response, Model model) {

		IimChatGroup icg = groupService.get(groupid);

		List<IimChatGroupUser> gulist = groupUserService.getGroupUserBygroup(icg);
		for (IimChatGroupUser iimChatGroupUser : gulist) {
			if (iimChatGroupUser.getUser().getId().equals(userid)) {
				if (iimChatGroupUser.getState().equals(Constant.group_user_off)) {
					iimChatGroupUser.setState(Constant.group_user_manage);
				} else {
					iimChatGroupUser.setState(Constant.group_user_off);
				}

				groupUserService.save(iimChatGroupUser);
			}
		}
		return manageUser(groupid, request, response, model);
	}

	/***
	 * 群成员关系manageUser
	 */

	@RequestMapping(value = "manageUser")
	public String manageUser(String id, HttpServletRequest request, HttpServletResponse response, Model model) {
		
		List<User> list1 = new ArrayList<User>();
		/**
		 * 群主
		 */
		User user = UserUtils.getUser();
		List<User> quser = groupUserService.getGroupUser(id, Constant.group_user_main);
		for (User uu : quser) {
			User uz = userDao.get(uu.getId());
			uu.setOffice(uz.getOffice());
			uu.setPhone(uz.getPhone());
			if (user.getId().equals(uu.getId())) {
				list1.add(uu);
			}
		}
		for (User uu : quser) {
			User uz = userDao.get(uu.getId());
			uu.setOffice(uz.getOffice());
			uu.setPhone(uz.getPhone());
			if (!user.getId().equals(uu.getId())) {
				list1.add(uu);
			}
		}

		List<User> list2 = new ArrayList<User>();
		/**
		 * 管理员
		 */
		List<User> muser = groupUserService.getGroupUser(id, Constant.group_user_manage);
		for (User uu : muser) {
			User uz = userDao.get(uu.getId());
			uu.setOffice(uz.getOffice());
			uu.setPhone(uz.getPhone());
			if (user.getId().equals(uu.getId())) {
				list2.add(uu);
			}
		}
		for (User uu : muser) {
			User uz = userDao.get(uu.getId());
			uu.setOffice(uz.getOffice());
			uu.setPhone(uz.getPhone());
			if (!user.getId().equals(uu.getId())) {
				list2.add(uu);
			}
		}
		List<User> list3 = new ArrayList<User>();
		/**
		 * 普通人员
		 */

		List<User> uuser = groupUserService.getGroupUser(id, Constant.group_user_off);

		for (User uu : uuser) {
			User uz = userDao.get(uu.getId());
			uu.setOffice(uz.getOffice());
			uu.setPhone(uz.getPhone());
			if (user.getId().equals(uu.getId())) {
				list3.add(uu);
			}
		}
		for (User uu : uuser) {
			User uz = userDao.get(uu.getId());
			uu.setOffice(uz.getOffice());
			uu.setPhone(uz.getPhone());
			if (!user.getId().equals(uu.getId())) {
				list3.add(uu);
			}
		}

		List<IimChatGroupUser> userlist = groupUserService.GetGroupUserbyid(id, user.getId());

		IimChatGroupUser icgu = userlist.get(0);

		IimChatGroup icg = groupService.get(id);

		model.addAttribute("groupid", id);
		model.addAttribute("usergroup", icgu);
		model.addAttribute("group", icg);
		model.addAttribute("list1", list1);
		model.addAttribute("list2", list2);
		model.addAttribute("list3", list3);
		return "modules/iim/manage_User";
	}

	/***
	 * 修改群信息
	 */

	@RequestMapping(value = "updateGroup")
	public String updateGroup(String id, HttpServletRequest request, HttpServletResponse response, Model model) {
		IimChatGroup icg = groupService.get(id);
		model.addAttribute("group", icg);
		return "modules/iim/manage_GroupUpdate";

	}

	// /**
	// * 添加好友--->常用联系人
	// */
	// @RequestMapping(value = "addFriend")
	// public String addFriend(String ids, RedirectAttributes
	// redirectAttributes) {
	// String idArray[] =ids.split(",");
	// User currentUser = UserUtils.getUser();
	// for(String id : idArray){
	// if(userDao.findFriend(currentUser.getId(), id) == null){
	//
	// userDao.insertFriend(IdGen.uuid(), currentUser.getId(), id);//添加对方为好友
	// // userDao.insertFriend(IdGen.uuid(), id,
	// currentUser.getId());//同时把自己添加为对方的好友
	// }
	// }
	// addMessage(redirectAttributes, "添加好友成功");
	// return
	// "redirect:"+Global.getAdminPath()+"/iim/contact/myFriends/?repage";
	// }

	// /**
	// * 删除好友
	// */
	// @RequestMapping(value = "delFriend")
	// public String delFriend(String id, RedirectAttributes redirectAttributes)
	// {
	// User friend = UserUtils.get(id);
	// User currentUser = UserUtils.getUser();
	// if(friend != null && userDao.findFriend(currentUser.getId(),
	// friend.getId()) != null){
	// userDao.deleteFriend(currentUser.getId(), friend.getId());//删除好友
	// // userDao.deleteFriend(friend.getId(),
	// currentUser.getId());//同时把自己从对方的好友列表删除
	// }
	//
	// return
	// "redirect:"+Global.getAdminPath()+"/iim/contact/myFriends/?repage";
	// }

	// /**
	// * 打开我的好友列表--->常用联系人列表
	// * @param user
	// * @param request
	// * @param response
	// * @param model
	// * @return
	// */
	// @RequestMapping(value = "myFriends")
	// public String myFriends(User user, HttpServletRequest request,
	// HttpServletResponse response, Model model) {
	// User currentUser = UserUtils.getUser();
	// List<User> friends = userDao.findFriends(currentUser);
	// model.addAttribute("list", friends);
	// return "modules/iim/myFriends";
	// }

	// /**
	// * 打开聊天窗口
	// * @param user
	// * @param request
	// * @param response
	// * @param model
	// * @return
	// */
	// @RequestMapping(value = "layerIM")
	// public String layerIM(User user, HttpServletRequest request,
	// HttpServletResponse response, Model model) {
	// List<User> list = systemService.findUser(user);
	// model.addAttribute("list", list);
	// return "modules/iim/layerIM";
	// }


	/***
	 * 群组成员接口
	 * 
	 * @param user
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "group")
	@ResponseBody
	public IIMMember getGroupUser(IimChatGroup group, HttpServletRequest request, HttpServletResponse response,
			Model model) {
		IIMMember iimmember = new IIMMember();
		List<User> userlist = groupUserService.getUserBygroup(group);
		List<User> list = new ArrayList<User>();
		IIMMData iimdate = new IIMMData();
		User uiu = UserUtils.getUser();

		User uu = new User();
		uu.setUsername(uiu.getName());
		uu.setId(uiu.getId());
		uu.setAvatar(uiu.getPhoto());
		uu.setSign(uiu.getSign());
		list.add(uu);

		iimmember.setMsg("0");
		for (User user : userlist) {
			if (!user.getId().equals(uiu.getId())) {
				User u = new User();
				u.setUsername(user.getName());
				u.setId(user.getId());
				u.setAvatar(user.getPhoto());
				u.setSign(user.getSign());
				list.add(u);
			}
		}
		iimdate.setList(list);
		iimmember.setData(iimdate);

		// System.out.println(JsonMapper.getInstance().toJson(iimmember));
		return iimmember;
	}

	// @RequestMapping(value="search")
	// @ResponseBody
	// public LayJson getSearch(User user, HttpServletRequest request,
	// HttpServletResponse response, Model model){
	// LayJson j = new LayJson();
	// j.setStatus(1);
	//
	// List<Office> officeList = officeService.findList(true);
	// int index=1;
	// for(Office office : officeList){
	// user.setOffice(office);
	// List<User> users = userDao.findListByOffice(user);
	// Group group = new Group();
	// group.setName(office.getName());
	// group.setNums(users.size());
	// group.setId(++index);
	// for(User u : users){
	// Friend friend = new Friend();
	// friend.setId(u.getLoginName());
	// friend.setName(u.getName());
	// friend.setFace(u.getPhoto());
	// group.getItem().add(friend);
	// }
	// j.getData().add(group);
	// }
	// user.setOffice(null);
	// List<User> users = userDao.findListByOffice(user);
	// Group group = new Group();
	// group.setName("未分组");
	// group.setNums(users.size());
	// group.setId(++index);
	// for(User u : users){
	// Friend friend = new Friend();
	// friend.setId(u.getLoginName());
	// friend.setName(u.getName());
	// friend.setFace(u.getPhoto());
	// group.getItem().add(friend);
	// }
	// j.getData().add(group);
	//
	// return j;
	// }

	// /**
	// * 群组列表接口 预留待开发
	// * @return
	// */
	// @RequestMapping(value="group")
	// @ResponseBody
	// public LayJson getGroup(){
	// LayJson j = new LayJson();
	// j.setStatus(1);
	// return j;
	// }
	// /**
	// * 最近联系人接口 预留
	// * @return
	// */
	// @RequestMapping(value="chatLog")
	// @ResponseBody
	// public LayJson getChatLog(User user, HttpServletRequest request,
	// HttpServletResponse response, Model model){
	// LayJson j = new LayJson();
	// j.setStatus(1);
	//
	// User currentUser = UserUtils.getUser();
	// ChatHistory chatHistory = new ChatHistory();
	// chatHistory.setUserid1(currentUser.getLoginName());
	// chatHistory.setUserid2(currentUser.getLoginName());
	// List<ChatHistory> lch = chatHistoryService.findNearPerson(chatHistory);
	// List<String> lists = new ArrayList<String>();
	// for (ChatHistory ch : lch) {
	// if(!lists.contains(ch.getUserid1())){
	// lists.add(ch.getUserid1());
	// }
	// if(!lists.contains(ch.getUserid2())){
	// lists.add(ch.getUserid2());
	// }
	// }
	//
	// List<User> friends = new ArrayList<User>();
	// for (String ls : lists) {
	// user.setLoginName(ls);
	// friends.add(userDao.findFriendLoginName(user));
	// }
	// //最近联系人
	// //List<User> friends = userDao.findFriends(currentUser);
	// Group friendGroup = new Group();
	// friendGroup.setName("最近联系人");
	// friendGroup.setId(3);
	// friendGroup.setNums(friends.size());
	// for(User u : friends){
	// Friend friend = new Friend();
	// friend.setId(u.getLoginName());
	// friend.setName(u.getName());
	// friend.setFace(u.getPhoto());
	//
	// ChatHistory chatHistory2 = new ChatHistory();
	// chatHistory2.setUserid1(u.getLoginName());
	// chatHistory2.setUserid2(currentUser.getLoginName());
	// SimpleDateFormat sdf = new SimpleDateFormat("MM-dd HH:mm");
	// friend.setTime(sdf.format(chatHistoryService.findNearPerson2(chatHistory2).get(0).getCreateDate()));
	// friendGroup.getItem().add(friend);
	// }
	// j.getData().add(friendGroup);
	// return j;
	// }
	/**
	 * 群组成员接口 预留
	 * 
	 * @return
	 */
	// @RequestMapping(value="groups")
	// @ResponseBody
	// public LayJson getGroups(){
	// LayJson j = new LayJson();
	// j.setStatus(1);
	// return j;
	// }

}