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
										//	oaLoading('正在提交，请稍等...');
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

	//打印
	function btnPrint2() {
		$(".printHidden").attr("hidden", true);
		$(".printShow").attr("hidden", false);
		window.print();
		$(".printHidden").attr("hidden", false);
		$(".printShow").attr("hidden", true);
	}
</script>
<link rel="stylesheet" type="text/css"
	href="${ctxStatic}/liuxin/css/liucheng.css">
</head>
<body class="gray-bg myoa-print-page">
	<div class="wrapper wrapper-content">
		<div class="ibox">
			<div class="ibox-title printHidden">
				<h5>${title}</h5>
			</div>
			<div class="ibox-content">
				<%--
				<ul class="nav nav-tabs">
					<li class="active"><a
						href="${ctx}/oa/oaEmployeeFormal/form?id=${oaEmployeeFormal.id}&flag=view">查看-员工转正申请</a></li>
				</ul>
				<br />
				 --%>
				 <div style="padding-bottom: 12px;width: 40%"><img src="${ctxStatic}/images/chuyulogo.png" alt="武汉楚誉科技" style="width: 100%;"/></div>
				<div class="printShow" hidden="true">
					<h3 align='center'>楚 誉 科 技 股 份 有 限 公 司</h3>
					<h3 align='center'>员 工 转 正 审 批 单</h3>
					<br> <br> <br>
				</div>
				<form:form id="inputForm" modelAttribute="oaEmployeeFormal"
					action="${ctx}/oa/oaEmployeeFormal/save" method="post"
					class="form-inline">
					<table class="table table-bordered  table-condensed dataTables-example dataTable no-footer">
						<tr>
							<td class="width-15 active">姓名</td>
							<td>${oaEmployeeFormal.name}</td>
							<td class="width-15 active">性别</td>
							<td>${oaEmployeeFormal.sex}</td>
							<td class="width-15 active">年龄</td>
							<td>${oaEmployeeFormal.age}</td>
						</tr>
						<tr>
							<td class="width-15 active">所属部门</td>
							<td >${oaEmployeeFormal.officeName}</td>
							<td class="width-15 active">手机号码</td>
							<td colspan="3">${oaEmployeeFormal.phone}</td>
						</tr>
						<tr>
							<td class="width-15 active">入职时间</td>
							<td colspan="5">
								<fmt:formatDate value="${oaEmployeeFormal.tryoutDate}"
							pattern="yyyy-MM-dd" />
							</td>
						</tr>
						<tr>
							<td class="width-15 active">试用期薪酬</td>
							<td colspan="5">
								${oaEmployeeFormal.tryoutSalary}
							</td>
						</tr>
						<tr>
							<td class="width-15 active">转正时间</td>
							<td colspan="5">
								<fmt:formatDate value="${oaEmployeeFormal.formalDate}"
							pattern="yyyy-MM-dd" />
							</td>
						</tr>
						<tr>
							<td class="width-15 active">转正期薪酬</td>
							<td colspan="5">
								${oaEmployeeFormal.formalSalary}
							</td>
						</tr>
						<tr>
							<td class="width-15 active">本人转正申请</td>
							<td colspan="5">								
								${oaEmployeeFormal.reason}								
							</td>
						</tr>
						<tr>
							<td class="width-15 active">部门主管意见</td>
							<td colspan="5">							
								${oaEmployeeFormal.examtext}							
							</td>
						</tr>
						<tr>
							<td class="width-15 active">部门副总意见</td>
							<td colspan="5">							
								${oaEmployeeFormal.examtext2}								
							</td>
						</tr>
						<tr>
							<td class="width-15 active">人事行政部意见</td>
							<td colspan="5">							
								${oaEmployeeFormal.examtext3}								
							</td>
						</tr>
					</table>
					<%-- <div class="control-group">
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
						<label class="control-label">人事行政部副总签名：</label>
						${oaEmployeeFormal.examname3}
					</div>
					<div class="control-group">
						<label class="control-label">人事行政部副总意见：</label>
						${oaEmployeeFormal.examtext3}
					</div> --%>
					<div class="form-actions printHidden">
						<input id="btnCancel" class="btn" type="button" value="返 回"
							onclick="history.go(-1)" /><act:flow-back-btn></act:flow-back-btn>
						<c:if test="${task != null}">
				&nbsp;<input
								onclick='btnPNGshow("${task.processDefinitionId}/${task.executionId}");'
								class="btn" type="button" value="流程跟踪" />
						</c:if>
						&nbsp;<input onclick='btnPrint2();' class="btn" type="button"
							value="打印" />
					</div>
					<div class="printHidden">
						<c:if test="${not empty oaEmployeeFormal.id}">
							<act:histoicFlow procInsId="${oaEmployeeFormal.procInsId}" />
						</c:if>
					</div>
				</form:form>
			</div>
		</div>
	</div>
</body>
</html>