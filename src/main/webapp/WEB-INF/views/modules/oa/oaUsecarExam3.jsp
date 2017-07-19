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
	
	
			//判断选择用车数据输入是否合乎逻辑
			function choose(){
				var usetime = $("#usetime").val();
				var gotime = $("#gotime").val();
				var backtime = $("#backtime").val();
				var gokilometer = $("#go").val();
				var backkilometer = $("#back").val();

				var go = new Date(gotime.replace(/-/g,"/"));
				var back = new Date(backtime.replace(/-/g,"/"));
				var use = new Date(usetime.replace(/-/g,"/"));
				if(new Date()<Date.parse(use)){
					top.layer.msg("请在用车之后填写！！");
					/* top.$.jBox.tip.mess = 1;
					top.$.jBox.tip("请在用车之后填写！！！", "error", {
						persistent : true,
						opacity : 0
					}); */
					$("#messageBox").show();
					return false;
				}
				if(Date.parse(back)<Date.parse(go)){
					top.layer.msg("出发时间必须早于返回时间！！");
					/* top.$.jBox.tip.mess = 1;
					top.$.jBox.tip("出发时间必须早于返回时间！！！", "error", {
						persistent : true,
						opacity : 0
					}); */
					$("#messageBox").show();
					return false;
				}
				if(isNaN(gokilometer) || (isNaN(backkilometer))){
					top.layer.msg("公里数请输入数字！！");
					/* top.$.jBox.tip.mess = 1;
					top.$.jBox.tip("公里数请输入数字！！！", "error", {
						persistent : true,
						opacity : 0
					}); */
					$("#messageBox").show();
					return false;
				}
				if(gokilometer<0 || backkilometer<0){
					top.layer.msg("公里数不能为负数！！");
					/* top.$.jBox.tip.mess = 1;
					top.$.jBox.tip("公里数不能为负数！！！", "error", {
						persistent : true,
						opacity : 0
					}); */
					$("#messageBox").show();
					return false;
				}
				if(parseInt(gokilometer)>parseInt(backkilometer)){
					top.layer.msg("返回公里数不能小于起始公里数！！");
					/* top.$.jBox.tip.mess = 1;
					top.$.jBox.tip("返回公里数不能小于起始公里数！！！", "error", {
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
				<h5><a href="${ctx}/oa/oaUsecar/exam3?id=${oaUsecar.id}">司机填写-用车申请车辆信息</a></h5>		
			</div>
	<%-- <ul class="nav nav-tabs">
		<li class="active">
		<a href="${ctx}/oa/oaUsecar/exam3?id=${oaUsecar.id}">司机填写-用车申请车辆信息</a></li>
	</ul> --%>
			<div class="ibox-content">
				<form:form id="inputForm" modelAttribute="oaUsecar"
					action="${ctx}/oa/oaUsecar/dealExam3" method="post" class="form-inline myoa-details-form" >
					<legend style="margin-bottom:10px;">${title }</legend>
					<input type="hidden" name="token" value="${token }">
					<form:hidden path="id"/>
					<form:hidden path="procInsId"/>
					<form:hidden path="fileId"/>
					<form:hidden path="department"/>
					<form:hidden path="createBy.id"/>
					<form:hidden path="usereason"/>
					<form:hidden path="destination"/>
					<form:hidden path="usescope"/>
					<input type="hidden" name="usetime" id="usetime"
						value='<fmt:formatDate value="${oaUsecar.usetime}" pattern="yyyy-MM-dd HH:mm:ss" />' />
					<form:hidden path="examname"/>
					<form:hidden path="examtext"/>
					<form:hidden path="destinationchange"/>
					
					<sys:message content="${message}"/>		
			
					<div class="control-group">
						<label class="control-label">用车部门：</label>
						<input type="text" value="${oaUsecar.department}" class="form-control" style="width:40%;" readonly="readonly">
					</div>
					<div class="control-group">
						<label class="control-label">申请人：</label>
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
						<form:select path="platenum" class="form-control" style="width:40%;">
							<form:option value="" label="" />
							<form:options items="${carno}" htmlEscape="false" /> 
		 				</form:select> 
					</div>
					<div class="control-group">
						<label class="control-label">司机：</label>
						<form:input path="driver" value="${oaUsecar.driver}" readonly="true" htmlEscape="false" maxlength="64"
			 					class="form-control" style="width:40%;"/>  
					</div>
					<div class="control-group">
						<label class="control-label">出发时间：</label>
						<input name="gotime" type="text" readonly="readonly" maxlength="20" id="gotime"
								 class="laydate-icon form-control layer-date input-sm required" style="background-color: #FFFFFF;" 
								value="<fmt:formatDate value="${oaUsecar.gotime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
								onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});" />
					</div>
					<div class="control-group">
						<label class="control-label">返回时间：</label>
						<input name="backtime" type="text" readonly="readonly" id="backtime"
								maxlength="20"  class="laydate-icon form-control layer-date input-sm required" style="background-color: #FFFFFF;" 
								value="<fmt:formatDate value="${oaUsecar.backtime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
								onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});" />
					</div>
					<div class="control-group">
						<label class="control-label">起始公里数：</label>
						<form:input path="gokilometer" htmlEscape="false" maxlength="64" class="form-control required" style="width:40%;" id="go"/>
					</div>
					<div class="control-group">
						<label class="control-label">返回公里数：</label> 
						<form:input path="backkilometer" htmlEscape="false" maxlength="64" class="form-control required" style="width:40%;" id="back"/>
					</div>
					<div class="control-group">
						<label class="control-label">安全到达：</label>
							<%-- <form:radiobuttons path="safearrive"
								items="${fns:getDictList('isSafe')}" itemLabel="label"  
			  					itemValue="value" htmlEscape="false" class="" />   --%>
						<input type="radio" name="safearrive" value="是" checked="checked">是
						<input type="radio" name="safearrive" value="否">否
					</div>
					<div class="control-group">
						<label class="control-label">备注：</label>
						<form:textarea path="remarks" htmlEscape="false" rows="4" maxlength="64" class="form-control" style="width:40%;"/>
					</div>
					<div class="form-actions" style="text-align:left; margin-top:15px;margin-bottom: 15px;">
						<shiro:hasPermission name="oa:oaUsecar:edit">
							<input id="btnSubmit" class="btn btn-primary" type="submit"
								value="提交" onclick="return choose();"/>&nbsp;</shiro:hasPermission>
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