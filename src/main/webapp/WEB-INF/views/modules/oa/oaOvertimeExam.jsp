<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>加班申请审核</title>
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
						href="${ctx}/oa/oaOvertime/exam?id=${oaOvertime.id}">审核-加班申请</a></li>
				</ul>
				<br />
				 --%>
				<form:form id="inputForm" modelAttribute="oaOvertime"
					action="${ctx}/oa/oaOvertime/dealExam" method="post"
					class="form-inline">
					<form:hidden path="id" />
					<form:hidden path="procInsId" />
					<input type="hidden" name="token" value="${token }">
					<form:hidden path="fileid" />
					<form:hidden path="officename" />
					<form:hidden path="time" />
					<input type="hidden" name="starttime"
						value="<fmt:formatDate value="${oaOvertime.starttime}" pattern="yyyy-MM-dd HH:mm:ss"/>" />
					<input type="hidden" name="endtime"
						value="<fmt:formatDate value="${oaOvertime.endtime}" pattern="yyyy-MM-dd HH:mm:ss"/>" />
					<form:hidden path="reason" />

					<div class="control-group">
						<label class="control-label">文件编号：</label> ${oaOvertime.fileid }
					</div>
					<div class="control-group">
						<label class="control-label">部门名称：</label> ${oaOvertime.officename }
					</div>
					<div class="control-group">
						<label class="control-label">申&nbsp;&nbsp;请&nbsp;&nbsp;人：</label>
						${oaOvertime.createBy.name }
					</div>
					<div class="control-group">
						<label class="control-label">申请时间：</label>

						<fmt:formatDate value="${oaOvertime.updateDate}"
							pattern="yyyy-MM-dd HH:mm:ss" />

					</div>
					<div class="control-group">
						<label class="control-label">加班时长：</label> ${oaOvertime.time }
					</div>
					<div class="control-group">
						<label class="control-label">开始时间：</label>

						<fmt:formatDate value="${oaOvertime.starttime}"
							pattern="yyyy-MM-dd HH:mm:ss" />

					</div>
					<div class="control-group">
						<label class="control-label">结束时间：</label>

						<fmt:formatDate value="${oaOvertime.endtime}"
							pattern="yyyy-MM-dd HH:mm:ss" />

					</div>
					<div class="control-group">
						<label class="control-label">加班理由：</label>
						<div class="lc-view-div">${oaOvertime.reason }<br>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label">审批决定：</label> <input type="radio"
							class="i-checks" name="exam" value="0">同意 <input
							type="radio" name="exam" class="i-checks" value="1"
							checked="checked">不同意

					</div>
					<div class="control-group">
						<label class="control-label">审批意见：</label>

						<form:input path="examtext" htmlEscape="false" maxlength="255"
							class="form-control input-sm " />

					</div>
					<div class="form-actions">
						<shiro:hasPermission name="oa:oaOvertime:edit">
							<input id="btnSubmit" class="btn btn-primary" type="submit"
								value="审核提交" />&nbsp;</shiro:hasPermission>
						<input id="btnCancel" class="btn" type="button" value="返 回"
							onclick="history.go(-1)" />
						<c:if test="${task != null}">
				&nbsp;<input
								onclick='btnPNGshow("${task.processDefinitionId}/${task.executionId}");'
								class="btn" type="button" value="流程跟踪" />
						</c:if>
					</div>
				</form:form>
				<c:if test="${not empty oaOvertime.id}">
					<act:histoicFlow procInsId="${oaOvertime.procInsId}" />
				</c:if>
			</div>
		</div>
	</div>
</body>
</html>