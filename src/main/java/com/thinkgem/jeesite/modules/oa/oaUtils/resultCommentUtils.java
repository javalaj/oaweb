package com.thinkgem.jeesite.modules.oa.oaUtils;

import java.io.Serializable;

import com.thinkgem.jeesite.common.persistence.ActEntity;
import com.thinkgem.jeesite.common.utils.StringUtils;

public class resultCommentUtils {

	public static <E extends ActEntity<E> & Serializable> String resultComment(E e,String successText, String failText,
	String comment) {
		String result = failText;
		if (StringUtils.equals(e.getAct().getFlag(), "true")) {
			result = successText;
		}
			result = "[" + result + "]" + comment;
			return result;
	}
}
