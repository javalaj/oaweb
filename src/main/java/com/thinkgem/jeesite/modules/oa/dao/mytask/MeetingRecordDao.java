package com.thinkgem.jeesite.modules.oa.dao.mytask;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.oa.entity.mytask.MeetingRecord;

@MyBatisDao
public interface MeetingRecordDao extends CrudDao<MeetingRecord> {
	
	public void updateMeetingRecord(MeetingRecord meetingrecord);
	
	public MeetingRecord getMeetingRecord(MeetingRecord meetingrecord);

}
