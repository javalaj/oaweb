<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>周计划管理</title>
<meta name="decorator" content="default" />
<style type="text/css">
select {
	width: 70px;
}

a {
	cursor: pointer;
}

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
		<h5>周计划流程 </h5>
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


	<%-- <table id="contentTable"
		class="table table-striped table-bordered table-condensed">
		<c:forEach items="${list1}" var="now1" varStatus="i">
			<table id="contentTable"
				class="table table-striped table-bordered table-condensed">
				<thead id="box">
					<tr>
						<td
							style="text-align: center; width: 30px; border: 1px solid blue;"><font
							color="blue">第${now1.weeksign }周</font>&emsp;(开始日期： <fmt:formatDate
								value="${now1.firstdate}" pattern="yyyy-MM-dd" />)</td>
						<td
							style="text-align: center; width: 30px; border: 1px solid blue;">提交状态：
							<c:choose>
								<c:when test="${now1.isdraft=='0'}">
									<font color="red">草稿</font>
								</c:when>
								<c:otherwise>
									<font color="blue">已提交</font>
								</c:otherwise>
							</c:choose>
						</td>
						<td
							style="text-align: center; width: 30px; border: 1px solid blue;">提交时间：<fmt:formatDate
								value="${now1.updateDate}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
					</tr>
				</thead>
			</table> --%>
			<table id="contentTable"
				class="table table-striped table-bordered table-hover table-condensed dataTables-example dataTable">
				
			<div class="modal-body">
					<div class="control-group">
						<label class="control-group"><h1>${officeName }     ${name }（<fmt:formatDate
								value="${userWeekplan.firstdate}" pattern="yyyy-MM" />）月，第（${userWeekplan.weeksign }）周，周计划</h1></label>
					</div>
				</div>
				
				
				
				
				
				
				<thead id="box">
				
					<tr>
						<td style="text-align: center;" width="100px">序号</td>
						<td style="text-align: center;" width="100px">开始时间</td>
						<td style="text-align: center;" width="100px">结束时间</td>
						<td style="text-align: center;" width="200px">工作计划</td>
						<td style="text-align: center;" width="200px">交付物</td>
						<td style="text-align: center;" width="200px">工作权重</td>
						<td style="text-align: center;" width="200px">进度分</td>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${userWeekrecord }" var="now2"  varStatus="ii">
						<tr>
							<td style="text-align: center;">${ii.index+1 }</td>
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
							<td style="text-align: center;" colspan="2">${now2.schedule }</td>
						</tr>
					</c:forEach>
						<tr>
					
					<td colspan="5"></td>
					<td colspan="4"  style="text-align: center;">	<input id="btnCancel" class="btn" type="button" value="返 回"
				onclick="history.go(-1)" /></td>
				</tbody>
					
			</table>
			
	<br/>
	<br/>
	</div>
	</div>
	</div>
			<c:if test="${not empty userWeekrecords.id}">
		<act:histoicFlow procInsId="${userWeekrecords.procInsId}" />
	</c:if>
</body>
</html>