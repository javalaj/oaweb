<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>固定资产申购</title>
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
<body>
	<form:form id="inputForm" modelAttribute="applyFixedAssets" action="" method="post" class="form-horizontal">
		<table class="table table-bordered  table-condensed dataTables-example dataTable no-footer">
			<tr>
				<td class="width-15 active noprint" colspan="6">
					<div style='text-align:left'>
						<input id="btnPrint" type="button" value="打印" class="btn btn-primary"/>&nbsp;
					</div>
				</td>
			</tr>
			<tr>
				<td class="width-15 active" colspan="6">
					<div style='text-align:left'>
						<fieldset>
							<legend>固定资产申购表</legend>
						</fieldset>
					</div>
				</td>
			</tr>
			<tr>
				<td class="width-15 active">申请部门</td>
				<td>
					${applyFixedAssets.applyDept}
				</td>
				<td class="width-15 active">申请人</td>
				<td>
					${applyFixedAssets.applyName.name}
				</td> 
				<td class="width-15 active"  style="width:100px">申请时间</td>
				<td>
					<fmt:formatDate value="${applyFixedAssets.applyTime}" pattern="yyyy-MM-dd"/>
				</td>
			</tr>
				<tr>
				<td class="width-15 active"  style="width:100px">期望到货日期</td>
				<td>
					<fmt:formatDate value="${applyFixedAssets.arriveTime}" pattern="yyyy-MM-dd"/>
				</td> 
				<td class="width-15 active">资产类别</td>
				<td>
					${fns:getDictLabel(applyFixedAssets.assetsCategory, 'assets_category', '')}
				</td>
			</tr>
			<tr>
				<td class="width-15 active">标题</td>
				<td colspan="5">
					${applyFixedAssets.applyTitle}
				</td>
			</tr>
			<tr>
				<td class="width-15 active">摘要/事项</td>
				<td colspan="5">
					${applyFixedAssets.remarks}
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
				<td colspan="6">
					${applyFixedAssets.deptDirectorSuggestion}
				</td>
			</tr>
			<tr>
				<td class="width-15 active" colspan="6">
					<div style='text-align:left'>
						<fieldset>
							<legend>相关部门
								<c:if test="${!empty applyFixedAssets.reletiveOffice}">
									(${applyFixedAssets.reletiveOffice.name})
								</c:if>
							</legend>
						</fieldset>
					</div>
				</td>
			</tr>
			<tr>
				<td class="width-15 active">相关部门主管意见</td>
				<td colspan="6">
					${applyFixedAssets.otherDirectorSuggestion}
				</td>
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
				<td colspan="6">
					${applyFixedAssets.generalManagerSuggestion}
				</td>
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
					${applyFixedAssets.purchaser}
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
					${applyFixedAssets.admin}
				</td>
			</tr>
		</table>
	</form:form>
</body>
</html>