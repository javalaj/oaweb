<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>印章使用申请</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
	
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
</head>
<body class="gray-bg">
<div class="wrapper wrapper-content">
	<div class="ibox" >
		<div class="ibox-title">
			<h5>用印使用详情</h5>
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
			<form:form id="inputForm" modelAttribute="oaSealUse" action="${ctx}/oa/oaSealUse/save" method="post" class="form-inline myoa-details-form">
				<legend style="margin-bottom: 10px;">${title }</legend>
				<input type="hidden" name="flag" value="0" id="flag">
				<form:hidden path="id"/>
				<sys:message content="${message}"/>		
				
				
				<div class="control-group">
					<label class="control-label">文件编号：</label>
					<input type="text" value="${oaSealUse.fileId}" readonly="readonly" class="form-control" style="width:40%;"/>	
				</div>
				<div class="control-group">
					<label class="control-label">申请人：</label>
					<input type="text" value="${oaSealUse.createBy.name}" readonly="readonly" class="form-control" style="width:40%;"/>
				</div>
				<div class="control-group">
					<label class="control-label">所在部门：</label>
					<input type="text" value="${oaSealUse.officeName}" readonly="readonly" class="form-control" style="width:40%;"/>
				</div>
				<div class="control-group">
					<label class="control-label">申请日期：</label>
					<input type="text" value="<fmt:formatDate value="${oaSealUse.createDate}" pattern="yyyy-MM-dd HH:mm:ss" /> " readonly="readonly" class="form-control" style="width:40%;"/>
				</div>
				<div class="control-group">
					<label class="control-label">印章类型：</label>
					<input type="text" value="${oaSealUse.sealType}" readonly="readonly" class="form-control" style="width:40%;"/>
				</div>
				<div class="control-group">
					<label class="control-label">携带外出：</label>
					<input type="text" value="${oaSealUse.isout}" readonly="readonly" class="form-control" style="width:40%;"/>
				</div>
				<div class="control-group">
					<label class="control-label">摘要事项：</label>
					<input type="text" value="${oaSealUse.matter}" readonly="readonly" class="form-control" style="width:40%;"/>
				</div>
				<div class="control-group">
					<label class="control-label">   经理签字：</label>
					<input type="text" value="${oaSealUse.examname}" readonly="readonly" class="form-control" style="width:40%;"/>
				</div>
				<div class="control-group">
					<label class="control-label">经理意见：</label>
					<input type="text" value="${oaSealUse.examtext}" readonly="readonly" class="form-control" style="width:40%;"/>				
				</div>
				<div class="control-group">
					<label class="control-label">归还签字：</label>
					<input type="text" value="${oaSealUse.examname2}" readonly="readonly" class="form-control" style="width:40%;"/>
				</div>
				<div class="control-group">
					<label class="control-label">归还意见：</label>
					<input type="text" value="${oaSealUse.examtext2}" readonly="readonly" class="form-control" style="width:40%;"/>
				</div>
				
				<div class="form-actions" style="margin-top:15px;margin-bottom: 15px;">			
					<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>&nbsp;
					<act:flow-back-btn></act:flow-back-btn>
					<c:if test="${task != null}">
						<input onclick='btnPNGshow("${task.processDefinitionId}/${task.executionId}");' class="btn" type="button" value="流程跟踪" />&nbsp;
					</c:if>
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