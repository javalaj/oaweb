/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.dao.loan;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.oa.entity.loan.OaLoanRepayment;

/**
 * 借支还款管理DAO接口
 * @author 李廷龙
 * @version 2017-01-16
 */
@MyBatisDao
public interface OaLoanRepaymentDao extends CrudDao<OaLoanRepayment> {
	public Double getSumRepaymentMoney(String loanUserId);
	public Double getSumRepaymentMoneyByLoanMainId(String loanMainId);
	
}