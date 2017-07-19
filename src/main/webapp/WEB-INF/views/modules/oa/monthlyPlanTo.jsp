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
				<th style="width: 200px;">任务名</th>
				<th>分值</th>
				<th style="width:200px">边界定义</th>
				<th>开始时间</th>
				<th>结束时间</th>
				<th style="width:80px">自我评分</th>
				<th style="width:80px">经理评分</th>
				<th style="width:80px" colspan="2">副总评分</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page}" var="cyTspOaMonthlyPlan">
			<tr><td style="display: none;"><input name="id"  type="text" value="${cyTspOaMonthlyPlan.id}" readonly="true"/></td>
				<td>
				<textarea  rows="3" cols="6" style="width: 200px;"  class="input-xxlarge required" disabled="disabled" readonly="readonly">${cyTspOaMonthlyPlan.taskName}</textarea>
				</td>
				<td><span style="color: red;"> ${cyTspOaMonthlyPlan.taskScrores }</span></td>
				
				<td>
				<textarea  rows="3" cols="6" style="width: 200px;"  class="input-xxlarge required" disabled="disabled" readonly="readonly">${cyTspOaMonthlyPlan.definiti}</textarea>	
				</td>
				<td>
					${cyTspOaMonthlyPlan.startTime}
				</td>
				<td>
					${cyTspOaMonthlyPlan.endTime}
				</td>
				<td>
					${cyTspOaMonthlyPlan.myScores}
				</td>
				<td>
					${cyTspOaMonthlyPlan.leaderScores}
				</td>
				<td colspan="2">
					${cyTspOaMonthlyPlan.viceScores}
				</td>
				<td style="display: none;">
					<input name="procInsId" type="text" value="${cyTspOaMonthlyPlan.procInsId}">
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
		  <td colspan="6">统计<span style="color: red;">(${Scrores["key"]})</span></td>
		 
		 <td>
		 
		    自我评价总分<span style="color: red;">(${Scrores["value"]})</span>
		 </td>
		 <td></td>
		 <td><input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.back()"/></td>
		 </tr>
		 
		  
		  
		 
		   
	
		</tbody>
	
	</table>