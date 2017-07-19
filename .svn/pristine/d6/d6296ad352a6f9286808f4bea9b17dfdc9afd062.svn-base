<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>个人电脑补贴申请管理</title>
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
						href="${ctx}/oa/oaPcSubsidy/form?id=${oaPcSubsidy.id}&flag=view">查看-个人电脑补贴申请</a></li>
				</ul>
				<br />
				 --%>
				<form:form id="inputForm" modelAttribute="oaPcSubsidy"
					action="${ctx}/oa/oaPcSubsidy/save" method="post"
					class="form-inline">
					<div class="control-group">
						<label class="control-label">姓名：</label>
						${oaPcSubsidy.createBy.name}
					</div>

					<div class="control-group">
						<label class="control-label">部门名称：</label>
						${oaPcSubsidy.officeName}
					</div>

					<div class="control-group">
						<label class="control-label">入职日期：</label>

						<fmt:formatDate value="${oaPcSubsidy.beginDate}"
							pattern="yyyy-MM-dd" />
					</div>

					<div class="control-group">
						<label class="control-label">转正日期：</label>

						<fmt:formatDate value="${oaPcSubsidy.endDate}"
							pattern="yyyy-MM-dd" />

					</div>
					<div class="control-group">
						<label class="control-label">购买电脑日期：</label>

						<fmt:formatDate value="${oaPcSubsidy.buyPcDate}"
							pattern="yyyy-MM-dd" />

					</div>
					<div class="control-group">
						<label class="control-label">申请补贴日期：</label>

						<fmt:formatDate value="${oaPcSubsidy.createDate}"
							pattern="yyyy-MM-dd" />

					</div>
					<div class="control-group">
						<label class="control-label">电脑配置：</label> ${oaPcSubsidy.pcConf}
					</div>

					<div class="control-group">
						<label class="control-label">发票扫描件：</label> <a href="#"
							onclick="openDialogView('查看发票扫描件', '${oaPcSubsidy.imgUrl}','800px', '500px')">发票扫描件(点击查看)</a>
					</div>
					<div class="control-group">
						<label class="control-label">人事行政部签字：</label>
						${oaPcSubsidy.examname}
					</div>

					<div class="control-group">
						<label class="control-label">人事行政部意见：</label>
						${oaPcSubsidy.examtext}
					</div>

					<div class="control-group">
						<label class="control-label">人事行政部副总签字：</label>
						${oaPcSubsidy.examname2}
					</div>

					<div class="control-group">
						<label class="control-label">人事行政部副总意见：</label>
						${oaPcSubsidy.examtext2}
					</div>

					<div class="form-actions">
						<input id="btnCancel" class="btn" type="button" value="返 回"
							onclick="history.go(-1)" /><act:flow-back-btn></act:flow-back-btn>
						<c:if test="${task != null}">
				&nbsp;<input
								onclick='btnPNGshow("${task.processDefinitionId}/${task.executionId}");'
								class="btn" type="button" value="流程跟踪" />
						</c:if>
					</div>
				</form:form>
				<c:if test="${not empty oaPcSubsidy.id}">
					<act:histoicFlow procInsId="${oaPcSubsidy.procInsId}" />
				</c:if>
			</div>
		</div>
	</div>
</body>
</html>