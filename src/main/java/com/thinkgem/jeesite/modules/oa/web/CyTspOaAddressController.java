package com.thinkgem.jeesite.modules.oa.web;

import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.utils.DateUtils;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.utils.excel.ExportExcel;
import com.thinkgem.jeesite.common.utils.excel.ImportExcel;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.oa.entity.CyTspOaAddress;
import com.thinkgem.jeesite.modules.oa.entity.CyTspOaAddressGroup;
import com.thinkgem.jeesite.modules.oa.service.CyTspOaAddressGroupService;
import com.thinkgem.jeesite.modules.oa.service.CyTspOaAddressService;
import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;

@Controller
@RequestMapping(value = "${adminPath}/oa/adress")
public class CyTspOaAddressController extends BaseController {

	@Autowired
	CyTspOaAddressService cytspoaaddressservice;
	@Autowired
	CyTspOaAddressGroupService cytspoaaddressgroupservice;
	@RequestMapping(value = "contactsss")
	public String indexListss(CyTspOaAddress cytspoaaddress, Model model, HttpServletRequest request,
			HttpServletResponse response) {
		// 获取当前用户登入的ID
		String id = cytspoaaddress.getCurrentUser().getId();
		String groupId = request.getParameter("groupId");
		if (groupId == null) {
			cytspoaaddress.setUrseId(id);
			Page<CyTspOaAddress> page = cytspoaaddressservice
					.findList_Oadress(new Page<CyTspOaAddress>(request, response), cytspoaaddress);
			model.addAttribute("page", page);
			// 查询分组列表
			List<CyTspOaAddressGroup> cytspoaaddressgrouplist = cytspoaaddressgroupservice.getCyTspOaAddressGroup(id);
			model.addAttribute("cytspoaaddressgrouplist", cytspoaaddressgrouplist);
			model.addAttribute("cytspoaaddress", cytspoaaddress);
		} else {
			cytspoaaddress.setUrseId(id);
			cytspoaaddress.setGroupId(Integer.valueOf(groupId));
			Page<CyTspOaAddress> page = cytspoaaddressservice
					.findList_Oadress(new Page<CyTspOaAddress>(request, response), cytspoaaddress);
			model.addAttribute("page", page);
			// 查询分组列表
			List<CyTspOaAddressGroup> cytspoaaddressgrouplist = cytspoaaddressgroupservice.getCyTspOaAddressGroup(id);
			model.addAttribute("cytspoaaddressgrouplist", cytspoaaddressgrouplist);
			model.addAttribute("cytspoaaddress", cytspoaaddress);
		}
		return "modules/sys/contactsList";
	}

	/**
	 * 
	 * 
	 * 查询个人通讯录
	 */
	@RequestMapping(value = "contacts")
	public String indexList(CyTspOaAddress cytspoaaddress, Model model, HttpServletRequest request,
			HttpServletResponse response) {
		// 获取当前用户登入的ID
		String id = UserUtils.getUser().getId();
		String groupId = request.getParameter("groupId");
		if (StringUtils.isBlank(groupId)) {
			cytspoaaddress.setUrseId(id);
			Page<CyTspOaAddress> page = cytspoaaddressservice
					.findList_Oadress(new Page<CyTspOaAddress>(request, response), cytspoaaddress);
			model.addAttribute("page", page);
			// 查询分组列表
			List<CyTspOaAddressGroup> cytspoaaddressgrouplist = cytspoaaddressgroupservice.getCyTspOaAddressGroup(id);
			model.addAttribute("cytspoaaddressgrouplist", cytspoaaddressgrouplist);
			model.addAttribute("cytspoaaddress", cytspoaaddress);
		} else {
			cytspoaaddress.setUrseId(id);
			cytspoaaddress.setGroupId(Integer.valueOf(groupId));
			Page<CyTspOaAddress> page = cytspoaaddressservice
					.findList_Oadress(new Page<CyTspOaAddress>(request, response), cytspoaaddress);
			model.addAttribute("page", page);
			// 查询分组列表
			List<CyTspOaAddressGroup> cytspoaaddressgrouplist = cytspoaaddressgroupservice.getCyTspOaAddressGroup(id);
			model.addAttribute("cytspoaaddressgrouplist", cytspoaaddressgrouplist);
			model.addAttribute("cytspoaaddress", cytspoaaddress);
		}
		/**
		 * 获取分组信息
		 */
		CyTspOaAddressGroup cyTspOaAddressGroup = new CyTspOaAddressGroup();
		cyTspOaAddressGroup.setUserId(UserUtils.getUser().getId());
		List<CyTspOaAddressGroup> treeList = cytspoaaddressgroupservice.findList(cyTspOaAddressGroup);
		model.addAttribute("treeList", treeList);
		return "modules/sys/contactsList";
	}
	@RequestMapping(value = "form")
	public String form(CyTspOaAddress cytspoaaddress,Model model) {
		/**
		 * 获取分组信息
		 */
		CyTspOaAddressGroup cyTspOaAddressGroup = new CyTspOaAddressGroup();
		cyTspOaAddressGroup.setUserId(UserUtils.getUser().getId());
		List<CyTspOaAddressGroup> treeList = cytspoaaddressgroupservice.findList(cyTspOaAddressGroup);
		model.addAttribute("treeList", treeList);
		if(cytspoaaddress.getId()!=null){
			cytspoaaddress=cytspoaaddressservice.getcytspoaaddress(cytspoaaddress.getId());
			CyTspOaAddressGroup cytspoaaddressgroup =cytspoaaddressgroupservice.get(String.valueOf(cytspoaaddress.getGroupId()));
			model.addAttribute("cytspoaaddressgroup", cytspoaaddressgroup);
		}
		model.addAttribute("cytspoaaddress", cytspoaaddress);
		return "modules/sys/contactsForm";
	}
	@RequestMapping(value = "groupform")
	public String groupform(CyTspOaAddressGroup cytspoaaddressgroup,Model model) {
		model.addAttribute("cytspoaaddressgroup", cytspoaaddressgroup);
		return "modules/sys/groupForm";
	}
	
	

