<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ attribute name="id" type="java.lang.String" required="false"%>
<%@ attribute name="url" type="java.lang.String" required="false"%>
<%@ attribute name="iconClass" type="java.lang.String" required="false"%>
<%@ attribute name="badgeValue" type="java.lang.String" required="false"%>
<%@ attribute name="title" type="java.lang.String" required="false"%>
<style>
	li.menu1Cell a{
		font-size:14px;
	}
	li.menu1Cell i{
		font-size:20px;
		margin-right:2px;
	}
</style>
<li id="${id}" class="mui-table-view-cell menu1Cell">
	<a href="${url}">
		<i class="mui-icon ${iconClass}"></i>
		${title}
		<c:if test="${badgeValue>0}">
			<span class="mui-badge mui-badge-danger">
				${badgeValue}
			</span>
		</c:if>
	</a>
</li>