<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>快捷方式管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			//$("#name").focus();
			$("#inputForm").validate({
				submitHandler: function(form){
					oaLoading('正在提交，请稍候...');
					form.submit();
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
			<div class="ibox-content">
				<ul class="nav nav-tabs myoa-tabs">
					<li><a href="${ctx}/oa/shortcutkey/shortcutKey/">快捷方式列表</a></li>
					<li class="active"><a href="${ctx}/oa/shortcutkey/shortcutKey/form?id=${shortcutKey.id}">快捷方式<shiro:hasPermission name="oa:shortcutkey:shortcutKey:edit">${not empty shortcutKey.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="oa:shortcutkey:shortcutKey:edit">查看</shiro:lacksPermission></a></li>
				</ul>
				<form:form id="inputForm" modelAttribute="shortcutKey" action="${ctx}/oa/shortcutkey/shortcutKey/save" method="post" class="form-horizontal">
					<form:hidden path="id"/>
					<sys:message content="${message}"/>
					
					
					<div class="control-group" >
						<label class="control-label">菜单: <font color="red">*</font></label>
						<div class="controls">
			                <sys:treeselect id="menu" name="menu.id" labelValue="${shortcutKey.menu.name}"
								labelName="shortcutKey.menu.name" value="${shortcutKey.menu.id}" title="菜单"
								url="/sys/user/treeDataForMenu" cssClass="input-small required" 
								allowClear="true" notAllowSelectParent="true" />
								<span class="help-inline"> </span>
						</div>
					</div>
					
					<div class="control-group">
						<label class="control-label">图标:</label>
						<div class="controls">
							<sys:iconselect id="icon" name="icon" value="${shortcutKey.icon}" />
						</div>
					</div>
					<div class="form-actions">
						<shiro:hasPermission name="oa:shortcutkey:shortcutKey:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
						<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
					</div>
				</form:form>
			</div>
		</div>
	</div>			
</body>
</html>