	/**
	 * 分享联系人
	 */
	@RequestMapping(value = "share")
	public String ShareContacts(CyTspOaAddress cytspoaaddress, RedirectAttributes redirectAttributes,
			HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		String shareFlagUserId = cytspoaaddress.getCurrentUser().getId();// 分享人ID
		Integer flag = 0;
		cytspoaaddressservice.ShareContacts(flag, id, shareFlagUserId);
		addMessage(redirectAttributes, "分享成功");
		return "redirect:" + adminPath + "/oa/adress/contacts";
	}

	/**
	 * 共享联系人列表
	 */
	@RequestMapping(value = "ShareContactsList")
	public String ShareContactsList(CyTspOaAddress cytspoaaddress, Model model, HttpServletRequest request,
			HttpServletResponse response) {
		Page<CyTspOaAddress> page = cytspoaaddressservice
				.findList_ShareContactsList(new Page<CyTspOaAddress>(request, response), cytspoaaddress);
		model.addAttribute("page", page);
		return "modules/sys/shareContactsList";
	}

	/**
	 * 取消共享
	 * 
	 */
	@RequestMapping(value = "offShare")
	public String OffShare(CyTspOaAddress cytspoaaddress, RedirectAttributes redirectAttributes,
			HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		String shareFlagUserId = cytspoaaddress.getCurrentUser().getId();// 分享人ID
		Integer flag = 1;

		boolean fflag = cytspoaaddressservice.offShare(flag, id, shareFlagUserId);
		if (fflag == false) {
			addMessage(redirectAttributes, "取消失败,当前联系人不是您分享的");
		} else {
			addMessage(redirectAttributes, "取消成功");
		}
		return "redirect:" + adminPath + "/oa/adress/ShareContactsList";
	}

	/**
	 * 通讯录导出
	 */
	@RequestMapping(value = "export", method = RequestMethod.POST)
	public String exportFile(CyTspOaAddress cytspoaaddress, HttpServletRequest request, HttpServletResponse response,
			RedirectAttributes redirectAttributes) {
		try {
			String fileName = "通讯录数据" + DateUtils.getDate("yyyyMMddHHmmss") + ".xlsx";
			Page<CyTspOaAddress> page = cytspoaaddressservice
					.findoaAdress(new Page<CyTspOaAddress>(request, response, -1), cytspoaaddress);
			   ExportExcel exportExcel=new ExportExcel("通讯录数据", CyTspOaAddress.class).setDataList(page.getList());
	            exportExcel.write(response, fileName).dispose();
//			new ExportExcel("通讯录数据", CyTspOaAddress.class).setDataList(page.getList()).write(response, fileName)
//					.dispose();
			return null;
		} catch (Exception e) {
			addMessage(redirectAttributes, "导出通讯录失败！失败信息：" + e.getMessage());
		}
		return "redirect:" + adminPath + "/oa/adress/contacts";
	}

