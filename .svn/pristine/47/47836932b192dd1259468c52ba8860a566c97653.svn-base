/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.web;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.oa.entity.OaDocmanage;
import com.thinkgem.jeesite.modules.oa.service.OaDocmanageService;
import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;

/**
 * 栏目管理Controller
 * @author liaijun
 * @version 2016-11-03
 */
@Controller
@RequestMapping(value = "${adminPath}/oa/oaDocmanage")
public class OaDocmanageController extends BaseController {

	@Autowired
	private OaDocmanageService oaDocmanageService;
	
	@ModelAttribute
	public OaDocmanage get(@RequestParam(required=false) String id) {
		OaDocmanage entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = oaDocmanageService.get(id);
		}
		if (entity == null){
			entity = new OaDocmanage();
		}
		return entity;
	}
	/**
	 * 栏目首页
	 * @param oaDocmanage
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
		@RequiresPermissions("oa:oaDocmanage:view")
		@RequestMapping(value = "")
		public String index(OaDocmanage oaDocmanage, HttpServletRequest request, HttpServletResponse response, Model model) {
			
			return "modules/oa/oaDocmanageIndex";
		}
	/**
	 * 栏目列表
	 * @param oaDocmanage
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequiresPermissions("oa:oaDocmanage:view")
	@RequestMapping(value = {"list"})
	public String list(OaDocmanage oaDocmanage, HttpServletRequest request, HttpServletResponse response, Model model) {
		List<OaDocmanage> list = oaDocmanageService.findList(oaDocmanage); 
		for (int i = 0; i < list.size(); i++) {
			String id=list.get(i).getId();
			String uid=list.get(i).getCreateBy().getId();	
			String pid=list.get(i).getParentId();
			
			/*System.out.println("父级编号：------------------"+oaDocmanageService.getpid(pid).get(0).getName());
		*/
			
				User createBy =  UserUtils.get(uid);// 通过用户id获取用户信息
				list.get(i).setCreateBy(createBy);
		}
		model.addAttribute("list", list);
	
		return "modules/oa/oaDocmanageList";
	}
   /**
    * 栏目添加/修改页面
    * @param oaDocmanage
    * @param model
    * @return
    */
	@RequiresPermissions("oa:oaDocmanage:view")
	@RequestMapping(value = "form")
	public String form(OaDocmanage oaDocmanage, Model model) {
		if (oaDocmanage.getParent()!=null && StringUtils.isNotBlank(oaDocmanage.getParent().getId())){
			oaDocmanage.setParent(oaDocmanageService.get(oaDocmanage.getParent().getId()));
			// 获取排序号，最末节点排序号+30
			if (StringUtils.isBlank(oaDocmanage.getId())){
				OaDocmanage oaDocmanageChild = new OaDocmanage();
				oaDocmanageChild.setParent(new OaDocmanage(oaDocmanage.getParent().getId()));
				List<OaDocmanage> list = oaDocmanageService.findList(oaDocmanage); 
				if (list.size() > 0){
					oaDocmanage.setSort(list.get(list.size()-1).getSort());
					if (oaDocmanage.getSort() != null){
						oaDocmanage.setSort(oaDocmanage.getSort() + 30);
					}
				}
			}
		}
		if (oaDocmanage.getSort() == null){
			oaDocmanage.setSort(30);
		}
		model.addAttribute("oaDocmanage", oaDocmanage);
		return "modules/oa/oaDocmanageForm";
	}
    /**
     * 保存栏目信息
     * @param oaDocmanage
     * @param model
     * @param redirectAttributes
     * @return
     */
	@RequiresPermissions("oa:oaDocmanage:edit")
	@RequestMapping(value = "save")
	public String save(OaDocmanage oaDocmanage, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, oaDocmanage)){
			return form(oaDocmanage, model);
		}
		oaDocmanageService.save(oaDocmanage);
		addMessage(redirectAttributes, "保存栏目成功");
		return "redirect:"+Global.getAdminPath()+"/oa/oaDocmanage/list?repage";
	}
	
	@RequiresPermissions("oa:oaDocmanage:edit")
	@RequestMapping(value = "delete")
	public String delete(OaDocmanage oaDocmanage, RedirectAttributes redirectAttributes) {
		oaDocmanageService.delete(oaDocmanage);
		addMessage(redirectAttributes, "删除栏目成功");
		return "redirect:"+Global.getAdminPath()+"/oa/oaDocmanage/list?repage";
	}
/**
 * 获取树结构json数据
 * @param extId
 * @param response
 * @return
 */
	@RequiresPermissions("user")
	@ResponseBody
	@RequestMapping(value = "treeData")
	public List<Map<String, Object>> treeData(@RequestParam(required=false) String extId, HttpServletResponse response) {
		List<Map<String, Object>> mapList = Lists.newArrayList();
		List<OaDocmanage> list = oaDocmanageService.findList(new OaDocmanage());
		for (int i=0; i<list.size(); i++){
			OaDocmanage e = list.get(i);
			if (StringUtils.isBlank(extId) || (extId!=null && !extId.equals(e.getId()) && e.getParentIds().indexOf(","+extId+",")==-1)){
				Map<String, Object> map = Maps.newHashMap();
				map.put("id", e.getId());
				map.put("pId", e.getParentId());
				map.put("name", e.getName());
				mapList.add(map);
			}
		}
		return mapList;
	}
	
}