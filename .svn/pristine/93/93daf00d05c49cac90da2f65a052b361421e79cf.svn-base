/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.mobile.modules.oa.web.contract;

import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.ConstraintViolationException;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.common.collect.Lists;
import com.thinkgem.jeesite.common.beanvalidator.BeanValidators;
import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.utils.excel.ExportExcel;
import com.thinkgem.jeesite.common.utils.excel.ImportExcel;
import com.thinkgem.jeesite.modules.oa.entity.contract.OaContractSales;
import com.thinkgem.jeesite.modules.oa.entity.project.OaProject;
import com.thinkgem.jeesite.modules.oa.service.contract.OaContractSalesService;
import com.thinkgem.jeesite.modules.oa.service.project.OaProjectService;
import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.modules.sys.service.SystemService;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;

/**
 * 销售合同管理Controller
 * @author 李廷龙
 * @version 2016-12-12
 */
@Controller
@RequestMapping(value = "${adminPath}${mobilePath}/oa/contract/oaContractSales")
public class OaContractSalesMController extends BaseController {
	public static final String MOBILE_ROOT="mobile/";
	@Autowired
	private OaContractSalesService oaContractSalesService;
	@Autowired
	private OaProjectService oaProjectService;
	@Autowired
	SystemService systemService;
	
