/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.service.loan;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.oa.entity.loan.OaLoanRepayment;
import com.thinkgem.jeesite.modules.oa.dao.loan.OaLoanRepaymentDao;

/**
 * 借支还款管理Service
 * @author 李廷龙
 * @version 2017-01-16
 */
@Service
@Transactional(readOnly = true)
public class OaLoanRepaymentService extends CrudService<OaLoanRepaymentDao, OaLoanRepayment> {

	public OaLoanRepayment get(String id) {
		return super.get(id);
	}
	public Double getSumRepaymentMoney(String loanUserId){
		Double result=dao.getSumRepaymentMoney(loanUserId);
		if (result==null) {
			result=0d;
		}
		return result;
	}
	public Double getSumRepaymentMoneyByLoanMainId(String loanMainId){
		Double result=dao.getSumRepaymentMoneyByLoanMainId(loanMainId);
		if (result==null) {
			result=0d;
		}
		return result;
	}
	
	public List<OaLoanRepayment> findList(OaLoanRepayment oaLoanRepayment) {
		return super.findList(oaLoanRepayment);
	}
	
	public Page<OaLoanRepayment> findPage(Page<OaLoanRepayment> page, OaLoanRepayment oaLoanRepayment) {
		return super.findPage(page, oaLoanRepayment);
	}
	
	@Transactional(readOnly = false)
	public void save(OaLoanRepayment oaLoanRepayment) {
		super.save(oaLoanRepayment);
	}
	
	@Transactional(readOnly = false)
	public void delete(OaLoanRepayment oaLoanRepayment) {
		super.delete(oaLoanRepayment);
	}
	
}