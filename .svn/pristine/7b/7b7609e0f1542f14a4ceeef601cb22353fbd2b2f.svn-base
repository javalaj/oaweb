<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ attribute name="isMobile" type="java.lang.String" required="false"
	description="是否为手机端的撤回操作"%>
<%@ attribute name="oaUseCarId" type="java.lang.String" required="false"
	description="业务表id"%>
<%@ attribute name="xinSign" type="java.lang.String" required="false"
	description="特殊处理标志位"%>
<%-- attribute name="procInsId" type="java.lang.String" required="true"
	description="流程业务id，后台单独model传递，为空标示无权撤回的意思"--%>
<c:choose>
	<c:when test="${isMobile == 'true'}">
		<c:choose>
		<c:when test="${not empty procInsId}">
			<button type="button" data-loading-text="撤回中"
				class="btnapp btn-next bt2"
				style="text-align: center; margin: 10px 0; margin-left: 15%; width: 30%;"
				onclick='window.location.href = "${ctx}/oa/flowback/oaFlowBack/usecarSave?isMobile=true&id=${procInsId}&oaUseCarId=${oaUseCarId}&xinSign=${xinSign}";' >
				<span>撤 回</span>
			</button>
			<button type="button" data-loading-text="返回中"
				class="btnapp btn-next bt2"
				style="text-align: center; margin: 10px 0; margin-left: 10%; width: 30%;"
				onclick='window.location.href="${mctx}/act/task/todo/";'>
				<span>返回待办</span>
			</button>
		</c:when>
		<c:otherwise>
			<button type="button" data-loading-text="返回中"
				class="btnapp btn-next bt2"
				style="text-align: center; margin: 10px 0; margin-left: 25%; width: 50%;"
				onclick='window.location.href="${mctx}/act/task/todo/";'>
				<span>返回待办</span>
			</button>
		</c:otherwise>	
	</c:choose>
		<input id="xin_m_msg" value="${message}" type="hidden">

		<script>
			$(function() {
				if ($("#xin_m_msg").val() != "") {
					//提示语句
					new_alert($("#xin_m_msg").val() + " !", " ");
					$("#xin_m_msg").val("");
				}
			});
		</script>
	</c:when>
	<c:otherwise>
		<c:if test="${not empty procInsId}">&nbsp;<input
				id="flow_back_btn" class="btn" type="button" value="撤 回"
				onclick='window.location.href = "${ctx}/oa/flowback/oaFlowBack/usecarSave?isMobile=false&id=${procInsId}&oaUseCarId=${oaUseCarId}&xinSign=${xinSign}";' />
		</c:if>
		<input id="xin_m_msg" value="${message}" type="hidden">

		<script>
			$(function() {
				if ($("#xin_m_msg").val() != "") {
					top.layer.msg($("#xin_m_msg").val());
					$("#xin_m_msg").val("");
				}
				//alert(123);top.layer.msg("流程撤回成功");
			});
		</script>
	</c:otherwise>
</c:choose>