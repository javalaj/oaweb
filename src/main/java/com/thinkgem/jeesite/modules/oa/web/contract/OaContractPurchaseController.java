/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.web.contract;

import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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

import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.oa.entity.Supmanagement;
import com.thinkgem.jeesite.modules.oa.entity.contract.OaContractPurchase;
import com.thinkgem.jeesite.modules.oa.entity.contract.OaContractSales;
import com.thinkgem.jeesite.modules.oa.entity.project.OaProject;
import com.thinkgem.jeesite.modules.oa.service.SupmanagementService;
import com.thinkgem.jeesite.modules.oa.service.contract.OaContractPurchaseService;
import com.thinkgem.jeesite.modules.oa.service.contract.OaContractSalesService;
import com.thinkgem.jeesite.modules.oa.service.project.OaProjectService;
import com.thinkgem.jeesite.modules.sys.entity.Dict;
import com.thinkgem.jeesite.modules.sys.service.DictService;
import com.thinkgem.jeesite.modules.sys.utils.DictUtils;

/**
 * 采购合同管理Controller
 * @author 李廷龙
 * @version 2016-12-12
 */
@Controller
@RequestMapping(value = "${adminPath}/oa/contract/oaContractPurchase")
public class OaContractPurchaseController extends BaseController {

	@Autowired
	private OaContractPurchaseService oaContractPurchaseService;
	@Autowired
	private OaProjectService oaProjectService;
	@Autowired
	private SupmanagementService supmanagementService;
	@Autowired
	private OaContractSalesService oaContractSalesService;
	
