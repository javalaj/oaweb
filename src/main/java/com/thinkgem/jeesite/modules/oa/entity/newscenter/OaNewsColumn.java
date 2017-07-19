/**
 * Copyright &copy; 2012-2025 <a href="https://www.chuyutech.com">JeeCY</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.entity.newscenter;

import org.hibernate.validator.constraints.Length;
import com.thinkgem.jeesite.modules.sys.entity.User;

import com.thinkgem.jeesite.common.persistence.DataEntity;
import com.thinkgem.jeesite.common.utils.excel.annotation.ExcelField;
/**
 * 栏目管理Entity
 * @author zf
 * @version 2017-05-24
 */
public class OaNewsColumn extends DataEntity<OaNewsColumn> {
	
	private static final long serialVersionUID = 1L;
	private String columnName;		// 栏目名称
	private User admin;		// 栏目管理员
	
	public OaNewsColumn() {
		super();
	}

	public OaNewsColumn(String id){
		super(id);
	}

	@Length(min=0, max=255, message="栏目名称长度必须介于 0 和 255 之间")
			
	@ExcelField(title="栏目名称", align=2, sort=1)
	
	public String getColumnName() {
		return columnName;
	}

	public void setColumnName(String columnName) {
		this.columnName = columnName;
	}
	
			
	@ExcelField(title="栏目管理员", fieldType=User.class, value="", align=2, sort=2)
	
	public User getAdmin() {
		return admin;
	}

	public void setAdmin(User admin) {
		this.admin = admin;
	}
	
}