	/**
	 * 共享通讯录导出
	 */
	@RequestMapping(value = "export1", method = RequestMethod.POST)
	public String exportFile1(CyTspOaAddress cytspoaaddress, HttpServletRequest request, HttpServletResponse response,
			RedirectAttributes redirectAttributes) {
		try {
			String fileName = "共享通讯录数据" + DateUtils.getDate("yyyyMMddHHmmss") + ".xlsx";
			Page<CyTspOaAddress> page = cytspoaaddressservice
					.findoaAdressShaer(new Page<CyTspOaAddress>(request, response, -1), cytspoaaddress);
			   ExportExcel exportExcel=new ExportExcel("通讯录数据", CyTspOaAddress.class).setDataList(page.getList());
	            exportExcel.write(response, fileName).dispose();
//			new ExportExcel("通讯录数据", CyTspOaAddress.class).setDataList(page.getList()).write(response, fileName)
//					.dispose();
			return null;
		} catch (Exception e) {
			addMessage(redirectAttributes, "共享导出通讯录失败！失败信息：" + e.getMessage());
		}
		return "redirect:" + adminPath + "/oa/adress/ShareContactsList";
	}

	/**
	 * 导入录通讯录
	 */
	@RequestMapping(value = "import1", method = RequestMethod.POST)
	public String importFile(MultipartFile file, RedirectAttributes redirectAttributes) {
		if (Global.isDemoMode()) {
			addMessage(redirectAttributes, "演示模式，不允许操作！");
			return "redirect:" + adminPath + "/oa/adress/contacts";
		}
		try {
			int successNum = 0;
			StringBuilder failureMsg = new StringBuilder();
			ImportExcel ei = new ImportExcel(file, 1, 0);
			List<CyTspOaAddress> list = ei.getDataList(CyTspOaAddress.class);
			for (int i = 0; i < list.size(); i++) {
				CyTspOaAddress cytspoaaddress = list.get(i);
				String id = cytspoaaddress.getCurrentUser().getId();
				UUID uuid = UUID.randomUUID();
				cytspoaaddress.setId(uuid + "");
				cytspoaaddress.setUrseId(id);
				cytspoaaddress.setGroupId(1);
				cytspoaaddress.setDeleFlag(0);
				cytspoaaddress.setShareFlag(1);
				cytspoaaddressservice.insert(cytspoaaddress);
				successNum++;
			}
			addMessage(redirectAttributes, "已成功导入 " + successNum + " 条用户" + failureMsg);
		} catch (Exception e) {
			e.printStackTrace();
			addMessage(redirectAttributes, "导入通讯录失败！失败信息：" + e.getMessage());
		}
		return "redirect:" + adminPath + "/oa/adress/contacts";
	}

	/**
	 * 下载通讯录摸版
	 */
	@RequestMapping(value = "import/template")
	public String importFileTemplate(HttpServletResponse response, RedirectAttributes redirectAttributes,
			CyTspOaAddress cytspoaaddress) {
		try {
			String fileName = "通讯录数据导入模板.xlsx";
			List<CyTspOaAddress> list = Lists.newArrayList();
			cytspoaaddress.setName("张三");
			cytspoaaddress.setPosition("java开发工程师");
			cytspoaaddress.setCompany("研发部");
			cytspoaaddress.setOph("027-8888888");
			cytspoaaddress.setIphone("1388888888");
			cytspoaaddress.setOfaddress("601");
			cytspoaaddress.setQq("888888888");
			cytspoaaddress.setEmail("8888@163.com");
			list.add(cytspoaaddress);

			new ExportExcel("通讯录", CyTspOaAddress.class, 2).setDataList(list).write(response, fileName).dispose();
			return null;
		} catch (Exception e) {
			addMessage(redirectAttributes, "导入模板下载失败！失败信息：" + e.getMessage());
		}
		return "redirect:" + adminPath + "/oa/adress/contacts";
	}

