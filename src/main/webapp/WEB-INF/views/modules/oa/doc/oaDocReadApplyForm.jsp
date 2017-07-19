<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>文档阅读申请信息管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			//$("#name").focus();
			$("#inputForm").validate({
				submitHandler: function(form){
					form.submit();
					oaLoading('操作正在进行中，请耐心等待...');
				},
				errorContainer: "#messageBox",
				errorPlacement: function(error, element) {
					$("#messageBox").text("输入有误，请先更正。");
					if (element.is(":checkbox")||element.is(":radio")||element.parent().is(".input-append")){
						error.appendTo(element.parent().parent());
					} else {
						error.insertAfter(element);
					}
				}
			});
		});
	</script>
</head>
<body class="gray-bg">
	<div class="wrapper wrapper-content">
		<div class="ibox">
			<ul class="nav nav-tabs myoa-tabs">
				<li><a href="${ctx}/oa/doc/oaDocReadApply/">文档阅读申请信息列表</a></li>
				<li class="active"><a href="${ctx}/oa/doc/oaDocReadApply/form?id=${oaDocReadApply.id}">文档阅读申请信息<shiro:hasPermission name="oa:doc:oaDocReadApply:edit">${not empty oaDocReadApply.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="oa:doc:oaDocReadApply:edit">查看</shiro:lacksPermission></a></li>
			</ul>
	<form:form id="inputForm" modelAttribute="oaDocReadApply" action="${ctx}/oa/doc/oaDocReadApply/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>		
		<div class="control-group">
			<label class="control-label">申请的文档：</label>
			<div class="controls">
				<form:input path="doc.id" htmlEscape="false" maxlength="64" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">借阅状态（0：申请中；1：同意；2：不同意）：</label>
			<div class="controls">
				<form:select path="lendStatus" class="input-xlarge ">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('oaDocReadApply_lendStatus')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">借阅人：</label>
			<div class="controls">
				<form:input path="lendUser.id" htmlEscape="false" maxlength="64" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">备注信息：</label>
			<div class="controls">
				<form:textarea path="remarks" htmlEscape="false" rows="4" maxlength="255" class="input-xxlarge "/>
			</div>
		</div>
		<div class="form-actions">
			<shiro:hasPermission name="oa:doc:oaDocReadApply:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
	</div>
	</div>
</body>
</html>