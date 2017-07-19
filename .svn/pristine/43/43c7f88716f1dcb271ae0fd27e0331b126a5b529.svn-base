package com.thinkgem.jeesite.modules.oa.service.mytask;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.oa.dao.mytask.MeetingRecordDao;
import com.thinkgem.jeesite.modules.oa.entity.mytask.MeetingRecord;
@Service
@Transactional(readOnly = true)
public class MeetingRecordService extends  CrudService<MeetingRecordDao, MeetingRecord> {
	@Autowired
	MeetingRecordDao dao;
	
	@Transactional(readOnly = false)
	public void save(MeetingRecord meetingrecord) {
		super.save(meetingrecord);
	}
	@Transactional(readOnly = false)
	public void updateMeetingRecord(MeetingRecord meetingrecord) {
		dao.updateMeetingRecord(meetingrecord);
	}
	
	public MeetingRecord getMeetingRecord(MeetingRecord meetingrecord){
		return dao.getMeetingRecord(meetingrecord);
	}
}
