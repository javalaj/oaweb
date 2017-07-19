<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ attribute name="content" type="java.lang.String" required="true" description="消息内容"%>
<script type="text/javascript">
$(document).ready(function() {
	<c:if test="${not empty content}">
		mui.toast("${content}");
	</c:if>
});
</script>
