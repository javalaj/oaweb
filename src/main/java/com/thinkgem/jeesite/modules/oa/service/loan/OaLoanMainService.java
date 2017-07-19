/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.service.loan;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.oa.entity.loan.OaLoanMain;
import com.thinkgem.jeesite.modules.oa.dao.loan.OaLoanMainDao;

/**
 * 借支单管理Service
 * @author 李廷龙
 * @version 2017-01-16
 */
@Service
@Transactional(readOnly = true)
public class OaLoanMainService extends CrudService<OaLoanMainDao, OaLoanMain> {

	public OaLoanMain get(String id) {
		return super.get(id);
	}
	public Double getSumLoanMoney(String loanUserId){
		Double result=dao.getSumLoanMoney(loanUserId);
		if (result==null) {
			result=0d;
		}
		return result;
	}
	public List<OaLoanMain> findList(OaLoanMain oaLoanMain) {
		return super.findList(oaLoanMain);
	}
	
	public Page<OaLoanMain> findPage(Page<OaLoanMain> page, OaLoanMain oaLoanMain) {
		return super.findPage(page, oaLoanMain);
	}
	
	@Transactional(readOnly = false)
	public void save(OaLoanMain oaLoanMain) {
		super.save(oaLoanMain);
	}
	
	@Transactional(readOnly = false)
	public void delete(OaLoanMain oaLoanMain) {
		super.delete(oaLoanMain);
	}
	
}