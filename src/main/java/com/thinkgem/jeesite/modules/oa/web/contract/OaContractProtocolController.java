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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.oa.entity.Supmanagement;
import com.thinkgem.jeesite.modules.oa.entity.contract.OaContractProtocol;
import com.thinkgem.jeesite.modules.oa.entity.contract.OaContractPurchase;
import com.thinkgem.jeesite.modules.oa.entity.contract.OaContractSales;
import com.thinkgem.jeesite.modules.oa.entity.project.OaProject;
import com.thinkgem.jeesite.modules.oa.service.contract.OaContractProtocolService;
import com.thinkgem.jeesite.modules.oa.service.project.OaProjectService;
import com.thinkgem.jeesite.modules.sys.entity.Dict;
import com.thinkgem.jeesite.modules.sys.utils.DictUtils;

/**
 * 协议框架合同管理Controller
 * @author 李廷龙
 * @version 2017-01-04
 */
@Controller
@RequestMapping(value = "${adminPath}/oa/contract/oaContractProtocol")
public class OaContractProtocolController extends BaseController {

	@Autowired
	private OaContractProtocolService oaContractProtocolService;
	@Autowired
	private OaProjectService oaProjectService;
	@ModelAttribute
	public OaContractProtocol get(@RequestParam(required=false) String id) {
		OaContractProtocol entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = oaContractProtocolService.get(id);
		}
		if (entity == null){
			entity = new OaContractProtocol();
		}
		return entity;
	}
	
	@RequiresPermissions("oa:contract:oaContractProtocol:view")
	@RequestMapping(value = {"list", ""})
	public String list(OaContractProtocol oaContractProtocol, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<OaContractProtocol> page = oaContractProtocolService.findPage(new Page<OaContractProtocol>(request, response), oaContractProtocol); 
		model.addAttribute("page", page);
		return "modules/oa/contract/oaContractProtocolList";
	}

	@RequiresPermissions("oa:contract:oaContractProtocol:view")
	@RequestMapping(value = "form")
	public String form(OaContractProtocol oaContractProtocol, Model model) {
		model.addAttribute("oaContractProtocol", oaContractProtocol);
		List<OaProject> oaProjectList = oaProjectService.findList(new OaProject());
		model.addAttribute("oaProjectList", oaProjectList);
		return "modules/oa/contract/oaContractProtocolForm";
	}

	@RequiresPermissions("oa:contract:oaContractProtocol:edit")
	@RequestMapping(value = "save")
	public String save(OaContractProtocol oaContractProtocol, Model model, RedirectAttributes redirectAttributes) {
		if (StringUtils.isBlank(oaContractProtocol.getContractName())){
			addMessage(model, "合同名称不能为空");
			return form(oaContractProtocol, model);
		}
		oaContractProtocolService.save(oaContractProtocol);
		addMessage(redirectAttributes, "保存协议框架合同成功");
		return "redirect:"+Global.getAdminPath()+"/oa/contract/oaContractProtocol/?repage";
	}
	
	@RequiresPermissions("oa:contract:oaContractProtocol:edit")
	@RequestMapping(value = "delete")
	public String delete(OaContractProtocol oaContractProtocol, RedirectAttributes redirectAttributes) {
		oaContractProtocolService.delete(oaContractProtocol);
		addMessage(redirectAttributes, "删除协议框架合同成功");
		return "redirect:"+Global.getAdminPath()+"/oa/contract/oaContractProtocol/?repage";
	}
	
	/**
	 * 
	 * @param file
	 * @param redirectAttributes
	 * @return
	 */
	@RequiresPermissions("oa:contract:oaContractProtocol:edit")
	@RequestMapping(value = "import", method = RequestMethod.POST)
	public String importFile(MultipartFile file, RedirectAttributes redirectAttributes) {
		try {
			InputStream is = file.getInputStream();
			HSSFWorkbook hssfWorkbook = new HSSFWorkbook(is);
			HSSFSheet hssfSheet = hssfWorkbook.getSheetAt(0);
			List<OaProject> oaProjects=oaProjectService.findList(new OaProject());
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
					
					OaContractProtocol oaContractProtocol=new OaContractProtocol();
					oaContractProtocol.setContractName(cell0);
					oaContractProtocol.setProject(findOaProjectByProjectNo(oaProjects, cell1));
					oaContractProtocol.setContractNo(cell2);
					oaContractProtocolService.save(oaContractProtocol);
					successNum++;
				} catch (Exception e) {
					// TODO: handle exception
					failureNum++;
				}
			}
			
			StringBuilder failureMsg = new StringBuilder();
			if (failureNum > 0) {
				failureMsg.insert(0, "，失败 " + failureNum + " 条协议框架，导入信息如下：");
			}
			addMessage(redirectAttributes, "已成功导入 " + successNum + " 条协议框架" + failureMsg);
		} catch (Exception e) {
			addMessage(redirectAttributes, "导入协议框架失败！失败信息：" + e.getMessage());
		}
		return "redirect:" + adminPath + "/oa/contract/oaContractProtocol/list?repage";
	}
	
	private OaProject findOaProjectByProjectNo(List<OaProject> list,String projectNo){
		for (OaProject oaProject : list) {
			if (StringUtils.equals(oaProject.getProjectNo(), projectNo)) {
				return oaProject;
			}
		}
		return null;
	}

}