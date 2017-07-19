<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>忘记打卡申请管理</title>
<meta name="decorator" content="default" />
<script type="text/javascript">
	$(document).ready(
			function() {
				//$("#name").focus();
				$("#inputForm")
						.validate(
								{
									submitHandler : function(form) {
										//loading('正在提交，请稍等...');
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
			<div class="ibox-title">
				<h5>${title}</h5>
			</div>
			<div class="ibox-content">
				<%--
				<ul class="nav nav-tabs">
					<li class="active"><a
						href="${ctx}/oa/oaForgetclock/form?id=${oaForgetclock.id}&flag=view">查看-忘记打卡申请</a></li>
				</ul>
				<br />
				 --%>
				<form:form id="inputForm" modelAttribute="oaOvertime" action=""
					method="post" class="form-inline">
					<sys:message content="${message}" />
					<div class="control-group">
						<label class="control-label">部门名称：</label>
						${oaForgetclock.officeName}
					</div>
					<div class="control-group">
						<label class="control-label">申请人：</label>
						${oaForgetclock.createBy.name}
					</div>
					<div class="control-group">
						<label class="control-label">申请时间：</label>

						<fmt:formatDate value="${oaForgetclock.createDate}"
							pattern="yyyy-MM-dd HH:mm:ss" />
					</div>
					<div class="control-group">
						<label class="control-label">忘记打卡日期：</label>

						<fmt:formatDate value="${oaForgetclock.date}" pattern="yyyy-MM-dd" />
					</div>
					<div class="control-group">
						<label class="control-label">忘记打卡节点：</label>
						<c:choose>
							<c:when test="${oaForgetclock.timesign == 0}">上班</c:when>
							<c:when test="${oaForgetclock.timesign == 1}">下班</c:when>
							<c:otherwise>上下班</c:otherwise>
						</c:choose>
					</div>
					<div class="control-group">
						<label class="control-label">忘记打卡时间描述：</label> ${oaForgetclock.time }
					</div>
					<div class="control-group">
						<label class="control-label">上级领导审核签名：</label>
						${oaForgetclock.examname}
					</div>
					<div class="control-group">
						<label class="control-label">上级领导审核意见：</label>
						${oaForgetclock.examtext}
					</div>
					<div class="control-group">
						<label class="control-label">人事归档签名：</label>
						${oaForgetclock.examname2}
					</div>
					<div class="control-group">
						<label class="control-label">人事归档意见：</label>
						${oaForgetclock.examtext2}
					</div>
					<div class="form-actions">
						<input id="btnCancel" class="btn" type="button" value="返 回"
							onclick="history.go(-1)" />
						<act:flow-back-btn></act:flow-back-btn>
						<c:if test="${task != null}">
				&nbsp;<input
								onclick='btnPNGshow("${task.processDefinitionId}/${task.executionId}");'
								class="btn" type="button" value="流程跟踪" />
						</c:if>
					</div>
					<c:if test="${not empty oaForgetclock.id}">
						<act:histoicFlow procInsId="${oaForgetclock.procInsId}" />
					</c:if>
				</form:form>
			</div>
		</div>
	</div>
</body>
</html>