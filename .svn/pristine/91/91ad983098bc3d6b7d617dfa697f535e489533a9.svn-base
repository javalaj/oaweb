/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.service.shortcutkey;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.oa.entity.shortcutkey.ShortcutKey;
import com.thinkgem.jeesite.modules.oa.dao.shortcutkey.ShortcutKeyDao;

/**
 * 快捷方式Service
 * @author zf
 * @version 2016-12-28
 */
@Service
@Transactional(readOnly = true)
public class ShortcutKeyService extends CrudService<ShortcutKeyDao, ShortcutKey> {

	public ShortcutKey get(String id) {
		return super.get(id);
	}
	
	public List<ShortcutKey> findList(ShortcutKey shortcutKey) {
		return super.findList(shortcutKey);
	}
	
	public Page<ShortcutKey> findPage(Page<ShortcutKey> page, ShortcutKey shortcutKey) {
		return super.findPage(page, shortcutKey);
	}
	
	@Transactional(readOnly = false)
	public void save(ShortcutKey shortcutKey) {
		super.save(shortcutKey);
	}
	
	@Transactional(readOnly = false)
	public void delete(ShortcutKey shortcutKey) {
		super.delete(shortcutKey);
	}
	
}