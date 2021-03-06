<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>资质借用管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			//$("#name").focus();
			$("#btnCancle2").click(function(){
					$("#flag").val("1");
					
				})
			
			
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
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/liuxin/css/liucheng.css">
<style>
.form-inline .form-control {
	width: 40%;
}
</style>
</head>
<body class="gray-bg">
	<div class="wrapper wrapper-content">
		<div class="ibox" style="width: 800px;margin: 0 auto;">
			<div class="ibox-title">
				<h5>${title}</h5>
			</div>
			<div class="ibox-content">
	<form:form id="inputForm" modelAttribute="oaQualificationb" action="${ctx}/oa/qualificationb/oaQualificationb/save" method="post" class="form-inline myoa-details-form">
		<%-- <legend style="height:43px;line-height:43px;">${title }</legend> --%>
		<input type="hidden" name="token" value="${token }">		
		<input type="hidden" name="flag" value="0" id="flag">
		<form:hidden path="id" />
		<form:hidden path="procInsId" />		
		<sys:message content="${message}"/>	
		
		<div class="control-group">
			<label class="control-label">文件编号：</label>		
			<form:input path="fileId" htmlEscape="false" maxlength="100" class="form-control" disabled="true" style="width:40%;"/>
			
		</div>
		<div class="control-group">
			<label class="control-label">借用人：</label>			
			<input type="text" value="${oaQualificationb.createBy.name}" disabled class="form-control" readonly="readonly" style="width:40%;">			
		</div>	
		<div class="control-group">
			<label class="control-label">所在部门：</label>			
			<input type="text" value="${oaQualificationb.officename}" disabled class="form-control" readonly="readonly" style="width:40%;">			
		</div>		
		<div class="control-group">
			<label class="control-label">借用日期：</label>		
			<input name="date" type="text" readonly="readonly" maxlength="20" id="uset"
					 class="laydate-icon form-control layer-date input-sm required" style="background-color: #FFFFFF;"
					value="<fmt:formatDate value="${oaQualificationb.date}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});" />
			
		</div>
		<div class="control-group">
			<label class="control-label">证照名称： <font color="red">*</font></label>			
				<form:input path="licensename" htmlEscape="false" maxlength="50" class="form-control required" style="width:40%;" />
						
		</div>
		<div class="control-group">
			<label class="control-label">证照类别： <font color="red">*</font></label>			
			<form:radiobuttons path="type" items="${fns:getDictList('licenseType')}" itemLabel="label" itemValue="value" htmlEscape="false" class="input-xlarge required i-checks"/>							
		</div>
		<div class="control-group">
			<label class="control-label">使用事由： <font color="red">*</font></label>			
			<form:input path="reason" htmlEscape="false" maxlength="200" class="form-control" style="width:40%;" required="required"/>							
		</div>
		<div class="control-group">
			<label class="control-label">备注：</label>			
			<form:textarea path="remarks" htmlEscape="false" rows="4" maxlength="100" class="input-xxlarge form-control"/>			
		</div>
		<div class="form-actions" style="text-align:left; margin-top:15px;margin-bottom: 15px;">
			<shiro:hasPermission name="oa:qualificationb:oaQualificationb:edit">
				<input id="btnSubmit" class="btn btn-primary" type="submit"
					value="提交" />&nbsp;
			</shiro:hasPermission>
			<c:if test="${not empty oaQualificationb.id}">
				<input id="btnCancle2" class="btn btn-primary" type="submit"
					value="取消申请" />&nbsp;
			</c:if>
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
			<%-- <c:if test="${task != null}">
				&nbsp;<input
				onclick='btnPNGshow("${task.processDefinitionId}/${task.executionId}");'
				class="btn" type="button" value="流程跟踪" />
		</c:if> --%>
		</div>
		
	</form:form>
	</div>
	<c:if test="${not empty oaQualificationb.id}">
		<act:histoicFlow procInsId="${oaQualificationb.procInsId}" />
	</c:if>
	</div>
	</div>
</body>
</html>