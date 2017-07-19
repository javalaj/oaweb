/**
 * Copyright &copy; 2012-2025 <a href="https://www.chuyutech.com">JeeCY</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.web.salarybillsend;

import java.io.InputStream;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.shiro.authz.annotation.Logical;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
import com.thinkgem.jeesite.common.utils.MyBeanUtils;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.utils.excel.ExportExcel;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.oa.entity.salarybillsend.OaSalaryBill;
import com.thinkgem.jeesite.modules.oa.entity.salarybillsend.OaSalaryDetails;
import com.thinkgem.jeesite.modules.oa.service.salarybillsend.OaSalaryBillService;
import com.thinkgem.jeesite.modules.oa.service.salarybillsend.OaSalaryDetailsService;
import com.thinkgem.jeesite.modules.oa.web.mytask.utis.SendEmail;
import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;

/**
 * 工资条发送Controller
 * @author zf
 * @version 2017-05-08
 */
@Controller
@RequestMapping(value = "${adminPath}/oa/salarybillsend/oaSalaryBill")
public class OaSalaryBillController extends BaseController {

	/**
	 * 获取工资条发送对象
	 */
	@ModelAttribute
	public OaSalaryBill get(@RequestParam(required=false) String id) {
		OaSalaryBill entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = oaSalaryBillService.get(id);
		}
		if (entity == null){
			entity = new OaSalaryBill();
		}
		return entity;
	}
	
	/**
	 * 工资条发送列表页面
	 */
	@RequiresPermissions("oa:salarybillsend:oaSalaryBill:list")
	@RequestMapping(value = {"list", ""})
	public String list(OaSalaryBill oaSalaryBill, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<OaSalaryBill> page = oaSalaryBillService.findPage(new Page<OaSalaryBill>(request, response), oaSalaryBill); 
		model.addAttribute("page", page);
		return "modules/oa/salarybillsend/oaSalaryBillList";
	}

	/**
	 * 查看，增加，编辑工资条发送表单页面
	 */
	@RequiresPermissions(value={"oa:salarybillsend:oaSalaryBill:view","oa:salarybillsend:oaSalaryBill:add","oa:salarybillsend:oaSalaryBill:edit"},logical=Logical.OR)
	@RequestMapping(value = "form")
	public String form(OaSalaryBill oaSalaryBill, Model model) {
		model.addAttribute("oaSalaryBill", oaSalaryBill);
		return "modules/oa/salarybillsend/oaSalaryBillForm";
	}

	/**
	 * 保存工资条发送
	 */
	@RequiresPermissions(value={"oa:salarybillsend:oaSalaryBill:add","oa:salarybillsend:oaSalaryBill:edit"},logical=Logical.OR)
	@RequestMapping(value = "save")
	public String save(OaSalaryBill oaSalaryBill, Model model, RedirectAttributes redirectAttributes) throws Exception{
		if (!beanValidator(model, oaSalaryBill)){
			return form(oaSalaryBill, model);
		}
		
		if (StringUtils.isBlank(oaSalaryBill.getId()))
			addMessage(redirectAttributes, "保存工资条发送成功");
		else
			addMessage(redirectAttributes, "修改工资条发送成功");
		
		if(!oaSalaryBill.getIsNewRecord()){//编辑表单保存
			OaSalaryBill t = oaSalaryBillService.get(oaSalaryBill.getId());//从数据库取出记录的值
			MyBeanUtils.copyBeanNotNull2Bean(oaSalaryBill, t);//将编辑表单中的非NULL值覆盖数据库记录中的值
			oaSalaryBillService.save(t);//保存
		}else{//新增表单保存
			oaSalaryBillService.save(oaSalaryBill);//保存
		}
		return "redirect:"+Global.getAdminPath()+"/oa/salarybillsend/oaSalaryBill/?repage";
	}
	
	/**
	 * 删除工资条发送
	 */
	@RequiresPermissions("oa:salarybillsend:oaSalaryBill:del")
	@RequestMapping(value = "delete")
	public String delete(OaSalaryBill oaSalaryBill, RedirectAttributes redirectAttributes) {
		oaSalaryBillService.delete(oaSalaryBill);
		addMessage(redirectAttributes, "删除工资条发送成功");
		return "redirect:"+Global.getAdminPath()+"/oa/salarybillsend/oaSalaryBill/?repage";
	}
	
	/**
	 * 批量删除工资条发送
	 */
	@RequiresPermissions("oa:salarybillsend:oaSalaryBill:del")
	@RequestMapping(value = "deleteAll")
	public String deleteAll(String ids, RedirectAttributes redirectAttributes) {
		String idArray[] =ids.split(",");
		for(String id : idArray){
			oaSalaryBillService.delete(oaSalaryBillService.get(id));
		}
		addMessage(redirectAttributes, "删除工资条发送成功");
		return "redirect:"+Global.getAdminPath()+"/oa/salarybillsend/oaSalaryBill/?repage";
	}
	
	/**
	 * 导出excel文件
	 */
	@RequiresPermissions("oa:salarybillsend:oaSalaryBill:export")
    @RequestMapping(value = "export", method=RequestMethod.POST)
    public String exportFile(OaSalaryBill oaSalaryBill, HttpServletRequest request, HttpServletResponse response, RedirectAttributes redirectAttributes) {
		try {
            String fileName = "工资条发送"+DateUtils.getDate("yyyyMMddHHmmss")+".xlsx";
            Page<OaSalaryBill> page = oaSalaryBillService.findPage(new Page<OaSalaryBill>(request, response, -1), oaSalaryBill);
    		new ExportExcel("工资条发送", OaSalaryBill.class).setDataList(page.getList()).write(response, fileName).dispose();
    		return null;
		} catch (Exception e) {
			addMessage(redirectAttributes, "导出工资条发送记录失败！失败信息："+e.getMessage());
		}
		return "redirect:"+Global.getAdminPath()+"/oa/salarybillsend/oaSalaryBill/?repage";
    }

	/**
	 * 导入Excel数据
	 */
	@RequiresPermissions("oa:salarybillsend:oaSalaryBill:import")
    @RequestMapping(value = "import", method=RequestMethod.POST)
    public String importFile(MultipartFile file, RedirectAttributes redirectAttributes) {
		try 
		{
			InputStream is = file.getInputStream();
			
			HSSFWorkbook hssfWorkbook = new HSSFWorkbook(is);
			
			HSSFSheet hssfSheet = hssfWorkbook.getSheetAt(0);
			
			int successNum = 0;
			
			int failureNum = 0;
			
			HSSFRow hssfRowFirst = hssfSheet.getRow(0);
			
			hssfRowFirst.getCell(0).setCellType(Cell.CELL_TYPE_STRING);
			
			String cell = hssfRowFirst.getCell(0).getStringCellValue();
			
			String salaryMonth = cell.substring(0,7);
			
			Integer successCount = 0;
			
			Integer failCount = 0;		
			
			OaSalaryBill oaSalaryBill = new OaSalaryBill();
			
			oaSalaryBill.setSalaryMonth(salaryMonth);
			
			oaSalaryBillService.save(oaSalaryBill);
			
			for (int i = 2; i <= hssfSheet.getLastRowNum(); i++) 
			{
				try 
				{
					HSSFRow hssfRow =hssfSheet.getRow(i);
					
					hssfRow.getCell(0).setCellType(Cell.CELL_TYPE_STRING);
					
					String cell0 = hssfRow.getCell(0).getStringCellValue();
					
					User user  = UserUtils.getByName(cell0);
					
					if (user != null && StringUtils.isNotEmpty(user.getEmail()))
					{
						hssfRow.getCell(1).setCellType(Cell.CELL_TYPE_NUMERIC);
						
						Double cell1 = hssfRow.getCell(1).getNumericCellValue();
						
						hssfRow.getCell(2).setCellType(Cell.CELL_TYPE_NUMERIC);
						
						Double cell2 = hssfRow.getCell(2).getNumericCellValue();
						
						hssfRow.getCell(3).setCellType(Cell.CELL_TYPE_NUMERIC);
						
						Double cell3 = hssfRow.getCell(3).getNumericCellValue();	
						
						hssfRow.getCell(4).setCellType(Cell.CELL_TYPE_NUMERIC);
						
						Double cell4 = hssfRow.getCell(4).getNumericCellValue();
						
						hssfRow.getCell(5).setCellType(Cell.CELL_TYPE_NUMERIC);
						
						Double cell5 = hssfRow.getCell(5).getNumericCellValue();
						
						/*String dateTime = DateUtils.formatDate(new Date(), "yyyy年MM月");*/
						
						HashMap<String, Object> map = new HashMap<String, Object>();
						
						map.put("time",salaryMonth);
						
						map.put("name",user.getName());
						
						map.put("basicPay",cell1);
						
						map.put("performancePay",cell2);
						
						map.put("grossPay",cell3);
						
						map.put("variousDeductions",cell4);
						
						map.put("netPay",cell5);
						
						String subject = "楚誉科技【"+salaryMonth+"】工资单";
						
						String templatePath = "mailtemplate/userSalaryBill.ftl";
						
						String username = Global.getConfig("mail.smtp.username");
						
						String password = Global.getConfig("mail.smtp.password");
						
						String smtp = Global.getConfig("mail.smtp.host"); 
						
						String from = Global.getConfig("mail.smtp.from");
						
						String[] toMailAddr = new String[1];
						
						toMailAddr[0] = user.getEmail();
						
						String[] to = toMailAddr;
						
						String[] filename = {};
						
						SendEmail.sendAndCc(smtp, from, to, subject, map, username, password, filename, templatePath);
						
						successCount++;
						
						OaSalaryDetails oaSalaryDetails = new OaSalaryDetails();
						
						oaSalaryDetails.setUser(cell0);
						
						oaSalaryDetails.setBillId(oaSalaryBill.getId());
						
						oaSalaryDetails.setSendFlag("0");
						
						oaSalaryDetailsService.save(oaSalaryDetails);
					}
					else
					{
						OaSalaryDetails oaSalaryDetails = new OaSalaryDetails();
						
						oaSalaryDetails.setUser(cell0);
						
						oaSalaryDetails.setBillId(oaSalaryBill.getId());
						
						oaSalaryDetails.setSendFlag("1");
						
						failCount++;
						
						oaSalaryDetailsService.save(oaSalaryDetails);
					}
					
					oaSalaryBill.setSuccessCount(successCount);
					
					oaSalaryBill.setFailCount(failCount);
					
					oaSalaryBill.preUpdate();
					
					oaSalaryBillService.update(oaSalaryBill);
				
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
				failureMsg.insert(0, "，失败 " + failureNum + " 条工资条发送记录，导入信息如下：");
			}
			
			addMessage(redirectAttributes, "已成功导入发送 " + successNum + " 条工资条记录" + failureMsg);
		} 
		catch (Exception e) 
		{
			addMessage(redirectAttributes, "导入工资条发送失败！失败信息：" + e.getMessage());
		}
		return "redirect:"+Global.getAdminPath()+"/oa/salarybillsend/oaSalaryBill/?repage";
    }
	
	/**
	 * 下载导入工资条发送数据模板
	 */
	@RequiresPermissions("oa:salarybillsend:oaSalaryBill:import")
    @RequestMapping(value = "import/template")
    public String importFileTemplate(HttpServletResponse response, RedirectAttributes redirectAttributes) {
		try {
            String fileName = "工资条发送数据导入模板.xlsx";
    		List<OaSalaryBill> list = Lists.newArrayList(); 
    		new ExportExcel("工资条发送数据", OaSalaryBill.class, 1).setDataList(list).write(response, fileName).dispose();
    		return null;
		} catch (Exception e) {
			addMessage(redirectAttributes, "导入模板下载失败！失败信息："+e.getMessage());
		}
		return "redirect:"+Global.getAdminPath()+"/oa/salarybillsend/oaSalaryBill/?repage";
    }
 
 	/*-------------------------------------参数--------------------------------------------*/
	
	/** OaSalaryBill业务层 */
	@Autowired
	private OaSalaryBillService oaSalaryBillService;
    
	@Autowired
	private OaSalaryDetailsService oaSalaryDetailsService;
}