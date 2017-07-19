<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ attribute name="id" type="java.lang.String" required="false"%>
<style>
.myoa-tabs {
    background-color: #eff4f8;
}
</style>
<ul class="nav nav-tabs myoa-tabs" id="${id}">
	<jsp:doBody></jsp:doBody>
</ul>
<script type="text/javascript">
function resetOaTabcellBadge${id}(cellId,content){
	$(".myoa-tabs#${id} li#"+cellId+" a span.oa-tab-cell-badge").html(content);
}
</script>
