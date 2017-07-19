<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ attribute name="id" type="java.lang.String" required="false"%>
<%@ attribute name="cssCLass" type="java.lang.String" required="false"%>
<%@ attribute name="cssStyle" type="java.lang.String" required="false"%>
<header id="${id}" class="mui-bar mui-bar-nav" style="position: fixed; top: 0px; left: 0; z-index: 997;">
	<jsp:doBody></jsp:doBody>
</header>