/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.web.perishableproducts;


import java.io.InputStream;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.common.collect.Lists;
import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.mapper.JsonMapper;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.utils.excel.ExportExcel;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.oa.entity.Supmanagement;
import com.thinkgem.jeesite.modules.oa.entity.fixedassets.PerishableHistory;
import com.thinkgem.jeesite.modules.oa.entity.perishableproducts.PerishableProducts;
import com.thinkgem.jeesite.modules.oa.service.SupmanagementService;
import com.thinkgem.jeesite.modules.oa.service.fixedassets.PerishableHistoryService;
import com.thinkgem.jeesite.modules.oa.service.perishableproducts.PerishableProductsService;
import com.thinkgem.jeesite.modules.sys.utils.DictUtils;
import com.thinkgem.jeesite.modules.sys.utils.OrdersUtils;

/**
 * 易耗品增删改查Controller
 * @author zf
 * @version 2016-11-08
 */
@Controller
@RequestMapping(value = "${adminPath}/perishableproducts/perishableProducts")
public class PerishableProductsController extends BaseController {
	
	@ModelAttribute
	public PerishableProducts get(@RequestParam(required=false) String id) {
		PerishableProducts entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = perishableProductsService.get(id);
		}
		if (entity == null){
			entity = new PerishableProducts();
		}
		return entity;
	}
	
	/**
	 * 认领申请
	 * @param redirectAttributes
	 * @param id
	 * @param amount
	 * @return
	 */
	@RequiresPermissions("perishableproducts:perishableProducts:view")
	@RequestMapping(value = {"updateForOutStock"})
	public String updateForOutStock(RedirectAttributes redirectAttributes, String[] id, Integer[] amount)
	{
		for (int i = 0; i < id.length; i++ ) 
		{
			PerishableProducts obj = get(id[i]);
			
			obj.setAmount(obj.getAmount() - amount[i]);
			
			perishableProductsService.save(obj);
		}
		
		addMessage(redirectAttributes, "认领申请成功");
		
		return "redirect:"+Global.getAdminPath()+"/perishableproducts/perishableProducts/?repage";
	}
	
	/**
	 * 用品申请列表
	 * @param perishableProducts
	 * @param model
	 * @return
	 */
	@RequiresPermissions("perishableproducts:perishableProducts:view")
	@RequestMapping(value = {"outStockList"})
	public String findOutStockList(PerishableProducts perishableProducts, Model model)
	{
		String[] arr=perishableProducts.getIdes().split(",");
	       
		List<String> idList = Arrays.asList(arr);
		
		List<PerishableProducts> list = perishableProductsService
				.findOutstockList(idList);
		
		model.addAttribute("list", list);
		
		return "modules/oa/perishableproducts/findOutStockList";
	}
	
	/**
	 * 用品管理列表
	 * @param perishableProducts
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequiresPermissions("perishableproducts:perishableProducts:view")
	@RequestMapping(value = {"list", ""})
	public String list(PerishableProducts perishableProducts, HttpServletRequest request,
			HttpServletResponse response, Model model) {
		Page<PerishableProducts> page = perishableProductsService
				.findPage(new Page<PerishableProducts>(request, response), perishableProducts); 
		
		List<PerishableProducts> list = page.getList();
		
		for (PerishableProducts obj : list) 
			obj.setSupplier(supmanagementService.get(obj.getSupplier()).getSupName());
		
		page.setList(list);
		
		model.addAttribute("page", page);
		
		return "modules/oa/perishableproducts/perishableProductsList";
	}

	/**
	 * 入库查询
	 * @param perishableProducts
	 * @param model
	 * @return
	 */
	@RequiresPermissions("perishableproducts:perishableProducts:view")
	@RequestMapping(value = {"statistics"})
	public String instock(PerishableProducts perishableProducts, Model model) {
		List<PerishableProducts> list = perishableProductsService
				.findList(perishableProducts); 
		model.addAttribute("list", list);
		return "modules/oa/perishableproducts/statistics";
	}
	
	/**
	 * 出库查询
	 * @param perishableProducts
	 * @param model
	 * @return
	 */
	@RequiresPermissions("perishableproducts:perishableProducts:view")
	@RequestMapping(value = {"outstock"})
	public String outstock(PerishableProducts perishableProducts, Model model) {
		List<PerishableProducts> list = perishableProductsService
				.findList(perishableProducts); 
		model.addAttribute("list", list);
		return "modules/oa/perishableproducts/outstock";
	}
	
	/**
	 * 用品添加
	 * @param perishableProducts
	 * @param model
	 * @return
	 */
	@RequiresPermissions("perishableproducts:perishableProducts:view")
	@RequestMapping(value = "form")
	public String form(PerishableProducts perishableProducts, Model model)
	{
		/**session对象*/
		HttpSession session = ((ServletRequestAttributes)RequestContextHolder
				.getRequestAttributes()).getRequest().getSession();
		
		PerishableProducts obj = (PerishableProducts) session.getAttribute("obj");
		
		if (obj != null)
		{
			perishableProducts = obj;
			
			session.setAttribute("obj", null);
		}
		
		Supmanagement supObj = new Supmanagement();
		
		supObj.setDelFlag("0");
		
		List<Supmanagement> supList = supmanagementService.findList(supObj);
		
		model.addAttribute("perishableProducts", perishableProducts);
		
		model.addAttribute("supList", supList);

		return "modules/oa/perishableproducts/perishableProductsForm";
	}

	/**
	 * 用品修改
	 * @param perishableProducts
	 * @param model
	 * @return
	 */
	@RequiresPermissions("perishableproducts:perishableProducts:view")
	@RequestMapping(value = "modif")
	public String modif(PerishableProducts perishableProducts, Model model)
	{
		Supmanagement supObj = new Supmanagement();
		
		supObj.setDelFlag("0");
			
		List<Supmanagement> supList = supmanagementService.findList(supObj);
		
		model.addAttribute("supList", supList);
		
		model.addAttribute("perishableProducts", perishableProducts);

		return "modules/oa/perishableproducts/perishableProductsFormModif";
	}
	
	@RequiresPermissions("perishableproducts:perishableProducts:edit")
	@RequestMapping(value = "modifysave")
	public String modifysave(PerishableProducts perishableProducts, Model model, 
			RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, perishableProducts)){
			return form(perishableProducts, model);
		}
		perishableProductsService.save(perishableProducts);
		
		addMessage(redirectAttributes, "修改办公用品成功");
		
		return "redirect:"+Global.getAdminPath()+"/perishableproducts/perishableProducts/?repage";
	}
	
	/**
	 * 用品保存
	 * @param perishableProducts
	 * @param model
	 * @param redirectAttributes
	 * @return
	 */
	@RequiresPermissions("perishableproducts:perishableProducts:edit")
	@RequestMapping(value = "save")
	public String save(PerishableProducts perishableProducts, Model model, 
			RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, perishableProducts)){
			return form(perishableProducts, model);
		}
		perishableProductsService.saveForPerishable(perishableProducts);
		
		/**session对象*/
		HttpSession session = ((ServletRequestAttributes)RequestContextHolder
				.getRequestAttributes()).getRequest().getSession();
		
		session.setAttribute("obj", perishableProducts);
		
		addMessage(redirectAttributes, "保存办公用品成功");
		
		return "redirect:"+Global.getAdminPath()+"/perishableproducts/perishableProducts/form";
	}
	
	@RequiresPermissions("perishableproducts:perishableProducts:view")
	@RequestMapping(value = "statisticsPage")
	public String statisticsPage(PerishableHistory perishableHistory, Model model)
	{
		model.addAttribute("perishableHistory", perishableHistory);
		
		return "modules/oa/perishableproducts/statisticsPage";
	}
	
	/**
	 * 判断序列号是否存在
	 * @param request
	 * @param response
	 * @return
	 */
	@RequiresPermissions("perishableproducts:perishableProducts:view")
	@RequestMapping(value = "checkSerialNumber")
	@ResponseBody
	public String checkSerialNumber(HttpServletRequest request,
			HttpServletResponse response)
	{
		String serialNumber = request.getParameter("serialNumber");
		
		return JsonMapper.getInstance().toJson(perishableProductsService
				.checkSerialNumber(serialNumber));
	}
	
	/**
	 * 判断库存是否为空
	 * @param request
	 * @param response
	 * @return
	 */
	@RequiresPermissions("perishableproducts:perishableProducts:view")
	@RequestMapping(value = "findAmount")
	@ResponseBody
	public String findAmount(HttpServletRequest request,
			HttpServletResponse response)
	{
		String id = request.getParameter("id");
		
		String ids[] = id.split(",");
		
		boolean b = true;
		
		for (int i = 0;i<ids.length;i++)
		{
			PerishableProducts  perishableProducts = perishableProductsService.get(ids[i]);
			
			int amount = perishableProducts.getAmount();
			
			if (amount == 0)
			{
				b = false;
				
				break;
			}
		}
		
		return JsonMapper.getInstance().toJson(b);
	}
	
	/**
	 * 删除
	 * @param perishableProducts
	 * @param redirectAttributes
	 * @return
	 */
	@RequiresPermissions("perishableproducts:perishableProducts:edit")
	@RequestMapping(value = "delete")
	public String delete(PerishableProducts perishableProducts,
			RedirectAttributes redirectAttributes) {
		perishableProductsService.delete(perishableProducts);
		addMessage(redirectAttributes, "删除办公用品成功");
		return "redirect:"+Global.getAdminPath()+"/perishableproducts/perishableProducts/?repage";
	}

	/**
	 * 下载导入用户数据模板
	 * 
	 * @param response
	 * @param redirectAttributes
	 * @return
	 */
	@RequiresPermissions("perishableproducts:perishableProducts:view")
	@RequestMapping(value = "import/template")
	public String importFileTemplate(HttpServletResponse response, RedirectAttributes redirectAttributes) {
		try {
			String fileName = "办公用品数据导入模板.xlsx";
			
			List<PerishableProducts> list = Lists.newArrayList();
			
			PerishableProducts perishableProducts = new PerishableProducts();
			
			perishableProducts.setSerialNumber("DL-55d");
			
			perishableProducts.setItemName("笔");
			
			perishableProducts.setItemCategory("办公用品");
			
			perishableProducts.setAmount(66);
			
			perishableProducts.setUnitPrice(20.0);
			
			perishableProducts.setUnit("支");
			
			perishableProducts.setSupplier("武汉市xxx公司");
			
			perishableProducts.setBrand("得力");
			
			list.add(perishableProducts);
			
			new ExportExcel("办公用品数据", PerishableProducts.class, 2).setDataList(list).write(response, fileName).dispose();
			return null;
		} catch (Exception e) {
			addMessage(redirectAttributes, "导入模板下载失败！失败信息：" + e.getMessage());
		}
		return "redirect:" + adminPath + "/perishableproducts/perishableProducts/list?repage";
	}	
	
	/**
	 * 
	 * @param file
	 * @param redirectAttributes
	 * @return
	 */
	@RequiresPermissions("perishableproducts:perishableProducts:edit")
	@RequestMapping(value = "import", method = RequestMethod.POST)
	public String importFile(MultipartFile file, RedirectAttributes redirectAttributes) {
		try 
		{
			InputStream is = file.getInputStream();
			
			HSSFWorkbook hssfWorkbook = new HSSFWorkbook(is);
			
			HSSFSheet hssfSheet = hssfWorkbook.getSheetAt(0);
			
			int successNum = 0;
			
			int failureNum = 0;
			
			for (int i = 2; i <= hssfSheet.getLastRowNum(); i++) 
			{
				try 
				{
					HSSFRow hssfRow =hssfSheet.getRow(i);
					
					hssfRow.getCell(0).setCellType(Cell.CELL_TYPE_STRING);
					
					String cell0 = hssfRow.getCell(0).getStringCellValue();
					
					hssfRow.getCell(1).setCellType(Cell.CELL_TYPE_STRING);
					
					String cell1 = hssfRow.getCell(1).getStringCellValue();
					
					hssfRow.getCell(2).setCellType(Cell.CELL_TYPE_NUMERIC);
					
					Integer cell2 = (int) hssfRow.getCell(2).getNumericCellValue();
					
					hssfRow.getCell(3).setCellType(Cell.CELL_TYPE_NUMERIC);
					
					Double cell3 = hssfRow.getCell(3).getNumericCellValue();
					
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
					
					PerishableProducts perishableProducts = new PerishableProducts();
					
					String category = perishableProductsService.getBrand(DictUtils.getDictValue(cell8, "equ_brand", "0"));
					
					perishableProducts.setSerialNumber(OrdersUtils.getGenerateOrderNo8(category + "-"));
					
					perishableProducts.setItemName(cell0);
					
					perishableProducts.setItemCategory(DictUtils.getDictValue(cell1, "item_category", "0"));
					
					perishableProducts.setAmount(cell2);
					
					perishableProducts.setUnitPrice(cell3);
					
					perishableProducts.setModel(cell4);
					
					perishableProducts.setSpecifications(cell5);
					
					perishableProducts.setUnit(DictUtils.getDictValue(cell6, "unit", "0"));
					
					perishableProducts.setSupplier(findSupplier(cell7));
					
					perishableProducts.setBrand(DictUtils.getDictValue(cell8, "equ_brand", "0"));
					
					perishableProducts.setTotal(cell2 * cell3 + "");
					
					perishableProducts.setRemarks("");
					
					perishableProductsService.save(perishableProducts);
					
					PerishableHistory perishableHistory = new PerishableHistory();
					
					perishableHistory.setAmount(perishableProducts.getAmount());
					
					perishableHistory.setType("0");
					
					perishableHistory.setPerishableProducts(perishableProducts);
					
					phs.save(perishableHistory);
					
					successNum++;
				} 
				catch (Exception e) 
				{
					failureNum++;
				}
			}
			
			StringBuilder failureMsg = new StringBuilder();
			
			if (failureNum > 0) 
			{
				failureMsg.insert(0, "，失败 " + failureNum + " 办公用品，导入信息如下：");
			}
			
			addMessage(redirectAttributes, "已成功导入 " + successNum + " 办公用品" + failureMsg);
		} 
		catch (Exception e) 
		{
			addMessage(redirectAttributes, "导入办公用品失败！失败信息：" + e.getMessage());
		}
		return "redirect:" + adminPath + "/perishableproducts/perishableProducts/list?repage";
	}

	private String findSupplier(String sname)
	{
		Supmanagement supObj = new Supmanagement();
		
		supObj.setDelFlag("0");
			
		List<Supmanagement> supList = supmanagementService.findList(supObj);
		
		for (Supmanagement supmanagement : supList) {
			if (StringUtils.equals(supmanagement.getSupName(),sname))
					return supmanagement.getId();
		}
		return supList.get(0).getId();
	}
	
	/*-------------------------------------------参数-----------------------------------------------------*/
	@Autowired
	private PerishableProductsService perishableProductsService;
	
	@Autowired
	private SupmanagementService supmanagementService;
	
	@Autowired
	private PerishableHistoryService phs;	
}