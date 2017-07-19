<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>公司收文登记管理</title>
<meta name="decorator" content="default" />
<script type="text/javascript">
	$(document).ready(
			function() {
				/* $("#btnCancle2").click(function() {
					$("#flag").val("1");
				}); */
				$("#btnSubmit").click(
						function() {
							if ($("input[name=hostPersonId][type=hidden]")
									.val() == "") {
								$("input[name=hostPersonId]").next().next()
										.next().next().children()
										.text("必填选项 *");
								return false;
							}
							$("input[name=hostPersonId]").next().next().next()
									.next().children().text("*");
						});
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
			<div class="ibox-title">
				<h5>${title}</h5>
			</div>
			<div class="ibox-content">
				<form:form id="inputForm" modelAttribute="oaReceiveFile"
					action="${ctx}/oa/oaReceiveFile/dealExam" method="post"
					class="form-inline">
					<legend>${title }</legend>
					<input type="hidden" name="token" value="${token }">
					<input type="hidden" name="sign" value="4">
					<form:hidden path="id" />
					<form:hidden path="procInsId" />
					<form:hidden path="officename" />



					<form:hidden path="code" />
					<form:hidden path="unitcode" />
					<input type="hidden" name="date"
						value="<fmt:formatDate value="${oaReceiveFile.date}" pattern="yyyy-MM-dd"/>">
					<form:hidden path="unitname" />
					<form:hidden path="title" />
					<form:hidden path="content" />
					<form:hidden path="mainfile" />
					<form:hidden path="otherfiles" />
					<form:hidden path="examname" />
					<form:hidden path="examtext" />
					<form:hidden path="examname2" />
					<form:hidden path="examtext2" />

					<div class="control-group">
						<label class="control-label">字&emsp;&emsp;号：</label>
						${oaReceiveFile.code}
					</div>
					<div class="control-group">
						<label class="control-label">登记部门：</label>
						${oaReceiveFile.officename}
					</div>
					<div class="control-group">
						<label class="control-label">登&nbsp;&nbsp;记&nbsp;&nbsp;人：</label>
						${oaReceiveFile.createBy.name}
					</div>
					<div class="control-group">
						<label class="control-label">登记时间：</label>

						<fmt:formatDate value="${oaReceiveFile.createDate}"
							pattern="yyyy-MM-dd HH:mm:ss" />

					</div>
					<div class="control-group">
						<label class="control-label">收文字号：</label>
						<div class="lc-view-div">${oaReceiveFile.unitcode}<br>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label">收文日期：</label>

						<fmt:formatDate value="${oaReceiveFile.date}" pattern="yyyy-MM-dd" />

					</div>
					<div class="control-group">
						<label class="control-label">来文单位：</label>
						<div class="lc-view-div">${oaReceiveFile.unitname}<br>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label">文件标题：</label>
						<div class="lc-view-div">${oaReceiveFile.title}<br>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label">内容摘要：</label>
						<div class="lc-view-div">${oaReceiveFile.content}<br>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label">正&emsp;&emsp;文：</label>
						<div class="lc-view-div" id="main-file">
							<sys:split-file-name urls="${oaReceiveFile.mainfile}"
								id="main-file"></sys:split-file-name>
							<br>
						</div>

					</div>
					<div class="control-group">
						<label class="control-label">附&emsp;&emsp;件：</label>
						<div class="lc-view-div" id="other-file">
							<sys:split-file-name urls="${oaReceiveFile.otherfiles}"
								id="other-file"></sys:split-file-name>
							<br>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label">主办部门领导签字：</label>
						${oaReceiveFile.examname}
					</div>
					<div class="control-group">
						<label class="control-label">主办部门领导意见：</label>
						<div class="lc-view-div">${oaReceiveFile.examtext}<br>
						</div>
					</div>

					<div class="control-group">
						<label class="control-label">总经理签名：</label>
						${oaReceiveFile.examname2}
					</div>
					<div class="control-group">
						<label class="control-label">总经理意见：</label>
						<div class="lc-view-div">${oaReceiveFile.examtext2}<br>
						</div>
					</div>





					<div class="control-group">
						<label class="control-label">主办人员：</label>
						<sys:treeselect id="user" name="hostPersonId" value=""
							labelName="" labelValue="" title="用户"
							url="/sys/office/treeData?type=3&isAll=true"
							cssStyle="background-color: #FFFFFF;"
							cssClass="form-control input-sm" allowClear="true"
							notAllowSelectParent="true" />
						<span class="help-inline"><font color="red">*</font> </span>
					</div>

					<div class="form-actions">
						<shiro:hasPermission name="oa:oaReceiveFile:edit">
							<input id="btnSubmit" class="btn btn-primary" type="submit"
								value="审核提交" />&nbsp;</shiro:hasPermission>
						<input id="btnCancel" class="btn" type="button" value="返 回"
							onclick="history.go(-1)" />
						<c:if test="${task != null}">
				&nbsp;<input
								onclick='btnPNGshow("${task.processDefinitionId}/${task.executionId}");'
								class="btn" type="button" value="流程跟踪" />
						</c:if>
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