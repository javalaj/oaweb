<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>私车公用管理</title>
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
		
<div class="ibox-title">
	<h5>私车公用详情</h5>
</div>
	<div class="ibox-content">
	<form:form id="inputForm" modelAttribute="oaPublicPrivateCars" action="${ctx}/oa/publicprivatecar/oaPublicPrivateCars/dealExam" method="post" class="form-horizontal">
		<legend style="margin-bottom:10px;">${title }</legend>
		<input type="hidden" name="token" value="${token }">
		<sys:message content="${message}"/>	
		<input type="hidden" name="sign" value="2" />
		<form:hidden path="id"/>
		<form:hidden path="procInsId"/>
		<form:hidden path="officename"/>
		<form:hidden path="usereason"/>
		<form:hidden path="gokilometer"/>
		<form:hidden path="backkilometer"/>
		<form:hidden path="destination"/>
		<form:hidden path="examname"/>
		<form:hidden path="examtext"/>
		<input type="hidden" name="starttime"
			value="<fmt:formatDate value="${oaPublicPrivateCars.starttime}" pattern="yyyy-MM-dd HH:mm:ss" />" />
		<input type="hidden" name="endtime"
			value="<fmt:formatDate value="${oaPublicPrivateCars.endtime}" pattern="yyyy-MM-dd HH:mm:ss" />" />
		
<!-- 		<input type="hidden" name="exam" value="0"/> -->
				
		<div class="control-group">
			<label class="control-label">文&nbsp;件&nbsp;编号：</label>
			<div class="controls">
				<input type="text" value="${oaPublicPrivateCars.fileId}" class="form-control" style="width:40%;" readonly="readonly"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">申请人：</label>
			<div class="controls">
				<input type="text" value="${oaPublicPrivateCars.createBy.name}" class="form-control" style="width:40%;" readonly="readonly"/>
			</div>
		</div>	
		<div class="control-group">
			<label class="control-label">所在部门：</label>
			<div class="controls">
				<input type="text" value="${oaPublicPrivateCars.createBy.office.name}" class="form-control" style="width:40%;" readonly="readonly"/>
			</div>
		</div>			
		<div class="control-group">
			<label class="control-label">用车范围：</label>
			<div class="controls">
				<input type="text" value="${oaPublicPrivateCars.usescope}" disabled class="form-control" style="width:40%;">
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">事由：</label>
			<div class="controls">
				<input type="text" value="${oaPublicPrivateCars.usereason}" disabled class="form-control" style="width:40%;">
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">起始时间：</label>
			<div class="controls">
				<input type="text" value="<fmt:formatDate value="${oaPublicPrivateCars.starttime}"
					pattern="yyyy-MM-dd HH:mm:ss" />" disabled class="form-control" style="width:40%;">
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">结束时间：</label>
			<div class="controls">
				<input type="text" value="<fmt:formatDate value="${oaPublicPrivateCars.endtime}"
					pattern="yyyy-MM-dd HH:mm:ss" />" disabled class="form-control" style="width:40%;">
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">起始公里数：</label>
			<div class="controls">
				<input type="text" value="${oaPublicPrivateCars.gokilometer}" disabled class="form-control" style="width:40%;">
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">返回公里数：</label>
			<div class="controls">
				<input type="text" value="${oaPublicPrivateCars.backkilometer}" disabled class="form-control" style="width:40%;">
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">目地：</label>
			<div class="controls">
				<input type="text" value="${oaPublicPrivateCars.destination}" disabled class="form-control" style="width:40%;">
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">上传照片：</label>
			<div class="controls">
				<form:hidden id="picture" path="picture" htmlEscape="false" maxlength="4000" class="input-xlarge"/>
				<sys:ckfinder input="picture" type="images" uploadPath="/oa/publicprivatecar/oaPublicPrivateCars/photo" selectMultiple="true" maxWidth="100" maxHeight="100" buttonLabel="上传照片" readonly="true"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">行政签名：</label>
			<div class="controls">
				<input type="text" value="${oaPublicPrivateCars.examname}" disabled class="form-control" style="width:40%;">
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">行政意见：</label>
			<div class="controls">
				<input type="text" value="${oaPublicPrivateCars.examtext}" disabled class="form-control" style="width:40%;">
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">财务报销：</label>
			<div class="controls">
				<input type="radio" class="i-checks" name="exam" value="0">同意&nbsp;&nbsp;&nbsp;
				<input type="radio" class="i-checks" name="exam" value="1" checked="checked">不同意				
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">财务留言：</label>
			<div class="controls">
				<form:input path="examtext1" htmlEscape="false" maxlength="80" class="form-control" style="width:40%;"/>
			</div>
		</div>
		
		<div class="control-group">
			<label class="control-label">备注：</label>
			<div class="controls">
				<form:textarea path="remarks" readonly="true" value="${oaPublicPrivateCars.remarks}" htmlEscape="false" rows="4" maxlength="255" class="form-control" style="width:40%;"/>
			</div>
		</div>
		<div class="form-actions" style="text-align:left; margin-top:15px;margin-bottom: 15px;">
			<shiro:hasPermission name="oa:publicprivatecar:oaPublicPrivateCars:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>&nbsp;
			<c:if test="${task != null}">
				<input onclick='btnPNGshow("${task.processDefinitionId}/${task.executionId}");' class="btn" type="button" value="流程跟踪" />
			</c:if>
		</div>
	
	</form:form>
	<c:if test="${not empty oaPublicPrivateCars.id}">
		<act:histoicFlow procInsId="${oaPublicPrivateCars.procInsId}" />
	</c:if>
	</div>
	</div>
		</div>
</body>
</html>