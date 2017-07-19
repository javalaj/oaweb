<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ attribute name="isAlwaysVisible" type="java.lang.Boolean" required="false"%>
<%@ attribute name="label" type="java.lang.String" required="false"%>
<label class="${isAlwaysVisible?'oa-search-group-alwaysVisible':''}">${label}
	<jsp:doBody></jsp:doBody>
</label>
