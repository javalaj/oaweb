<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>请假流程管理</title>
<meta name="decorator" content="default" />
<script type="text/javascript">
	$(document)
			.ready(
					function() {
					/* 	$("#btnPNG")
								.click(
										function() {
											top.$.jBox
													.open(
															"iframe:/oa/a/act/task/trace/photo/${task.processDefinitionId}/${task.executionId}",
															"流程跟踪",
															1400,
															500,
															{
																buttons : {
																	"关闭" : true
																},
																submit : function(
																		v, h, f) {

																},
																loaded : function(
																		h) {
																	$(
																			".jbox-content",
																			top.document)
																			.css(
																					"overflow-y",
																					"hidden");
																}
															});
										}); */
						//$("#name").focus();
						$("#inputForm").validate(
								{
									submitHandler : function(form) {
										oaLoading('正在提交，请稍等...');
										form.submit();
									},
									errorContainer : "#messageBox",
									errorPlacement : function(error, element) {
										$("#messageBox").text("输入有误，请先更正。");
										if (element.is(":checkbox")
												|| element.is(":radio")
												|| element.parent().is(
														".input-append")) {
											error.appendTo(element.parent()
													.parent());
										} else {
											error.insertAfter(element);
										}
									}
								});
					});
</script>
<link rel="stylesheet" type="text/css"
	href="${ctxStatic}/liuxin/css/liucheng.css">
</head>
<body class="gray-bg">
	<div class="wrapper wrapper-content">
		<div class="ibox">
			<div class="ibox-title printHidden">
				<h5>${oaProVacate.vacateTitle}</h5>
			</div>
			<div class="ibox-content">
				<%--
				<ul class="nav nav-tabs">
					<li class="active"><a
						href="${ctx}/oa/coding/oaProVacate/view?id=${oaProVacate.id}">请假流程查看
					</a></li>
				</ul>
				<br />
				 --%>
				<form:form id="inputForm" modelAttribute="oaProVacate"
					action="${ctx}/oa/coding/oaProVacate/exam" method="post"
					class="form-inline">
					<form:hidden path="id" />
					<sys:message content="${message}" />
					<div class="control-group">
						<label class="control-label">申请日期：</label>

						<fmt:formatDate value="${oaProVacate.applydate}"
							pattern="yyyy-MM-dd HH:mm:ss" />
					</div>
					<div class="control-group">
						<label class="control-label">请假开始时间：</label>

						<fmt:formatDate value="${oaProVacate.vacatebegindate}"
							pattern="yyyy-MM-dd HH:mm:ss" />
					</div>
					<div class="control-group">
						<label class="control-label">请假截止时间：</label>

						<fmt:formatDate value="${oaProVacate.vacateenddate}"
							pattern="yyyy-MM-dd HH:mm:ss" />
					</div>
					<div class="control-group">
						<label class="control-label">请假小时数：</label>
						${oaProVacate.vacatedays}
					</div>
					<div class="control-group">
						<label class="control-label">请假类型：</label>
						${fns:getDictLabel(oaProVacate.vacatetype,
				'pro_vacate_type', '')}
					</div>
					<div class="control-group">
						<label class="control-label">请假事由：</label>
						${oaProVacate.vacatedesc}
					</div>
					<div class="form-actions">
						<input id="btnCancel" class="btn" type="button" value="返 回"
							onclick="history.go(-1)" /><act:flow-back-btn></act:flow-back-btn>
						<c:if test="${task != null}">
				&nbsp;<input id="btnPNG" class="btn" type="button" value="流程跟踪"  onclick='btnPNGshow("${task.processDefinitionId}/${task.executionId}");'/>
						</c:if>
					</div>
					<c:if test="${not empty oaProVacate.id}">
						<act:histoicFlow procInsId="${oaProVacate.procInsId}" />
					</c:if>
				</form:form>
			</div>
		</div>
	</div>
</body>
</html>