	@ModelAttribute
	public OaContractSales get(@RequestParam(required=false) String id) {
		OaContractSales entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = oaContractSalesService.get(id);
		}
		if (entity == null){
			entity = new OaContractSales();
		}
		return entity;
	}
	
	@RequiresPermissions("oa:contract:oaContractSales:view")
	@RequestMapping(value = {"list", ""})
	public String list(OaContractSales oaContractSales, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<OaContractSales> page = oaContractSalesService.findPage(new Page<OaContractSales>(request, response), oaContractSales); 
		model.addAttribute("page", page);
		return MOBILE_ROOT+"modules/oa/contract/oaContractSalesList";
	}

	
	@RequiresPermissions("oa:contract:oaContractSales:view")
	@RequestMapping(value = "form")
	public String form(OaContractSales oaContractSales, Model model, HttpServletRequest request) {
		String pageType=(String)request.getParameter("pageType");
		
		List<OaProject> oaProjectList = oaProjectService.findList(new OaProject());
		model.addAttribute("oaProjectList", oaProjectList);
		model.addAttribute("oaContractSales", oaContractSales);
		if(StringUtils.equals("view", pageType)){
			return MOBILE_ROOT+"modules/oa/contract/oaContractSalesFormView";
		}
		return MOBILE_ROOT+"modules/oa/contract/oaContractSalesForm";
	}

	@RequiresPermissions("oa:contract:oaContractSales:edit")
	@RequestMapping(value = "save")
	public String save(OaContractSales oaContractSales, Model model, RedirectAttributes redirectAttributes, HttpServletRequest request) {
		if (StringUtils.isBlank(oaContractSales.getContractName())){
			addMessage(model, "合同名称不能为空");
			return form(oaContractSales, model,request);
		}
		oaContractSalesService.save(oaContractSales);
		addMessage(redirectAttributes, "保存销售合同成功");
		return "redirect:"+Global.getAdminPath()+Global.getAdminPath()+"/oa/contract/oaContractSales/?repage";
	}
	
	@RequiresPermissions("oa:contract:oaContractSales:edit")
	@RequestMapping(value = "delete")
	public String delete(OaContractSales oaContractSales, RedirectAttributes redirectAttributes) {
		oaContractSalesService.delete(oaContractSales);
		addMessage(redirectAttributes, "删除销售合同成功");
		return "redirect:"+Global.getAdminPath()+Global.getAdminPath()+"/oa/contract/oaContractSales/?repage";
	}
	
	@RequestMapping(value="getOaContractSalesList")
	public @ResponseBody List<OaContractSales> getOaContractSalesList(String projectId){
		OaContractSales oaContractSales=new OaContractSales();
		oaContractSales.setProject(new OaProject(projectId));
		List<OaContractSales> oaContractSalesList =oaContractSalesService.findListByProjectId(oaContractSales);
		return oaContractSalesList;
	}
	
	/**
	 * 下载导入用户数据模板
	 * 
	 * @param response
	 * @param redirectAttributes
	 * @return
	 */
	@RequiresPermissions("oa:contract:oaContractSales:view")
	@RequestMapping(value = "import/template")
	public String importFileTemplate(HttpServletResponse response, RedirectAttributes redirectAttributes) {
		try {
			String fileName = "销售合同数据导入模板.xlsx";
			List<OaContractSales> list = Lists.newArrayList();
			OaContractSales oaContractSales=new OaContractSales();
			oaContractSales.setContractName("合同模板");
			oaContractSales.setContractPartya("合同甲方");
			oaContractSales.setContractMoney(10.0d);
			oaContractSales.setContractTime(new Date());
			//oaContractSales.setContractStatus("0");
			oaContractSales.setProject(new OaProject("PJ20170209093300001"));
			oaContractSales.setWarrantyStartTime(new Date());
			oaContractSales.setWarrantyEndTime(new Date());
			oaContractSales.setProjectLeader(new User("admin"));
			list.add(oaContractSales);
			new ExportExcel("销售合同数据", OaContractSales.class, 2).setDataList(list).write(response, fileName).dispose();
			return null;
		} catch (Exception e) {
			addMessage(redirectAttributes, "导入模板下载失败！失败信息：" + e.getMessage());
		}
		return "redirect:" +Global.getAdminPath()+ adminPath + "/oa/contract/oaContractSales/list?repage";
	}
	
	/**
	 * 
	 * @param file
	 * @param redirectAttributes
	 * @return
	 */
	@RequiresPermissions("oa:contract:oaContractSales:edit")
	@RequestMapping(value = "import", method = RequestMethod.POST)
	public String importFile(MultipartFile file, RedirectAttributes redirectAttributes) {
		try {
			InputStream is = file.getInputStream();
			HSSFWorkbook hssfWorkbook = new HSSFWorkbook(is);
			HSSFSheet hssfSheet = hssfWorkbook.getSheetAt(0);
			
			List<User> users=systemService.findAllList();
			List<OaProject> oaProjects=oaProjectService.findList(new OaProject());
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
			int successNum = 0;
			int failureNum = 0;
			for (int i = 2; i <= hssfSheet.getLastRowNum(); i++) {
				try {
					HSSFRow hssfRow =hssfSheet.getRow(i);
					hssfRow.getCell(0).setCellType(Cell.CELL_TYPE_STRING);
					String cell0=hssfRow.getCell(0).getStringCellValue();
					
					hssfRow.getCell(1).setCellType(Cell.CELL_TYPE_STRING);
					String cell1=hssfRow.getCell(1).getStringCellValue();
					
					hssfRow.getCell(2).setCellType(Cell.CELL_TYPE_STRING);
					String cell2=hssfRow.getCell(2).getStringCellValue();
					
					hssfRow.getCell(3).setCellType(Cell.CELL_TYPE_NUMERIC);
					Double cell3=hssfRow.getCell(3).getNumericCellValue();
					
					hssfRow.getCell(4).setCellType(Cell.CELL_TYPE_STRING);
					String cell4=hssfRow.getCell(4).getStringCellValue();
					
					hssfRow.getCell(5).setCellType(Cell.CELL_TYPE_STRING);
					String cell5=hssfRow.getCell(5).getStringCellValue();
					
					hssfRow.getCell(6).setCellType(Cell.CELL_TYPE_STRING);
					String cell6=hssfRow.getCell(6).getStringCellValue();
					
					hssfRow.getCell(7).setCellType(Cell.CELL_TYPE_STRING);
					String cell7=hssfRow.getCell(7).getStringCellValue();
					
					hssfRow.getCell(8).setCellType(Cell.CELL_TYPE_STRING);
					String cell8=hssfRow.getCell(8).getStringCellValue();
					
					
					OaContractSales oaContractSales=new OaContractSales();
					oaContractSales.setContractName(cell0);
					oaContractSales.setProject(findOaProjectByProjectNo(oaProjects,cell1));
					oaContractSales.setContractPartya(cell2);
					oaContractSales.setContractMoney(cell3);
					oaContractSales.setContractTime(sdf.parse(cell4));
					oaContractSales.setWarrantyStartTime(sdf.parse(cell5));
					oaContractSales.setWarrantyEndTime(sdf.parse(cell6));
					oaContractSales.setProjectLeader(findUserByUserLoginName(users,cell7));
					oaContractSales.setContractNo(cell8);
					oaContractSalesService.save(oaContractSales);
					successNum++;
				} catch (Exception e) {
					// TODO: handle exception
					failureNum++;
				}
			}
			
			StringBuilder failureMsg = new StringBuilder();
			if (failureNum > 0) {
				failureMsg.insert(0, "，失败 " + failureNum + " 条销售合同，导入信息如下：");
			}
			addMessage(redirectAttributes, "已成功导入 " + successNum + " 条销售合同" + failureMsg);
		} catch (Exception e) {
			addMessage(redirectAttributes, "导入销售合同失败！失败信息：" + e.getMessage());
		}
		return "redirect:" +Global.getAdminPath()+ adminPath + "/oa/contract/oaContractSales/list?repage";
	}

	private OaProject findOaProjectByProjectNo(List<OaProject> list,String projectNo){
		for (OaProject oaProject : list) {
			if (StringUtils.equals(oaProject.getProjectNo(), projectNo)) {
				return oaProject;
			}
		}
		return null;
	}
	
	private User findUserByUserLoginName(List<User> list,String loginName) {
		for (User user : list) {
			if (StringUtils.equals(user.getLoginName(), loginName)) {
				return user;
			}
		}
		return null;
	}
}