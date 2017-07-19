<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>人力审核备案-外出申请</title>
<meta name="decorator" content="default" />
<script type="text/javascript">
	$(document).ready(
			function() {
				//$("#name").focus();
				$("#inputForm")
						.validate(
								{
									submitHandler : function(form) {
										//	loading('正在提交，请稍等...');
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
				<h5>${title}</h5>
			</div>
			<div class="ibox-content">
				<%--
				<ul class="nav nav-tabs">
					<li class="active"><a
						href="${ctx}/oa/oaGoout/filling?id=${oaGoout.id}">归档-外出申请 </a></li>
				</ul>
				<br />
				 --%>
				<form:form id="inputForm" modelAttribute="oaGoout"
					action="${ctx}/oa/oaGoout/dealFilling" method="post"
					class="form-inline">
					<input type="hidden" name="token" value="${token }">
					<form:hidden path="id" />
					<form:hidden path="procInsId" />

					<form:hidden path="time" />
					<input type="hidden" name="starttime"
						value="<fmt:formatDate value="${oaGoout.starttime}" pattern="yyyy-MM-dd HH:mm:ss"/>" />
					<input type="hidden" name="endtime"
						value="<fmt:formatDate value="${oaGoout.endtime}" pattern="yyyy-MM-dd HH:mm:ss"/>" />
					<form:hidden path="reason" />
					<form:hidden path="examname" />
					<form:hidden path="examtext" />
					<form:hidden path="officename" />

					<sys:message content="${message}" />
					<div class="control-group">
						<label class="control-label">部门名称：</label> ${oaGoout.officename }
					</div>

					<div class="control-group">
						<label class="control-label">申请人：</label> ${oaGoout.createBy.name }
					</div>

					<div class="control-group">
						<label class="control-label">申请提交时间：</label>

						<fmt:formatDate value="${oaGoout.updateDate}"
							pattern="yyyy-MM-dd HH:mm:ss" />

					</div>
					<div class="control-group">
						<label class="control-label">外出开始时间：</label>

						<fmt:formatDate value="${oaGoout.starttime}"
							pattern="yyyy-MM-dd HH:mm:ss" />

					</div>
					<div class="control-group">
						<label class="control-label">外出结束时间：</label>

						<fmt:formatDate value="${oaGoout.endtime}"
							pattern="yyyy-MM-dd HH:mm:ss" />

					</div>
					<div class="control-group">
						<label class="control-label">外出时长：</label> ${oaGoout.time }
					</div>
					<div class="control-group">
						<label class="control-label">外出理由：</label> ${oaGoout.reason }
					</div>
					<div class="control-group">
						<label class="control-label">审批人签名：</label> ${oaGoout.examname }
					</div>

					<div class="control-group">
						<label class="control-label">审批人意见：</label> ${oaGoout.examtext }
					</div>
					<div class="control-group">
						<label class="control-label">审批决定：</label> <input type="radio"
							class="i-checks" name="exam" value="0">同意 <input
							type="radio" name="exam" value="1" checked="checked"
							class="i-checks">不同意

					</div>
					<div class="control-group">
						<label class="control-label">审批意见：</label> <input type="text"
							name="ftext" maxlength="255" class="form-control input-sm " />

					</div>
					<div class="form-actions">
						<shiro:hasPermission name="oa:oaOvertime:edit">
							<input id="btnSubmit" class="btn btn-primary" type="submit"
								value="提交归档" />&nbsp;</shiro:hasPermission>
						<input id="btnCancel" class="btn" type="button" value="返 回"
							onclick="history.go(-1)" />
						<c:if test="${task != null}">
				&nbsp;<input
								onclick='btnPNGshow("${task.processDefinitionId}/${task.executionId}");'
								class="btn" type="button" value="流程跟踪" />
						</c:if>
					</div>
				</form:form>
				<c:if test="${not empty oaGoout.id}">
					<act:histoicFlow procInsId="${oaGoout.procInsId}" />
				</c:if>
			</div>
		</div>
	</div>
</body>
</html>