/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.oa.dao.OaNotifyDao;
import com.thinkgem.jeesite.modules.oa.dao.OaNotifyRecordDao;
import com.thinkgem.jeesite.modules.oa.entity.OaNotify;
import com.thinkgem.jeesite.modules.oa.entity.OaNotifyRecord;
import com.thinkgem.jeesite.modules.sys.dao.UserDao;

/**
 * 通知通告Service
 * 
 * @author liaijun
 * @version 2014-10-13
 */
@Service
@Transactional(readOnly = true)
public class OaNotifyService extends CrudService<OaNotifyDao, OaNotify> {

	@Autowired
	private OaNotifyRecordDao oaNotifyRecordDao;
	@Autowired
	private UserDao userDao;

	public OaNotify get(String id) {
		OaNotify entity = dao.get(id);
		return entity;
	}

	@Transactional(readOnly = false)
	public void deleteMyNoticeByOaNotifyId(String oaNotifyId, String userId) {
		oaNotifyRecordDao.deleteMyNoticeByOaNotifyId(oaNotifyId, userId);
	}

	/**
	 * 获取通知发送记录
	 * 
	 * @param oaNotify
	 * @return
	 */
	public OaNotify getRecordList(OaNotify oaNotify) {
		oaNotify.setOaNotifyRecordList(oaNotifyRecordDao.findList(new OaNotifyRecord(oaNotify)));
		return oaNotify;
	}

	/**
	 * 分页列表显示
	 * 
	 * @param page
	 * @param oaNotify
	 * @return
	 */
	public Page<OaNotify> find(Page<OaNotify> page, OaNotify oaNotify) {
		oaNotify.setPage(page);
		page.setList(dao.findList(oaNotify));
		for (int i = 0; i < page.getList().size(); i++) {
			page.getList().get(i).setCreateBy(userDao.get(page.getList().get(i).getCreateBy().getId()));
		}
		return page;
	}

	/**
	 * 我的通知
	 * 
	 * @param page
	 * @param oaNotify
	 * @return
	 */
	public Page<OaNotify> findMyList(Page<OaNotify> page, OaNotify oaNotify) {
		oaNotify.setPage(page);
		page.setList(dao.findMyList(oaNotify));
		for (int i = 0; i < page.getList().size(); i++) {
			page.getList().get(i).setCreateBy(userDao.get(page.getList().get(i).getCreateBy().getId()));
		}
		return page;
	}

	/**
	 * 我的所有通知
	 * 
	 * @param oaNotify
	 * @return
	 */
	public List<OaNotify> findMyAllList(OaNotify oaNotify) {
		List<OaNotify> list = dao.findMyList(oaNotify);

		for (int i = 0; i < list.size(); i++)
			list.get(i).setCreateBy(userDao.get(list.get(i).getCreateBy().getId()));

		return list;
	}

	/**
	 * 通告列表
	 * 
	 * @param page
	 * @param oaNotify
	 * @return
	 */
	public Page<OaNotify> findList(Page<OaNotify> page, OaNotify oaNotify) {
		oaNotify.setPage(page);
		page.setList(dao.findAllList(oaNotify));
		for (int i = 0; i < page.getList().size(); i++) {
			page.getList().get(i).setCreateBy(userDao.get(page.getList().get(i).getCreateBy().getId()));
		}
		return page;
	}

	/**
	 * 获取通知数目
	 * 
	 * @param oaNotify
	 * @return
	 */
	public Long findCount(OaNotify oaNotify) {
		return dao.findCount(oaNotify);
	}

	/**
	 * 保存通知内容
	 * 
	 * @param oaNotify
	 * @return
	 */
	@Transactional(readOnly = false)
	public void save(OaNotify oaNotify) {
		super.save(oaNotify);

		// 更新发送接受人记录
		oaNotifyRecordDao.deleteByOaNotifyId(oaNotify.getId());
		if (oaNotify.getOaNotifyRecordList().size() > 0) {
			oaNotifyRecordDao.insertAll(oaNotify.getOaNotifyRecordList());
		}
	}

	/**
	 * 更新阅读状态
	 */
	@Transactional(readOnly = false)
	public void updateReadFlag(OaNotify oaNotify) {
		OaNotifyRecord oaNotifyRecord = new OaNotifyRecord(oaNotify);
		oaNotifyRecord.setUser(oaNotifyRecord.getCurrentUser());
		oaNotifyRecord.setReadDate(new Date());
		oaNotifyRecord.setReadFlag("1");
		oaNotifyRecordDao.update(oaNotifyRecord);
	}

	/**
	 * 通过内容删除通告
	 * 
	 * @param oaNotify
	 */
	@Transactional(readOnly = false)
	public void deleteByContent(String content) {
		OaNotify oaNotify = new OaNotify();
		oaNotify.setContent(content);
		dao.deleteByContent(oaNotify);
	}

	/**
	 * 
	 * 通过keyid删除表数据
	 * 
	 */
	@Transactional(readOnly = false)
	public void deleteByKeyId(String keyId) {
		OaNotify oaNotify = new OaNotify();
		oaNotify.setKeyId(keyId);
		dao.deleteByKeyId(oaNotify);
	}
}