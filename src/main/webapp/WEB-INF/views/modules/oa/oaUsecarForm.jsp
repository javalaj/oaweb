<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>申请用车</title>
<meta name="decorator" content="default" />
<script type="text/javascript">
	$(document).ready(
			function() {
				$("#btnCancle2").click(function(){
					$("#flag").val("1");
					
				})
	
				
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
	
		//判断选择用车时间是否是当前日期之后
		function choose(){
			var uset = document.getElementById("uset").value;
			var db = new Date(uset.replace(/-/g,"/"));
			if(new Date()>Date.parse(db)){
				top.layer.msg("请选择当前时间之后的时间!!");
				/* top.$.jBox.tip.mess = 1;
				top.$.jBox.tip("请选择当前时间之后的时间!!", "error", {
					persistent : true,
					opacity : 0
				}); */
				$("#messageBox").show();
				return false;
			}
			return true;
		}
		
		function showWorkflowImage(){
			btnPNGshow2("${fns:getWorkflowVarValue('oa_carManagement','procDefId','')}");
		}
		
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
				<form:form id="inputForm" modelAttribute="oaUsecar"
					action="${ctx}/oa/oaUsecar/save" method="post" class="form-inline myoa-details-form">
					<%-- <legend style="margin-bottom: 20px;">${title }</legend> --%>
					<input type="hidden" name="token" value="${token }">
					<input type="hidden" value="0" name="flag" id="flag"/>
					<form:hidden path="id" />
					<form:hidden path="procInsId" />
					<sys:message content="${message}" />
										
					<div class="control-group">
						<label class="control-label">用车部门：</label>						
						<input type="text" value="${oaUsecar.department}" class="form-control" readonly="readonly">						
					</div>
					
					<div class="control-group">
						<label class="control-label">申请人：</label>						
						<input type="text" value="${oaUsecar.createBy.name}" class="form-control"  readonly="readonly">						
					</div>
					
					<div class="control-group">
						<label class="control-label">用车时间： <font color="red">*</font></label>						
						<input name="usetime" type="text" readonly="readonly" maxlength="20" id="uset"
								 class="laydate-icon form-control layer-date input-sm required" required="required" style="background-color: #fff;"
								value="<fmt:formatDate value="${oaUsecar.usetime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
								onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});" />												
					</div>
					<div class="control-group">
						<label class="control-label">用车原因： <font color="red">*</font></label>						
						<form:input path="usereason" htmlEscape="false" maxlength="64" class="form-control required"/> 
					</div>
					<div class="control-group">
						<label class="control-label">目的地： <font color="red">*</font></label>					
						<form:input path="destination" htmlEscape="false" maxlength="64" class="form-control required"/> 
					</div>
			
					<div class="control-group">
						<label class="control-label" style="padding-top: 0;">用车范围：</label>
							<input type="radio" class="i-checks" name="usescope" checked="checked" value="市内"/><font>&nbsp;市内</font>
							<input type="radio" class="i-checks" name="usescope" value="市外"/><font>&nbsp;市外</font>	
							<%-- <form:radiobuttons path="usescope" items="${fns:getDictList('useScope')}"
								itemLabel="label" itemValue="value" htmlEscape="false"/> --%>
					</div>
			
					<div class="form-actions" style="text-align:left; margin-top:15px;margin-bottom: 15px;">
						<shiro:hasPermission name="oa:oaUsecar:edit">
							<input id="btnSubmit" class="btn btn-primary" onclick="return choose();" type="submit" 
								value="申请"/>&nbsp;																
						</shiro:hasPermission>
						
						<c:if test="${not empty oaUsecar.id}">
							<input id="btnCancle2" class="btn btn-primary" type="submit"
								value="取消申请" />&nbsp;</c:if>					
						<input id="btnCancel" class="btn" type="button" value="返 回"
							onclick="history.go(-1)" />
						<c:choose>
							<c:when test="${task != null}">&nbsp;
								<input onclick='btnPNGshow("${task.processDefinitionId}/${task.executionId}");'
								class="btn" type="button" value="流程跟踪" />
							</c:when>
							<c:otherwise>&nbsp;
								<input onclick='btnPNGshow2("${procDefId}");' class="btn"
								type="button" value="流程图" />
							</c:otherwise>
						</c:choose>		
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