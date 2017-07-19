<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>资质借用管理</title>
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
<link rel="stylesheet" type="text/css" href="${ctxStatic}/liuxin/css/liucheng.css">
</head>
<body class="gray-bg">
<div class="wrapper wrapper-content">
	<div class="ibox" >
	
		<div class="ibox-title">
			<h5>资质借用详情</h5>
<!-- 		<div class="ibox-tools"> -->
<!-- 			<a class="collapse-link"> -->
<!-- 				<i class="fa fa-chevron-up"></i> -->
<!-- 			</a> -->
<!-- 			<a class="dropdown-toggle" data-toggle="dropdown" href="form_basic.html#"> -->
<!-- 				<i class="fa fa-wrench"></i> -->
<!-- 			</a> -->
			
<!-- 			<a class="close-link"> -->
<!-- 				<i class="fa fa-times"></i> -->
<!-- 			</a> -->
<!-- 		</div> -->
		</div>
	
		<div class="ibox-content">
	
			<form:form id="inputForm" modelAttribute="oaQualificationb" action="${ctx}/oa/qualificationb/oaQualificationb/save" method="post" class="form-inline myoa-details-form">
				<sys:message content="${message}"/>	
				
				<legend style="margin-bottom: 10px;">${title }</legend>
				<input type="hidden" name="token" value="${token }">
				<input type="hidden" name="flag" value="0" id="flag">
				<form:hidden path="id"/>
				<sys:message content="${message}"/>
				
				<div class="control-group">
					<label class="control-label">文件编号：</label>
					<input type="text" value="${oaQualificationb.fileId}" readonly="readonly" class="form-control" style="width:40%;"/>
				</div>
				<div class="control-group">
					<label class="control-label">借用人：</label>
					<input type="text" value="${oaQualificationb.createBy.name}" readonly="readonly" class="form-control" style="width:40%;"/>
				</div>	
				<div class="control-group">
					<label class="control-label">所在部门：</label>
					<input type="text" value="${oaQualificationb.createBy.office.name}" readonly="readonly" class="form-control" style="width:40%;"/>
				</div>
				<div class="control-group">
					<label class="control-label">借用日期：</label>
					<input type="text" value="<fmt:formatDate value="${oaQualificationb.date}" pattern="yyyy-MM-dd HH:mm:ss" />" readonly="readonly" class="form-control" style="width:40%;"/>			
				</div>
				<div class="control-group">
					<label class="control-label">证照名称：</label>
					<input type="text" value="${oaQualificationb.licensename}" readonly="readonly" class="form-control" style="width:40%;"/>		
				</div>
				<div class="control-group">
					<label class="control-label">证照类别：</label>
					<input type="text" value="${oaQualificationb.type}" readonly="readonly" class="form-control" style="width:40%;"/>
				</div>
				<div class="control-group">
					<label class="control-label">使用事由：</label>
					<input type="text" value="${oaQualificationb.reason}" readonly="readonly" class="form-control" style="width:40%;"/>
				</div>
				<div class="control-group">
					<label class="control-label">备注：</label>
					<input type="text" value="${oaQualificationb.remarks}" readonly="readonly" class="form-control" style="width:40%;"/>
				</div>
				<div class="control-group">
					<label class="control-label">行政签字：</label>
					<input type="text" value="${oaQualificationb.textname}" readonly="readonly" class="form-control" style="width:40%;"/>
				</div>
				<div class="control-group">
					<label class="control-label">行政意见：</label>
					<input type="text" value="${oaQualificationb.textexam}" readonly="readonly" class="form-control" style="width:40%;"/>				
				</div>
				<div class="control-group">
					<label class="control-label">归还签字：</label>
					<input type="text" value="${oaQualificationb.textname1}" readonly="readonly" class="form-control" style="width:40%;"/>
				</div>
				<div class="control-group">
					<label class="control-label">归还意见：</label>
					<input type="text" value="${oaQualificationb.textexam1}" readonly="readonly" class="form-control" style="width:40%;"/>
				</div>
				<div class="form-actions" style="margin-top:15px;margin-bottom: 15px;">			
					<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
					<act:flow-back-btn></act:flow-back-btn>
					<c:if test="${task != null}">
						&nbsp;<input onclick='btnPNGshow("${task.processDefinitionId}/${task.executionId}");' class="btn" type="button" value="流程跟踪" />
				</c:if>
				</div>
				
			</form:form>
			<c:if test="${not empty oaQualificationb.id}">
				<act:histoicFlow procInsId="${oaQualificationb.procInsId}" />
			</c:if>
		</div>
	</div>
</div>
</body>
</html>