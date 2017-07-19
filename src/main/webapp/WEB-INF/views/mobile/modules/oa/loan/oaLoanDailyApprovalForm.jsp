<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>日常借支流程</title>
	<meta name="decorator" content="default"/>
	<meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=no" />
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/mobile/css/mui.min.css" />
	<script src="${ctxStatic}/mobile/js/mui.min.js"></script>
	<script>
		mui.init({
			swipeBack:true //启用右滑关闭功能
		});
	</script>
	<script type="text/javascript">
		$(document).ready(function() {
			
			$("#btnPrint").click(function(){
				var src="${ctx}/oa/loan/oaLoanDailyApproval/print?id=${oaLoanDailyApproval.id}";
				top.layer.open({
					  type: 2, 
					  area: ["100%","100%"],
				      title: "打印预览",
			          maxmin: true, //开启最大化最小化按钮
			          shadeClose: true,
					  content: src //这里content是一个普通的String
				});
			});
			
			$("#btnViewCommen").click(function(){
				var src="${ctx}/act/process/resource/read?procDefId=${fns:getWorkflowVarValue('oa_loan_daily_approval','procDefId','')}&resType=image";
				if("${not empty oaLoanDailyApproval.procInsId}"=="true"){
					src="${ctx}/act/task/trace/photo/${fns:getWorkflowVarValue('oa_loan_daily_approval','procDefId','')}/${oaLoanDailyApproval.procInsId}";
				}
				top.layer.open({
					  type: 2, 
					  area: ["100%","100%"],
				      title: "日常借支流程图",
			          maxmin: true, 
			          shadeClose: true,
					  content: src 
				});				
			});
			
			$("#btnView").click(function(){
				var src="${ctx}/act/task/trace/photo/${fns:getWorkflowVarValue('oa_loan_daily_approval','procDefId','')}/${oaLoanDailyApproval.procInsId}";
				var width = window.innerWidth || document.documentElement.clientWidth || document.body.clientWidth;  
				var height = window.innerHeight || document.documentElement.clientHeight || document.body.clientHeight;  
				top.layer.open({
					  type: 2, 
					  area: ["100%","100%"],
				      title: "日常借支流程图",
			          maxmin: true, 
			          shadeClose: true,
					  content: src 
				});
			});
			
			//$("#name").focus();
			$("#inputForm").validate({
				rules: {
					"projectManager.name": {
				        required: true
				     }
				},
			    messages: {
			        "projectManager.name": {
			          required: "必填信息",
			        }
			    },
				submitHandler: function(form){
					//oaLoading('正在提交，请稍候...');
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
			
			$("#isPurchase").change(function(){  
				$(this).valid();
				
				if($(this).val()=="1"){
					$("#tr_projectManager").show();
				}else{
					$("#tr_projectManager").hide();
				}
			});
			
			$("#projectManagerName").change(function(){  
				$(this).valid();  
			});
		});
	</script>
	<style type="text/css">
		td{
			font-size:13px;
		}
	</style>
</head>
<body class="mui-ios mui-ios-9 mui-ios-9-1">
 	<oam:header>
		<a class="mui-icon mui-icon-back mui-pull-left" onclick="location.href='/oa/a/m/oa/loan/oaLoanRepayment/'"></a>
		<h1 class="mui-title">日常借支流程</h1>
	</oam:header>
	<oam:message content="${message}"/>
	<div class="mui-content">
	<form:form id="inputForm" modelAttribute="oaLoanDailyApproval" action="${mctx}/oa/loan/oaLoanDailyApproval/save" method="post" class="form-horizontal">
		<input type="hidden" name="token" value="${token }">
		<form:hidden path="id"/>
		<form:hidden path="act.taskId"/>
		<form:hidden path="act.taskName"/>
		<form:hidden path="act.taskDefKey"/>
		<form:hidden path="act.procInsId"/>
		<form:hidden path="act.procDefId"/>
		<form:hidden id="flag" path="act.flag"/>
		<sys:message content="${message}"/>
		<table class="table table-bordered  table-condensed dataTables-example dataTable no-footer" style="background-color: #ffffff">
			<c:if test="${oaLoanDailyApproval.isStart eq '1' and oaLoanDailyApproval.act.taskDefKey ne 'exam1'}">
				<tr>
					<td class="width-15 active" style="width:25%" >借支人姓名</td>
					<td class="width-35">
						${oaLoanDailyApproval.loanUser.name}
					</td>
				</tr>
				<tr>
					<td class="width-15 active"  >所在部门</td>
					<td class="width-35">
						<c:if test="${not empty oaLoanDailyApproval.loanUserParentOfficeName}">
							${oaLoanDailyApproval.loanUserParentOfficeName}&nbsp;-&nbsp;
						</c:if>
						${oaLoanDailyApproval.loanUserOfficeName}
					</td>
				</tr>
				<tr>
					<td class="width-15 active"  >申请单号</td>
					<td class="width-35">
						${oaLoanDailyApproval.approvalNo}
					</td>
				</tr>
				<tr>
					<td class="width-15 active"  >未归还借款</td>
					<td class="width-35">
						${arrearsMoney}
					</td>
				</tr>
			</c:if>
			<tr>
				<td class="width-15 active"  >是否用于采购<span class="help-inline"><font color="red">*</font> </span></td>
				<td class="width-35" colspan="3">
					<c:if test="${oaLoanDailyApproval.isStart ne '1' or oaLoanDailyApproval.act.taskDefKey eq 'exam1'}">
						<form:select path="isPurchase"  class="form-control selectpicker " data-style="btn-inverse" data-live-search="true">
							<form:options items="${fns:getDictList('yes_no')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
						</form:select>
						
					</c:if>
					<c:if test="${!(oaLoanDailyApproval.isStart ne '1' or oaLoanDailyApproval.act.taskDefKey eq 'exam1')}">
						${fns:getDictLabel(oaLoanDailyApproval.isPurchase,'yes_no','')}
					</c:if>
				</td>
			</tr>
			<tr id="tr_projectManager">
				<td class="width-15 active"  >项目经理<span class="help-inline"><font color="red">*</font> </span></td>
				<td class="width-35" colspan="3">
					<c:if test="${oaLoanDailyApproval.isStart ne '1' or oaLoanDailyApproval.act.taskDefKey eq 'exam1'}">
						<sys:treeselect height="100% !important"  width="100% !important" id="projectManager" name="projectManager.id" value="${oaLoanDailyApproval.projectManager.id}" labelName="projectManager.name" labelValue="${oaLoanDailyApproval.projectManager.name}"
							title="用户" url="/sys/office/treeData?type=3" cssClass="form-control" allowClear="true" notAllowSelectParent="true"/>
						<%-- <sys:treeselect height="100% !important"  width="100% !important" id="projectManager" name="projectManager.id" value="${oaLoanDailyApproval.projectManager.id}" labelName="projectManager.name" labelValue="${oaLoanDailyApproval.projectManager.name}"
						title="用户" url="/sys/office/treeData?type=3" cssClass="form-control required" allowClear="true" notAllowSelectParent="true" checked="false" /> --%>
					</c:if>
					<c:if test="${!(oaLoanDailyApproval.isStart ne '1' or oaLoanDailyApproval.act.taskDefKey eq 'exam1')}">
						${oaLoanDailyApproval.projectManager.name}
					</c:if>
				</td>
			</tr>
			<tr>
				<td class="width-15 active"  >借支事由<span class="help-inline"><font color="red">*</font> </span></td>
				<td class="width-35" colspan="3">
					<c:if test="${oaLoanDailyApproval.isStart ne '1' or oaLoanDailyApproval.act.taskDefKey eq 'exam1'}">
						<form:textarea path="loanReason" htmlEscape="false" rows="4" maxlength="450" class="form-control required" style="width:98%"/>
						
					</c:if>
					<c:if test="${!(oaLoanDailyApproval.isStart ne '1' or oaLoanDailyApproval.act.taskDefKey eq 'exam1')}">
						<form:textarea path="loanReason" htmlEscape="false" rows="4" maxlength="450" class="form-control" readonly="true" style="width:98%"/>
					</c:if>
				</td>
			</tr>
			<tr>
				<td class="width-15 active"  >人民币（大写）<span class="help-inline"><font color="red">*</font> </span></td>
				<td class="width-35" colspan="3">
					<c:if test="${oaLoanDailyApproval.isStart ne '1' or oaLoanDailyApproval.act.taskDefKey eq 'exam1'}">
						<form:input path="loanMoney" htmlEscape="false" min="0" max="9999999" class="form-control required number"/>
						
					</c:if>
					<c:if test="${!(oaLoanDailyApproval.isStart ne '1' or oaLoanDailyApproval.act.taskDefKey eq 'exam1')}">
						${oaLoanDailyApproval.loanMoney}(${oaLoanDailyApproval.loanMoneyBIG})
					</c:if>
				</td>
			</tr>
			<c:if test="${not empty oaLoanDailyApproval.exam2Opinion}">
				<tr>
					<td class="width-15 active" colspan="4"><div style='text-align:left;font-size: 18px;color: #18a689;'>上级领导意见</div></td>
				</tr>
				<tr>
					<td class="width-35" colspan="4">
						${oaLoanDailyApproval.exam2Opinion}
					</td>
				</tr>
			</c:if>
			<c:if test="${not empty oaLoanDailyApproval.exam5Opinion}">
				<tr>
					<td class="width-15 active" colspan="4"><div style='text-align:left;font-size: 18px;color: #18a689;'>项目经理意见</div></td>
				</tr>
				<tr>
					<td class="width-35" colspan="4">
						${oaLoanDailyApproval.exam5Opinion}
					</td>
				</tr>
			</c:if>
			<c:if test="${not empty oaLoanDailyApproval.exam3Opinion}">
				<tr>
					<td class="width-15 active" colspan="4"><div style='text-align:left;font-size: 18px;color: #18a689;'>财务副总意见</div></td>
				</tr>
				<tr>
					<td class="width-35" colspan="4">
						${oaLoanDailyApproval.exam3Opinion}
					</td>
				</tr>
			</c:if>
			<c:if test="${not empty oaLoanDailyApproval.exam4Opinion}">
				<tr>
					<td class="width-15 active" colspan="4"><div style='text-align:left;font-size: 18px;color: #18a689;'>总经理意见</div></td>
				</tr>
				<tr>
					<td class="width-35" colspan="4">
						${oaLoanDailyApproval.exam4Opinion}
					</td>
				</tr>
			</c:if>
			<c:if test="${not empty oaLoanDailyApproval.exam6Opinion}">
				<tr>
					<td class="width-15 active" colspan="4"><div style='text-align:left;font-size: 18px;color: #18a689;'>会计意见</div></td>
				</tr>
				<tr>
					<td class="width-35" colspan="4">
						${oaLoanDailyApproval.exam6Opinion}
					</td>
				</tr>
			</c:if>
			<c:if test="${not empty oaLoanDailyApproval.exam7Opinion}">
				<tr>
					<td class="width-15 active" colspan="4"><div style='text-align:left;font-size: 18px;color: #18a689;'>出纳意见</div></td>
				</tr>
				<tr>
					<td class="width-35" colspan="4">
						${oaLoanDailyApproval.exam7Opinion}
					</td>
				</tr>
			</c:if>
			<c:if test="${oaLoanDailyApproval.isStart eq '1' and oaLoanDailyApproval.act.taskDefKey ne 'exam1' and not empty oaLoanDailyApproval.act.taskDefKey}">
				<tr>
					<td class="width-15 active" colspan="4"><div style='text-align:left;font-size: 18px;color: #18a689;'>审批意见填写</div></td>
				</tr>
				<tr>
					<td class="width-35" colspan="4">
						<form:textarea path="remarksx" htmlEscape="false" rows="4" maxlength="180" class="form-control required" style="width:98%"/>
						<span class="help-inline"><font color="red">*</font> </span>
					</td>
				</tr>
			</c:if>
			<tr>
				<td class="width-15 active" colspan="6" style="width:100%;text-align: center">
					<%-- <c:if test="${empty oaLoanDailyApproval.act.taskDefKey}">
						<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>&nbsp;
					</c:if>
					<c:if test="${not empty oaLoanDailyApproval.act.taskDefKey}">
						<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>&nbsp;
					</c:if> --%>
					
					<%-- <c:if test="${empty oaLoanDailyApproval.act.taskDefKey}">
						<input id="btnViewCommen" class="btn btn-primary" type="button" value="查看流程图"/>&nbsp;
					</c:if>
					<c:if test="${not empty oaLoanDailyApproval.act.taskDefKey}">
						<input id="btnView" class="btn btn-primary" type="button" value="流程追踪"/>&nbsp;
					</c:if> --%>
					<shiro:hasPermission name="oa:loan:oaLoanDailyApproval:edit">
						<c:if test="${empty oaLoanDailyApproval.act.taskDefKey}">
							<c:if test="${oaLoanDailyApproval.isStart ne '1'}">
								<input id="btnSave" class="btn btn-primary" type="submit" value="存草稿" onclick="$('#flag').val('save')"/>&nbsp;
								<input id="btnSubmit" class="btn btn-primary" type="submit" value="提交"  onclick="$('#flag').val('true')"/>&nbsp;
							</c:if>
						</c:if>
						<c:if test="${not empty oaLoanDailyApproval.act.taskDefKey}">
							<c:if test="${oaLoanDailyApproval.act.taskDefKey eq 'exam1'}">
								<input id="btnSave" class="btn btn-primary" type="submit" value="存草稿" onclick="$('#flag').val('save')"/>&nbsp;
								<input id="btnSubmit" class="btn btn-primary" type="submit" value="提交"  onclick="$('#flag').val('true')"/>&nbsp;
								<input id="btnSubmit2" class="btn btn-inverse" type="submit" value="销毁" onclick="$('#flag').val('false')"/>&nbsp;
							</c:if>
							<c:if test="${oaLoanDailyApproval.act.taskDefKey ne 'exam1' and oaLoanDailyApproval.act.taskDefKey ne 'exam7'}">
								<input id="btnSubmit" class="btn btn-primary" type="submit" value="同意"  onclick="$('#flag').val('true')"/>&nbsp;
								<input id="btnSubmit2" class="btn btn-inverse" type="submit" value="驳回" onclick="$('#flag').val('false')"/>&nbsp;
							</c:if>
							<c:if test="${oaLoanDailyApproval.act.taskDefKey eq 'exam7'}">
								<input id="btnSubmit" class="btn btn-primary" type="submit" value="确认"  onclick="$('#flag').val('true')"/>&nbsp;
							</c:if>
						</c:if>
					</shiro:hasPermission>
				</td>
			</tr>			
		</table>
		
		<c:if test="${oaLoanDailyApproval.isStart eq '1' and not empty oaLoanDailyApproval.act.procInsId}">
			<act:histoicFlowMobile procInsId="${oaLoanDailyApproval.act.procInsId}" />
		</c:if>
	</form:form>	
	</div>

</body>
</html>