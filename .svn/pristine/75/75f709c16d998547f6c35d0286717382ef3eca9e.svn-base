<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>日常借支审批信息管理</title>
	<meta name="decorator" content="default"/>

	<script type="text/javascript">
		$(document).ready(function() {
			$("#btnPrint").click(function(){
				var src="${ctx}/oa/loan/oaLoanDailyApproval/print?id=${oaLoanDailyApproval.id}";
				top.layer.open({
					  type: 2, 
					  area: ["80%","80%"],
				      title: "打印预览",
			          maxmin: true, 
			          shadeClose: true,
					  content: src
				});
			});
			
			$("#btnViewCommen").click(function(){
				var src="${ctx}/act/process/resource/read?procDefId=${fns:getWorkflowVarValue('oa_loan_daily_approval','procDefId','')}&resType=image";
				if("${not empty oaLoanDailyApproval.procInsId}"=="true"){
					src="${ctx}/act/task/trace/photo/${fns:getWorkflowVarValue('oa_loan_daily_approval','procDefId','')}/${oaLoanDailyApproval.procInsId}";
				}
				top.layer.open({
					  type: 2, 
					  area: ["80%","80%"],
				      title: "日常借支申请流程图",
			          maxmin: true,
			          shadeClose: true,
					  content: src
				});
			});
		});
	</script>
	<style>
	@media print {
		.noprint {
			display: none
		}
	}
	</style>
