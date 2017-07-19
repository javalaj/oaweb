<%@page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>月绩效考核</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			
		});
		function page(n,s){
			$("#pageNo").val(n);
			$("#pageSize").val(s);
			$("#searchForm").submit();
        	return false;
        }
	</script>
</head>
<body>
	<sys:message content="${message}"/>
	
	 
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
 <h1 style="text-align:center">${offname }----${cyname }----${StartTime2}月绩效</h1>
 		<thead>
			<tr>
				<th>任务名&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(分值)</th>
				<th>定义</th>
				<th>开始时间</th>
				<th>结束时间</th>
				<th >自我评分</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page}" var="cyTspOaMonthlyPlan">
			<tr><td style="display: none;"><input name="id"  type="text" value="${cyTspOaMonthlyPlan.id}" readonly="true"/></td>
				<td>
				<input name="taskName" type="text" style="width:80px"  value="${cyTspOaMonthlyPlan.taskName}" readonly="true">	&nbsp;&nbsp;&nbsp;<input type="text" name="taskScrores" style="color: red; width: 50px" value="${cyTspOaMonthlyPlan.taskScrores }"readonly="true"/>
				</td>
				<td>
				<input name="definiti"  type="text" style="width:80px"   value="${cyTspOaMonthlyPlan.definiti}" readonly="true">	
				</td>
				<td>
					<input name="startTime" type="text" style="width:80px"    value="${cyTspOaMonthlyPlan.startTime}" readonly="true">
				</td>
				<td>
					<input name="endTime"  type="text" style="width:80px"  value="${cyTspOaMonthlyPlan.endTime}" readonly="true"> 
				</td>
				<td >
					<input id="cpmyscores" name="myScores" type="text" style="width:80px" 	 value="${cyTspOaMonthlyPlan.myScores}" readonly="true">
				</td>
			
				<td style="display: none;">
					<input name="procInsId" type="text"  value="${cyTspOaMonthlyPlan.procInsId}">
				</td>
				<td style="display: none;">
					<input name="approvalState" type="text" value="${cyTspOaMonthlyPlan.approvalState}">
				</td>
				<td style="display: none;">
					<input name="commonId" type="text" style="width:80px" 	 value="${cyTspOaMonthlyPlan.commonId}" >
				</td>
				<td style="display: none;">
					<input name="approvalUserName" type="text" style="width:80px" 	 value="${cyTspOaMonthlyPlan.approvalUserName}" >
				</td>
			</tr>
		</c:forEach>
		 
		 <tr>
		  <td colspan="5">统计<span style="color: red;">(${Scrores["key"]})</span></td>
		 
		 <td colspan="4">
		 
		    自我评价总分<span style="color: red;">(${Scrores["value"]})</span>
		     
		   
		 </td>
		 
		 </tr>
		 <tr>
		 <td colspan="5"></td>
		 <td><input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.back()"/></td>
		 
		 </tr>
		 
		  
		  
		 
		   
	
		</tbody>
	
	</table>