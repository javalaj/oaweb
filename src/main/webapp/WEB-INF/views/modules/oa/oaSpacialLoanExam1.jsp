<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>专项借支申请管理</title>
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
			<div class="ibox-title printHidden">
				<h5>${title}</h5>
			</div>
			<div class="ibox-content">
				<%--
				<ul class="nav nav-tabs">
					<li class="active"><a
						href="${ctx}/oa/oaSpacialLoan/exam?num=1&id=${oaSpacialLoan.id}">审核-专项借支申请
					</a></li>
				</ul>
				<br />
				 --%>
				<form:form id="inputForm" modelAttribute="oaSpacialLoan"
					action="${ctx}/oa/oaSpacialLoan/dealExam" method="post"
					class="form-inline">
					<input type="hidden" name="token" value="${token }">

					<form:hidden path="id" />
					<form:hidden path="procInsId" />
					<form:hidden path="fileId" />
					<form:hidden path="officeName" />
					<form:hidden path="job" />
					<form:hidden path="reason" />
					<form:hidden path="moneyString" />
					<form:hidden path="moneyDouble" />
					<input type="hidden" name="sign" value="1">



					<div class="control-group">
						<label class="control-label">借支日期：</label>

						<fmt:formatDate value="${oaSpacialLoan.createDate}"
							pattern="yyyy-MM-dd" />
					</div>
					<div class="control-group">
						<label class="control-label">文件单号：</label> ${oaSpacialLoan.fileId}
					</div>
					<div class="control-group">
						<label class="control-label">姓名：</label>
						${oaSpacialLoan.createBy.name}
					</div>
					<div class="control-group">
						<label class="control-label">部门名称：</label>
						${oaSpacialLoan.officeName}
					</div>
					<div class="control-group">
						<label class="control-label">职务：</label> ${oaSpacialLoan.job}
					</div>
					<div class="control-group">
						<label class="control-label">借支事由：</label> ${oaSpacialLoan.reason}
					</div>
					<div class="control-group">
						<label class="control-label">人民币（小写）：</label>
						${oaSpacialLoan.moneyDouble}
					</div>
					<div class="control-group">
						<label class="control-label">人民币（大写）：</label>
						${oaSpacialLoan.moneyString}
					</div>







					<div class="control-group">
						<label class="control-label">审批决定：</label> <input type="radio"
							class="i-checks" name="exam" value="0">同意 <input
							type="radio" name="exam" class="i-checks" value="1"
							checked="checked">不同意
					</div>
					<div class="control-group">
						<label class="control-label">上级领导意见：</label>

						<form:input path="examtext" htmlEscape="false" maxlength="230"
							class="form-control input-sm  " />
					</div>

					<div class="form-actions">
						<shiro:hasPermission name="oa:oaSpacialLoan:edit">
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
				<c:if test="${not empty oaSpacialLoan.id}">
					<act:histoicFlow procInsId="${oaSpacialLoan.procInsId}" />
				</c:if>
			</div>
		</div>
	</div>
</body>
</html>