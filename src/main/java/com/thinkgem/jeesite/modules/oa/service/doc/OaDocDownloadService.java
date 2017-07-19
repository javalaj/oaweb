/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.service.doc;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.oa.entity.doc.OaDocDownload;
import com.thinkgem.jeesite.modules.oa.dao.doc.OaDocDownloadDao;

/**
 * 文档管理Service
 * @author 李廷龙
 * @version 2017-02-28
 */
@Service
@Transactional(readOnly = true)
public class OaDocDownloadService extends CrudService<OaDocDownloadDao, OaDocDownload> {

	
	
	
	@Transactional(readOnly = false)
	public void save(OaDocDownload oaDocDownload) {
		super.save(oaDocDownload);
	}
	
}