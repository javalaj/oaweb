/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.dao;

import java.util.List;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.oa.entity.OaArchives;

/**
 * 公文DAO接口
 * 
 * @author liaijun
 * @version 2016-11-09
 */
@MyBatisDao
public interface OaArchivesDao extends CrudDao<OaArchives> {
	// 通过实例id获取对象
	public OaArchives getByProcInsId(String procInsId);

	// 更新实例id
	public int updateInsId(OaArchives oaArchives);

	// 本部门领导会签
	public int updateLeadText(OaArchives oaArchives);

	// 技术部领导会签
	public int updateThText(OaArchives oaArchives);

	// 研发部领导会签
	public int updateDevelopText(OaArchives oaArchives);

	// 商务部领导会签
	public int updateCommerceText(OaArchives oaArchives);

	// 市场部领导会签
	public int updateMarketText(OaArchives oaArchives);

	// 人事行政部领导会签
	public int updatePersonalText(OaArchives oaArchives);

	// 财务部领导会签
	public int updateFinanceText(OaArchives oaArchives);

	// 总经理会签
	public int updateManagerText(OaArchives oaArchives);

	public List<OaArchives> findList2(OaArchives entity);
}