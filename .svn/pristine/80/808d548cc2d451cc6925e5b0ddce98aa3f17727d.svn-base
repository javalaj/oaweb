<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>招待费流程管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {						
			//$("#name").focus();
			$("#inputForm").validate({
				submitHandler: function(form){
					oaLoading('正在提交，请稍等...');
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
		});	
	</script>
	
	<style type="text/css">
		.head{text-align: center;font-size: 20px;font-weight: bolder;}
		.add-del-png {
			width: 15px;
			height: 15px;
		}
	</style>
</head>
<body class="gray-bg">
	<div class="wrapper wrapper-content">
<div class="ibox">
<div class="ibox-title">
<%-- 		<h5><a href="${ctx}/oa/entertainmentr/oaEntertainmentReimbursement/form?id=${oaEntertainmentReimbursement.id}">招待费流程详情</a> </h5> --%>
	</div>
    
    <div class="ibox-content">
	<sys:message content="${message}"/>
	<form:form id="inputForm" modelAttribute="listOaEnter" class="form-horizontal">
<%-- 		<form:hidden path="id"/> --%>
		<label>招 待 费 报 销 审 批 单</label>
		<table class="table table-bordered  table-condensed dataTables-example dataTable no-footer">
<!-- 			<tr> -->
<!-- 				<td colspan="9" class="head"></td> -->
<!-- 			</tr> -->
<thead>
			<tr>
				<td rowspan="2">日期</td>
				<td rowspan="2">往来单位</td>
				<td rowspan="2">洽谈事由及项目名称</td>
				<td colspan="2">实际金额</td>
				<td colspan="2">参与人数</td>
				<td rowspan="2">是否在事前报批</td>			
			</tr>
			<tr>
				<td>餐费</td>
				<td>酒水/烟等</td>
				<td>我司</td>
				<td>客户</td>
			</tr>
</thead><tbody>
			<c:forEach var="oaEnter" items="${listOaEnter}">
				<tr>
					<td>
						<fmt:formatDate value="${oaEnter.date}"
						pattern="yyyy-MM-dd" />						
					</td>
					<td>
						${oaEnter.currentunit}
					</td>
					<td>
						${oaEnter.reason}					
					</td>
					<td>
						${oaEnter.meals}
					</td>
					<td>
						${oaEnter.alcoholtobacco}
					</td>
					<td>
						${oaEnter.numOur}
					</td>
					<td>
						${oaEnter.numCustomers}
					</td>					
					<td>
						${oaEnter.ispriorapproval}
					</td>					
				</tr>
				</c:forEach>
				<tr>
					<td colspan="2">
						合计金额
					</td>
					<td colspan="6">
						${total}
					</td>
				</tr>
				<tr>
					<td colspan="2">
						大写金额
					</td>
					<td colspan="6">
						${money_string}
					</td>
				</tr>
				<c:if test="not empty ${name1}">
				<tr>
					<td colspan="2">
						部门负责人签字
					</td>
					<td colspan="6">
						${name1}
					</td>
				</tr>
				<tr>
					<td colspan="2">
						部门负责人审核意见
					</td>
					<td colspan="6">
						${text1}
					</td>
				</tr>
				</c:if>
				<c:if test="not empty ${name2}">
				<tr>
					<td colspan="2">
						总经理签字
					</td>
					<td colspan="6">
						${name2}
					</td>
				</tr>
				<tr>
					<td colspan="2">
						总经理审核意见
					</td>
					<td colspan="6">
						${text2 }
					</td>
				</tr>
				</c:if>
				<tr>
					<td colspan="2">
						财务签字
					</td>
					<td colspan="6">
						${name3}
					</td>
				</tr>
				<tr>
					<td colspan="2">
						财务审核意见
					</td>
					<td colspan="6">
						${text3 }
					</td>
				</tr>						
			</tbody>
		</table>
		
		<div class="form-actions" style='text-align:center;'>					
			<input id="btnCancel" class="btn" type="button" value="返 回"
				onclick="window.location.href='${ctx}/act/task/todo/' " />
			<c:if test="${task != null}">
				&nbsp;<input  
				onclick='btnPNGshow("${task.processDefinitionId}/${task.executionId}");'			
				class="btn" type="button" value="流程跟踪" />
		</c:if>
		</div>
		
	</form:form>
 	<c:if test="${not empty oaEntertainmentReimbursement.sameid}">
 		<act:histoicFlow procInsId="${oaEntertainmentReimbursement.procInsId}" />
 	</c:if>

		<br/>
	<br/>
	</div>
	</div>
</div>
</body>
</html>