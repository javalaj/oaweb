<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>人员入职信息打印预览</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			
			$("#btnPrint").click(function(){
				var src="${ctx}/oa/emp/oaEmpJoinApproval/print?id=${oaEmpJoinApproval.id}";
					top.layer.open({
						  type: 2, 
						  area: ["80%","80%"],
					      title: "打印预览",
				          maxmin: true,
				          shadeClose: true,
						  content: src 
					});
			});
			
			$("#btnView").click(function(){
				var src="${ctx}/act/process/resource/read?procDefId=${fns:getWorkflowVarValue('oa_emp_join_approval','procDefId','')}&resType=image";
				if("${not empty oaEmpJoinApproval.procInsId}"=="true"){
					src="${ctx}/act/task/trace/photo/${fns:getWorkflowVarValue('oa_emp_join_approval','procDefId','')}/${oaEmpJoinApproval.procInsId}";
				}
				top.layer.open({
					  type: 2, 
					  area: ["80%","80%"],
				      title: "员工入职流程图",
			          maxmin: true,
			          shadeClose: true,
					  content: src
				});				
			});
		});
	</script>
	<style>
	table tr td:nth-of-type(2n){
		width: 20%;
	}
	
	@media print {
		.noprint {
			display: none
		}
	}
	
	</style>
</head>
<body style="padding: 0px"  class="gray-bg">
	<div class="wrapper wrapper-content">
		<div class="ibox">
			<div class="ibox-title">
				<h5>员工入职申请表</h5>				
			</div>
			<div class="ibox-content" style="padding: 5px 0;">
	<form:form id="inputForm" modelAttribute="oaEmpJoinApproval" action="" method="post" class="form-horizontal">
		<table class="table table-bordered  table-condensed dataTables-example dataTable no-footer">
			<tr>
				<td class="width-15 active noprint" colspan="6"><div style='text-align:left'><input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>&nbsp;<input id="btnPrint" type="button" value="打印" class="btn btn-primary"/>&nbsp;
					<input id="btnView" class="btn btn-primary" type="button" value="查看流程图"/>&nbsp;<act:flow-back-btn></act:flow-back-btn></div></td>
			</tr>
			<tr>
				<td class="width-15 active" colspan="6"><div style='text-align:center'><fieldset><legend>员工入职审批表</legend></fieldset></div></td>
			</tr>
			<tr>
				<td class="width-15 active" >姓名</td>
				<td>
					${oaEmpJoinApproval.empName}
				</td>
				<td class="active" >性别</td>
				<td>
					${fns:getDictLabel(oaEmpJoinApproval.sex,'sex','')}
				</td>
				<td class="active" >民族</td>
				<td>
					${oaEmpJoinApproval.nation}
				</td>
			</tr>
			<tr>
				<td class="width-15 active" >归属部门</td>
				<td>
					${oaEmpJoinApproval.office.name}
				</td>
				<td class="active" >职务</td>
				<td>
					${oaEmpJoinApproval.duty}
				</td>
				<td class="active" >职称</td>
				<td>
					${oaEmpJoinApproval.title}
				</td>
			</tr>
			<tr>
				<td class="width-15 active" >入职时间</td>
				<td>
					<fmt:formatDate value="${oaEmpJoinApproval.entryTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td class="active" >最高学历</td>
				<td>
					${fns:getDictLabel(oaEmpJoinApproval.degrees,'oa_emp_degrees','')}
				</td>
				<td class="active">身份证号</td>
				<td>
					${oaEmpJoinApproval.idNumber}
				</td>
			</tr>	
			<tr>
				<td class="width-15 active" >联系电话</td>
				<td>
					${oaEmpJoinApproval.telephone}
				</td>
				<td class="active" >现家庭住址</td>
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
			 <tr>
				<td class="width-15 active" >入职申请提交人部门负责人意见</td>
				<td colspan="5">
					${oaEmpJoinApproval.deptMinisterOpinion}
				</td>
			</tr>
			
			<tr>
				<td class="width-15 active" >工单提交者所在部门的负责人意见</td>
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
                    <p>试用期：<span style=" display border-bottom: 1px solid #ddd;width:50px;">${oaEmpJoinApproval.probationSalary}</span>元/月</p>
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
	</div>
	</div>
	</div>
</body>
</html>