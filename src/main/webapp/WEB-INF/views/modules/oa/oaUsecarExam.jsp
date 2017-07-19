<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>申请用车</title>
<meta name="decorator" content="default" />
<script type="text/javascript">
	$(document).ready(
			function() {
				//$("#name").focus();
				$("#inputForm")
						.validate(
								{
									submitHandler : function(form) {
// 										oaLoading('正在提交，请稍候...');
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
	
			function choose(){
				var a=document.getElementsByName("exam");
				for(i=0;i<a.length;i++){
					if(a[i].checked==true){
						return true;
					}
				}
				top.layer.msg("请选择是否同意申请！");
				/* top.$.jBox.tip.mess = 1;
				top.$.jBox.tip("请选择是否同意申请！！！", "error", {
					persistent : true,
					opacity : 0
				}); */
				$("#messageBox").show();
				return false;
			}
			
</script>
<link rel="stylesheet" type="text/css" href="${ctxStatic}/liuxin/css/liucheng.css">
</head>
<body class="gray-bg">
	<div class="wrapper wrapper-content">
		<div class="ibox">
			<div class="ibox-title">
				<h5><a href="${ctx}/oa/oaUsecar/exam?id=${oaUsecar.id}">审核-用车申请</a></h5>		
			</div>
			<%-- <ul class="nav nav-tabs">
				<li class="active"><a href="${ctx}/oa/oaUsecar/exam?id=${oaUsecar.id}">审核-用车申请</a></li>
			</ul> --%>
			<div class="ibox-content">
				<form:form id="inputForm" modelAttribute="oaUsecar"
					action="${ctx}/oa/oaUsecar/dealExam" method="post"
					class="form-inline myoa-details-form">
					<legend style="margin-bottom:10px;">${title }</legend>
					<input type="hidden" name="token" value="${token }">
					<form:hidden path="id" />
					<form:hidden path="procInsId" />
					<form:hidden path="fileId" />
					<form:hidden path="department" />
					<form:hidden path="createBy.id" />
					<form:hidden path="usereason" />
					<form:hidden path="destination" />
					<form:hidden path="usescope" />
					<input type="hidden" name="usetime"
						value="<fmt:formatDate value="${oaUsecar.usetime}" pattern="yyyy-MM-dd HH:mm:ss" />" />
			
			
					<sys:message content="${message}" />
			
					<div class="control-group">
						<label class="control-label">用车部门：</label>						
						<input type="text" value="${oaUsecar.department}" readonly="readonly" class="form-control" style="width:40%;"/>						
					</div>
					<div class="control-group">
						<label class="control-label">申请人：</label>						
						<input type="text" value="${oaUsecar.createBy.name}" readonly="readonly" class="form-control" style="width:40%;"/>
					</div>
					<div class="control-group">
						<label class="control-label">用车时间：</label>
						<input type="text" value="<fmt:formatDate value="${oaUsecar.usetime}"
								pattern="yyyy-MM-dd HH:mm:ss" />" readonly="readonly" class="form-control" style="width:40%;"/>
					</div>
					<div class="control-group">
						<label class="control-label">用车原因：</label>
						<input type="text" value="${oaUsecar.usereason}" readonly="readonly" class="form-control" style="width:40%;"/>
					</div>
					<div class="control-group">
						<label class="control-label">目的地：</label>
						<input type="text" value="${oaUsecar.destination}" readonly="readonly" class="form-control" style="width:40%;"/>
					</div>
			
					<div class="control-group">
						<label class="control-label">用车范围：</label>
						<input type="text" value="${oaUsecar.usescope}" readonly="readonly" class="form-control" style="width:40%;"/>
					</div>
					
					<div class="control-group">
						<label class="control-label">审批决定：</label>
						<input type="radio" name="exam" value="0" class="i-checks">同意
						<input type="radio" name="exam" value="1" checked="checked" class="i-checks">不同意
					</div>
					<div class="control-group">
						<label class="control-label">人事意见：</label>
						<input type="text" name="examtext" value="${oaUsecar.examtext}"
								class="form-control required" required="required" style="width:40%;" maxlength="100"
							<c:if test="${not empty oaUsecar.examtext}">disabled</c:if> />
					</div>
					<c:if test="${not empty oaUsecar.examtext}">
					<div class="control-group">
						<label class="control-label">变更地点：</label>
						<input type="text" name="destinationchange" value="${oaUsecar.destinationchange}" readonly="readonly" class="form-control" style="width:40%;"/>			
					</div>
					</c:if>
					<div class="control-group">
						<label class="control-label">人事意见(变更目的地)：</label>
						<input type="text" name="examtext2" value="${oaUsecar.examtext2}" 
							class="form-control required" style="width:40%;" maxlength="100" 
							<c:if test="${empty oaUsecar.examtext}">disabled</c:if> />				
					</div>
							
					<div class="form-actions" style="margin-top:15px;margin-bottom: 15px;">
						<shiro:hasPermission name="oa:oaUsecar:edit">
							<input id="btnSubmit" class="btn btn-primary" type="submit"
							   onclick="return choose();" value="提交审核" />&nbsp;</shiro:hasPermission>
							<input id="btnCancel" class="btn" type="button" value="返 回"
								onclick="history.go(-1)" />&nbsp;
						<c:if test="${task != null}">
							<input onclick='btnPNGshow("${task.processDefinitionId}/${task.executionId}");' class="btn" type="button" value="流程跟踪" />&nbsp;
						</c:if>
					</div>
				</form:form>
			</div>
		</div>
	</div>
</body>
</html>