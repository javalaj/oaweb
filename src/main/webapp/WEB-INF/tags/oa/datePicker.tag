<%@ tag language="java" pageEncoding="UTF-8" body-content="empty" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ attribute name="id" type="java.lang.String" required="true"%>
<%@ attribute name="cssClass" type="java.lang.String" %>
<%@ attribute name="pattern" type="java.lang.String"  required="true"%>
<%@ attribute name="value" type="java.util.Date" %>
<%@ attribute name="readOnly" type="java.lang.String" %>
<%@ attribute name="isShowClear" type="java.lang.Boolean" %>
<%@ attribute name="onPicked" type="java.lang.String" %>
<%@ attribute name="onCleared" type="java.lang.String" %>
<input id="${id}" name="${id}" type="text" readonly="readonly" class="Wdate laydate-icon form-control layer-date input-sm ${cssClass}"
		value="<fmt:formatDate value="${value}" pattern="${pattern}"/>"
		onclick="<c:if test="${readOnly ne 'true'}">WdatePicker({dateFmt:'${pattern}',isShowClear:${isShowClear},onpicked:function(){${onPicked}},oncleared:function(){${onCleared}}});</c:if>"/>