<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>个人电脑补贴申请管理</title>
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
										beginDate : {
											required : true
										},
										endDate : {
											required : true,
											min_date : $("#beginDate")[0]
										},

										buyPcDate : {
											required : true
										},

										pcConf : {
											required : true
										},

										imgUrl : {
											required : true
										}
									},
									messages : {
										endDate : {
											required : "必填信息",
											min_date : "时间必须大于或等于开始时间"
										}
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
	var judge1 = judge11();
	var judge2 = notnull();
	return judge1 && judge2;
	}); */
	//$("#name").focus();
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
	 return judge;
	 } */
	/* function judge11() {
		var judge = true;
		if ($("input[name=beginDate]").val() == "") {
			$("input[name=beginDate]").next().children().text("必填信息 *");
			judge = false;
		} else {
			$("input[name=beginDate]").next().children().text(" *");
		}
		if ($("input[name=endDate]").val() == "") {
			$("input[name=endDate]").next().children().text("必填信息 *");
			judge = false;
		} else {
			$("input[name=endDate]").next().children().text(" *");
		}
		if ($("input[name=endDate]").val() != ""
				&& $("input[name=beginDate]").val() != "") {
			var min = new Date($("input[name=beginDate]").val());
			var max = new Date($("input[name=endDate]").val());
			if (min > max) {
				$("input[name=endDate]").next().children().text("时间错误 *");
				judge = false;
			} else {
				$("input[name=endDate]").next().children().text(" *");
			}
		}
		return judge;
	} */
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
						href="${ctx}/oa/oaPcSubsidy/form?id=${oaPcSubsidy.id}">编辑-个人电脑补贴申请</a></li>
				</ul>
				<br />
				 --%>
				<form:form id="inputForm" modelAttribute="oaPcSubsidy"
					action="${ctx}/oa/oaPcSubsidy/save" method="post"
					class="form-inline myoa-details-form">
					<input type="hidden" name="token" value="${token }">
					<input type="hidden" name="flag" value="0" id="flag">
					<form:hidden path="id" />
					<form:hidden path="procInsId" />
					<form:hidden path="officeName" />
					<div class="control-group">
						<label class="control-label">入职日期： <font color="red">*</font></label> <input name="beginDate"
							id="beginDate" type="text" readonly="readonly"
							class="laydate-icon layer-date form-control"
							style="background-color: #FFFFFF;" maxlength="20"
							value="<fmt:formatDate value="${oaPcSubsidy.beginDate}" pattern="yyyy-MM-dd"/>"
							onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});" />
						

					</div>
					<div class="control-group">
						<label class="control-label">转正日期： <font color="red">*</font></label> <input name="endDate"
							type="text" readonly="readonly" maxlength="20"
							class="laydate-icon layer-date form-control"
							style="background-color: #FFFFFF;"
							value="<fmt:formatDate value="${oaPcSubsidy.endDate}" pattern="yyyy-MM-dd"/>"
							onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});" />
						

					</div>
					<div class="control-group">
						<label class="control-label">购买电脑日期： <font color="red">*</font></label> <input
							name="buyPcDate" type="text" readonly="readonly" maxlength="20"
							class="laydate-icon layer-date form-control xinreq"
							style="background-color: #FFFFFF;"
							value="<fmt:formatDate value="${oaPcSubsidy.buyPcDate}" pattern="yyyy-MM-dd"/>"
							onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});" />
						

					</div>
					<div class="control-group">
						<label class="control-label">电脑配置： <font color="red">*</font></label>

						<form:input path="pcConf" htmlEscape="false" maxlength="255"
							class="form-control  xinreq" />
						

					</div>
					<div class="control-group control-group1">
						<label class="control-label">发票扫描件： <font color="red">*</font></label>

						<form:input id="files" path="imgUrl" htmlEscape="false"
							maxlength="2000" class="form-control  xinreq"
							style="background-color: #FFFFFF;" readonly="true" />
						
						<sys:ckfinder input="files" type="images"
							uploadPath="/oa/oaPcSubsidy" selectMultiple="false" />

					</div>
					<div class="form-actions">
						<shiro:hasPermission name="oa:oaPcSubsidy:edit">
							<input id="btnSubmit" class="btn btn-primary" type="submit"
								value="申请个人电脑补贴" />&nbsp;</shiro:hasPermission>
						<c:if test="${not empty oaPcSubsidy.id}">
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
				<c:if test="${not empty oaPcSubsidy.id}">
					<act:histoicFlow procInsId="${oaPcSubsidy.procInsId}" />
				</c:if>
			</div>
		</div>
	</div>
</body>
</html>