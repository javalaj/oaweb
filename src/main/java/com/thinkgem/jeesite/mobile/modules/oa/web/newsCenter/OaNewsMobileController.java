package com.thinkgem.jeesite.mobile.modules.oa.web.newsCenter;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.oa.entity.newscenter.OaNews;
import com.thinkgem.jeesite.modules.oa.service.newscenter.OaNewsService;
import com.thinkgem.jeesite.modules.oa.web.newscenter.util.NewsUtils;
/**
 * 新闻中心Controller
 * @author zf
 * @version 2017-05-24
 */
@Controller
@RequestMapping(value = "${adminPath}${mobilePath}/oa/newscenter/oaNews")
public class OaNewsMobileController extends BaseController {
	
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
	 * 新闻中心列表页面
	 */
	@RequiresPermissions("oa:newscenter:oaNews:list")
	@RequestMapping(value = {"newsList"})
	public String newsList(OaNews oaNews, HttpServletRequest request, HttpServletResponse response, Model model) 
	{
		//发布
		oaNews.setStatus("1");
		
		List<OaNews> list = oaNewsService.findList(oaNews); 
		
		String tabs = NewsUtils.getMobileTabs(oaNews, request);
		
		model.addAttribute("list", list);
		
		model.addAttribute("tabs", tabs);
		
		return "mobile/modules/oa/newsCenter/newsList";
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

		return "mobile/modules/oa/newsCenter/oaNewsView";
	}
	
	
	/** OaNews业务层 */
	@Autowired
	private OaNewsService oaNewsService;
}
