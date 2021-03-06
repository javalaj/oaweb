<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>测试部审核月绩效查看</title>
<meta name="decorator" content="default" />
<script type="text/javascript">
	$(document)
			.ready(
					function() {
					});

</script>
<style type="text/css">
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
		<h5>月绩效流程 </h5>
		<div class="ibox-tools">
		</div>
	</div>
   <div class="ibox-content">
   	<sys:message content="${message}"/>
   	<div class="row">
	<div class="col-sm-12">
	<br/>
	</div>
	</div>
	</ul>
		<table class="table table-striped table-bordered table-hover table-condensed dataTables-example dataTable">
			<thead>
		<tr>
				<th style="text-align: center;">小组成员</th>
				<th style="text-align: center;">开始时间</th>
				<th style="text-align: center;">结束时间</th>
				<th style="text-align: center;">工作内容</th>
				<th style="text-align: center;">交付物</th>
				<th style="text-align: center;">工作权重</th>
				<th style="text-align: center;">进度分</th>
				<th style="text-align: center;">质量分</th>
				<th style="text-align: center;" colspan="2">任务分</th>
			</tr>
		</thead>
		<tbody>
		<c:set scope="page" var="inisign" value="-1" >
		</c:set>
		<c:forEach items="${us}" var="now2">
		<c:if test="${now2.weeksign!=inisign }">
		             <tr>
											<td  colspan="10" style="text-align: center;"><h1>第${now2.weeksign}周</h1></td>
								</tr>
								<c:set scope="page" var="inisign" value="${ now2.weeksign}" >
		</c:set>
								</c:if>
						            	<tr>	
								<td style="text-align: center;" >${now2.creatName }</td>
								<td style="text-align: center;"><c:choose>
									<c:when test="${now2.beginday=='1' }">周一</c:when>
									<c:when test="${now2.beginday=='2' }">周二</c:when>
									<c:when test="${now2.beginday=='3' }">周三</c:when>
									<c:when test="${now2.beginday=='4' }">周四</c:when>
									<c:when test="${now2.beginday=='5' }">周五</c:when>
									<c:when test="${now2.beginday=='6' }">周六</c:when>
									<c:otherwise>周日</c:otherwise>
								</c:choose></td>

							<td style="text-align: center;"><c:choose>
									<c:when test="${now2.endday=='1' }">周一</c:when>
									<c:when test="${now2.endday=='2' }">周二</c:when>
									<c:when test="${now2.endday=='3' }">周三</c:when>
									<c:when test="${now2.endday=='4' }">周四</c:when>
									<c:when test="${now2.endday=='5' }">周五</c:when>
									<c:when test="${now2.endday=='6' }">周六</c:when>
									<c:otherwise>周日</c:otherwise>
								</c:choose></td>
							<td style="text-align: center;">${now2.content }</td>
							<td style="text-align: center;">${now2.deliverables }</td>
							<td style="text-align: center;">${now2.important }</td>
							<td style="text-align: center;" >${now2.schedule }</td>
							<td style="text-align: center;" >${now2.qualityScore }</td>
							<td style="text-align: center;"colspan="2" >${now2.testScore }</td>
						</tr>
						</c:forEach>
							<tr>
					<td colspan="9"></td>
					<td  style="text-align: center;" >
						<input id="btnCancel" class="btn btn-myoa" type="button" value="返 回"
				onclick="history()" />
						</td>
					</tr>
		</tbody>
	</table>
	<br/>
	<br/>
	</div>
	</div>
	</div>
			<c:if test="${not empty userWeekrecords.id}">
		<act:histoicFlow procInsId="${userWeekrecords.procInsIdPre}" />
	</c:if>
	<hr>
	<script type="text/javascript">
	function history(){
		window.location.href="${ctx}/act/task/historic/";
	}
	
	</script>
</body>
</html>