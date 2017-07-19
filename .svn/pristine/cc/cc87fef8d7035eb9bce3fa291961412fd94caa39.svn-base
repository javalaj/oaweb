<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>申请用车详情</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			//$("#name").focus();
			$("#inputForm").validate({
				submitHandler: function(form){
// 					loading('正在提交，请稍等...');
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
		<div class="ibox">
			<div class="ibox-title">
				<h5>${title }</h5>		
			</div>	
<!-- <ul class="nav nav-tabs"> -->
<!-- 		<li class="active"><a -->
<%-- 			href="${ctx}/oa/oaUsecar/form?id=${oaUsecar.id}">查看-用车申请</a></li> --%>
<!-- 	</ul> -->
			<div class="ibox-content">
				<form:form id="inputForm" modelAttribute="oaUsecar" action="#" method="post" class="form-inline">
					<%-- <legend>${title }</legend> --%>
					
					<div class="control-group">
						<label class="control-label">文件编号：</label>
						${oaUsecar.fileId }
					</div>
					<div class="control-group">
						<label class="control-label">所在部门：</label>
						${oaUsecar.department }
					</div>
					<div class="control-group">
						<label class="control-label">申请人：</label>
						${oaUsecar.createBy.name}
					</div>
					<div class="control-group">
						<label class="control-label">用车时间：</label>
						
							<fmt:formatDate value="${oaUsecar.usetime}"
				 				pattern="yyyy-MM-dd HH:mm:ss" /> 
						
					</div>
					<div class="control-group">
						<label class="control-label">用车原因：</label>
						${oaUsecar.usereason}
					</div>
					<div class="control-group">
						<label class="control-label">目的地：</label>
						${oaUsecar.destination}
					</div>
					<div class="control-group">
						<label class="control-label">用车范围：</label>							
						${oaUsecar.usescope}							
					</div>
					<div class="control-group">
						<label class="control-label">人事签字：</label>
						${oaUsecar.examname}
					</div>
					<div class="control-group">
						<label class="control-label">人事意见：</label>
						${oaUsecar.examtext}
					</div>
					<div class="control-group">
						<label class="control-label">变更目的地：</label>
						${oaUsecar.destinationchange }
					</div>
					<div class="control-group">
						<label class="control-label">人事签字（变后）：</label>
						${oaUsecar.examname2}
					</div>
					<div class="control-group">
						<label class="control-label">人事意见（变后）：</label>
						${oaUsecar.examtext2}
					</div>	
					<div class="control-group">
							<label class="control-label">车牌号：</label>
							
								${oaUsecar.platenum}
							
					</div>
					<div class="control-group">
						<label class="control-label">司机：</label>
						${oaUsecar.driver }
					</div>
					<div class="control-group">
							<label class="control-label">出发时间：</label>
							
								<fmt:formatDate value="${oaUsecar.gotime}"
				  					pattern="yyyy-MM-dd HH:mm:ss" /> 
							
						</div>
						<div class="control-group">
							<label class="control-label">返回时间：</label>
							
								<fmt:formatDate value="${oaUsecar.backtime}"
				  					pattern="yyyy-MM-dd HH:mm:ss" /> 
							
						</div>	
					<div class="control-group">
						<label class="control-label">起始公里数：</label>
						${oaUsecar.gokilometer }
					</div>
					<div class="control-group">
						<label class="control-label">返回公里数：</label>
						${oaUsecar.backkilometer}
					</div>
					<div class="control-group">
						<label class="control-label">安全到达：</label>
						${oaUsecar.safearrive}
					</div>
					<div class="control-group">
						<label class="control-label">备注：</label>
						${oaUsecar.remarks}
					</div>	
					
					<div class="form-actions">
						<input id="btnCancel" class="btn" type="button" value="返 回"
							onclick="history.go(-1)" />&nbsp;
						<c:choose>
						<c:when test="${backsign eq '1'}">
						<act:flow-back-btn-usecar oaUseCarId="${oaUsecar.id}"></act:flow-back-btn-usecar>
						</c:when>
						<c:otherwise>
						<act:flow-back-btn></act:flow-back-btn>
						</c:otherwise>
						</c:choose>
						
						<c:if test="${task != null}">
						<input onclick='btnPNGshow("${task.processDefinitionId}/${task.executionId}");' class="btn" type="button" value="流程跟踪" />
						</c:if>
					</div>
					</form:form>
				<c:if test="${not empty oaUsecar.id}">
					<act:histoicFlow procInsId="${oaUsecar.procInsId}" />
				</c:if>
			</div>
		</div>
	</div>			
</body>
</html>