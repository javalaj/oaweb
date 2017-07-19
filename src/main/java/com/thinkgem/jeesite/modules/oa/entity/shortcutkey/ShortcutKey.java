/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.entity.shortcutkey;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;
import com.thinkgem.jeesite.modules.sys.entity.Menu;

/**
 * 快捷方式Entity
 * @author zf
 * @version 2016-12-28
 */
public class ShortcutKey extends DataEntity<ShortcutKey> {
	
	private static final long serialVersionUID = 1L;
	private Menu menu;	// 菜单
	private String icon;		// 图标
	
	public ShortcutKey() {
		super();
	}

	public ShortcutKey(String id){
		super(id);
	}

	
	@Length(min=1, max=255, message="图标长度必须介于 1 和 255 之间")
	public String getIcon() {
		return icon;
	}

	public void setIcon(String icon) {
		this.icon = icon;
	}

	public Menu getMenu() {
		return menu;
	}

	public void setMenu(Menu menu) {
		this.menu = menu;
	}
	
}