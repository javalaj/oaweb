/**
 * Copyright &copy; 2012-2025 <a href="https://www.chuyutech.com">JeeCY</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.web.newscenter;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.ConstraintViolationException;

import org.apache.shiro.authz.annotation.Logical;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.common.collect.Lists;
import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.utils.DateUtils;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.utils.excel.ExportExcel;
import com.thinkgem.jeesite.common.utils.excel.ImportExcel;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.oa.entity.newscenter.OaNews;
import com.thinkgem.jeesite.modules.oa.service.newscenter.OaNewsService;
import com.thinkgem.jeesite.modules.oa.web.newscenter.util.NewsUtils;
import com.thinkgem.jeesite.modules.user.entity.UserFavorite;
import com.thinkgem.jeesite.modules.user.service.UserFavoriteService;


/**
 * 新闻中心Controller
 * @author zf
 * @version 2017-05-24
 */
@Controller
@RequestMapping(value = "${adminPath}/oa/newscenter/oaNews")
public class OaNewsController extends BaseController {

	/**
	 * 获取新闻中心对象
	 */
	@ModelAttribute
	public OaNews get(@RequestParam(required=false) String id) {
		OaNews entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = oaNewsService.get(id);
		}
		if (entity == null){
			entity = new OaNews();
		}
		return entity;
	}
	
	//绑定对象属性
	@InitBinder("oaNews")
	public void initBinder(WebDataBinder binder)
	{
		binder.setFieldDefaultPrefix("oaNews.");
	}
	
	/**
	 * 文章管理列表页面
	 */
	@RequiresPermissions("oa:newscenter:oaNews:list")
	@RequestMapping(value = {"list", ""})
	public String list(OaNews oaNews, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<OaNews> page = oaNewsService.findPage(new Page<OaNews>(request, response), oaNews); 
		model.addAttribute("page", page);
		return "modules/oa/newscenter/oaNewsList";
	}

	/**
	 * 新闻中心列表页面
	 */
	@RequiresPermissions("oa:newscenter:oaNews:list")
	@RequestMapping(value = {"newsList"})
	public String newsList(OaNews oaNews, HttpServletRequest request, HttpServletResponse response, Model model) 
	{
		//发布
		oaNews.setStatus("1");
		
		Page<OaNews> page = oaNewsService.findPage(new Page<OaNews>(request, response), oaNews); 
		
		String tabs = NewsUtils.getTabs(oaNews,request);
		
		model.addAttribute("page", page);
		
		model.addAttribute("tabs", tabs);
		
		return "modules/oa/newscenter/newsList";
	}
	
	/**
	 * 查看，增加，编辑新闻中心表单页面
	 */
	@RequiresPermissions(value={"oa:newscenter:oaNews:view","oa:newscenter:oaNews:add","oa:newscenter:oaNews:edit"},logical=Logical.OR)
	@RequestMapping(value = "form")
	public String form(OaNews oaNews, Model model) {
		model.addAttribute("oaNews", oaNews);
		return "modules/oa/newscenter/oaNewsForm";
	}

	/**
	 * 记录浏览量
	 */
	@RequiresPermissions(value={"oa:newscenter:oaNews:view"})
	@RequestMapping(value = "view")
	public String view(OaNews oaNews, Model model) 
	{
		Integer num = oaNews.getPageView();
		
		num++;
		
		oaNews.setPageView(num);
		
		oaNewsService.save(oaNews);
		
		model.addAttribute("oaNews", oaNews);

		return "modules/oa/newscenter/oaNewsView";
	}
	
	/**
	 * 保存文章
	 */
	@RequiresPermissions(value={"oa:newscenter:oaNews:add","oa:newscenter:oaNews:edit"},logical=Logical.OR)
	@RequestMapping(value = "save")
	public String save(OaNews oaNews, Model model, RedirectAttributes redirectAttributes) throws Exception{
		if (!beanValidator(model, oaNews)){
			return form(oaNews, model);
		}
		
		if (StringUtils.isBlank(oaNews.getId()))
			addMessage(redirectAttributes, "保存文章成功");
		else
			addMessage(redirectAttributes, "修改文章成功");
		
		if(!oaNews.getIsNewRecord())
		{//编辑表单保存
			oaNews.preUpdate();
			
			oaNewsService.save(oaNews);//更新
		}
		else
		{//新增表单保存
			oaNewsService.save(oaNews);//保存
		}
		return "redirect:"+Global.getAdminPath()+"/oa/newscenter/oaNews/?repage";
	}
	
	/**
	 * 删除文章
	 */
	@RequiresPermissions("oa:newscenter:oaNews:del")
	@RequestMapping(value = "delete")
	public String delete(OaNews oaNews, RedirectAttributes redirectAttributes) {
		oaNewsService.delete(oaNews);
		addMessage(redirectAttributes, "删除文章成功");
		return "redirect:"+Global.getAdminPath()+"/oa/newscenter/oaNews/?repage";
	}
	
	/**
	 * 批量删除文章
	 */
	@RequiresPermissions("oa:newscenter:oaNews:del")
	@RequestMapping(value = "deleteAll")
	public String deleteAll(String ids, RedirectAttributes redirectAttributes) {
		String idArray[] =ids.split(",");
		for(String id : idArray){
			oaNewsService.delete(oaNewsService.get(id));
		}
		addMessage(redirectAttributes, "删除文章成功");
		return "redirect:"+Global.getAdminPath()+"/oa/newscenter/oaNews/?repage";
	}
	
	/**
	 * 批量收藏新闻
	 * 
	 * @param request
	 * @param response
	 * @param redirectAttributes
	 * @return
	 */
	/*@RequiresPermissions("oa:oaNotify:edit")*/
	@RequestMapping(value = "/storeNews")
	public String storeNews(String ids,
			RedirectAttributes redirectAttributes) {
		//String items = request.getParameter("delitem");
		String[] item = ids.split(",");
		for (int i = 0; i < item.length; i++) {
			OaNews oaNews = oaNewsService.get(item[i]);
			String title = oaNews.getTitle();
			String type = "新闻";
			String sign = item[i];
			String url = "/oa/newscenter/oaNews/view?id=" + item[i];
			UserFavorite userFavorite = new UserFavorite();
			userFavorite.setTitle(title);// 设置收藏标题
			userFavorite.setType(type);// 设置收藏类型
			userFavorite.setUrl(url);// 设置收藏url
			userFavorite.setSign(sign);
			userFavoriteService.save(userFavorite);
		}
		addMessage(redirectAttributes, "收藏成功！");	
		return "redirect:list";
	}
	
	/**
	 * 导出excel文件
	 */
	@RequiresPermissions("oa:newscenter:oaNews:export")
    @RequestMapping(value = "export", method=RequestMethod.POST)
    public String exportFile(OaNews oaNews, HttpServletRequest request, HttpServletResponse response, RedirectAttributes redirectAttributes) {
		try {
            String fileName = "新闻中心"+DateUtils.getDate("yyyyMMddHHmmss")+".xlsx";
            Page<OaNews> page = oaNewsService.findPage(new Page<OaNews>(request, response, -1), oaNews);
    		new ExportExcel("新闻中心", OaNews.class).setDataList(page.getList()).write(response, fileName).dispose();
    		return null;
		} catch (Exception e) {
			addMessage(redirectAttributes, "导出新闻中心记录失败！失败信息："+e.getMessage());
		}
		return "redirect:"+Global.getAdminPath()+"/oa/newscenter/oaNews/?repage";
    }

	/**
	 * 导入Excel数据
	 */
	@RequiresPermissions("oa:newscenter:oaNews:import")
    @RequestMapping(value = "import", method=RequestMethod.POST)
    public String importFile(MultipartFile file, RedirectAttributes redirectAttributes) {
		try {
			int successNum = 0;
			int failureNum = 0;
			StringBuilder failureMsg = new StringBuilder();
			ImportExcel ei = new ImportExcel(file, 1, 0);
			List<OaNews> list = ei.getDataList(OaNews.class);
			for (OaNews oaNews : list){
				try{
					oaNewsService.save(oaNews);
					successNum++;
				}catch(ConstraintViolationException ex){
					failureNum++;
				}catch (Exception ex) {
					failureNum++;
				}
			}
			if (failureNum>0){
				failureMsg.insert(0, "，失败 "+failureNum+" 条新闻中心记录。");
			}
			addMessage(redirectAttributes, "已成功导入 "+successNum+" 条新闻中心记录"+failureMsg);
		} catch (Exception e) {
			addMessage(redirectAttributes, "导入新闻中心失败！失败信息："+e.getMessage());
		}
		return "redirect:"+Global.getAdminPath()+"/oa/newscenter/oaNews/?repage";
    }
	
	/**
	 * 下载导入新闻中心数据模板
	 */
	@RequiresPermissions("oa:newscenter:oaNews:import")
    @RequestMapping(value = "import/template")
    public String importFileTemplate(HttpServletResponse response, RedirectAttributes redirectAttributes) {
		try {
            String fileName = "新闻中心数据导入模板.xlsx";
    		List<OaNews> list = Lists.newArrayList(); 
    		new ExportExcel("新闻中心数据", OaNews.class, 1).setDataList(list).write(response, fileName).dispose();
    		return null;
		} catch (Exception e) {
			addMessage(redirectAttributes, "导入模板下载失败！失败信息："+e.getMessage());
		}
		return "redirect:"+Global.getAdminPath()+"/oa/newscenter/oaNews/?repage";
    }
 
 	/*-------------------------------------参数--------------------------------------------*/
	
	/** OaNews业务层 */
	@Autowired
	private OaNewsService oaNewsService;
    
	@Autowired
	private UserFavoriteService userFavoriteService;
}