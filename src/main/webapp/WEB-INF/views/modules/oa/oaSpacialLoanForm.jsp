<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>专项借支申请管理</title>
<meta name="decorator" content="default" />
<script type="text/javascript">
	$(document).ready(
			function() {
				$("#btnCancle2").click(function() {
					$("#flag").val("1");
				});

				//加载自已的验证方法
				xin_validate();
				//保单验证
				$("#inputForm")
						.validate(
								{
									rules : {

										moneyDouble : {
											required : true,
											number_1 : [ "" ]
										},

										reason : {
											required : true
										}
									},
									messages : {},
									submitHandler : function(form) {
										oaLoading('正在提交，请稍候...');
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

	//非空控制
	/* function notnull() {
		var judge = true;
		//事由不为空
		if ($("input[name=reason]").val() == "") {
			$("input[name=reason]").next().children().text("必填信息 *");
			judge = false;
		} else {
			$("input[name=reason]").next().children().text("*");
		}
		//金额控制
		if ($("input[name=moneyDouble]").val() != "") {
			if ($("input[name=moneyDouble]").val() % 1 === 0
					&& $("input[name=moneyDouble]").val() >= 1) {
				$("input[name=moneyDouble]").next().children().text("*");
			} else {
				$("input[name=moneyDouble]").next().children().text(
						"请输入大于0的整数 *");
				judge = false;
			}
		} else {
			$("input[name=moneyDouble]").next().children().text("必填信息 *");
			judge = false;
		}
		return judge;
	} */
	/* $("#btnSubmit").click(function() {
	return notnull();
	}); */
	//$("#name").focus();
</script>
<link rel="stylesheet" type="text/css"
	href="${ctxStatic}/liuxin/css/liucheng.css">
<style>
.form-inline .form-control {
	width: 40%;
}
</style>
</head>
<body class="gray-bg">
	<div class="wrapper wrapper-content">
		<div class="ibox" style="width: 800px;margin:0 auto;">
			<div class="ibox-title printHidden">
				<h5>${title}</h5>
			</div>
			<div class="ibox-content">
				<%--
				<ul class="nav nav-tabs">
					<li class="active"><a
						href="${ctx}/oa/oaSpacialLoan/form?id=${oaSpacialLoan.id}">编辑-专项借支申请</a></li>
				</ul>
				<br />
				 --%>
				<form:form id="inputForm" modelAttribute="oaSpacialLoan"
					action="${ctx}/oa/oaSpacialLoan/save" method="post"
					class="form-inline myoa-details-form">
					<input type="hidden" name="token" value="${token }">
					<form:hidden path="id" />
					<form:hidden path="procInsId" />
					<form:hidden path="officeName" />
					<form:hidden path="job" />
					<form:hidden path="moneyString" />
					<input type="hidden" name="flag" value="0" id="flag">
					<div class="control-group">
						<label class="control-label">未归还金额：</label> <input type="text"
							style="background-color: #FFFFFF;" value="${sumLoanMoney}"
							readonly="readonly" class="form-control " />
					</div>
					<div class="control-group">
						<label class="control-label">文件单号：</label>

						<form:input path="fileId" htmlEscape="false" maxlength="100"
							style="background-color: #FFFFFF;" readonly="true"
							class="form-control " />
					</div>
					<div class="control-group">
						<label class="control-label">借支事由： <font color="red">*</font></label>

						<form:input path="reason" htmlEscape="false" maxlength="255"
							class="form-control " />
						
					</div>
					<div class="control-group">
						<label class="control-label">人民币（小写）： <font color="red">*</font></label>

						<form:input path="moneyDouble" htmlEscape="false" maxlength="9"
							class="form-control " />
						
					</div>
					<div class="form-actions">
						<shiro:hasPermission name="oa:oaSpacialLoan:edit">
							<input id="btnSubmit" class="btn btn-primary" type="submit"
								value="申请专项借支" />&nbsp;</shiro:hasPermission>
						<c:if test="${not empty oaSpacialLoan.id}">
							<input id="btnCancle2" class="btn btn-primary" type="submit"
								value="取消申请" />&nbsp;</c:if>
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