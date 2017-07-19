<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>固定资产申购</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			
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
			
			 if(newurl == "/oa/a/oa/fixedassetpurchase/applyFixedAssets" || 
				newurl == "/oa/a/oa/fixedassetpurchase/applyFixedAssets/?repage"){
				window.location.href="${ctx}/oa/fixedassetpurchase/applyFixedAssets";			
			}else{
				history.go(-1);
			} 
		}
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
				<h5>固定资产申购详情</h5>		
			</div>
			<div class="ibox-content" style="padding: 5px 0;">
				<form:form id="inputForm" modelAttribute="applyFixedAssets" action="" method="post" class="form-horizontal">
					<table class="table table-bordered  table-condensed dataTables-example dataTable no-footer">
						<tr>
							<td class="width-15 active noprint" colspan="6">
								<div style='text-align:left'>
									<input id="btnCancel" class="btn" type="button" value="返 回" onclick="goBack();"/>&nbsp;
									<input id="btnPrint" type="button" value="打印" class="btn btn-primary"/>&nbsp;
									<input id="btnView" class="btn btn-primary" type="button" value="查看流程图"/>&nbsp;
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
			</div>
		</div>
	</div>
</body>
</html>