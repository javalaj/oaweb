<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>申请用车</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {

			$("#btnCancle2").click(function() {
				$("#next").val("1");
			});
			
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
		
		//判断是否变更目的地，如果变更则变更目的地项必填
		function choose(){
			var change = $('input:radio:checked').val();
			var destinationchange = $("#destinationchange").val();
			var destination = $("#destination").val();
			
			if((change == '1' && destinationchange=='')||(change == '1' && destinationchange==destination)){
				top.layer.msg("请注意填写变更后的目的地!");
				/* top.$.jBox.tip.mess = 1;
				top.$.jBox.tip("请注意填写变更后的目的地!!", "error", {
					persistent : true,
					opacity : 0
				}); */
				$("#messageBox").show();
				return false;
			}
			if(change == '0' && destinationchange !=''){
				top.layer.msg("请置空变更目的地项!");
				/* top.$.jBox.tip.mess = 1;
				top.$.jBox.tip("请置空变更目的地项!!", "error", {
					persistent : true,
					opacity : 0
				}); */
				$("#messageBox").show();
				return false;
			}
			return true;
		}
		
	</script>
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/liuxin/css/liucheng.css">
</head>
<body class="gray-bg">
<div class="wrapper wrapper-content">
	<div class="ibox">
		<div class="ibox-title">
			<h5>重新编辑-用车申请</h5>
		</div>
		<div class="ibox-content">
		<form:form id="inputForm" modelAttribute="oaUsecar" action="${ctx}/oa/oaUsecar/dealExam2" method="post" class="form-inline myoa-details-form">
		<legend style="margin-bottom:10px;">${title}</legend>
		<input type="hidden" name="token" value="${token }">
		<input type="hidden" name="next" value="0" id="next">
		
		<form:hidden path="id"/>
		<form:hidden path="procInsId"/>
		<form:hidden path="fileId"/>
		<form:hidden path="department"/>
		<form:hidden path="createBy.id"/>
		<form:hidden path="usereason"/>
		<form:hidden path="destination" id="destination"/>
<%-- 		<form:hidden path="usetype"/> --%>
		<form:hidden path="usescope"/>
		<input type="hidden" name="usetime"
			value='<fmt:formatDate value="${oaUsecar.usetime}" pattern="yyyy-MM-dd HH:mm:ss" />' />
		<form:hidden path="examname"/>
		<form:hidden path="examtext"/>
		
		<sys:message content="${message}"/>		


		<div class="control-group">
			<label class="control-label">用车部门：</label>
			<input type="text" value="${oaUsecar.department}" class="form-control" style="width:40%;" readonly="readonly">
		</div>
		<div class="control-group">
			<label class="control-label">申&nbsp;&nbsp;请&nbsp;&nbsp;人：</label>
<%-- 				<form:input path="createBy.name" readonly="true" htmlEscape="false" maxlength="64" class="input-xlarge required"/> --%>
			<input type="text" value="${oaUsecar.createBy.name}" class="form-control" style="width:40%;" readonly="readonly">
		</div>
		<div class="control-group">
			<label class="control-label">用车时间：</label>
			<input type="text" value="<fmt:formatDate value="${oaUsecar.usetime}"
  					pattern="yyyy-MM-dd HH:mm:ss" />" class="form-control" style="width:40%;" readonly="readonly">
		</div>
		<div class="control-group">
			<label class="control-label">用车原因：</label>
			<input type="text" value="${oaUsecar.usereason}" class="form-control" style="width:40%;" readonly="readonly">
		</div>
<!-- 		<div class="control-group"> -->
<!-- 			<label class="control-label">用车类型：</label> -->
<!-- 			<div class="controls"> -->
<%-- 			${oaUsecar.usetype} --%>
<!-- 			</div> -->
<!-- 		</div> -->
		<div class="control-group">
			<label class="control-label">用车范围：</label>
			<input type="text" value="${oaUsecar.usescope}" class="form-control" style="width:40%;" readonly="readonly">
		</div>
		<div class="control-group">
			<label class="control-label">目的地：</label>
			<input type="text" value="${oaUsecar.destination}" class="form-control" style="width:40%;" readonly="readonly">
		</div>
	
		<div class="control-group">
			<label class="control-label">人事签字：</label>				
			<input type="text" value="${oaUsecar.examname }" class="form-control" style="width:40%;" readonly="readonly">
		</div>
		<div class="control-group">
			<label class="control-label">人事意见：</label>				
			<input type="text" value="${oaUsecar.examtext }" class="form-control" style="width:40%;" readonly="readonly">
		</div>
		<div class="control-group">
			<label class="control-label" style="padding-top:0;">变更目的地：</label>
			<input type="radio" class="i-checks" name="exam" value="0" checked="checked" class="i-checks">不变更 
			<input type="radio" class="i-checks" name="exam" value="1" class="i-checks">变更
		</div>
		<div class="control-group">
			<label class="control-label">变更地点：</label>
				<%-- <form:input path="destinationchange" htmlEscape="false" id="destinationchange"
 					maxlength="64" class="input-xlarge " /> --%>
 			<input type="text" value="${oaUsecar.destinationchange}" name="destinationchange" class="form-control" style="width:40%;" id="destinationchange"> 
		</div>

		<div class="form-actions" style="margin-top:15px;margin-bottom: 15px;">
			<shiro:hasPermission name="oa:oaUsecar:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="申请" onclick="return choose();"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancle2" class="btn btn-primary" type="submit" value="取消申请"
				<c:if test="${empty oaUsecar.id}">disabled</c:if> />&nbsp;
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>&nbsp;
			<c:if test="${task != null}">
				<input onclick='btnPNGshow("${task.processDefinitionId}/${task.executionId}");' class="btn" type="button" value="流程跟踪" />&nbsp;
			</c:if>
		</div>
	</form:form>
		</div>
	</div>
</div>
	<%-- <ul class="nav nav-tabs">		
		<li class="active"><a href="${ctx}/oa/oaUsecar/exam2?id=${oaUsecar.id}">重新编辑-用车申请</a></li>
	</ul><br/> --%>
	
</body>
</html>