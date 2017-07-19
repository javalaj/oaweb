<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>忘记打卡申请管理</title>
<meta name="decorator" content="default" />
<script type="text/javascript">
	$(document).ready(
			function() {
				//作废
				$("#btnCancle2").click(function() {
					$("#flag").val("1");
				});
				//加载自已的验证方法
				xin_validate();
				//表单验证
				$("#inputForm")
						.validate(
								{
									rules : {
										date : {
											required : true
										},
										time : {
											required : true 
										}
									},
									messages : {
										 
									},
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
	/* $("#btnSubmit").click(function() {
	return notnull();
	}); */
	//$("#name").focus();
	/* //特殊性的，证明人不为空判断.
	if ($("input[name=witnessId][type=hidden]").val() == "") {
		$("input[name=witnessId][type=hidden]").next().next().next().next()
				.children().text("必填选项 *");
		return false;
	} else {
		if ($("input[name=witnessId][type=hidden]").val() == $("#nowUserId")
				.val()) {
			$("input[name=witnessId][type=hidden]").next().next().next()
					.next().children().text("不能选择自己 *");
			return false;
		}
	}
	$("input[name=witnessId][type=hidden]").next().next().next().next()
			.children().text("*"); */
	/* //非空的判断
	function notnull() {
		var judge = true;
		$(".xinreq").each(function() {
			if ($(this).val() == "") {
				$(this).next().children().text("必填信息 *");
				judge = false;
			} else {
				$(this).next().children().text("*");
			}
		});

	} */
</script>
<link rel="stylesheet" type="text/css" href="${ctxStatic}/liuxin/css/liucheng.css">
<style>
.form-inline .form-control {
	width: 40%;
}
</style>
</head>
<body class="gray-bg">
	<div class="wrapper wrapper-content">
		<div class="ibox" style="width: 800px;margin:0 auto;">
			<div class="ibox-title">
				<h5>${title}</h5>
			</div>
			<div class="ibox-content">
				<%-- 
				<ul class="nav nav-tabs">
					<li class="active"><a
						href="${ctx}/oa/oaForgetclock/form?id=${oaForgetclock.id}">编辑-忘记打卡申请</a></li>
				</ul>
				<br />
				--%>
				<form:form id="inputForm" modelAttribute="oaForgetclock"
					action="${ctx}/oa/oaForgetclock/save" method="post"
					class="form-inline myoa-details-form">
					<input type="hidden" name="token" value="${token }">
					<input type="hidden" name="flag" value="0" id="flag">
					<form:hidden path="id" />
					<form:hidden path="procInsId" />
					<form:hidden path="officeName" />
					<sys:message content="${message}" />
					<div class="control-group">
						<label class="control-label">忘记打卡日期： <span class="help-inline"><font color="red">*</font> </span></label>
						
							<input name="date"
							type="text" readonly="readonly" maxlength="20"
							class="laydate-icon form-control layer-date xinreq"
							style="background-color: #fff;"
							value="<fmt:formatDate value="${oaForgetclock.date}" pattern="yyyy-MM-dd"/>"
							onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false,maxDate:'%y-%M-%d',minDate:'%y-%M-{%d-1}'});" />
						
						
					</div>
					<div class="control-group">
						<label class="control-label" style="padding-top:0;">忘记打卡节点：</label> 
						<input type="radio"
							class="i-checks" name="timesign" value="0"
							<c:if test="${oaForgetclock.timesign == '0'}">checked="checked"</c:if>>上班&emsp;<input
							type="radio" name="timesign" class="i-checks" value="1"
							<c:if test="${oaForgetclock.timesign == '1'}">checked="checked"</c:if>>下班&emsp;<input
							type="radio" name="timesign" class="i-checks" value="2"
							<c:if test="${oaForgetclock.timesign == '2' || empty oaForgetclock.timesign}">checked="checked"</c:if>>上下班
					</div>
					<div class="control-group">
						<label class="control-label">忘记打卡时间描述： <span class="help-inline"><font color="red">*</font></span></label>
						<form:input path="time" htmlEscape="false" maxlength="100"
							class="form-control xinreq" />
						
					</div>
					<div class="form-actions">
						<shiro:hasPermission name="oa:oaForgetclock:edit">
							<input id="btnSubmit" class="btn btn-primary" type="submit"
								value="申请忘记打卡" />&nbsp;</shiro:hasPermission>
						<c:if test="${not empty oaForgetclock.id}">
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
				<c:if test="${not empty oaForgetclock.id}">
					<act:histoicFlow procInsId="${oaForgetclock.procInsId}" />
				</c:if>
			</div>
		</div>
	</div>
</body>
</html>