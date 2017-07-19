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
// 										loading('正在提交，请稍等...');
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
</script>
<link rel="stylesheet" type="text/css" href="${ctxStatic}/liuxin/css/liucheng.css">
</head>
<body class="gray-bg">
	<div class="wrapper wrapper-content">
		<div class="ibox">
			<div class="ibox-title">
				<h5><a href="${ctx}/oa/oaUsecar/filling?id=${oaUsecar.id}">人力核实备案-用车申请</a></h5>		
			</div>
	<%-- <ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/oa/oaUsecar/filling?id=${oaUsecar.id}">人力核实备案-用车申请</a></li>
	</ul>
	<br /> --%>
			<div class="ibox-content">
				<form:form id="inputForm" modelAttribute="oaUsecar"
					action="${ctx}/oa/oaUsecar/dealfilling" method="post" class="form-inline myoa-details-form">
					<legend style="margin-bottom:10px;">${title }</legend>
					<input type="hidden" name="token" value="${token }">
					<form:hidden path="id"/>
					<form:hidden path="procInsId"/>
					<form:hidden path="fileId"/>
					<form:hidden path="department"/>
					<form:hidden path="createBy.id"/>
					<form:hidden path="usereason"/>
					<form:hidden path="destination"/>
			<%-- 		<form:hidden path="usetype"/> --%>
					<form:hidden path="usescope"/>
					<input type="hidden" name="usetime"
						value='<fmt:formatDate value="${oaUsecar.usetime}" pattern="yyyy-MM-dd HH:mm:ss" />' />
					<form:hidden path="examname"/>
					<form:hidden path="examtext"/>
					<form:hidden path="destinationchange"/>
					<form:hidden path="platenum"/>
					<form:hidden path="driver"/>
					<input type="hidden" name="gotime"
						value='<fmt:formatDate value="${oaUsecar.gotime}" pattern="yyyy-MM-dd HH:mm:ss" />' />
					<input type="hidden" name="backtime"
						value='<fmt:formatDate value="${oaUsecar.backtime}" pattern="yyyy-MM-dd HH:mm:ss" />' />
					<form:hidden path="gokilometer"/>
					<form:hidden path="backkilometer"/>
					<form:hidden path="safearrive"/>
					<form:hidden path="remarks"/>
					
					
					<sys:message content="${message}"/>			
				
					<div class="control-group">
						<label class="control-label">用车部门：</label>
						<input type="text" value="${oaUsecar.department}" class="form-control" style="width:40%;" readonly="readonly">
					</div>
					<div class="control-group">
						<label class="control-label">申请人：</label>
							<%-- <form:input path="createBy.name" readonly="true" htmlEscape="false" maxlength="64" class="input-xlarge required"/>
							<span class="help-inline"><font color="red">*</font> </span> --%>
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
						<label class="control-label">变更目的地：</label>
						<input type="text" value="${oaUsecar.destinationchange }" class="form-control" style="width:40%;" readonly="readonly">
					</div>
					
					
					<div class="control-group">
						<label class="control-label">车牌号：</label>
						<input type="text" value="${oaUsecar.platenum}" class="form-control" style="width:40%;" readonly="readonly">				
					</div>
					<div class="control-group">
						<label class="control-label">司&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;机：</label>
						<input type="text" value="${oaUsecar.driver}" class="form-control" style="width:40%;" readonly="readonly">
					</div>
					<div class="control-group">
						<label class="control-label">出发时间：</label>
						<input type="text" value="<fmt:formatDate value="${oaUsecar.gotime}"
			  					pattern="yyyy-MM-dd HH:mm:ss" />" class="form-control" style="width:40%;" readonly="readonly">
					</div>
					<div class="control-group">
						<label class="control-label">返回时间：</label>
						<input type="text" value="<fmt:formatDate value="${oaUsecar.backtime}"
			  					pattern="yyyy-MM-dd HH:mm:ss" /> " class="form-control" style="width:40%;" readonly="readonly">
					</div>
					<div class="control-group">
						<label class="control-label">起始公里数：</label> 
						<input type="text" value="${oaUsecar.gokilometer}" class="form-control" style="width:40%;" readonly="readonly">				
					</div>
					<div class="control-group">
						<label class="control-label">返回公里数：</label>
						<input type="text" value="${oaUsecar.backkilometer}" class="form-control" style="width:40%;" readonly="readonly">			
					</div>
					<div class="control-group">
						<label class="control-label">是否安全到达：</label> ${isSafe}
							<%-- <form:radiobuttons path=""
			 					items="${fns:getDictList('isSafe')}" itemLabel="label"  
			  					itemValue="value" htmlEscape="false" class="" />  --%>
			  			<input type="text" value="${oaUsecar.safearrive }" class="form-control" style="width:40%;" readonly="readonly">
					</div>
					<div class="control-group">
						<label class="control-label">备注：</label>
						<form:textarea path="remarks" htmlEscape="false" rows="4" maxlength="64"  class="form-control" style="width:40%;" readonly="true"/>
					</div>				
					<div class="control-group">
						<label class="control-label">归档日期： <font color="red">*</font></label>			
						<input name="updateDate" type="text" readonly="readonly" maxlength="20" id="uset"
								class="laydate-icon form-control layer-date input-sm required"
								value="<fmt:formatDate value="${oaUsecar.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
								onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});" />
						<span class="help-inline"></span>
					</div>
					<div class="control-group">
						<label class="control-label">归档人： <font color="red">*</font> </label>
							<form:input path="fillingName" htmlEscape="false" maxlength="64"
			 					 class="form-control required" style="width:40%;"/> 
							<span class="help-inline"></span>
					</div>
					
					<div class="form-actions">
						<shiro:hasPermission name="oa:oaUsecar:edit">
							<input id="btnSubmit" class="btn btn-primary" type="submit"
								value="归档" />&nbsp;</shiro:hasPermission>
						<input id="btnCancel" class="btn" type="button" value="返 回"
							onclick="history.go(-1)" />&nbsp;
						<c:if test="${task != null}">
							<input onclick='btnPNGshow("${task.processDefinitionId}/${task.executionId}");' class="btn" type="button" value="流程跟踪" />&nbsp;
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