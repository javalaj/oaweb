/**
 * Copyright &copy; 2012-2025 <a href="https://www.chuyutech.com">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.service.salarybillsend;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.oa.entity.salarybillsend.OaSalaryBill;
import com.thinkgem.jeesite.modules.oa.entity.salarybillsend.OaSalaryDetails;
import com.thinkgem.jeesite.modules.oa.dao.salarybillsend.OaSalaryBillDao;

/**
 * 工资条发送Service
 * @author zf
 * @version 2017-05-08
 */
@Service
@Transactional(readOnly = true)
public class OaSalaryBillService extends CrudService<OaSalaryBillDao, OaSalaryBill> {

	@Autowired
	private OaSalaryDetailsService oaSalaryDetailsService;
	
	public OaSalaryBill get(String id) 
	{
		OaSalaryBill oaSalaryBill = super.get(id);
		
		OaSalaryDetails oaSalaryDetails = new OaSalaryDetails();
		
		oaSalaryDetails.setBillId(id);
		
		List<OaSalaryDetails> list = oaSalaryDetailsService.findList(oaSalaryDetails);
		
		oaSalaryBill.setDetailList(list);
		
		return oaSalaryBill;
	}
	
	public List<OaSalaryBill> findList(OaSalaryBill oaSalaryBill) {
		return super.findList(oaSalaryBill);
	}
	
	public Page<OaSalaryBill> findPage(Page<OaSalaryBill> page, OaSalaryBill oaSalaryBill) {
		return super.findPage(page, oaSalaryBill);
	}
	
	@Transactional(readOnly = false)
	public void save(OaSalaryBill oaSalaryBill) {
		super.save(oaSalaryBill);
	}
	
	@Transactional(readOnly = false)
	public void delete(OaSalaryBill oaSalaryBill) {
		super.delete(oaSalaryBill);
	}

	@Transactional(readOnly = false)
	public void update(OaSalaryBill oaSalaryBill) 
	{
		dao.update(oaSalaryBill);
	}
	
}