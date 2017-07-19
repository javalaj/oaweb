<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>固定资产申购管理</title>
	<meta name="decorator" content="default"/>
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/easyui/themes/gray/easyui.css"/>
	<script type="text/javascript" src="${ctxStatic}/easyui/jquery.easyui.min.js" charset="utf-8"></script>
	<script type="text/javascript" src="${ctxStatic}/easyui/locale/easyui-lang-zh_CN.js" charset="utf-8"></script>
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/easyui/icon.css"/>
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/easyui/demo/demo.css"/>
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
	
		$(document).ready(function() {
			
			getDate();
			
			$("#btnPrint").click(function(){
				var src="${ctx}/oa/fixedassetpurchase/applyFixedAssets/print?id=${applyFixedAssets.id}";
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
					var src="${ctx}/act/process/resource/read?procDefId=${fns:getWorkflowVarValue('apply_fixed_assets','procDefId','')}&resType=image";
					if("${not empty applyFixedAssets.procInsId}"=="true"){
						src="${ctx}/act/task/trace/photo/${fns:getWorkflowVarValue('apply_fixed_assets','procDefId','')}/${applyFixedAssets.procInsId}";
					}
					top.layer.open({
						  type: 2, 
						  area: [$("body").width()+'px', $("body").height()+'px'],
						  title: "固定资产申购流程图", 
				          maxmin: true, 
				          shadeClose: true,
						  content: src
					});	
				}); 
			
			$("#btnView").click(function(){
				var src="${ctx}/act/task/trace/photo/${fns:getWorkflowVarValue('apply_fixed_assets','procDefId','')}/${applyFixedAssets.procInsId}";
				top.layer.open({
					  type: 2, 
					  area: [$("body").width()+'px', $("body").height()+'px'],
					  title: "固定资产申购流程图",
			          maxmin: true, 
			          shadeClose: true,
					  content: src 
				});
			});	
			
			$("#inputForm").validate({
				rules: {
					"office.name": {
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
			    	"office.name": {
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
			$("#reletiveOffice").change(function(){  
				$(this).valid();  
			});
		});
		
		function goBack(){
			
			var strUrl=document.referrer;
			
			var arrObj=strUrl.split("//");
			var start=arrObj[1].indexOf("/");
			var end=arrObj[1].indexOf(";");
			var newurl=arrObj[1].substring(start);
			if(end>0){
				var newurl=arrObj[1].substring(start,end);
				}
			
			 if(newurl == "/oa/a/oa/fixedassetpurchase/applyFixedAssets"|| 
				newurl == "/oa/a/oa/fixedassetpurchase/applyFixedAssets/?repage"){
				window.location.href="${ctx}/oa/fixedassetpurchase/applyFixedAssets";			
			}else{
				history.go(-1);
			} 
		}
	</script>
</head>
<body class="gray-bg" style="padding: 0;">
	<div class="wrapper wrapper-content">
		<div class="ibox">
			<div class="ibox-title">
				<h5>固定资产申购</h5>		
			</div>
			<div class="ibox-content" style="padding: 5px 0;">
				<form:form id="inputForm" modelAttribute="applyFixedAssets" action="${ctx}/oa/fixedassetpurchase/applyFixedAssets/save" method="post" class="form-horizontal">
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
									<c:if test="${empty applyFixedAssets.act.taskDefKey}">
									<input id="btnViewCommen" class="btn btn-primary" type="button" value="查看流程图"/>&nbsp;
									</c:if>
									<c:if test="${not empty applyFixedAssets.act.taskDefKey}">
									<input id="btnView" class="btn btn-primary" type="button" value="查看流程图"/>&nbsp;
									</c:if>
									<shiro:hasPermission name="oa:fixedassetpurchase:applyFixedAssets:edit">
										<c:if test="${empty applyFixedAssets.act.taskDefKey}">
											<c:if test="${applyFixedAssets.isStart ne '1'}">
												<input id="btnSave" class="btn btn-primary" type="submit" value="存草稿" onclick="$('#flag').val('save')"/>&nbsp;
												<input id="btnSubmit" class="btn btn-primary" type="submit" value="提交申请"  onclick="$('#flag').val('true')"/>&nbsp;
											</c:if>
										</c:if>
										<c:if test="${not empty applyFixedAssets.act.taskDefKey}">
											<c:if test="${applyFixedAssets.act.taskDefKey eq 'exam1'}">
												<input id="btnSave" class="btn btn-primary" type="submit" value="存草稿" onclick="$('#flag').val('save')"/>&nbsp;
												<input id="btnSubmit" class="btn btn-primary" type="submit" value="重新提交申请"  onclick="$('#flag').val('true')"/>&nbsp;
												<input id="btnSubmit2" class="btn btn-inverse" type="submit" value="销毁申请" onclick="$('#flag').val('3')"/>&nbsp;
											</c:if>
											<c:if test="${applyFixedAssets.act.taskDefKey ne 'exam1'}">
												<input id="btnSubmit" class="btn btn-primary" type="submit" value="同意"  onclick="$('#flag').val('true')"/>&nbsp;
												<input id="btnSubmit2" class="btn btn-inverse" type="submit" value="驳回" onclick="$('#flag').val('false')"/>&nbsp;
											</c:if>
										</c:if>
									</shiro:hasPermission>
								</div>
							</td>
						</tr>		
						<tr>
							<td class="width-15 active" colspan="6">
								<div style='text-align:left'>
									<fieldset>
										<legend>固定资产申请表</legend>
									</fieldset>
								</div>
							</td>
						</tr>
						<c:if test="${applyFixedAssets.act.taskDefKey ne 'exam7'}">
							<tr>
								<td class="width-15 active">申请部门</td>
								<td>
									<c:if test="${applyFixedAssets.isStart ne '1' or applyFixedAssets.act.taskDefKey eq 'exam1'or applyFixedAssets.act.taskDefKey eq 'exam6'}">
										${empty applyFixedAssets.applyDept?fns:getUser().office.name:applyFixedAssets.applyDept}
										<input type="hidden" name="applyDept" value="${empty applyFixedAssets.applyDept?fns:getUser().office.name:applyFixedAssets.applyDept}">
									</c:if>
									<c:if test="${!(applyFixedAssets.isStart ne '1' or applyFixedAssets.act.taskDefKey eq 'exam1'or applyFixedAssets.act.taskDefKey eq 'exam6')}">
										${applyFixedAssets.applyDept}
									</c:if>
								</td>
								<td class="width-15 active">申请人</td>
								<td>
									<c:if test="${applyFixedAssets.isStart ne '1' or applyFixedAssets.act.taskDefKey eq 'exam1'}">
										${empty applyFixedAssets.applyName.name?fns:getUser().name:applyFixedAssets.applyName.name}
										<input type="hidden" name="applyName.id" value="${empty applyFixedAssets.applyName.id?fns:getUser().id:applyFixedAssets.applyName.id}">
									</c:if>
									<c:if test="${!(applyFixedAssets.isStart ne '1' or applyFixedAssets.act.taskDefKey eq 'exam1')}">
										${applyFixedAssets.applyName.name}
									</c:if>
								</td> 
								<td class="width-15 active"  style="width:100px">申请时间</td>
								<td>
									<c:if test="${applyFixedAssets.isStart ne '1' or applyFixedAssets.act.taskDefKey eq 'exam1'}">
										<span id="applyTime"></span>
										<input id="at" type="hidden" name="applyTime" />
									</c:if>
									<c:if test="${!(applyFixedAssets.isStart ne '1' or applyFixedAssets.act.taskDefKey eq 'exam1')}">
										<fmt:formatDate value="${applyFixedAssets.applyTime}" pattern="yyyy-MM-dd"/>
									</c:if>
								</td>
							</tr>
							<tr>
								<td class="width-15 active"  style="width:100px">期望到货日期 <span class="help-inline"><font color="red">*</font> </span></td>
								<td>
									<c:if test="${applyFixedAssets.isStart ne '1' or applyFixedAssets.act.taskDefKey eq 'exam1'}">
										<input name="arriveTime" type="text" readonly="readonly" maxlength="20" class="form-control Wdate laydate-icon layer-date input-sm required"
											value="<fmt:formatDate value="${applyFixedAssets.arriveTime}" pattern="yyyy-MM-dd"/>"
											onclick="WdatePicker({minDate:'%y-%M-{%d+1}',dateFmt:'yyyy-MM-dd',isShowClear:false, isShowToday:false});"/>
									</c:if>
									<c:if test="${!(applyFixedAssets.isStart ne '1' or applyFixedAssets.act.taskDefKey eq 'exam1')}">
										<fmt:formatDate value="${applyFixedAssets.arriveTime}" pattern="yyyy-MM-dd"/>
									</c:if>
								</td> 
								<td class="width-15 active">资产类别 <span class="help-inline"><font color="red">*</font> </span></td>
								<td>
									<c:if test="${applyFixedAssets.isStart ne '1' or applyFixedAssets.act.taskDefKey eq 'exam1'or computerPurchase.act.taskDefKey eq 'exam7'}">
										<form:select path="assetsCategory" class="selectpicker required" data-style="btn-inverse" data-live-search="true">
											<form:options items="${fns:getDictList('assets_category')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
										</form:select>
									</c:if>
									<c:if test="${!(applyFixedAssets.isStart ne '1' or applyFixedAssets.act.taskDefKey eq 'exam1'or computerPurchase.act.taskDefKey eq 'exam7')}">
										${fns:getDictLabel(applyFixedAssets.assetsCategory, 'assets_category', '')}
									</c:if>
								</td>
							</tr>
						</c:if>
						<tr>
							<td class="width-15 active">标题 <span class="help-inline"><font color="red">*</font> </span></td>
							<td colspan="5">
								<c:if test="${applyFixedAssets.isStart ne '1' or applyFixedAssets.act.taskDefKey eq 'exam1'}">
									<form:input path="applyTitle" htmlEscape="false" rows="4" maxlength="30" class="form-control required" style="width: 50%;"/>
									
								</c:if>
								<c:if test="${!(applyFixedAssets.isStart ne '1' or applyFixedAssets.act.taskDefKey eq 'exam1')}">
									${applyFixedAssets.applyTitle}
								</c:if>
							</td>
						</tr>
						<tr>
							<td class="width-15 active">摘要/事项 <span class="help-inline"><font color="red">*</font> </span></td>
							<td colspan="5">
								<c:if test="${applyFixedAssets.isStart ne '1' or applyFixedAssets.act.taskDefKey eq 'exam1'}">
									<form:textarea path="remarks" htmlEscape="false" rows="4" maxlength="50" class="form-control required" style="width: 50%;"/>
			        				<span class="help-inline"><font color="red">（请说明申购事由、采购资产的型号、性能要求。）</font> </span>
								</c:if>
								<c:if test="${!(applyFixedAssets.isStart ne '1' or applyFixedAssets.act.taskDefKey eq 'exam1')}">
									${applyFixedAssets.remarks}
								</c:if>
							</td>
						</tr>
						<tr>
							<td class="width-15 active" colspan="6">
								<div style='text-align:left'>
									<fieldset>
										<legend>申请部门主管</legend>
									</fieldset>
								</div>
							</td>
						</tr>
						<tr>
							<td class="width-15 active">申请部门主管意见</td>
							<td colspan="6"><c:if test="${applyFixedAssets.act.taskDefKey eq 'exam2'}">
								<form:textarea path="deptDirectorSuggestion" htmlEscape="false" rows="4" maxlength="20" class="form-control required" style="width: 50%;"/>
								<span class="help-inline"><font color="red">*</font> </span>
							</c:if>
							<c:if test="${applyFixedAssets.act.taskDefKey ne'exam2'}">
								${applyFixedAssets.deptDirectorSuggestion}
							</c:if></td>
						</tr>
						<tr>
							<td class="width-15 active" >
								<div style='text-align:left'>
									<fieldset>
										<legend>相关部门 <span class="help-inline"><font color="red">*</font></span>&nbsp;&nbsp;
											<c:if test="${applyFixedAssets.isStart ne '1' or applyFixedAssets.act.taskDefKey eq 'exam1'}">
												<td class="width-15" colspan="2">
													<sys:treeselect id="reletiveOffice" name="reletiveOffice"
													value="${applyFixedAssets.reletiveOffice.id}" labelName="office.name"
													labelValue="${applyFixedAssets.reletiveOffice.name}" title="部门"
													url="/sys/office/treeData?type=2" cssClass="form-control required"
													allowClear="true" notAllowSelectParent="true" />
												</td>
											</c:if>
										</legend>
									</fieldset>
								</div>
							</td>
						</tr>
						<tr>
							<td class="width-15 active">相关部门主管意见</td>
							<td colspan="6"><c:if test="${applyFixedAssets.act.taskDefKey eq 'exam3'}">
								<form:textarea path="otherDirectorSuggestion" htmlEscape="false" rows="4" maxlength="20" class="form-control required"  style="width: 50%;"/>
								<span class="help-inline"><font color="red">*</font> </span>
							</c:if>
							<c:if test="${applyFixedAssets.act.taskDefKey ne'exam3'}">
								${applyFixedAssets.otherDirectorSuggestion}
							</c:if></td>
						</tr>
						<tr>
							<td class="width-15 active" colspan="6">
								<div style='text-align:left'>
									<fieldset>
										<legend>总经理</legend>
									</fieldset>
								</div>
							</td>
						</tr>
						<tr>
							<td class="width-15 active">总经理意见</td>
							<td colspan="6"><c:if test="${applyFixedAssets.act.taskDefKey eq 'exam4'}">
								<form:textarea path="generalManagerSuggestion" htmlEscape="false" rows="4" maxlength="20" class="form-control required" style="width: 50%;"/>
								<span class="help-inline"><font color="red">*</font> </span>
							</c:if>
							<c:if test="${applyFixedAssets.act.taskDefKey ne'exam3'}">
								${applyFixedAssets.generalManagerSuggestion}
							</c:if></td>
						</tr>
						<tr>
							<td class="width-15 active" colspan="6">
								<div style='text-align:left'>
									<fieldset>
										<legend>采购执行</legend>
									</fieldset>
								</div>
							</td>
						</tr>
						<tr>
							<td class="width-15 active">采购情况</td>
							<td colspan="6">
								<c:if test="${applyFixedAssets.act.taskDefKey eq 'exam5'}">
									<form:textarea path="purchaser" htmlEscape="false" rows="4" maxlength="20" class="form-control required" style="width: 50%;"/>
									<span class="help-inline"><font color="red">*</font> </span>
								</c:if>
								<c:if test="${applyFixedAssets.act.taskDefKey ne'exam5'}">
									${applyFixedAssets.purchaser}
								</c:if>
							</td>
						</tr>
						<tr>
							<td class="width-15 active" colspan="6">
								<div style='text-align:left'>
									<fieldset>
										<legend>固定资产管理员</legend>
									</fieldset>
								</div>
							</td>
						</tr>
						<tr>
							<td class="width-15 active">固定资产情况</td>
							<td colspan="6">
								<c:if test="${applyFixedAssets.act.taskDefKey eq 'exam6'}">
									<form:textarea path="admin" htmlEscape="false" rows="4" maxlength="20" class="form-control required" style="width: 50%;"/>
									<span class="help-inline"><font color="red">*</font> </span>
								</c:if>
								<c:if test="${applyFixedAssets.act.taskDefKey ne 'exam6'}">
									${applyFixedAssets.admin}
								</c:if>
							</td>
						</tr>
					</table>
					<c:if test="${applyFixedAssets.isStart ne '0'}">
						<act:histoicFlow procInsId="${applyFixedAssets.act.procInsId}" />
					</c:if>	
				</form:form>
			</div>
		</div>
	</div>
</body>
</html>