<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>售前项目立项申請</title>
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
	<form:form id="inputForm" modelAttribute="oaProjectApproval" action="" method="post" class="form-horizontal">
		<table class="table table-bordered  table-condensed dataTables-example dataTable no-footer">
			<tr>
				<td class="width-15 active noprint" colspan="6"><div style='text-align:left'><input id="btnPrint" type="button" value="打印" class="btn btn-primary"/>&nbsp;</div></td>
			</tr>
			<tr>
				<td class="width-15 active" colspan="4"><div style='text-align:left'><fieldset><legend>售前项目立项申请表</legend></fieldset></div></td>
			</tr>
			<c:if test="${oaProjectApproval.isStart eq '1'}">
				<tr>
					<td class="width-15 active" >申请人</td>
					<td class="width-35">
						${oaProjectApproval.applicant.name}
					</td>
					<td class="width-15 active" >申请日期</td>
					<td class="width-35">
						<fmt:formatDate value="${oaProjectApproval.applyDate}" pattern="yyyy-MM-dd"/>
					</td>
				</tr>
			</c:if>
			<tr>
				<td class="width-15 active" >项目名称</td>
				<td class="width-35" colspan="3">
						${oaProjectApproval.projectName}
				</td>
			</tr>
			<tr>
				<td class="width-15 active">客户经理</td>
				<td class="width-35">
						${oaProjectApproval.accountManager.name}
				</td>
				<td class="width-15 active" >客户名称</td>
				<td class="width-35">
						${oaProjectApproval.accountName}
				</td>
			</tr>
			<tr>
				<td class="width-15 active">所属行业</td>
				<td class="width-35">
						${fns:getDictLabel(oaProjectApproval.ownedIndustry,'oa_project_ownedIndustry','')}
				</td>
				<td class="width-15 active">服务类别</td>
				<td class="width-35">
						${fns:getDictLabel(oaProjectApproval.contractType,'oa_project_contractType','')}
				</td>
			</tr>
			<tr>
				<td class="width-15 active">预计金额</td>
				<td class="width-35">
						${oaProjectApproval.expectedMoney}
				</td>
				<c:if test="${not empty oaProjectApproval.establishmentTime}">
				<td class="width-15 active">立项日期</td>
				<td class="width-35">
					<fmt:formatDate value="${oaProjectApproval.establishmentTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				</c:if>
			</tr>
			<tr>
				<td class="width-15 active">是否投标</td>
				<td class="width-35">
						${fns:getDictLabel(oaProjectApproval.isBid,'yes_no','')}
				</td>
				<td class="width-15 active">预计投标日期</td>
				<td class="width-35">
						<fmt:formatDate value="${oaProjectApproval.expectedBidTime}" pattern="yyyy-MM-dd"/>
				</td>
			</tr>
			<tr>
				<td class="width-15 active">预计签约时间</td>
				<td class="width-35" colspan="3">
						<fmt:formatDate value="${oaProjectApproval.bookContractTime}" pattern="yyyy-MM-dd"/>
				</td>
			</tr>
			<tr>
				<td class="width-15 active">项目背景描述</td>
				<td class="width-35" colspan="3">
						${oaProjectApproval.projectBgDescription}
				</td>
			</tr>
			<tr  class="noprint">
				<td class="width-15 active">项目附件</td>
				<td class="width-35" colspan="3">
					<form:hidden id="projectFile" path="projectFile" htmlEscape="false" maxlength="1000" class="form-control"/>
					<sys:ckfinder input="projectFile" type="files" uploadPath="/oa/project/oaProjectApproval" selectMultiple="true" readonly="true"/>
				</td>
			</tr>
			
			<tr>
				<td class="width-15 active" colspan="4"><div style='text-align:left'><fieldset><legend>市场部主管</legend></fieldset></div></td>
			</tr>
			<tr>
				<td class="width-15 active">市场部主管意见</td>
				<td class="width-35" colspan="3">
					${oaProjectApproval.marketingDirectorOpinion}
				</td>
			</tr>
			
			<tr>
				<td class="width-15 active" colspan="4"><div style='text-align:left'><fieldset><legend>商务部副总</legend></fieldset></div></td>
			</tr>
			<tr>
				<td class="width-15 active">商务部副总意见</td>
				<td class="width-35" colspan="3">
					${oaProjectApproval.viceMinisterOpinion}
				</td>
			</tr>
			<tr>
				<td class="width-15 active">商务支持</td>
				<td class="width-35" colspan="3">
					${oaProjectApproval.businessManager.name}
				</td>
			</tr>
			
			<tr>
				<td class="width-15 active" colspan="4"><div style='text-align:left'><fieldset><legend>售前部经理</legend></fieldset></div></td>
			</tr>
			<tr>
				<td class="width-15 active">售前部经理意见</td>
				<td class="width-35" colspan="3">
					${oaProjectApproval.preSalesManagerOpinion}
				</td>
			</tr>
			<tr>
				<td class="width-15 active">技术支持</td>
				<td class="width-35" colspan="3">
					${oaProjectApproval.technicalManager.name}
				</td>
			</tr>
		</table>
		<c:if test="${oaProjectApproval.isStart eq '1' and not empty oaProjectApproval.act.procInsId}">
			<act:histoicFlow procInsId="${oaProjectApproval.act.procInsId}" />
		</c:if>
	</form:form>
</oa:bodyPrint>
</html>