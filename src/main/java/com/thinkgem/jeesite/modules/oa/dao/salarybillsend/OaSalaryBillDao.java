/**
 * Copyright &copy; 2012-2025 <a href="https://www.chuyutech.com">JeeCY</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.dao.salarybillsend;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.oa.entity.salarybillsend.OaSalaryBill;

/**
 * 工资条发送DAO接口
 * @author zf
 * @version 2017-05-08
 */
@MyBatisDao
public interface OaSalaryBillDao extends CrudDao<OaSalaryBill> {
	
}