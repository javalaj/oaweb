<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ attribute name="id" type="java.lang.String" required="false"%>
<%@ attribute name="cssCLass" type="java.lang.String" required="false"%>
<%@ attribute name="cssStyle" type="java.lang.String" required="false"%>
<div id="${id}" class="mui-content ${cssCLass}" style="background-color: #fff;${cssStyle}">
	<jsp:doBody></jsp:doBody>
</div>