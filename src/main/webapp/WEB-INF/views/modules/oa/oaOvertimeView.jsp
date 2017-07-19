<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>查看加班申请</title>
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
				 --%>
				<%--
				
				<ul class="nav nav-tabs">
					<li class="active"><a
						href="${ctx}/oa/oaOvertime/form?id=${oaOvertime.id}&flag=view">查看-加班申请</a></li>
				</ul>
				<br />
				--%>
				<form:form id="inputForm" modelAttribute="oaOvertime" action=""
					method="post" class="form-inline">
					<sys:message content="${message}" />
					<div class="control-group">
						<label class="control-label">文件编号：</label> ${oaOvertime.fileid }
					</div>
					<div class="control-group">
						<label class="control-label">部门名称：</label> ${oaOvertime.officename }
					</div>
					<div class="control-group">
						<label class="control-label">申&nbsp;&nbsp;请&nbsp;&nbsp;人：</label>
						${oaOvertime.createBy.name}
					</div>
					<div class="control-group">
						<label class="control-label">申请时间：</label>

						<fmt:formatDate value="${oaOvertime.createDate}"
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
						<div class="lc-view-div">
							${oaOvertime.reason }<br>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label">审批人签名：</label> ${oaOvertime.examname }
					</div>
					<div class="control-group">
						<label class="control-label">审批人意见：</label>
						<div class="lc-view-div">${oaOvertime.examtext }<br>
						</div>
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
				<c:if test="${not empty oaOvertime.id}">
					<act:histoicFlow procInsId="${oaOvertime.procInsId}" />
				</c:if>
			</div>
		</div>
	</div>
</body>
</html>