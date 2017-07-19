<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>人员入职信息打印预览</title>
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
	<form:form id="inputForm" modelAttribute="oaEmpJoinApproval" action="" method="post" class="form-horizontal">
	<div style="padding-bottom: 12px;width: 40%"><img src="${ctxStatic}/images/chuyulogo.png" alt="武汉楚誉科技" style="width: 100%;"/></div>
		<table class="table table-bordered  table-condensed dataTables-example dataTable no-footer">
			<tr>
				<td class="width-15 active noprint" colspan="6"><div style='text-align:left'><input id="btnPrint" type="button" value="打印" class="btn btn-primary"/>&nbsp;</div></td>
			</tr>
			<tr>
				<td class="width-15 active" colspan="6"><div style='text-align:center'><fieldset><legend>员工入职审批表</legend></fieldset></div></td>
			</tr>
			<tr>
				<td class="width-15 active" >姓名</td>
				<td>
					${oaEmpJoinApproval.empName}
				</td>
				<td class="width-15 active" >性别</td>
				<td>
					${fns:getDictLabel(oaEmpJoinApproval.sex,'sex','')}
				</td>
				<td class="width-15 active" >民族</td>
				<td>
					${oaEmpJoinApproval.nation}
				</td>
			</tr>
			<tr>
				<td class="width-15 active" >归属部门</td>
				<td>
					${oaEmpJoinApproval.office.name}
				</td>
				<td class="width-15 active" >职务</td>
				<td>
					${oaEmpJoinApproval.duty}
				</td>
				<td class="width-15 active" >职称</td>
				<td>
					${oaEmpJoinApproval.title}
				</td>
			</tr>
			<tr>
				<td class="width-15 active" >入职时间</td>
				<td>
					<fmt:formatDate value="${oaEmpJoinApproval.entryTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td class="width-15 active" >最高学历</td>
				<td>
					${fns:getDictLabel(oaEmpJoinApproval.degrees,'oa_emp_degrees','')}
				</td>
				<td class="width-15 active">身份证号</td>
				<td>
					${oaEmpJoinApproval.idNumber}
				</td>
			</tr>	
			<tr>
				<td class="width-15 active" >联系电话</td>
				<td>
					${oaEmpJoinApproval.telephone}
				</td>
				<td class="width-15 active" >现家庭住址</td>
				<td colspan="3">
					${oaEmpJoinApproval.homeAddress}
				</td>
			</tr>
			<tr>
				<td class="width-15 active" >面试官意见</td>
				<td colspan="5">
					${oaEmpJoinApproval.examinerOpinion}
				</td>
			</tr>
			<tr>
				<td class="width-15 active" colspan="6"><div style='text-align:center'><fieldset><legend>员工入职审批意见</legend></fieldset></div></td>
			</tr>
			<%-- <tr>
				<td class="width-15 active" >入职申请提交人部门负责人意见</td>
				<td colspan="5">
					${oaEmpJoinApproval.deptMinisterOpinion}
				</td>
			</tr> --%>
			
			<tr>
				<td class="width-15 active" >分管副总意见</td>
				<td colspan="5">
					<textarea style="border: none;height: 100px; width: 100%" readonly="readonly">${oaEmpJoinApproval.empDeptMinisterOpinion}</textarea>
				</td>
			</tr>
			<tr>
				<td class="width-15 active" >人力资源部及副总意见</td>
				<td colspan="3" style="text-align: inherit">
				<p>人力资源部意见：</p>
				<textarea style="border: none;height: 100px; width: 100%" readonly="readonly">${oaEmpJoinApproval.hrOpinion}</textarea>
					<p>拟定薪酬：</p>
                    <p>试用期：<span style=" border-bottom: 1px solid #ddd;width:50px;">${oaEmpJoinApproval.probationSalary}</span>元/月</p>
                    <p>正式期：<span style=" border-bottom: 1px solid #ddd;width:50px;">${oaEmpJoinApproval.regularSalary}</span>元/月</p>
				</td>
				
				<td colspan="2">
					<p>行政人事副总意见:</p>
					<textarea style="border: none;height: 170px; width: 100%" readonly="readonly">${oaEmpJoinApproval.hrMinisterOpinion}</textarea>
				</td>
			</tr>
		</table>
		<c:if test="${oaEmpJoinApproval.isStart eq '1' and not empty oaEmpJoinApproval.act.procInsId}">
			<act:histoicFlow procInsId="${oaEmpJoinApproval.act.procInsId}" />
		</c:if>
	</form:form>
</oa:bodyPrint>
</html>