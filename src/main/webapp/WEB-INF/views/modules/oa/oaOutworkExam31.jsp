<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>审核出差申请</title>
<meta name="decorator" content="default" />
<script type="text/javascript">
	$(document)
			.ready(
					function() {
						/**技术部 出差报告/抄送 特殊性定义验证 */
						jQuery.validator.addMethod("special_validate_1",
								function(value, element, param) {
									if (value == ""
											&& $(param[0]).is(":checked")) {
										return false;
									}
									return true;
								}, $.validator.format("必填信息 *"));
						//加载自已的验证方法
						xin_validate();
						//保单验证
						$("#inputForm")
								.validate(
										{
											rules : {
												realEndTime : {
													required : true,
													min_date_ne : $("#startTime")[0]

												},
												time : {
													required : true,
													number_1 : [ "" ]
												},
												fileurl : {
													special_validate_1 : [ $("input[name=isTrue]")[0] ]
												},
												username : {
													special_validate_1 : [ $("input[name=isTrue]")[0] ]
												}
											},
											messages : {
												realEndTime : {
													min_date : "必须大于开始时间"
												},
												fileurl : {
													required : "必填信息 *"
												},
												username : {
													required : "必填信息 *"
												}
											},
											submitHandler : function(form) {
												//loading('正在提交，请稍等...');
												form.submit();
											},
											errorContainer : "#messageBox",
											errorPlacement : function(error,
													element) {
												$("#messageBox").text(
														"输入有误，请先更正。");
												if (element.is(":checkbox")
														|| element.is(":radio")
														|| element
																.parent()
																.is(
																		".input-append")) {
													error.appendTo(element
															.parent().parent());
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
	/* function notnull() {
		var judge = true;
		if ($("input[name=realEndTime]").val() == "") {
			$("input[name=realEndTime]").next().children().text("必填信息 *");
			judge = false;
		} else {
			$("input[name=realEndTime]").next().children().text("*");
		}
		//时长
			if ($("input[name=time]").val() != "") {
			if ($("input[name=time]").val() % 1 === 0
					&& $("input[name=time]").val() >= 0) {
				$("input[name=time]").next().children().text("*");
			} else {
				$("input[name=time]").next().children().text("请输入大于或等于0的整数 *");
				judge = false;
			}
		} else {
			$("input[name=time]").next().children().text("必填信息 *");
			judge = false;
		}
		//
		if ($("input[name=isTrue]").is(":checked")) {
			if ($("input[name=fileurl]").val() == "") {
				$("input[name=fileurl]").next().children().text("必填信息 *");
				judge = false;
			} else {
				$("input[name=fileurl]").next().children().text("");
			}
			if ($("input[name=toSendMessageUserid][type=hidden]").val() == "") {
				$("input[name=toSendMessageUserid][type=hidden]").next().next().next().next()
						.children().text("必填信息 *");
				judge = false;
			} else {
				$("input[name=toSendMessageUserid][type=hidden]").next().next().next().next()
						.children().text("");
			}
		} else {
			$("input[name=fileurl]").next().children().text("");
			$("input[name=toSendMessageUserid][type=hidden]").next().next().next().next()
					.children().text("");
		}
		return judge;
	} */
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
</style>
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
						href="${ctx}/oa/oaOutwork/exam3?id=${oaOutwork.id}&num=1">审核-出差申请</a></li>
				</ul>
				<br />
				 --%>
				<form:form id="inputForm" modelAttribute="oaOutwork"
					action="${ctx}/oa/oaOutwork/dealExam3" method="post"
					class="form-inline">
					<input type="hidden" name="token" value="${token }">
					<form:hidden path="id" />
					<form:hidden path="procInsId" />
					<form:hidden path="fileId" />
					<form:hidden path="officeName" />
					<form:hidden path="task" />
					<form:hidden path="address" />
					<form:hidden path="unitName" />
					<form:hidden path="unitUserName" />
					<input type="hidden" name="sign" value="1">
					<input type="hidden" name="startTime" id="startTime"
						value="<fmt:formatDate value="${oaOutwork.startTime}"
					pattern="yyyy-MM-dd HH:mm:ss" />" />
					<input type="hidden" name="endTime"
						value="<fmt:formatDate value="${oaOutwork.endTime}"
					pattern="yyyy-MM-dd HH:mm:ss" />" />
					<form:hidden path="cost" />
					<form:hidden path="projectName" />
					<form:hidden path="scheduleProgram" />
					<form:hidden path="examname" />
					<form:hidden path="examtext" />
					<form:hidden path="examname2" />
					<form:hidden path="examtext2" />

					<sys:message content="${message}" />

					<div class="control-group">
						<label class="control-label">文件编号：</label> ${oaOutwork.fileId }
					</div>
					<div class="control-group">
						<label class="control-label">部门名称：</label> ${oaOutwork.officeName }
					</div>
					<div class="control-group">
						<label class="control-label">申请人：</label>
						${oaOutwork.createBy.name }
					</div>
					<div class="control-group">
						<label class="control-label">申请时间：</label>

						<fmt:formatDate value="${oaOutwork.updateDate }"
							pattern="yyyy-MM-dd HH:mm:ss" />
					</div>
					<div class="control-group">
						<label class="control-label">出差任务：</label> ${oaOutwork.task }
					</div>
					<div class="control-group">
						<label class="control-label">项目或合同名称：</label>
						${oaOutwork.projectName }
					</div>
					<div class="control-group">
						<label class="control-label">出差日程安排：</label>
						${oaOutwork.scheduleProgram }
					</div>
					<div class="control-group">
						<label class="control-label">目的地：</label> ${oaOutwork.address }
					</div>
					<div class="control-group">
						<label class="control-label">访问单位：</label> ${oaOutwork.unitName }
					</div>
					<div class="control-group">
						<label class="control-label">拜访对象：</label>
						${oaOutwork.unitUserName }
					</div>
					<div class="control-group">
						<label class="control-label">出差开始时间：</label>

						<fmt:formatDate value="${oaOutwork.startTime}"
							pattern="yyyy-MM-dd HH:mm:ss" />
					</div>
					<div class="control-group">
						<label class="control-label">预计结束时间：</label>

						<fmt:formatDate value="${oaOutwork.endTime}"
							pattern="yyyy-MM-dd HH:mm:ss" />
					</div>
					<div class="control-group">
						<label class="control-label">预计出差费用：</label> ${oaOutwork.cost }
					</div>
					<div class="control-group">
						<label class="control-label">上级领导签字：</label> ${oaOutwork.examname }
					</div>
					<div class="control-group">
						<label class="control-label">上级领导意见：</label> ${oaOutwork.examtext }
					</div>
					<div class="control-group">
						<label class="control-label">部门副总签字：</label> ${oaOutwork.examname2 }
					</div>
					<div class="control-group">
						<label class="control-label">部门副总意见：</label> ${oaOutwork.examtext2 }
					</div>
					<div class="control-group">
						<label class="control-label">总经理签字：</label>
						${oaOutwork.examname21}
					</div>
					<div class="control-group">
						<label class="control-label">总经理意见：</label>
						${oaOutwork.examtext21}
					</div>
					<div class="control-group">
						<label class="control-label">确定出差结束时间： <font color="red">*</font></label> <input
							name="realEndTime" type="text" readonly="readonly" maxlength="20"
							class="laydate-icon form-control "
							style="background-color: #FFFFFF;"
							value="<fmt:formatDate value="${oaOutwork.realEndTime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
							onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});" />
						
					</div>
					<div class="control-group">
						<label class="control-label">出差时长： <font color="red">*</font></label>

						<form:input path="time" htmlEscape="false" maxlength="11"
							id="time" class="form-control input-sm" autocomplete="off" />
						
					</div>
					<div class="control-group">
						<label class="control-label">是否有出差报告：</label> <input
							type="checkbox" name="isTrue" value="0" class="i-checks">有
					</div>
					<div class="control-group">
						<label class="control-label">通知抄送（技术部）：</label>

						<sys:treeselect id="user" name="toSendMessageUserid" labelValue=""
							labelName="username" value="" title="用户"
							url="/sys/office/treeData?type=3"
							cssClass="form-control input-sm"
							cssStyle="background-color: #FFFFFF;" allowClear="true"
							notAllowSelectParent="true" checked="true" />
						
					</div>
					<div class="control-group control-group1">
						<label class="control-label">出差报告（技术部）：</label>

						<form:input path="fileurl" htmlEscape="false" maxlength="2000"
							readonly="true" class="form-control input-sm"
							style="background-color: #FFFFFF;" />
						<span class="help-inline"><font color="red"></font> </span>
						<sys:ckfinder input="fileurl" type="files"
							uploadPath="/oa/oaOutwork" selectMultiple="true" />
					</div>
					<div class="form-actions">
						<shiro:hasPermission name="oa:oaOutwork:edit">
							<input id="btnSubmit" class="btn btn-primary" type="submit"
								value="提交审核" />&nbsp;</shiro:hasPermission>
						<input id="btnCancel" class="btn" type="button" value="返 回"
							onclick="history.go(-1)" />
						<c:if test="${task != null}">
				&nbsp;<input
								onclick='btnPNGshow("${task.processDefinitionId}/${task.executionId}");'
								class="btn" type="button" value="流程跟踪" />
						</c:if>
					</div>
				</form:form>
				<c:if test="${not empty oaOutwork.id}">
					<act:histoicFlow procInsId="${oaOutwork.procInsId}" />
				</c:if>
			</div>
		</div>
	</div>
</body>
</html>