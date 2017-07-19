<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>查看-外出申请</title>
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
						href="${ctx}/oa/oaGoout/form?id=${oaGoout.id}&flag=view">查看-外出申请</a></li>
				</ul>
				<br />
				 --%>
				<form:form id="inputForm" modelAttribute="oaOvertime" action=""
					method="post" class="form-inline">
					<sys:message content="${message}" />
					<div class="control-group">
						<label class="control-label">部门名称：</label> ${oaGoout.officename }
					</div>
					<div class="control-group">
						<label class="control-label">申请人：</label> ${oaGoout.createBy.name }
					</div>

					<div class="control-group">
						<label class="control-label">申请提交时间：</label>

						<fmt:formatDate value="${oaGoout.createDate}"
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
						<label class="control-label">上级签字：</label> ${oaGoout.examname }
					</div>

					<div class="control-group">
						<label class="control-label">上级意见：</label> ${oaGoout.examtext }
						<%--<textarea rows="7" cols="80" style="padding:5px 10px;">${oaGoout.examtext }</textarea> --%>
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
				</form:form>
				<c:if test="${not empty oaGoout.id}">
					<act:histoicFlow procInsId="${oaGoout.procInsId}" />
				</c:if>
			</div>
		</div>
	</div>
</body>
</html>