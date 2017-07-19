/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.oa.entity.OaLoan;

/**
 * 借支DAO接口
 * 
 * @author liaijun
 * @version 2016-11-21
 */
@MyBatisDao
public interface OaLoanDao extends CrudDao<OaLoan> {
	// 通过实例id获取对象
	public OaLoan getByProcInsId(String procInsId);

	// 更新实例id
	public int updateInsId(OaLoan OaLoan);

	// 直属上级审批
	public int updateUpperText(OaLoan oaLoan);

	// 项目经理审批
	public int updateProText(OaLoan OaLoan);

	// 财务部副总审批
	public int updateFincinalText(OaLoan OaLoan);

	// 总经理审批
	public int updatemanagertext(OaLoan OaLoan);

	// 会计审核
	public int updateAccountText(OaLoan OaLoan);

	// 出纳确认
	public int updatePayText(OaLoan OaLoan);

}