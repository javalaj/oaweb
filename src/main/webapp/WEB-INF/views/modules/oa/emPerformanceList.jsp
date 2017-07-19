<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>我的通讯录</title>
	<meta name="decorator" content="default"/>
	 <script type="text/javascript">
		$(document).ready(function() {
	});
		function page(n,s){
			  
			$("#pageNo").val(n);
		    $("#pageSize").val(s);
			$("#searchForm").attr("action","${ctx}/oa/adress/contactsssss");
			$("#searchForm").submit();
	    	return false;
	    }
	</script>

 <script type="text/javascript">
  var myDate = new Date();
  myDate.getMonth();   //获取当前月份(0-11,0代表1月)

 
if (mytime<"23:30:00")
{
alert(mytime);
}

</script>

</head>
<body>


    <h1 style="text-align:center"><!-- <a onclick="moth();">上一月</a> -->${offname }${month }月绩效考核</h1>
	<span class="noprint"><sys:message  content="${message}"/></span>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead><tr>
		
		<th>姓名</th><th>直接上级</th><th>自评分</th><th >上级评分</th><th>副总评分</th><th>查看详细计划</th></thead>
		<tbody>
		<c:forEach items="${page.list}" var="OaMonthlyPlan">
			<td>${OaMonthlyPlan.creatName}</td>
			<td>${OaMonthlyPlan.superiorName}</td>
			<td>${OaMonthlyPlan.myScores}</td>
			<td>${OaMonthlyPlan.leaderScores}</td>
		    <td>${OaMonthlyPlan.viceScores}</td>
			<td class="noprint"><a href="${ctx}/oa/cyTspOaMonthlyPlan/empList?commid=${OaMonthlyPlan.commonId}">查看详细计划</a></td>
						
				
			</tr>
		</c:forEach>
		</tbody>
	
	</table>
   	
	<div class="pagination noprint">${page}</div>
	