</head>
<body class="gray-bg" style="padding: 0;">
	<div class="wrapper wrapper-content">
		<div class="ibox">
			<div class="ibox-title">
				<h5>日常借支申请</h5>
			</div> 
    		<div class="ibox-content" style="padding: 5px 0;">
				<form:form id="inputForm" modelAttribute="oaLoanDailyApproval" action="" method="post" class="form-horizontal">
					<table class="table table-bordered  table-condensed dataTables-example dataTable no-footer">
						<tr>
							<td class="width-15 active noprint" colspan="4">
								<oa:buttonGoBack/>  &nbsp;
								<input id="btnPrint" type="button" class="btn btn-primary" value="打印"/>&nbsp;
								<input id="btnViewCommen" type="button" class="btn btn-primary" value="查看流程图"/>&nbsp;
								<act:flow-back-btn></act:flow-back-btn>
							</td>
						</tr>
						<tr>
							<td class="width-15 active" colspan="4"><div style='text-align:left'><fieldset><legend>日常借支审批表</legend></fieldset></div></td>
						</tr>
						<c:if test="${oaLoanDailyApproval.isStart eq '1' and oaLoanDailyApproval.act.taskDefKey ne 'exam1'}">
							<tr>
								<td class="width-15 active">借支人姓名</td>
								<td class="width-35">
									${oaLoanDailyApproval.loanUser.name}
								</td>
								<td class="width-15 active">所在部门</td>
								<td class="width-35">
									<c:if test="${not empty oaLoanDailyApproval.loanUserParentOfficeName}">
										${oaLoanDailyApproval.loanUserParentOfficeName}&nbsp;-&nbsp;
									</c:if>
									${oaLoanDailyApproval.loanUserOfficeName}
								</td>
							</tr>
							<tr>
								<td class="width-15 active">申请单号</td>
								<td class="width-35">
									${oaLoanDailyApproval.approvalNo}
								</td>
								<td class="width-15 active">未归还借款</td>
								<td class="width-35">
									${arrearsMoney}
								</td>
							</tr>
						</c:if>
						<tr>
							<td class="width-15 active">是否用于采购</td>
							<td  class="width-35" colspan="3">
								<c:if test="${oaLoanDailyApproval.isStart ne '1' or oaLoanDailyApproval.act.taskDefKey eq 'exam1'}">
									<form:select path="isPurchase" class="form-control selectpicker " data-style="btn-inverse" data-live-search="true">
										<form:options items="${fns:getDictList('yes_no')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
									</form:select>
									<span class="help-inline"><font color="red">*</font> </span>
								</c:if>
								<c:if test="${!(oaLoanDailyApproval.isStart ne '1' or oaLoanDailyApproval.act.taskDefKey eq 'exam1')}">
									${fns:getDictLabel(oaLoanDailyApproval.isPurchase,'yes_no','')}
								</c:if>
							</td>
						</tr>
						<tr id="tr_projectManager">
							<td class="width-15 active">项目经理</td>
							<td class="width-35" colspan="3">
								<c:if test="${oaLoanDailyApproval.isStart ne '1' or oaLoanDailyApproval.act.taskDefKey eq 'exam1'}">
									<sys:treeselect id="projectManager" name="projectManager.id" value="${oaLoanDailyApproval.projectManager.id}" labelName="projectManager.name" labelValue="${oaLoanDailyApproval.projectManager.name}"
										title="用户" url="/sys/office/treeData?type=3" cssClass="form-control required" allowClear="true" notAllowSelectParent="true"/>
									<span class="help-inline"><font color="red">*</font> </span>
								</c:if>
								<c:if test="${!(oaLoanDailyApproval.isStart ne '1' or oaLoanDailyApproval.act.taskDefKey eq 'exam1')}">
									${oaLoanDailyApproval.projectManager.name}
								</c:if>
							</td>
						</tr>
						<tr>
							<td class="width-15 active">借支事由</td>
							<td class="width-35" colspan="3">
								<form:textarea path="loanReason" htmlEscape="false" rows="4" maxlength="500" class="form-control required" style="width:98%"/>
								<c:if test="${oaLoanDailyApproval.isStart ne '1' or oaLoanDailyApproval.act.taskDefKey eq 'exam1'}">
									<span class="help-inline"><font color="red">*</font> </span>
								</c:if>
							</td>
						</tr>
						<tr>
							<td class="width-15 active">人民币（大写）</td>
							<td class="width-35" colspan="3">
								<c:if test="${oaLoanDailyApproval.isStart ne '1' or oaLoanDailyApproval.act.taskDefKey eq 'exam1'}">
									<form:input path="loanMoney" htmlEscape="false" min="0" max="9999999" class="form-control required number"/>
									<span class="help-inline"><font color="red">*</font> </span>
								</c:if>
								<c:if test="${!(oaLoanDailyApproval.isStart ne '1' or oaLoanDailyApproval.act.taskDefKey eq 'exam1')}">
									${oaLoanDailyApproval.loanMoney}(${oaLoanDailyApproval.loanMoneyBIG})
								</c:if>
							</td>
						</tr>
						<c:if test="${not empty oaLoanDailyApproval.exam2Opinion}">
							<tr>
								<td class="width-15 active" colspan="4"><div style='text-align:left'><fieldset><legend>上级领导意见</legend></fieldset></div></td>
							</tr>
							<tr>
								<td class="width-15" colspan="4">
									${oaLoanDailyApproval.exam2Opinion}
								</td>
							</tr>
						</c:if>
						<c:if test="${not empty oaLoanDailyApproval.exam5Opinion}">
							<tr>
								<td class="width-15 active" colspan="4"><div style='text-align:left'><fieldset><legend>项目经理意见</legend></fieldset></div></td>
							</tr>
							<tr>
								<td class="width-15" colspan="4">
									${oaLoanDailyApproval.exam5Opinion}
								</td>
							</tr>
						</c:if>
						<c:if test="${not empty oaLoanDailyApproval.exam3Opinion}">
							<tr>
								<td class="width-15 active" colspan="4"><div style='text-align:left'><fieldset><legend>财务副总意见</legend></fieldset></div></td>
							</tr>
							<tr>
								<td class="width-15" colspan="4">
									${oaLoanDailyApproval.exam3Opinion}
								</td>
							</tr>
						</c:if>
						<c:if test="${not empty oaLoanDailyApproval.exam4Opinion}">
							<tr>
								<td class="width-15 active" colspan="4"><div style='text-align:left'><fieldset><legend>总经理意见</legend></fieldset></div></td>
							</tr>
							<tr>
								<td class="width-15" colspan="4">
									${oaLoanDailyApproval.exam4Opinion}
								</td>
							</tr>
						</c:if>
						<c:if test="${not empty oaLoanDailyApproval.exam6Opinion}">
							<tr>
								<td class="width-15 active" colspan="4"><div style='text-align:left'><fieldset><legend>会计意见</legend></fieldset></div></td>
							</tr>
							<tr>
								<td class="width-15" colspan="4">
									${oaLoanDailyApproval.exam6Opinion}
								</td>
							</tr>
						</c:if>
						<c:if test="${not empty oaLoanDailyApproval.exam7Opinion}">
							<tr>
								<td class="width-15 active" colspan="4"><div style='text-align:left'><fieldset><legend>出纳意见</legend></fieldset></div></td>
							</tr>
							<tr>
								<td class="width-15" colspan="4">
									${oaLoanDailyApproval.exam7Opinion}
								</td>
							</tr>
						</c:if>
					</table>
					<c:if test="${oaLoanDailyApproval.isStart eq '1' and not empty oaLoanDailyApproval.act.procInsId}">
						<act:histoicFlow procInsId="${oaLoanDailyApproval.act.procInsId}" />
					</c:if>
				</form:form>
			</div>
		</div>
	</div>
</body>
</html>