	/**
	 * 新建联系人
	 */
	@RequestMapping(value = "save", method = RequestMethod.POST, produces = "text/html;charset=utf-8")
	public String saver(CyTspOaAddress cytspoaaddress, Model model, HttpServletRequest request,
			HttpServletResponse responsem, RedirectAttributes redirectAttributes) {
		if(cytspoaaddress.getId().equals("")||cytspoaaddress.getId()==null){
			String id = cytspoaaddress.getCurrentUser().getId();// 当前用户登入id
			UUID uuid = UUID.randomUUID();// 实用64编码ID保证数据库数据ID唯一
			String name = request.getParameter("name");// 名字
			String company = request.getParameter("company");// 部门
			String position = request.getParameter("position");// 岗位
			String iphone = request.getParameter("iphone");// 电话
			String oph = request.getParameter("oph");// 办公电话
			String qq = request.getParameter("qq");// QQ
			String email = request.getParameter("email");// 邮箱
			String ofaddress = request.getParameter("ofaddress");// 办公地点
			String grouid = request.getParameter("select");
			if (grouid.equals("0")) {
				grouid = 1 + "";
			}
			cytspoaaddress.setId(uuid + "");
			cytspoaaddress.setUrseId(id);
			cytspoaaddress.setGroupId(Integer.valueOf(grouid));// 分组id
			cytspoaaddress.setName(name);
			cytspoaaddress.setCompany(company);
			cytspoaaddress.setPosition(position);
			cytspoaaddress.setIphone(iphone);
			cytspoaaddress.setOph(oph);
			cytspoaaddress.setQq(qq);
			cytspoaaddress.setEmail(email);
			cytspoaaddress.setOfaddress(ofaddress);
			cytspoaaddress.setShareFlag(1);// 共享：1（不共享），0（共享）
			cytspoaaddress.setDeleFlag(0);// 回收站：0（未进入回收站）,1(进入回收站)
			cytspoaaddressservice.insertContacts(cytspoaaddress);
			addMessage(redirectAttributes, "添加联系人成功");
		}else{
			String grouid = request.getParameter("select");
			if (grouid.equals("0")) {
				grouid = 1 + "";
			}
			cytspoaaddress.setGroupId(Integer.valueOf(grouid));// 分组id
			cytspoaaddressservice.upaddress(cytspoaaddress);
			addMessage(redirectAttributes, "修改联系人成功");
		}
		return "redirect:" + adminPath + "/oa/adress/contacts";
	}
	/**
	 * 验证表单数据
	 * @param cytspoaaddress
	 * @param model
	 * @return
	 */
	@RequestMapping(value="formCheck")
	@ResponseBody
	public List<CyTspOaAddress> formCheck(CyTspOaAddress cytspoaaddress, Model model, HttpServletRequest request,
			HttpServletResponse response){
		cytspoaaddress.setUrseId(cytspoaaddress.getCurrentUser().getId());
		List<CyTspOaAddress> checkList = cytspoaaddressservice.findList_Oadress(cytspoaaddress);
		return checkList;
	}
	@RequestMapping(value="formCheckGroup")
	@ResponseBody
	public List<CyTspOaAddressGroup> formCheckGroup(CyTspOaAddressGroup cytspoaaddressgroup, Model model, HttpServletRequest request,
			HttpServletResponse response){
		cytspoaaddressgroup.setUserId(cytspoaaddressgroup.getCurrentUser().getId());
		List<CyTspOaAddressGroup> checkList = cytspoaaddressgroupservice.getGroupName(cytspoaaddressgroup);
		return checkList;
	}
	/**
	 * 新建分组
	 */
	@RequestMapping(value = "saveGroup", method = RequestMethod.POST)
	public String saveGroup(CyTspOaAddressGroup cytspoaaddressgroup, HttpServletRequest request,
			HttpServletResponse response, RedirectAttributes redirectAttributes, Model model) {
		String userId = cytspoaaddressgroup.getCurrentUser().getId();// 当前用户登入id
		cytspoaaddressgroupservice.insertGroup(userId, cytspoaaddressgroup.getName());
		addMessage(redirectAttributes, "新建分组成功");
		return "redirect:" + adminPath + "/oa/adress/contacts";

	}

	// 删除联系人
	@RequestMapping(value = "deletemore", method = RequestMethod.POST)
	public String deleteMore(HttpServletRequest request, HttpServletResponse response,
			RedirectAttributes redirectAttributes, CyTspOaAddress cytspoaaddress) {
		String items = request.getParameter("delitems");
		String[] item = items.split(",");
		for (int i = 0; i < item.length; i++) {
			cytspoaaddress.setId(item[i]);
			cytspoaaddressservice.delete(cytspoaaddress);
		}
		addMessage(redirectAttributes, "删除联系人成功");
		return "redirect:" + adminPath + "/oa/adress/contacts";
	}

	@RequestMapping(value = "all")
	public String all(CyTspOaAddress cytspoaaddress, Model model, HttpServletRequest request,
			HttpServletResponse response) {
		cytspoaaddress.setUrseId(cytspoaaddress.getCurrentUser().getId());

		List<CyTspOaAddress> page = cytspoaaddressservice.findList_Oadress(cytspoaaddress);
		model.addAttribute("page", page);
		return "modules/sys/allContactsList";
	}

	/**
	 * 
	 * 更新组的名称
	 * 
	 */
	@RequestMapping(value = "updateGroup")
	public String updateGroup(CyTspOaAddressGroup cyTspOaAddressGroup) {
		try {
			cyTspOaAddressGroup.setName(java.net.URLDecoder.decode(cyTspOaAddressGroup.getName(), "UTF-8"));
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		cytspoaaddressgroupservice.updateGroup(cyTspOaAddressGroup);
		return "redirect:" + adminPath + "/oa/adress/contacts";
	}

	/**
	 * 
	 * 删除分组
	 * 
	 */
	@RequestMapping(value = "deleteGroup")
	public String deleteGroup(CyTspOaAddressGroup cyTspOaAddressGroup,CyTspOaAddress cytspoaaddress) {
		cytspoaaddressgroupservice.deleteGroup(cyTspOaAddressGroup);
		return "redirect:" + adminPath + "/oa/adress/contacts";
	}
}
