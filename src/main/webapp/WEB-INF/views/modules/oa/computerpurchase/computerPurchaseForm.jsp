<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>办公电脑申购</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
	function getDate()
	{
		var d = new Date();
		
		var month = d.getMonth()+1;
		
		month = month >= 0 && month <= 9 ? '0' + month : month;
		
		var day = d.getDate();
		
		day = day >= 0 && day <= 9 ? '0' + day : day;
		
		var str = d.getFullYear()+"-"+ month +"-"+ day;
	
		$("#applyTime").html(str);
		
		$("#at").val(str);
	}
	
	function goBack(){
		
		var strUrl=document.referrer;
		
		var arrObj=strUrl.split("//");
		var start=arrObj[1].indexOf("/");
		var end=arrObj[1].indexOf(";");
		var newurl=arrObj[1].substring(start);
		if(end>0){
			var newurl=arrObj[1].substring(start,end);
			}
		
		 if(newurl == "/oa/a/oa/computerpurchase/computerPurchase" || 
			newurl == "/oa/a/oa/computerpurchase/computerPurchase/?repage"){
			window.location.href="${ctx}/oa/computerpurchase/computerPurchase";			
		}else{
			history.go(-1);
		} 
	}	
	
	var configure = '${computerPurchase.configure}';
	
	if (configure == null || configure == '')
		$("#configure1").iCheck('check');
	
		$(document).ready(function() {
			
			getDate();
			
			$("#btnPrint").click(function(){
				var src="${ctx}/oa/computerpurchase/computerPurchase/print?id=${computerPurchase.id}";
				top.layer.open({
					  type: 2, 
					  area: [$("body").width()+'px', $("body").height()+'px'],
					  title: "打印预览", 
			          maxmin: true, 
			          shadeClose: true,
					  content: src
				});
			});
			
			 $("#btnViewCommen").click(function(){
					var src="${ctx}/act/process/resource/read?procDefId=${fns:getWorkflowVarValue('computer_purchase','procDefId','')}&resType=image";
					if("${not empty computerPurchase.procInsId}"=="true"){
						src="${ctx}/act/task/trace/photo/${fns:getWorkflowVarValue('computer_purchase','procDefId','')}/${computerPurchase.procInsId}";
					}
					top.layer.open({
						  type: 2, 
						  area: [$("body").width()+'px', $("body").height()+'px'],
						  title: "办公电脑申购流程图", 
				          maxmin: true, 
				          shadeClose: true,
						  content: src
					});	
				}); 
			
			$("#btnView").click(function(){
				var src="${ctx}/act/task/trace/photo/${fns:getWorkflowVarValue('computer_purchase','procDefId','')}/${computerPurchase.procInsId}";
				top.layer.open({
					  type: 2, 
					  area: [$("body").width()+'px', $("body").height()+'px'],
				      title: "办公电脑申购流程图",
			          maxmin: true, 
			          shadeClose: true,
					  content: src 
				});
			});			
			
			$("#inputForm").validate({
				rules: {
					"accountManager.name": {
				        required: true
				     },
					"businessManager.name": {
				        required: true
				     },
					"technicalManager.name": {
				        required: true
				     },
					"projectManager.name": {
				        required: true
				     },
				     "expectedMoney":{
				    	 number:true,
				    	 min:0,
				    	 max:9999999
				     }
				},
			    messages: {
			    	"accountManager.name": {
			          required: "必填信息",
			        },
			        "businessManager.name": {
				      required: "必填信息",
				    },
				    "technicalManager.name": {
					  required: "必填信息",
					},
			        "projectManager.name": {
			          required: "必填信息",
			        }
			    },
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
			$("#ownedIndustry").change(function(){  
				$(this).valid();  
			});
			$("#contractType").change(function(){  
				$(this).valid();  
			});
			$("#accountManagerId").change(function(){  
				$(this).valid();  
			});
			$("#businessManagerId").change(function(){  
				$(this).valid();  
			});
			$("#technicalManagerId").change(function(){  
				$(this).valid();  
			});
		});
	</script>
	<style>
		input[type="radio"]{
			margin:0;
		}
		input[name='configure'] + label{
			margin-left:2px;
			margin-right:6px;
		}
	</style>
</head>
<body class="gray-bg" style="padding: 0;">
	<div class="wrapper wrapper-content">
		<div class="ibox">
			<div class="ibox-title">
				<h5>办公电脑采购申请</h5>		
			</div>
			<div class="ibox-content" style="padding: 5px 0;">
				<form:form id="inputForm" modelAttribute="computerPurchase" action="${ctx}/oa/computerpurchase/computerPurchase/save" method="post" class="form-horizontal">
					<form:hidden path="id"/>
					<form:hidden path="act.taskId"/>
					<form:hidden path="act.taskName"/>
					<form:hidden path="act.taskDefKey"/>
					<form:hidden path="act.procInsId"/>
					<form:hidden path="act.procDefId"/>
					<form:hidden id="flag" path="act.flag"/>
					<sys:message content="${message}"/>
					<table class="table table-bordered  table-condensed dataTables-example dataTable no-footer">
						<tr>
							<td class="width-15 active" colspan="6">
								<div style='text-align:left'>
									<input id="btnCancel" class="btn" type="button" value="返 回" onclick="goBack();"/>&nbsp;
									<input id="btnPrint" type="button" value="打印" class="btn btn-primary"/>&nbsp;
									<c:if test="${empty computerPurchase.act.taskDefKey}">
										<input id="btnViewCommen" class="btn btn-primary" type="button" value="查看流程图"/>&nbsp;
									</c:if>
									<c:if test="${not empty computerPurchase.act.taskDefKey}">
										<input id="btnView" class="btn btn-primary" type="button" value="查看流程图"/>&nbsp;
									</c:if>
									<shiro:hasPermission name="oa:computerpurchase:computerPurchase:edit">
										<c:if test="${empty computerPurchase.act.taskDefKey}">
											<c:if test="${computerPurchase.isStart ne '1'}">
												<input id="btnSave" class="btn btn-white btn-sm" type="submit" value="存草稿" onclick="$('#flag').val('save')"/>&nbsp;
												<input id="btnSubmit" class="btn btn-white btn-sm" type="submit" value="提交申请"  onclick="$('#flag').val('true')"/>&nbsp;
											</c:if>
										</c:if>
										<c:if test="${not empty computerPurchase.act.taskDefKey}">
											<c:if test="${computerPurchase.act.taskDefKey eq 'exam1'}">
												<input id="btnSave" class="btn btn-white btn-sm" type="submit" value="存草稿" onclick="$('#flag').val('save')"/>&nbsp;
												<input id="btnSubmit" class="btn btn-white btn-sm" type="submit" value="重新提交申请"  onclick="$('#flag').val('true')"/>&nbsp;
												<input id="btnSubmit2" class="btn btn-inverse btn-sm" type="submit" value="销毁申请" onclick="$('#flag').val('3')"/>&nbsp;
											</c:if>
											<c:if test="${computerPurchase.act.taskDefKey ne 'exam1'}">
												<input id="btnSubmit" class="btn btn-primary" type="submit" value="同意"  onclick="$('#flag').val('true')"/>&nbsp;
												<input id="btnSubmit2" class="btn btn-white" type="submit" value="驳回" onclick="$('#flag').val('false')"/>&nbsp;
											</c:if>
										</c:if>
									</shiro:hasPermission>
									<act:flow-back-btn/>
								</div>
							</td>
						</tr>		
						<tr>
							<td class="width-15 active" colspan="4"><div style='text-align:left'><fieldset><legend>办公电脑申请表</legend></fieldset></div></td>
						</tr>
						<c:if test="${computerPurchase.act.taskDefKey ne 'exam7'}">
							<tr>
								<td class="width-15 active">申请部门</td>
								<td class="width-35">
									<c:if test="${computerPurchase.isStart ne '1' or computerPurchase.act.taskDefKey eq 'exam1'or computerPurchase.act.taskDefKey eq 'exam7'}">
										${empty computerPurchase.applyDept?fns:getUser().office.name:computerPurchase.applyDept}
										<input type="hidden" name="applyDept" 
										value="${empty computerPurchase.applyDept?fns:getUser().office.name:computerPurchase.applyDept}">
									</c:if>
									<c:if test="${!(computerPurchase.isStart ne '1' or computerPurchase.act.taskDefKey eq 'exam1'or computerPurchase.act.taskDefKey eq 'exam7')}">
										${computerPurchase.applyDept}
									</c:if>
								</td>
								<td  class="width-15 active"  style="width:100px">申请时间</td>
								<td>
									<c:if test="${computerPurchase.isStart ne '1' or computerPurchase.act.taskDefKey eq 'exam1'}">
											<span id="applyTime"></span>
											<input id="at" type="hidden" name="applyTime" />
									</c:if>
									<c:if test="${!(computerPurchase.isStart ne '1' or computerPurchase.act.taskDefKey eq 'exam1')}">
										<fmt:formatDate value="${computerPurchase.applyTime}" pattern="yyyy-MM-dd"/>
									</c:if>
								</td> 
							</tr>
						</c:if>
						<tr>
							<td  class="width-15 active">申请人</td>
							<td colspan="3">
								<c:if test="${computerPurchase.isStart ne '1' or computerPurchase.act.taskDefKey eq 'exam1'}">
									${empty computerPurchase.userName.name?fns:getUser().name:computerPurchase.userName.name}
									<input type="hidden" name="userName.id" value="${empty computerPurchase.userName.id?fns:getUser().id:computerPurchase.userName.id}">
								</c:if>
								<c:if test="${!(computerPurchase.isStart ne '1' or computerPurchase.act.taskDefKey eq 'exam1')}">
									${computerPurchase.userName.name}
								</c:if>
							</td>
						</tr>
						<tr>
							<td  class="width-15 active">配置 <font color="red">*</font></td>
							<td colspan="3">
								<c:if test="${computerPurchase.isStart ne '1' or computerPurchase.act.taskDefKey eq 'exam1'}">
									<form:radiobuttons path="configure" items="${fns:getDictList('computer_configure')}" 
										itemLabel="label" itemValue="value" htmlEscape="false" class="i-checks" checked="checked"/>
									<span class="help-inline"> </span>
								</c:if>
								<c:if test="${!(computerPurchase.isStart ne '1' or computerPurchase.act.taskDefKey eq 'exam1')}">
									${fns:getDictLabel(computerPurchase.configure,'computer_configure','')}
								</c:if>
							</td>
						</tr>
						<tr>
							<td  class="width-15 active">要求型号</td>
							<td colspan="3">
								<c:if test="${computerPurchase.isStart ne '1' or computerPurchase.act.taskDefKey eq 'exam1'}">
									<form:textarea path="demandModel" htmlEscape="false" rows="4" maxlength="50" class="form-control " style="width: 50%;"/>
								</c:if>
								<c:if test="${!(computerPurchase.isStart ne '1' or computerPurchase.act.taskDefKey eq 'exam1')}">
									${computerPurchase.demandModel}
								</c:if>
							</td>
						</tr>
						<tr>
							<td  class="width-15 active">cpu <font color="red">*</font></td>
							<td colspan="3">
								<c:if test="${computerPurchase.isStart ne '1' or computerPurchase.act.taskDefKey eq 'exam1'}">
									<form:input path="cpu" htmlEscape="false" rows="4" maxlength="30" class="form-control required" style="width: 50%;"/>
									<span class="help-inline"> </span>
								</c:if>
								<c:if test="${!(computerPurchase.isStart ne '1' or computerPurchase.act.taskDefKey eq 'exam1')}">
									${computerPurchase.cpu}
								</c:if>
							</td>
						</tr>
						<tr>
							<td class="width-15 active">内存 <font color="red">*</font></td>
							<td colspan="3">
								<c:if test="${computerPurchase.isStart ne '1' or computerPurchase.act.taskDefKey eq 'exam1'}">
									<form:input path="memory" htmlEscape="false" rows="4" maxlength="30" class="form-control required" style="width: 50%;"/>
									<span class="help-inline"> </span>
								</c:if>
								<c:if test="${!(computerPurchase.isStart ne '1' or computerPurchase.act.taskDefKey eq 'exam1')}">
									${computerPurchase.memory}
								</c:if>
							</td>
						</tr>
						<tr>
							<td class="width-15 active">硬盘容量 <font color="red">*</font></td>
							<td colspan="3">
								<c:if test="${computerPurchase.isStart ne '1' or computerPurchase.act.taskDefKey eq 'exam1'}">
									<form:input path="hardDisk" htmlEscape="false" rows="4" maxlength="30" class="form-control required" style="width: 50%;"/>
									<span class="help-inline"> </span>
								</c:if>
								<c:if test="${!(computerPurchase.isStart ne '1' or computerPurchase.act.taskDefKey eq 'exam1')}">
									${computerPurchase.hardDisk}
								</c:if>
							</td>
						</tr>
						<tr>
							<td class="width-15 active">显卡 <font color="red">*</font></td>
							<td colspan="3">
								<c:if test="${computerPurchase.isStart ne '1' or computerPurchase.act.taskDefKey eq 'exam1'}">
									<form:input path="videoCard" htmlEscape="false" rows="4" maxlength="30" class="form-control required" style="width: 50%;"/>
									<span class="help-inline"> </span>
								</c:if>
								<c:if test="${!(computerPurchase.isStart ne '1' or computerPurchase.act.taskDefKey eq 'exam1')}">
									${computerPurchase.videoCard}
								</c:if>
							</td>
						</tr>
						<tr>
							<td class="width-15 active">其他要求</td>
							<td colspan="3">
								<c:if test="${computerPurchase.isStart ne '1' or computerPurchase.act.taskDefKey eq 'exam1'}">
									<form:input path="other" htmlEscape="false" rows="4" maxlength="100" class="form-control " style="width: 50%;"/>
								</c:if>
								<c:if test="${!(computerPurchase.isStart ne '1' or computerPurchase.act.taskDefKey eq 'exam1')}">
									${computerPurchase.other}
								</c:if>
							</td>
						</tr>
						
						<tr>
							<td class="width-15 active" colspan="4"><div style='text-align:left'><fieldset><legend>申请部门主管</legend></fieldset></div></td>
						</tr>
						<tr>
							<td class="width-15 active">申请部门主管意见 <font color="red">*</font></td>
							<td colspan="3"><c:if test="${computerPurchase.act.taskDefKey eq 'exam2'}">
								<form:textarea path="deptDirectorSuggestion" htmlEscape="false" rows="4" maxlength="20" class="form-control required" style="width: 50%;"/>
								<span class="help-inline"> </span>
							</c:if>
							<c:if test="${computerPurchase.act.taskDefKey ne'exam2'}">
								${computerPurchase.deptDirectorSuggestion}
							</c:if></td>
						</tr>
						
						<tr>
							<td class="width-15 active" colspan="4"><div style='text-align:left'><fieldset><legend>申请部门副总</legend></fieldset></div></td>
						</tr>
						<tr>
							<td class="width-15 active">申请部门副总意见 <font color="red">*</font></td>
							<td colspan="3"><c:if test="${computerPurchase.act.taskDefKey eq 'exam3'}">
								<form:textarea path="deputyManagerSuggestion" htmlEscape="false" rows="4" maxlength="20" class="form-control required" style="width: 50%;"/>
								<span class="help-inline"> </span>
							</c:if>
							<c:if test="${computerPurchase.act.taskDefKey ne 'exam3'}">
								${computerPurchase.deputyManagerSuggestion}
							</c:if></td>
						</tr>
						
						<tr>
							<td class="width-15 active" colspan="4"><div style='text-align:left'><fieldset><legend>人事行政副总</legend></fieldset></div></td>
						</tr>
						<tr>
							<td class="width-15 active">人事行政副总意见 <font color="red">*</font></td>
							<td colspan="3"><c:if test="${computerPurchase.act.taskDefKey eq 'exam4'}">
								<form:textarea path="adminDeptManagerSuggestion" htmlEscape="false" rows="4" maxlength="20" class="form-control required" style="width: 50%;"/>
								<span class="help-inline"> </span>
							</c:if>
							<c:if test="${computerPurchase.act.taskDefKey ne 'exam4'}">
								${computerPurchase.adminDeptManagerSuggestion}
							</c:if></td>
						</tr>
						
						<tr>
							<td class="width-15 active" colspan="4"><div style='text-align:left'><fieldset><legend>总经理</legend></fieldset></div></td>
						</tr>
						<tr>
							<td class="width-15 active">总经理意见 <font color="red">*</font></td>
							<td colspan="3"><c:if test="${computerPurchase.act.taskDefKey eq 'exam5'}">
								<form:textarea path="generalManagerSuggestion" htmlEscape="false" rows="4" maxlength="20" class="form-control required" style="width: 50%;"/>
								<span class="help-inline"> </span>
							</c:if>
							<c:if test="${computerPurchase.act.taskDefKey ne 'exam5'}">
								${computerPurchase.generalManagerSuggestion}
							</c:if></td>
						</tr>
						<tr>
							<td class="width-15 active" colspan="4"><div style='text-align:left'><fieldset><legend>采购执行</legend></fieldset></div></td>
						</tr>
						<tr>
							<td class="width-15 active">采购情况 <font color="red">*</font></td>
							<td colspan="3"><c:if test="${computerPurchase.act.taskDefKey eq 'exam6'}">
								<form:textarea path="purchaser" htmlEscape="false" rows="4" maxlength="20" class="form-control required" style="width: 50%;"/>
								<span class="help-inline"> </span>
							</c:if>
							<c:if test="${computerPurchase.act.taskDefKey ne 'exam6'}">
								${computerPurchase.purchaser}
							</c:if></td>
						</tr>
						<tr>
							<td class="width-15 active" colspan="4"><div style='text-align:left'><fieldset><legend>固定资产管理员</legend></fieldset></div></td>
						</tr>
						<tr>
							<td class="width-15 active">固定资产情况 <font color="red">*</font></td>
							<td colspan="3"><c:if test="${computerPurchase.act.taskDefKey eq 'exam7'}">
								<form:textarea path="admin" htmlEscape="false" rows="4" maxlength="20" class="form-control required" style="width: 50%;"/>
								<span class="help-inline"> </span>
							</c:if>
							<c:if test="${computerPurchase.act.taskDefKey ne 'exam7'}">
								${computerPurchase.admin}
							</c:if></td>
						</tr>
					</table>
					<c:if test="${computerPurchase.isStart ne '0'}">
						<act:histoicFlow procInsId="${computerPurchase.act.procInsId}" />
					</c:if>
				</form:form>
			</div>
		</div>
	</div>
</body>
</html>