	@ModelAttribute
	public OaContractPurchase get(@RequestParam(required=false) String id) {
		OaContractPurchase entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = oaContractPurchaseService.get(id);
		}
		if (entity == null){
			entity = new OaContractPurchase();
		}
		return entity;
	}
	
	@RequiresPermissions("oa:contract:oaContractPurchase:view")
	@RequestMapping(value = {"list", ""})
	public String list(OaContractPurchase oaContractPurchase, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<OaContractPurchase> page = oaContractPurchaseService.findPage(new Page<OaContractPurchase>(request, response), oaContractPurchase); 
		model.addAttribute("page", page);
		List<OaProject> oaProjectList = oaProjectService.findList(new OaProject());
		List<Supmanagement> supmanagementList=supmanagementService.findList(new Supmanagement());
		model.addAttribute("oaProjectList", oaProjectList);
		model.addAttribute("supmanagementList", supmanagementList);
		return "modules/oa/contract/oaContractPurchaseList";
	}

	@RequiresPermissions("oa:contract:oaContractPurchase:view")
	@RequestMapping(value = "form")
	public String form(OaContractPurchase oaContractPurchase, Model model) {
		List<OaProject> oaProjectList = oaProjectService.findList(new OaProject());
		List<Supmanagement> supmanagementList=supmanagementService.findList(new Supmanagement());
		model.addAttribute("oaContractPurchase", oaContractPurchase);
		model.addAttribute("oaProjectList", oaProjectList);
		model.addAttribute("supmanagementList", supmanagementList);
		model.addAttribute("productsTotalMoney", oaContractPurchase.calculatorProductsTotalMoney());
		return "modules/oa/contract/oaContractPurchaseForm";
	}
	
	@RequiresPermissions("oa:contract:oaContractPurchase:view")
	@RequestMapping(value = "formInspection")
	public String formInspection(OaContractPurchase oaContractPurchase, Model model) {
		List<OaProject> oaProjectList = oaProjectService.findList(new OaProject());
		List<Supmanagement> supmanagementList=supmanagementService.findList(new Supmanagement());
		model.addAttribute("oaContractPurchase", oaContractPurchase);
		model.addAttribute("oaProjectList", oaProjectList);
		model.addAttribute("supmanagementList", supmanagementList);
		return "modules/oa/contract/oaContractPurchaseFormInspection";
	}
	

	@RequiresPermissions("oa:contract:oaContractPurchase:edit")
	@RequestMapping(value = "save")
	public String save(OaContractPurchase oaContractPurchase, Model model, RedirectAttributes redirectAttributes) {
		if (StringUtils.isBlank(oaContractPurchase.getContractName())){
			addMessage(model, "合同名称不能为空");
			return form(oaContractPurchase, model);
		}
		oaContractPurchaseService.save(oaContractPurchase);
		addMessage(redirectAttributes, "保存采购合同成功");
		return "redirect:"+Global.getAdminPath()+"/oa/contract/oaContractPurchase/?repage";
	}
	
	@RequiresPermissions("oa:contract:oaContractPurchase:inspection")
	@RequestMapping(value = "inspection")
	public String inspection(OaContractPurchase oaContractPurchase, Model model, RedirectAttributes redirectAttributes) {
		oaContractPurchaseService.inspection(oaContractPurchase);
		addMessage(redirectAttributes, "采购合同验货完成");
		return "redirect:"+Global.getAdminPath()+"/oa/contract/oaContractPurchase/?repage";
	}
	
	
	@RequiresPermissions("oa:contract:oaContractPurchase:edit")
	@RequestMapping(value = "delete")
	public String delete(OaContractPurchase oaContractPurchase, RedirectAttributes redirectAttributes) {
		oaContractPurchaseService.delete(oaContractPurchase);
		addMessage(redirectAttributes, "删除采购合同成功");
		return "redirect:"+Global.getAdminPath()+"/oa/contract/oaContractPurchase/?repage";
	}
	@RequiresPermissions("oa:contract:oaContractPurchase:checkInspection")
	@RequestMapping(value = "checkInspection")
	public String checkInspection(OaContractPurchase oaContractPurchase, RedirectAttributes redirectAttributes) {
		oaContractPurchaseService.checkInspection(oaContractPurchase);
		addMessage(redirectAttributes, "采购合同确认验货完成");
		return "redirect:"+Global.getAdminPath()+"/oa/contract/oaContractPurchase/?repage";
	}
	
	@RequestMapping(value="getOaContractPurchaseList")
	public @ResponseBody List<OaContractPurchase> getOaContractPurchaseList(String projectId){
		OaContractPurchase oaContractPurchase=new OaContractPurchase();
		oaContractPurchase.setProject(new OaProject(projectId));
		List<OaContractPurchase> oaContractPurchaseList =oaContractPurchaseService.findListByProjectId(oaContractPurchase);
		return oaContractPurchaseList;
	}
	
	@RequestMapping(value="oaProjectList")
	public @ResponseBody List<OaProject> oaProjectList(@RequestParam(required=false) String type){
		List<OaProject> oaProjectList = oaProjectService.findList(new OaProject());
		return oaProjectList;
	}
	
	@RequestMapping(value="supmanagementList")
	public @ResponseBody List<Supmanagement> supmanagementList(@RequestParam(required=false) String type){
		List<Supmanagement> supmanagementList=supmanagementService.findList(new Supmanagement());
		return supmanagementList;
	}
	
	/**
	 * 
	 * @param file
	 * @param redirectAttributes
	 * @return
	 */
	@RequiresPermissions("oa:contract:oaContractPurchase:edit")
	@RequestMapping(value = "import", method = RequestMethod.POST)
	public String importFile(MultipartFile file, RedirectAttributes redirectAttributes) {
		try {
			InputStream is = file.getInputStream();
			HSSFWorkbook hssfWorkbook = new HSSFWorkbook(is);
			HSSFSheet hssfSheet = hssfWorkbook.getSheetAt(0);
			
			List<OaContractSales> oaContractSaless=oaContractSalesService.findList(new OaContractSales());
			List<Supmanagement> supmanagements=supmanagementService.findList(new Supmanagement());
			List<Dict> dicts1=DictUtils.getDictList("oa_contract_purchase_filingStatus");
			List<Dict> dicts2=DictUtils.getDictList("oa_contract_purchase_status");
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
					
					hssfRow.getCell(9).setCellType(Cell.CELL_TYPE_STRING);
					String cell9=hssfRow.getCell(9).getStringCellValue();
					
					
					OaContractPurchase oaContractPurchase=new OaContractPurchase();
					oaContractPurchase.setContractName(cell0);
					OaContractSales oaContractSales=findOaContractSalesByContractSalesNo(oaContractSaless, cell1);
					oaContractPurchase.setContractSales(oaContractSales);
					oaContractPurchase.setProject(oaContractSales.getProject());
					oaContractPurchase.setSupplier(findSupmanagementByNo(supmanagements, cell2));
					oaContractPurchase.setContractMoney(cell3);
					oaContractPurchase.setContractTime(sdf.parse(cell4));
					oaContractPurchase.setSupplierWarrantyStartTime(sdf.parse(cell5));
					oaContractPurchase.setSupplierWarrantyEndTime(sdf.parse(cell6));
					oaContractPurchase.setFilingStatus(findDictValueByLabel(dicts1, cell7));
					oaContractPurchase.setContractStatus(findDictValueByLabel(dicts2, cell8));
					oaContractPurchase.setContractNo(cell9);
					oaContractPurchaseService.save(oaContractPurchase);
					successNum++;
				} catch (Exception e) {
					// TODO: handle exception
					failureNum++;
				}
			}
			
			StringBuilder failureMsg = new StringBuilder();
			if (failureNum > 0) {
				failureMsg.insert(0, "，失败 " + failureNum + " 条采购合同，导入信息如下：");
			}
			addMessage(redirectAttributes, "已成功导入 " + successNum + " 条采购合同" + failureMsg);
		} catch (Exception e) {
			addMessage(redirectAttributes, "导入采购合同失败！失败信息：" + e.getMessage());
		}
		return "redirect:" + adminPath + "/oa/contract/oaContractPurchase/list?repage";
	}

	private OaContractSales findOaContractSalesByContractSalesNo(List<OaContractSales> list,String contractSalesNo){
		for (OaContractSales oaContractSales : list) {
			if (StringUtils.equals(oaContractSales.getContractNo(), contractSalesNo)) {
				return oaContractSales;
			}
		}
		return null;
	}
	private Supmanagement findSupmanagementByNo(List<Supmanagement> list,String no) {
		for (Supmanagement supmanagement : list) {
			if (StringUtils.equals(supmanagement.getOrgCode(), no)) {
				return supmanagement;
			}
		}
		return null;
	}
	
	private String findDictValueByLabel(List<Dict> list,String label){
		for (Dict dict : list) {
			if (StringUtils.equals(dict.getLabel(), label)) {
				return dict.getValue();
			}
		}
		return null;
	}
}