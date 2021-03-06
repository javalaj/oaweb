<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>员工转正申请管理</title>
<meta name="decorator" content="default" />
<script type="text/javascript">
	$(document).ready(
			function() {
				//$("#name").focus();
				$("#inputForm")
						.validate(
								{
									submitHandler : function(form) {
										//		oaLoading('正在提交，请稍等...');
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
						href="${ctx}/oa/oaEmployeeFormal/exam?num=3&id=${oaEmployeeFormal.id}">审核-员工转正申请</a></li>
				</ul>
				<br />
				 --%>
				<form:form id="inputForm" modelAttribute="oaEmployeeFormal"
					action="${ctx}/oa/oaEmployeeFormal/dealExam" method="post"
					class="form-inline">

					<input type="hidden" name="token" value="${token }">
					<input type="hidden" name="sign" value="3">
					<form:hidden path="id" />
					<form:hidden path="procInsId" />
					<form:hidden path="officeName" />

					<form:hidden path="name" />
					<form:hidden path="age" />
					<form:hidden path="sex" />
					<form:hidden path="phone" />
					<input type="hidden" name="tryoutDate"
						value="<fmt:formatDate value="${oaEmployeeFormal.tryoutDate}" pattern="yyyy-MM-dd"/>">
					<form:hidden path="tryoutSalary" />
					<input type="hidden" name="formalDate"
						value="<fmt:formatDate value="${oaEmployeeFormal.formalDate}" pattern="yyyy-MM-dd"/>">
					<form:hidden path="formalSalary" />
					<form:hidden path="reason" />

					<form:hidden path="examname" />
					<form:hidden path="examtext" />
					<form:hidden path="examname2" />
					<form:hidden path="examtext2" />
					<form:hidden path="examname4" />
					<form:hidden path="examtext4" />


					<div class="control-group">
						<label class="control-label">部门名称：</label>
						${oaEmployeeFormal.officeName}
					</div>
					<div class="control-group">
						<label class="control-label">姓名：</label> ${oaEmployeeFormal.name}
					</div>
					<div class="control-group">
						<label class="control-label">年龄：</label> ${oaEmployeeFormal.age}
					</div>
					<div class="control-group">
						<label class="control-label">性别：</label> ${oaEmployeeFormal.sex}
					</div>
					<div class="control-group">
						<label class="control-label">手机号码：</label>
						${oaEmployeeFormal.phone}
					</div>
					<div class="control-group">
						<label class="control-label">入职日期：</label>

						<fmt:formatDate value="${oaEmployeeFormal.tryoutDate}"
							pattern="yyyy-MM-dd" />
					</div>
					<div class="control-group">
						<label class="control-label">试用期薪酬(月薪)：</label>
						${oaEmployeeFormal.tryoutSalary}
					</div>
					<div class="control-group">
						<label class="control-label">转正日期：</label>

						<fmt:formatDate value="${oaEmployeeFormal.formalDate}"
							pattern="yyyy-MM-dd" />
					</div>
					<div class="control-group">
						<label class="control-label">转正薪酬(月薪)：</label>
						${oaEmployeeFormal.formalSalary}
					</div>
					<div class="control-group">
						<label class="control-label">转正申请备注：</label>
						${oaEmployeeFormal.reason}
					</div>
					<div class="control-group">
						<label class="control-label">上级领导签名：</label>
						${oaEmployeeFormal.examname}
					</div>
					<div class="control-group">
						<label class="control-label">上级领导意见：</label>
						${oaEmployeeFormal.examtext}
					</div>
					<div class="control-group">
						<label class="control-label">部门副总签名：</label>
						${oaEmployeeFormal.examname2}
					</div>
					<div class="control-group">
						<label class="control-label">部门副总意见：</label>
						${oaEmployeeFormal.examtext2}
					</div>
					<div class="control-group">
						<label class="control-label">人事行政部经理签名：</label>
						${oaEmployeeFormal.examname4}
					</div>
					<div class="control-group">
						<label class="control-label">人事行政部经理意见：</label>
						${oaEmployeeFormal.examtext4}
					</div>
					<div class="control-group">
						<label class="control-label">审批决定：</label> <input type="radio"
							class="i-checks" name="exam" value="0">同意 <input
							type="radio" name="exam" class="i-checks" value="1"
							checked="checked">不同意
					</div>
					<div class="control-group">
						<label class="control-label">人事行政部副总意见：</label>

						<form:input path="examtext3" htmlEscape="false" maxlength="255"
							class="form-control input-sm" />
					</div>

					<div class="form-actions">
						<shiro:hasPermission name="oa:oaEmployeeFormal:edit">
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
				<c:if test="${not empty oaEmployeeFormal.id}">
					<act:histoicFlow procInsId="${oaEmployeeFormal.procInsId}" />
				</c:if>
			</div>
		</div>
	</div>
</body>
</html>