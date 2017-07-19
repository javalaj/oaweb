<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@page language="java" import="java.util.Date"%>
<html>
<head>
<title>印章使用申请</title>
<meta name="decorator" content="default" />
<script type="text/javascript">
		$(document).ready(
			function() {
				$("#btnCancle2").click(function(){
					$("#flag").val("1");
					
				})
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
			<div class="ibox-tools">
			<!-- <a class="collapse-link">
				<i class="fa fa-chevron-up"></i>
			</a>
			<a class="dropdown-toggle" data-toggle="dropdown" href="form_basic.html#">
				<i class="fa fa-wrench"></i>
			</a>
			
			<a class="close-link">
				<i class="fa fa-times"></i>
			</a> -->
			</div>
		</div>
		<div class="ibox-content">
			<form:form id="inputForm" modelAttribute="oaSealUse"
				action="${ctx}/oa/oaSealUse/save" method="post"
				class="form-inline myoa-details-form">
				<%-- <legend style="height:43px;">${title}</legend> --%>
				<input type="hidden" name="token" value="${token }">
				
				<input type="hidden" name="flag" value="0" id="flag">
				<form:hidden path="id" />
				<form:hidden path="procInsId" />
				<sys:message content="${message}" />
		
		
				<div class="control-group">
					<label class="control-label">编号：</label>					
					<form:input path="fileId" htmlEscape="false" maxlength="100" class="form-control" disabled="true" style="width:40%;"/>					
				</div>
				<div class="control-group">
					<label class="control-label">申请人姓名：</label>					
					<input type="text" value="${oaSealUse.createBy.name}" disabled  class="form-control" style="width:40%;">					
				</div>
				<div class="control-group">
					<label class="control-label">所在部门：</label>					
					<input type="text" value="${oaSealUse.officeName}" class="form-control" disabled style="width:40%;">					
				</div>
				<div class="control-group">
					<label class="control-label">申请日期： <font color="red">*</font></label>					
					<input name="createDate"  id="gotime" type="text" readonly="readonly" maxlength="20" class="laydate-icon form-control layer-date input-sm required"
							value="<fmt:formatDate value="${oaSealUse.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
							onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});" style="background-color: #fff;"/>

				</div>
				<div class="control-group">
					<label class="control-label">印章类型：</label>					
					<input type="checkbox" class="i-checks" name="sealType" checked="checked" value="印章"/><font>&nbsp;印章</font>
					<input type="checkbox" class="i-checks" name="sealType" value="合同章"><font>&nbsp;合同章</font>
						<%-- <form:checkboxes path="sealType" items="${fns:getDictList('sealType')}" 
							itemLabel="label" itemValue="value" htmlEscape="false" /> --%>
					
				</div>
				
				<div class="control-group">
					<label class="control-label">是否携带外出：</label>
					
						<input type="radio" class="i-checks" name="isout" checked="checked" value="是"/><font>&nbsp;是</font>
						<input type="radio" class="i-checks" name="isout" value="否"/><font>&nbsp;否</font>				
						<%-- <form:radiobuttons path="isout" items="${fns:getDictList('isOut')}"
							itemLabel="label" itemValue="value" htmlEscape="false"/> --%>
					
				</div>
				<div class="control-group">
					<label class="control-label">摘要(事项)：</label>					
					<form:input path="matter" htmlEscape="false" maxlength="100" class="form-control" style="width:40%;"/>					
				</div>
		
				<div class="form-actions" style="text-align:left; margin-top:15px;margin-bottom: 15px;">
					<shiro:hasPermission name="oa:oaSealUse:edit">
						<input id="btnSubmit" class="btn btn-primary" type="submit"
							value="提交" />&nbsp;
					</shiro:hasPermission>
					<c:if test="${not empty oaSealUse.id}">
						<input id="btnCancle2" class="btn btn-primary" type="submit"
							value="取消申请" />&nbsp;
					</c:if>
					<input id="btnCancel" class="btn" type="button" value="返 回"
						onclick="history.go(-1)" />&nbsp;
					<c:choose>
						<c:when test="${task != null}">
							<input onclick='btnPNGshow("${task.processDefinitionId}/${task.executionId}");'
							class="btn" type="button" value="流程跟踪" />&nbsp;
						</c:when>
						<c:otherwise>
							<input onclick='btnPNGshow2("${procDefId}");' class="btn"
							type="button" value="流程图" />&nbsp;
						</c:otherwise>
					</c:choose>	
				</div>
				
			</form:form>
			<c:if test="${not empty oaSealUse.id}">
				<act:histoicFlow procInsId="${oaSealUse.procInsId}" />
			</c:if>
	</div>
</div>
</div>
</body>
</html>