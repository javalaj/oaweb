<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ attribute name="procInsId" type="java.lang.String" required="true" description="流程实例ID"%>
<%@ attribute name="startAct" type="java.lang.String" required="false" description="开始活动节点名称"%>
<%@ attribute name="endAct" type="java.lang.String" required="false" description="结束活动节点名称"%>
<link rel="stylesheet" type="text/css" href="${ctxStatic}/mobile/css/mui.min.css" />
<script src="${ctxStatic}/mobile/js/mui.min.js"></script>
<div class="mui-card">
	<!--页眉，放置标题-->
	<div class="mui-card-header" style='text-align:left;font-size: 18px;color: #18a689;'>流转信息</div>
	<!--内容区-->
	<div class="mui-card-content" id="histoicFlowList">正在加载流转信息...</div>
</div>
<script type="text/javascript">
	$.get("${ctx}/act/task/histoicFlowMobile?procInsId=${procInsId}&startAct=${startAct}&endAct=${endAct}&t="+new Date().getTime(), function(data){
		$("#histoicFlowList").html(data);
	});
</script>