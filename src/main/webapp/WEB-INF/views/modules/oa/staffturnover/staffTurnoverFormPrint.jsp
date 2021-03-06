<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>武汉楚誉科技股份有限公司</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#btnPrint").click(function(){
				window.print();
			});
		});
	</script>
	<style type="text/css">
		@media print {
			.noprint {
				display: none
			}
		}	
	</style>
</head>
<body class="myoa-print-page">
	<sys:message content="${message}"/>
		<form:form id="inputForm" modelAttribute="staffTurnover" action="" method="post" class="form-horizontal">
			<div class="noprint" style="padding-top: 10px;">
				<input id="btnPrint" type="button" value="打印" class="btn btn-primary"/>
			</div>
			<div style="padding-bottom: 12px;width: 40%">
				<img src="${ctxStatic}/images/chuyulogo.png" alt="武汉楚誉科技" style="width: 100%;"/>
			</div>
			<div style="padding-bottom: 12px;font-size: 22px;text-align:center;">员工异动表</div>
			
			<table class="table table-bordered  table-condensed dataTables-example dataTable no-footer">
				<tr>
					<td rowspan="8" class="active" style="width: 10%;">① 由员工填写</td>
					<td class="width-15 active">姓名</td>
					<td class="width-15">
						${staffTurnover.user.name}
					</td>
					<td class="width-15 active">工号</td>
					<td class="width-15">
						${staffTurnover.employeeId}
					</td> 
					<td class="width-15 active">职位</td>
					<td class="width-15">
						${staffTurnover.position}
					</td>
				</tr>
				<tr>
					<td class="active">异动类型</td>
					<td colspan="5">
						${fns:getDictLabel(staffTurnover.type,'turnover_type','')}
					</td>
				</tr>
				<tr>
					<td class="active">异动原因</td>
					<td colspan="5">
						${staffTurnover.reason}
					</td>
				</tr>
				<tr>
					<td class="active" colspan="3" align="center">异动前信息</td>
					<td class="active" colspan="3" align="center">异动后信息</td>
				</tr>
				<tr>
					<td class="active">部门</td>
					<td colspan="2">
						${fns:getOfficeName(staffTurnover.deptBefore)}
					</td>
					<td colspan="3">
						${fns:getOfficeName(staffTurnover.deptAfter)}
					</td>
				</tr>
				<tr>
					<td class="active">岗位</td>
					<td colspan="2">
						${staffTurnover.postitionBefore}
					</td>
					<td colspan="3">
						${staffTurnover.postitionAfter}
					</td>
				</tr>
				<tr>
					<td class="active">办公地点</td>
					<td colspan="2">
						${staffTurnover.officeLocatedBefore}
					</td>
					<td colspan="3">
						${staffTurnover.officeLocatedAfter}
					</td>
				</tr>
				<tr>
					<td class="active">办公电话</td>
					<td colspan="2">
						${staffTurnover.phoneBefore}
					</td>
					<td colspan="3">
						${staffTurnover.phoneAfter}
					</td>
				</tr>
				<tr>
					<td class="active" colspan="7">
						<div style='text-align:center;'>② 请按下列顺序办理审批手续</div>
					</td>
				</tr>
				<tr>
					<td class="active" colspan="4" align="center">异动前部门意见</td>
					<td class="active" colspan="3" align="center">异动后部门意见</td>
				</tr>
				<tr>
					<td class="active" colspan="2">主管意见</td>
					<td colspan="2">
						${staffTurnover.deptDirectorSuggestionBefore}
					</td>
					<td colspan="3">
						${staffTurnover.deptDirectorSuggestionAfter}
					</td>
				</tr>
				
				<tr>
					<td class="active" colspan="2">部门领导意见</td>
					<td colspan="2">
						${staffTurnover.deptManagerSuggestionBefore}
					</td>
					<td colspan="3">
						${staffTurnover.deptManagerSuggestionAfter}
					</td>
				</tr>
				
				<tr>
					<td class="active"  colspan="2">总经理意见</td>
					<td colspan="5">
						${staffTurnover.generalManagerSuggestion}
					</td>
				</tr>
				
				<tr>
					<td class="active" colspan="2">异动生效时间</td>
					<td colspan="5">
						<fmt:formatDate value="${staffTurnover.effectiveDate}" pattern="yyyy-MM-dd"/>
					</td>
				</tr>
				<tr>
					<td class="active" colspan="7"><div style='text-align:center;'>③ 工作交接手续</div></td>
				</tr>
				<!--遍历工作交接表  -->
				<tr>
					<td class="active" colspan="2" align="center">移交项目</td>
					<td class="active" colspan="3" align="center">具体内容</td>
					<td class="active" align="center">数量</td>
					<td class="active" align="center">备注</td>
				</tr>
				<c:forEach items="${staffTurnover.workList}" var="vo">
					<tr>
						<td colspan="2" align="center">
							${vo.project}
						</td>
						<td colspan="3" align="center">
							${vo.content}
						</td>
						<td align="center">
							${vo.number}
						</td>
						<td align="center">
							${vo.remarks}
						</td>
					</tr>
				</c:forEach>
				<tr>
					<td colspan="2">移交人</td>
					<td class="width-15">${staffTurnover.user.name}</td>	
					<td class="width-15">接收人</td>
					<td class="width-15">
							${staffTurnover.workTurnoverReceiver.name}
					</td>
					<td class="width-15">监收人</td>
					<td class="width-15">
							${staffTurnover.workTakeoverAcceptor.name}
					</td>
				</tr>	
				</table> 
			
			<table class="table table-bordered  table-condensed dataTables-example dataTable no-footer">	
				<tr>
					<td class="active" colspan="6">
						<div style='text-align:center;'>④ 资产移交手续</div>
					</td>
				</tr>	
				<!--资产移交列表  -->
				<tr>
					<td colspan="3" align="center">资产名称</td>
					<td align="center">数量</td>
					<td colspan="2"  align="center">备注</td>				
				</tr>
				<c:forEach items="${staffTurnover.assetsList}" var="vo">
					<tr>
						<td align="center" colspan="3">
							${vo.assetsName}
						</td>
						<td align="center">
							${vo.number}
						</td>
						<td align="center" colspan="2">
							${vo.remarks}
						</td>				
					</tr>
				</c:forEach>	
				<tr>
					<td>移交人</td>
					<td>${staffTurnover.user.name}</td>	
					<td>接收人</td>
					<td>
						${staffTurnover.assetsTurnoverReceiver.name}
					</td>
					<td>监收人</td>
					<td>
						${staffTurnover.assetsTakeoverAcceptor.name}
					</td>
				</tr>
			</table>
			
			<table class="table table-bordered  table-condensed dataTables-example dataTable no-footer">
				<tr>
					<td class="active" colspan="2"><div style='text-align: center;'>⑤ 财务结算手续</div></td>
				</tr>
				<tr>
					<td style="width: 65%;">
						<ul>
							<li><c:if test="${financeStatus eq 1}">
									无挂账
								</c:if>
							</li>
							<li><c:if test="${financeStatus eq 2}">
									挂账${onAccountYuan}元,${staffTurnover.onAccountStaff.name}代为冲账
								</c:if>
							</li>
							<li><c:if test="${financeStatus eq 3}">
									领用公司电脑，不须归还，补交剩余费用${payInBack}元
								</c:if>
							</li>
						</ul>
					</td>
					<td style="width: 35%;">财务人员确认签字：
						<c:if test="${staffTurnover.act.taskDefKey eq 'exam13'}">
							${fns:getWorkflowVarValue('staff_turnover', 'financialStaff', '')}
						</c:if>
					</td>
				</tr>
			</table >
		</form:form>
</body>
</html>