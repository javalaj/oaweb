<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ attribute name="url" type="java.lang.String" required="false"%>
<%@ attribute name="title" type="java.lang.String" required="false"%>
<%@ attribute name="width" type="java.lang.String" required="false"%>
<%@ attribute name="height" type="java.lang.String" required="false"%>
<%@ attribute name="target" type="java.lang.String" required="false"%>
<%@ attribute name="label" type="java.lang.String" required="false"%>
<button class="btn btn-white btn-sm" data-toggle="tooltip"
	style="outline-style: none;" data-placement="left" onclick="shoucang()"
	title="收藏">
	<i class="fa">★</i> 收藏
</button>
<%-- 使用方法：在页面自定义收藏方法shoucang() --%>
