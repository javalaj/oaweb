/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.mobile.modules.oa.web.contact;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.oa.entity.CyTspOaAddress;
import com.thinkgem.jeesite.modules.oa.entity.CyTspOaAddressGroup;
import com.thinkgem.jeesite.modules.oa.service.CyTspOaAddressGroupService;
import com.thinkgem.jeesite.modules.oa.service.CyTspOaAddressService;
import com.thinkgem.jeesite.modules.sys.entity.Office;
import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.modules.sys.service.OfficeService;
import com.thinkgem.jeesite.modules.sys.service.SystemService;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;

/**
 * @author ThinkGem
 * @version 2013-8-29
 */
@Controller
@RequestMapping(value = "${adminPath}${mobilePath}/oa/contact/oaContact")
public class OaContactMController extends BaseController {

	@Autowired
	private SystemService systemService;
	
	@Autowired
	private OfficeService officeService;
	
	
	@Autowired
	private CyTspOaAddressGroupService cyTspOaAddressGroupService;
	
	
	@Autowired
	private CyTspOaAddressService cyTspOaAddressService;
	
	
//	@ModelAttribute
//	public User get(@RequestParam(required=false) String id) {
//		if (StringUtils.isNotBlank(id)){
//			return systemService.getUser(id);
//		}else{
//			return new User();
//		}
//	}

	@RequestMapping(value = {"/company/list", ""})
	public String companyList(Model model) {
		List<Office> offices=officeService.findAll();
		List<Map<String, Object>> lists=new ArrayList<Map<String, Object>>();
		for (Office office : offices) {
			String officeId=office.getId();
			List<User> users=systemService.findUserByOfficeId(officeId);
			
			if(users!=null&&users.size()>0){
				Map<String, Object> map=new HashMap<String, Object>();
				map.put("office", office);
				map.put("users", users);
				lists.add(map);
			}
		}
		model.addAttribute("lists", lists);
		return "mobile/modules/oa/contact/oaContactCompanyList";
	}
	
	@RequestMapping(value = {"/user/list"})
	public String userList(Model model) {
		List<CyTspOaAddressGroup> cyTspOaAddressGroups=cyTspOaAddressGroupService.getCyTspOaAddressGroup(UserUtils.getUser().getId());
		List<Map<String, Object>> lists=new ArrayList<Map<String, Object>>();
		for (CyTspOaAddressGroup cyTspOaAddressGroup : cyTspOaAddressGroups) {
			String cyTspOaAddressGroupId=cyTspOaAddressGroup.getGroupId()+"";
			
			List<CyTspOaAddress> cyTspOaAddresses=cyTspOaAddressService.findAllOaAdressByGroupId(cyTspOaAddressGroupId);
			if(cyTspOaAddresses!=null&&cyTspOaAddresses.size()>0){
				Map<String, Object> map=new HashMap<String, Object>();
				map.put("cyTspOaAddressGroup", cyTspOaAddressGroup);
				map.put("cyTspOaAddresses", cyTspOaAddresses);
				lists.add(map);
			}
		}
		model.addAttribute("lists", lists);
		return "mobile/modules/oa/contact/oaContactUserList";
	}
	
	@RequestMapping(value = {"/user/form"})
	public String userform(Model model) {
		List<CyTspOaAddressGroup> cyTspOaAddressGroups=cyTspOaAddressGroupService.getCyTspOaAddressGroup(UserUtils.getUser().getId());
		model.addAttribute("cyTspOaAddressGroups", cyTspOaAddressGroups);
		model.addAttribute("cyTspOaAddress", new CyTspOaAddress());
		return "mobile/modules/oa/contact/oaContactUserForm";
	}
	
	@RequestMapping(value = {"/user/save"})
	public String userSave(Model model,CyTspOaAddress cyTspOaAddress, RedirectAttributes redirectAttributes) {
		UUID uuid=UUID.randomUUID();//实用64编码ID保证数据库数据ID唯一
		cyTspOaAddress.setId(uuid+"");
		cyTspOaAddress.setUrseId(UserUtils.getUser().getId());
		cyTspOaAddress.setShareFlag(1);//共享：1（不共享），0（共享）
		cyTspOaAddress.setDeleFlag(0);//回收站：0（未进入回收站）,1(进入回收站)
		cyTspOaAddressService.insertContacts(cyTspOaAddress);
		addMessage(redirectAttributes, "保存成功");
		return "redirect:"+Global.getAdminPath()+Global.getMobilePath()+ "/oa/contact/oaContact/user/list";
	}
	
	@RequestMapping(value = {"/share/list"})
	public String shareList(Model model) {
		List<CyTspOaAddress> cyTspOaAddresses=cyTspOaAddressService.findAllShareOaAdress(null);
		model.addAttribute("cyTspOaAddresses", cyTspOaAddresses);
		return "mobile/modules/oa/contact/oaContactShareList";
	}
    
}
