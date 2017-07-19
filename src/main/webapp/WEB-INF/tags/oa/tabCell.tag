<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ attribute name="id" type="java.lang.String" required="false"%>
<%@ attribute name="href" type="java.lang.String" required="true"%>
<%@ attribute name="label" type="java.lang.String" required="true"%>
<%@ attribute name="isActive" type="java.lang.Boolean" required="false"%>
<%@ attribute name="isShowBadge" type="java.lang.Boolean" required="false"%>
<%@ attribute name="isCurrentPageElement" type="java.lang.Boolean" required="false" description="href指向的地址是否为当前页面内元素"%>
<%@ attribute name="badgeInfo" type="java.lang.String" required="false"%>
<li id="${id}" class="${isActive?'active':''}"><a href="${href}" data-toggle="${isCurrentPageElement?'tab':''}">${label}<span style="font-size:12px;display:${!isShowBadge?'none':''}" class="oa-tab-cell-badge">${badgeInfo}</span></a></li>
