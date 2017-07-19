<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>日常借支审批信息管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#btnPrint").click(function(){
				window.print();
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
<oa:bodyPrint>
	<form:form id="inputForm" modelAttribute="oaLoanDailyApproval" action="" method="post" class="form-horizontal">
		<table class="table table-bordered  table-condensed dataTables-example dataTable no-footer">
			<tr>
				<td class="width-15 active noprint" colspan="4"><div style='text-align:left'><input id="btnPrint" type="button" value="打印" class="btn btn-primary"/>&nbsp;</div></td>
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
				<td class="width-35" colspan="3">
					${fns:getDictLabel(oaLoanDailyApproval.isPurchase,'yes_no','')}
				</td>
			</tr>
			<tr id="tr_projectManager">
				<td class="width-15 active">项目经理</td>
				<td class="width-35" colspan="3">
					${oaLoanDailyApproval.projectManager.name}
				</td>
			</tr>
			<tr>
				<td class="width-15 active">借支事由</td>
				<td class="width-35" colspan="3">
					${oaLoanDailyApproval.loanReason}
				</td>
			</tr>
			<tr>
				<td class="width-15 active">人民币（大写） <span class="help-inline"><font color="red">*</font> </span></td>
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
					<td class="width-15 active" colspan="4"><div style='text-align:left'><fieldset><legend>上级领导意见</legend></fieldset></div></td>
				</tr>
				<tr>
					<td class="width-35" colspan="4">
						${oaLoanDailyApproval.exam2Opinion}
					</td>
				</tr>
			</c:if>
			<c:if test="${not empty oaLoanDailyApproval.exam5Opinion}">
				<tr>
					<td class="width-15 active" colspan="4"><div style='text-align:left'><fieldset><legend>项目经理意见</legend></fieldset></div></td>
				</tr>
				<tr>
					<td class="width-35" colspan="4">
						${oaLoanDailyApproval.exam5Opinion}
					</td>
				</tr>
			</c:if>
			<c:if test="${not empty oaLoanDailyApproval.exam3Opinion}">
				<tr>
					<td class="width-15 active" colspan="4"><div style='text-align:left'><fieldset><legend>财务副总意见</legend></fieldset></div></td>
				</tr>
				<tr>
					<td class="width-35" colspan="4">
						${oaLoanDailyApproval.exam3Opinion}
					</td>
				</tr>
			</c:if>
			<c:if test="${not empty oaLoanDailyApproval.exam4Opinion}">
				<tr>
					<td class="width-15 active"colspan="4"><div style='text-align:left'><fieldset><legend>总经理意见</legend></fieldset></div></td>
				</tr>
				<tr>
					<td class="width-35" colspan="4">
						${oaLoanDailyApproval.exam4Opinion}
					</td>
				</tr>
			</c:if>
			<c:if test="${not empty oaLoanDailyApproval.exam6Opinion}">
				<tr>
					<td class="width-15 active" colspan="4"><div style='text-align:left'><fieldset><legend>会计意见</legend></fieldset></div></td>
				</tr>
				<tr>
					<td class="width-35" colspan="4">
						${oaLoanDailyApproval.exam6Opinion}
					</td>
				</tr>
			</c:if>
			<c:if test="${not empty oaLoanDailyApproval.exam7Opinion}">
				<tr>
					<td class="width-15 active" colspan="4"><div style='text-align:left'><fieldset><legend>出纳意见</legend></fieldset></div></td>
				</tr>
				<tr>
					<td class="width-35" colspan="4">
						${oaLoanDailyApproval.exam7Opinion}
					</td>
				</tr>
			</c:if>
		</table>
		<c:if test="${oaLoanDailyApproval.isStart eq '1' and not empty oaLoanDailyApproval.act.procInsId}">
			<act:histoicFlow procInsId="${oaLoanDailyApproval.act.procInsId}" />
		</c:if>
	</form:form>
</oa:bodyPrint>
</html>