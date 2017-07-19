<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>修改密码</title>
<meta name="decorator" content="default" />
<style>
	.myoa-modifypwd-form {
		padding: 36px 0;
	}
	.myoa-modifypwd-form .control-group {
		padding-bottom: 0;
		border-bottom: none;
	}
</style>
<script type="text/javascript">
		$(document).ready(function() {
			$("#oldPassword").focus();
			jQuery.validator.addMethod('notEqualTo', function(value, element,param) {
				//alert(1+"  "+param);
				var judge=(value != $(param).val());
				//alert(2 +"  "+judge+' '+value+' -1111-'+$(param).val());
				return judge;
				},'两次输入不能相同!');
			
			$("#inputForm").validate({
				rules: {
					newPassword:{notEqualTo:[$("#oldPassword")[0]]}
				},				
				messages: {					
					confirmNewPassword: {equalTo: "输入与上面相同的密码"}
				},
				submitHandler: function(form){
					oaLoading('正在提交，请稍等...');
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
<body>
<body class="gray-bg">
	<div class="wrapper wrapper-content">
		<div class="ibox">
			<div class="ibox-content" style="padding:0;">
				<ul class="nav nav-tabs myoa-tabs">
					<li><a href="${ctx}/sys/user/info">个人信息</a></li>
					<li class="active"><a href="${ctx}/sys/user/modifyPwd">修改密码</a></li>
				</ul>
				<form:form id="inputForm" modelAttribute="user"
		action="${ctx}/sys/user/modifyPwd" method="post"
		class="form-horizontal myoa-modifypwd-form">
		<form:hidden path="id" />
		<sys:message content="${message}" />
		<div class="control-group">
			<label class="control-label">旧密码:<span class="help-inline"><font
					color="red">*</font> </span></label>
			<div class="controls">
				<input id="oldPassword" name="oldPassword" type="password" value=""
					maxlength="50" minlength="3" class="form-control required"
					style="width: 30%;" /> 
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">新密码:<span class="help-inline"><font
					color="red">*</font> </span></label>
			<div class="controls">
				<input id="newPassword" name="newPassword" type="password" value=""
					maxlength="50" minlength="3" class="form-control required"
					style="width: 30%;" /> 
			</div>
		</div>		<div class="control-group">
			<label class="control-label">确认新密码:<span class="help-inline"><font
					color="red">*</font> </span></label>
			<div class="controls">
				<input id="confirmNewPassword" name="confirmNewPassword"
					type="password" value="" maxlength="50" minlength="3"
					class="form-control required" style="width: 30%;"
					equalTo="#newPassword" /> 
			</div>
		</div>
		<div class="form-actions">
			<input id="btnSubmit" class="btn btn-myoa btn-myoa-large" type="submit"
				value="保 存" />
		</div>
	</form:form>
			</div>
		</div>
	</div>		
</body>
</html>