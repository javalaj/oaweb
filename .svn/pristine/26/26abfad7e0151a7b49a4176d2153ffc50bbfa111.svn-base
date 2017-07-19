<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>公司收文登记管理</title>
<meta name="decorator" content="default" />
<script type="text/javascript">
	//非空的判断
	/* function notnull() {
		var judge = true;
		$(".xinreq").each(function() {
			if ($(this).val() == "") {
				$(this).next().children().text("必填信息 *");
				judge = false;
			} else {
				$(this).next().children().text("*");
			}
		});
		//特殊性的，主办单位不为空判断.
		if ($("input[name=hostUpperOfficeId][type=hidden]").val() == "") {
			judge = false;
			$("#req_xin_m").text("必填选项 *");
		} else {
			$("#req_xin_m").text("*");
		}
		return judge;
	} */

	$(document).ready(
			function() {
				//作废
				$("#btnCancle2").click(function() {
					$("#flag").val("1");
					$("input[name=isdraft]").val("2");
				});
				//草稿
				$("#btnSubmit0").click(function() {
					$("#flag").val("0");
					$("input[name=isdraft]").val("0");
				});
				//提交
				$("#btnSubmit").click(function() {
					$("#flag").val("0");
					$("input[name=isdraft]").val("1");
				});

				//加载自已的验证方法
				xin_validate();
				//保单验证
				$("#inputForm")
						.validate(
								{
									rules : {
										date : {
											required : true
										},
										unitname : {
											required : true
										},
										title : {
											required : true
										},
										content : {
											required : true
										},
										mainfile : {
											required : true
										},
										hostUpperOfficeName : {
											required : true
										}
									},
									messages : {
										hostUpperOfficeName : {
											required : "必填信息 *"
										}
									},
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

	////////////////////
	/* if ($(
				"input[name=hostUpperOfficeId]")
				.val() == "") {
				$(
					"input[name=hostUpperOfficeId]")
					.parent().next().next()
					.children().text(
							"必填选项 *");
				return false;
				}
				$("input[name=hostUpperOfficeId]")
				.parent().next().next()
				.children().text("*"); */
	/* if ($(
			"input[name=hostUpperOfficeId]")
			.val() == "") {
		$(
				"input[name=hostUpperOfficeId]")
				.parent().next().next()
				.children().text(
						"必填选项 *");
		return false;
	}
	$("input[name=hostUpperOfficeId]")
			.parent().next().next()
			.children().text("*"); */
	//$("#name").focus();
	/////////////
</script>
<link rel="stylesheet" type="text/css"
	href="${ctxStatic}/liuxin/css/liucheng.css">
<style type="text/css">
.input-group.treeselect-div label.error {
	position: absolute;
	width: 100px;
	margin-left: 36px;
	left: 100%;
	top: 6px;
}

.control-group1 ol {
	margin-left: 0;
	display: inline-block;
}

.control-group1 ol+input[type="button"].btn {
	display: block;
	margin-left: 23.2%;
	margin-top: 8px;
}

.control-group .sgin-red{
	position:relative
}

.sgin-red:after{
        	position: absolute;
		    display: block;
		    content: '*';
		    color: red;
		    top: 0;
		    right:-5px;
        }
.upload-ph{
	float:none;
	margin-left:0;
}
</style>
</head>
<body class="gray-bg">
	<div class="wrapper wrapper-content">
		<div class="ibox">
			<div class="ibox-title">
				<h5>${title}</h5>
			</div>
			<div class="ibox-content">
				<%--
	<ul class="nav nav-tabs">
		<li class="active"><a
			href="${ctx}/oa/oaReceiveFile/form?id=${oaReceiveFile.id}&flag=form">编辑-公司收文</a></li>
	</ul>
	<br />
    --%>
				<form:form id="inputForm" modelAttribute="oaReceiveFile"
					action="${ctx}/oa/oaReceiveFile/save" method="post"
					class="form-inline">
					<input type="hidden" name="token" value="${token }">
					<input type="hidden" name="flag" value="0" id="flag">
					<form:hidden path="id" />
					<form:hidden path="procInsId" />
					<form:hidden path="officename" />
					<input type="hidden" name="isdraft" value="0">






					<div class="control-group">
						<label class="control-label">字&emsp;&emsp;号：</label>
						<form:input path="code" htmlEscape="false" maxlength="100"
							class="form-control input-sm" readonly="true"
							style="background-color: #FFFFFF;" />
					</div>
					<div class="control-group">
						<label class="control-label">收文字号：</label>
						<form:input path="unitcode" htmlEscape="false" maxlength="100"
							class="form-control input-sm" />
					</div>
					<div class="control-group">
						<label class="control-label sgin-red">收文日期：</label> <input name="date"
							type="text" readonly="readonly" maxlength="20"
							class="laydate-icon form-control xinreq"
							style="background-color: #FFFFFF; width: 196px;"
							value="<fmt:formatDate value="${oaReceiveFile.date}" pattern="yyyy-MM-dd"/>"
							onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});" />
					</div>
					<div class="control-group">
						<label class="control-label sgin-red">来文单位：</label>
						<form:input path="unitname" htmlEscape="false" maxlength="100"
							class="form-control input-sm xinreq" />
					</div>
					<div class="control-group">
						<label class="control-label sgin-red">文件标题：</label>
						<form:input path="title" htmlEscape="false" maxlength="100"
							class="form-control input-sm xinreq" />
					</div>
					<div class="control-group">
						<label class="control-label sgin-red">内容摘要：</label>
						<form:textarea path="content" htmlEscape="false" rows="4"
							maxlength="255" class="form-control input-sm xinreq"
							cssStyle="width:196px;" />
					</div>
					<div class="control-group control-group1">
						<label class="control-label sgin-red">正&emsp;&emsp;文：</label>
						<form:input path="mainfile" htmlEscape="false" maxlength="2000"
							readonly="true" class="form-control input-sm xinreq"
							style="background-color: #FFFFFF;" />
						<sys:ckfinder input="mainfile" type="files"
							uploadPath="/oa/oaReceiveFile" selectMultiple="true" />
					</div>
					<div class="control-group control-group1">
						<label class="control-label">附&emsp;&emsp;件：</label>
						<form:input path="otherfiles" htmlEscape="false" maxlength="2000"
							readonly="true" class="form-control input-sm"
							style="background-color: #FFFFFF;" />
						<sys:ckfinder input="otherfiles" type="files"
							uploadPath="/oa/oaReceiveFile" selectMultiple="true" />
					</div>
					<div class="control-group">
						<label class="control-label sgin-red">主办部门：</label>
						<sys:treeselect id="office" name="hostUpperOfficeId" value="${oaReceiveFile.hostUpperOfficeId }"
							labelName="hostUpperOfficeName" labelValue="${oaReceiveFile.hostUpperOfficeName }" title="部门"
							url="/sys/office/treeData?type=2"
							cssStyle="background-color: #FFFFFF;"
							cssClass="form-control input-sm" notAllowSelectParent="false" />
					</div>
					<div class="form-actions">
						<c:if
							test="${oaReceiveFile.isdraft=='0' || empty oaReceiveFile.id }">
							<shiro:hasPermission name="oa:oaReceiveFile:edit">
								<input id="btnSubmit0" class="btn btn-myoa" type="submit"
									value="存草稿" />&nbsp;</shiro:hasPermission>
						</c:if>
						<shiro:hasPermission name="oa:oaReceiveFile:edit">
							<input id="btnSubmit" class="btn btn-myoa" type="submit"
								value="提交" />&nbsp;</shiro:hasPermission>
						<c:if
							test="${not empty oaReceiveFile.id && oaReceiveFile.isdraft!='0'}">
							<input id="btnCancle2" class="btn btn-primary" type="submit"
								value="作废申请" />&nbsp;</c:if>
						<input id="btnCancel" class="btn" type="button" value="返 回"
							onclick="history.go(-1)" />
						<c:choose>
							<c:when test="${task != null}">
				&nbsp;<input
									onclick='btnPNGshow("${task.processDefinitionId}/${task.executionId}");'
									class="btn" type="button" value="流程跟踪" />
							</c:when>
							<c:otherwise>&nbsp;<input
									onclick='btnPNGshow2("${procDefId}");' class="btn"
									type="button" value="流程图" />
							</c:otherwise>
						</c:choose>
					</div>
				</form:form>
				<c:if test="${not empty oaReceiveFile.id}">
					<act:histoicFlow procInsId="${oaReceiveFile.procInsId}" />
				</c:if>
			</div>
		</div>
	</div>
</body>
</html>