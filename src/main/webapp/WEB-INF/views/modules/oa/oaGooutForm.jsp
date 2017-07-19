<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>编辑-外出申请</title>
<meta name="decorator" content="default" />
<script type="text/javascript">
	$(document).ready(
			function() {
				//作废
				$("#btnCancle2").click(function() {
					//$("#flag").val("1");
					window.location.href="${ctx}/oa/oaGoout/save?flag=1&id=${oaGoout.id}&token=${token}";
					return false;
				});
				//加载自已的验证方法
				xin_validate();
				//验证表单
				$("#inputForm")
						.validate(
								{
									rules : {
										starttime : {
											required : true,
											min_date : $("#shenqingdate")[0]
										},
										endtime : {
											required : true,
											min_date : $("#starttime")[0]
										},
										time : {
											required : true,
											number_1 : [ "" ]
										},
										reason : {
											required : true
										}
									},
									messages : {
										starttime : {
											required : "必填信息"
										},
										endtime : {
											required : "必填信息",
											min_date : "时间必须大于或等于开始时间"
										},
										time : {
											required : "必填信息"
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
	var judge2 = judge22();
	return judge1 && judge2;
	}); */
	//$("#name").focus();
	/* function judge11() {
		var judge = true;
		var min = new Date($("input[name=starttime]").val());
		var max = new Date($("input[name=endtime]").val());
		if ($("input[name=starttime]").val() == "") {
			$("input[name=starttime]").next().children().text("必填信息 *");
			judge = false;
		} else {
			$("input[name=starttime]").next().children().text(" *");
		}
		if ($("input[name=endtime]").val() == "") {
			$("input[name=endtime]").next().children().text("必填信息 *");
			judge = false;
		} else {
			$("input[name=endtime]").next().children().text(" *");
		}
		if ($("input[name=starttime]").val() != ""
				&& $("input[name=endtime]").val() != "") {
			if (min >= max) {
				$("input[name=endtime]").next().children().text("时间错误 *");
				judge = false;
			} else {
				$("input[name=endtime]").next().children().text(" *");
			}
		}
		return judge;
	}

	function judge22() {
		var patten = /^\d+\.?\d{0,1}$/;
		var judge = true;
		if ($("input[name=time]").val() == '') {
			$("input[name=time]").next().children().text("必填信息 *");
			judge = false;
		} else {
			if (patten.test($("input[name=time]").val())) {
				$("input[name=time]").next().children().text(" *");
			} else {
				$("input[name=time]").next().children().text("输入一位小数(正)*");
				judge = false;
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
						href="${ctx}/oa/oaGoout/form?id=${oaGoout.id}">编辑-外出申请</a></li>
				</ul>
				<br />
				 --%>
				<form:form id="inputForm" modelAttribute="oaGoout"
					action="${ctx}/oa/oaGoout/save" method="post" class="form-inline myoa-details-form">
					<input type="hidden" name="token" value="${token }">
					<input type="hidden" name="flag" value="0" id="flag">
					<form:hidden path="id" />
					<form:hidden path="procInsId" />
					<form:hidden path="officename" />
					<div class="control-group">
						<jsp:useBean id="nowdate" class="java.util.Date" scope="page" />
						<label class="control-label">申请时间：</label> <input type="text"
							readonly="readonly" id="shenqingdate"
							class="laydate-icon layer-date form-control xinreq"
							style="background-color: #FFFFFF;" maxlength="20"
							value="<fmt:formatDate value="${nowdate}" pattern="yyyy-MM-dd HH:mm:ss"/>" /><span
							class="help-inline"><font color="red"></font> </span>
					</div>
					<div class="control-group">
						<label class="control-label">外出开始时间： <font color="red">*</font></label> <input
							name="starttime" type="text" readonly="readonly" id="starttime"
							class="laydate-icon layer-date form-control xinreq"
							style="background-color: #FFFFFF;" maxlength="20"
							value="<fmt:formatDate value="${oaGoout.starttime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
							onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false,minDate:'%y-%M-{%d-3}'});" />
					</div>
					<div class="control-group">
						<label class="control-label">外出结束时间： <font color="red">*</font></label> <input name="endtime"
							type="text" readonly="readonly" maxlength="20"
							class="laydate-icon layer-date form-control xinreq"
							style="background-color: #FFFFFF;"
							value="<fmt:formatDate value="${oaGoout.endtime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
							onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});" />
					</div>
					<div class="control-group">
						<label class="control-label">外出时长： <font color="red">*</font></label>
						<form:input path="time" htmlEscape="false" maxlength="11"
							class="form-control " />
						
					</div>
					<div class="control-group">
						<label class="control-label">外出理由： <font color="red">*</font></label>
						<form:input path="reason" htmlEscape="false" maxlength="255"
							class="form-control  " />
						
					</div>
					<div class="form-actions">
						<shiro:hasPermission name="oa:oaGoout:edit">
							<input id="btnSubmit" class="btn btn-primary" type="submit"
								value="外出申请" />&nbsp;</shiro:hasPermission>
						<c:if test="${not empty oaGoout.id}">
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
				<c:if test="${not empty oaGoout.id}">
					<act:histoicFlow procInsId="${oaGoout.procInsId}" />
				</c:if>
			</div>
		</div>
	</div>
</body>
</html>