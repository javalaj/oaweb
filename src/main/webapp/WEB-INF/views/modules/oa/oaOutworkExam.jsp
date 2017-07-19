<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>审核出差申请</title>
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
		<div class="ibox" style="width: 800px;margin: 0 auto;">
			<div class="ibox-title printHidden">
				<h5>${title}</h5>
			</div>
			<div class="ibox-content">
				<%--
				
				<ul class="nav nav-tabs">
					<li class="active"><a
						href="${ctx}/oa/oaOutwork/exam?id=${oaOutwork.id}">审核-出差申请</a></li>
				</ul>
				<br />
				 --%>
				<form:form id="inputForm" modelAttribute="oaOutwork"
					action="${ctx}/oa/oaOutwork/dealExam" method="post"
					class="form-inline">
					<input type="hidden" name="token" value="${token }">
					<form:hidden path="id" />
					<form:hidden path="procInsId" />
					<form:hidden path="fileId" />
					<form:hidden path="officeName" />
					<form:hidden path="task" />
					<form:hidden path="address" />
					<form:hidden path="unitName" />
					<form:hidden path="unitUserName" />
					<input type="hidden" name="startTime"
						value="<fmt:formatDate value="${oaOutwork.startTime}"
					pattern="yyyy-MM-dd HH:mm:ss" />" />
					<input type="hidden" name="endTime"
						value="<fmt:formatDate value="${oaOutwork.endTime}"
					pattern="yyyy-MM-dd HH:mm:ss" />" />
					<form:hidden path="cost" />
					<form:hidden path="projectName" />
					<form:hidden path="scheduleProgram" />


					<div class="control-group">
						<label class="control-label">文件编号：</label> ${oaOutwork.fileId }
					</div>
					<div class="control-group">
						<label class="control-label">部门名称：</label> ${oaOutwork.officeName }
					</div>
					<div class="control-group">
						<label class="control-label">申请人：</label>
						${oaOutwork.createBy.name }
					</div>
					<div class="control-group">
						<label class="control-label">申请时间：</label>

						<fmt:formatDate value="${oaOutwork.updateDate }"
							pattern="yyyy-MM-dd HH:mm:ss" />
					</div>
					<div class="control-group">
						<label class="control-label">出差任务：</label> ${oaOutwork.task }
					</div>
					<div class="control-group">
						<label class="control-label">项目或合同名称：</label>
						${oaOutwork.projectName }
					</div>
					<div class="control-group">
						<label class="control-label">出差日程安排：</label>
						${oaOutwork.scheduleProgram }
					</div>
					<div class="control-group">
						<label class="control-label">目的地：</label> ${oaOutwork.address }
					</div>
					<div class="control-group">
						<label class="control-label">访问单位：</label> ${oaOutwork.unitName }
					</div>
					<div class="control-group">
						<label class="control-label">拜访对象：</label>
						${oaOutwork.unitUserName }
					</div>
					<div class="control-group">
						<label class="control-label">出差开始时间：</label>

						<fmt:formatDate value="${oaOutwork.startTime}"
							pattern="yyyy-MM-dd HH:mm:ss" />
					</div>
					<div class="control-group">
						<label class="control-label">预计结束时间：</label>

						<fmt:formatDate value="${oaOutwork.endTime}"
							pattern="yyyy-MM-dd HH:mm:ss" />
					</div>
					<div class="control-group">
						<label class="control-label">预计出差费用：</label> ${oaOutwork.cost }
					</div>
					<div class="control-group">
						<label class="control-label">审批决定：</label> <input type="radio"
							name="exam" value="0" class="i-checks">同意 <input
							class="i-checks" type="radio" name="exam" value="1"
							checked="checked">不同意
					</div>
					<div class="control-group">
						<label class="control-label">上级领导意见：</label>

						<form:input path="examtext" htmlEscape="false" maxlength="255"
							class="form-control" />
					</div>
					<div class="form-actions">
						<shiro:hasPermission name="oa:oaOutwork:edit">
							<input id="btnSubmit" class="btn btn-primary" type="submit"
								value="提交审核" />&nbsp;</shiro:hasPermission>
						<input id="btnCancel" class="btn" type="button" value="返 回"
							onclick="history.go(-1)" />
						<c:if test="${task != null}">
				&nbsp;<input
								onclick='btnPNGshow("${task.processDefinitionId}/${task.executionId}");'
								class="btn" type="button" value="流程跟踪" />
						</c:if>
					</div>
				</form:form>
				<c:if test="${not empty oaOutwork.id}">
					<act:histoicFlow procInsId="${oaOutwork.procInsId}" />
				</c:if>
			</div>
		</div>
	</div>
</body>
</html>