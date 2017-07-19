package com.thinkgem.jeesite.mobile.modules.oa.web.coding.comparator;

import java.util.Comparator;

import com.thinkgem.jeesite.common.utils.DateUtils;
import com.thinkgem.jeesite.modules.oa.entity.coding.OaCollectCoding;

public class OaCollectCodingComparator implements Comparator<OaCollectCoding> {

	@Override
	public int compare(OaCollectCoding o1, OaCollectCoding o2) {
		// TODO Auto-generated method stub
		return DateUtils.compareDate(o1.getCodingBegindate(), o2.getCodingBegindate());
	}

}
