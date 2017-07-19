<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>站内邮件</title>
<meta name="decorator" content="default" />
<script type="text/javascript">
	var validateForm;
	//回调函数，在编辑和保存动作时，供openDialog调用提交表单，-------存草稿。
	function caogao() {
		if (validateForm.form()) {
			//草稿
			$("input[name=isdraft]").val("0");
			$("#inputForm").submit();
			return true;
		}

		return false;
	}
	//回调函数，在编辑和保存动作时，供openDialog调用提交表单---------发送。
	function doSubmit() {
		if (validateForm.form()) {
			//提交
			$("input[name=isdraft]").val("1");
			$("#inputForm").submit();
			return true;
		}

		return false;
	}
	$(document).ready(
			function() {
				validateForm = $("#inputForm")
						.validate(
								{
									rules : {
										mainName : {
											required : true
										},
										title : {
											required : true
										},

										content : {
											required : true
										}
									},
									messages : {
										mainName : {
											required : "必填信息"
										}
									},
									submitHandler : function(form) {
										//oaLoading('正在提交，请稍等...');
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
<style type="text/css">
div.input-group.treeselect-div {
	width: 88%;
}

div.input-group.treeselect-div label.error {
	height: 20px;
}

<<<<<<<
.mine
div.input-group.treeselect-div label.error {
	height: 20px;
}

.table.myoa-newitem-table>tbody>tr>td {
	border-top-width: 0;
}

.table.myoa-newitem-table>tbody>tr>td:nth-child(odd) {
	width: 20%;
}

.table.myoa-newitem-table>tbody>tr>td:nth-child(even) {
	width: 80%;
}

div.input-group.treeselect-div label.error {
	height: 20px;
}

.table.myoa-newitem-table>tbody>tr>td {
	border-top-width: 0;
}

.table.myoa-newitem-table>tbody>tr>td:nth-child(odd) {
	width: 20%;
}

.table.myoa-newitem-table>tbody>tr>td:nth-child(even) {
	width: 80%;
}
</style>
</head>
<body>
	<form:form id="inputForm" modelAttribute="oaMail"
		action="${ctx}/oa/mail/oaMail/save" method="post"
		class="form-horizontal">
		<form:hidden path="id" />
		<input type="hidden" name="isdraft" value="1" />
		<input type="hidden" value="${token}" name="token" />
		<sys:message content="${message}" />
		<table
			class="table table-condensed dataTables-example dataTable no-footer myoa-newitem-table">
			<tbody>
				<tr>
					<td><label class="pull-right">收件人： <font color="red">*</font></label></td>
					<td><sys:treeselect id="main" name="mainId"
							value="${oaMail.mainId}" labelName="mainName"
							labelValue="${oaMail.mainName}" title="用户"
							url="/sys/office/treeData?type=3&isAll=true"
							cssClass="form-control" allowClear="true" checked="true"
							cssStyle="background-color: #FFFFFF;" notAllowSelectParent="true" />
					</td>
				</tr>
				<tr>
					<td><label class="pull-right">抄送：</label></td>
					<td><sys:treeselect id="other" name="otherId"
							value="${oaMail.otherId}" labelName="otherName"
							labelValue="${oaMail.otherName}" title="用户"
							url="/sys/office/treeData?type=3&isAll=true"
							cssClass="form-control" allowClear="true" checked="true"
							cssStyle="background-color: #FFFFFF;" notAllowSelectParent="true" />
					</td>
				</tr>
				<tr>
					<td><label class="pull-right">标题： <font color="red">*</font></label></td>
					<td><form:input path="title" htmlEscape="false"
							maxlength="1000" class="form-control " /></td>
				</tr>
				<tr>
					<td><label class="pull-right">附件：</label></td>
					<td><form:input path="file" htmlEscape="false"
							maxlength="3000" class="form-control " readonly="true"
							style="width: 60%; background-color: #fff;" /> <sys:ckfinder
							input="file" type="files" uploadPath="/oa/mail/oaMail"
							selectMultiple="true" /></td>
				</tr>
				<tr>
					<td><label class="pull-right">内容： <font color="red">*</font></label></td>
					<td colspan="3"><form:textarea path="content"
							htmlEscape="false" rows="6" maxlength="3000"
							class="form-control " /></td>
				</tr>
			</tbody>
		</table>
	</form:form>
</body>
</html>