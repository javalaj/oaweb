<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>部门小组长提交</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#inputForm").validate({
				submitHandler : function(form) {
					oaLoading('操作正在进行中，请耐心等待');
					form.submit();
				},
			});
		});
		function page(n,s){
			$("#pageNo").val(n);
			$("#pageSize").val(s);
			$("#searchForm").submit();
        	return false;
        }
	</script>
</head>
<body class="gray-bg">
<div class="wrapper wrapper-content">
<div class="ibox">
<!-- <div class="ibox-title">
		<h5>部门月绩效考核 </h5>
		<div class="ibox-tools">
		</div>
	</div> -->
	
	<div class="ibox-content">
   	<sys:message content="${message}"/>
   	<div class="row">
	<div class="col-sm-12">
	<br/>
	</div>
	</div>
	
<div class="row">
	<div class="col-sm-12">
		<div class="pull-left">
			</div>
	</div>
	</div>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-hover table-condensed dataTables-example dataTable">
			<form id="inputForm"   action="${ctx}/user/userWeekplan/dispose" method="post" class="form-horizontal">
		<thead>
			<tr>
				<th style="text-align: center;">小组成员</th>
				<th style="text-align: center;">开始时间</th>
				<th style="text-align: center;">结束时间</th>
				<th style="text-align: center;">工作内容</th>
				<th style="text-align: center;">交付物</th>
				<th style="text-align: center;">工作权重</th>
				<th style="text-align: center;">进度分</th>
			</tr>
		</thead>
		<tbody>
		<c:set scope="page" var="inisign" value="-1" >
		</c:set>
		<c:forEach items="${us}" var="week" >
		
		<c:forEach items="${week}" var="now2">
		<c:if test="${now2.weeksign!=inisign }">
		             <tr>
											<td  colspan="7" style="text-align: center;"><h1>第${now2.weeksign}周<input type="text"  style="display: none;"
										name="weeksign" value="${now2.weeksign}" maxlength="255"/></h1></td>
								</tr>
								<c:set scope="page" var="inisign" value="${ now2.weeksign}" >
		</c:set>
								</c:if>
						            	<tr>	
						            	<input type="text"  style="display: none;"
										name="id" value="${now2.commonid}" maxlength="255"/>
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
							<td style="text-align: center;" colspan="3">${now2.schedule }</td>
						</tr>
						</c:forEach>
		</c:forEach>
			<tr>
							<td style="border: none;"></td>
							<td style="border: none;"></td>
							<td style="border: none;">
							<td style="border: none;">
								<c:choose>
						<c:when test="${us.get(0).get(0).toProcinsFlag==1 }">
<!-- 						<input id="btnCancel" class="btn btn-myoa" type="button" value="返 回"
				onclick="history.go(-1)" /> -->
						</c:when> 
							<c:otherwise>
							<c:if test="${cz!=1 }">
							<input id="btnSubmit" class="btn btn-myoa-sec btn-myoa-large"  type="submit" value="提交" />
							</c:if>
							<c:if  test="${cz==1 }">
							<h1><span style="color: red;font-weight:bolder;">本月绩效考核已提交或小组成员还没有提交周计划考核</span></h1>
							</c:if>
<!-- 						<input id="btnCancel" class="btn btn-myoa" type="button" value="返 回"
				onclick="history.go(-1)" /> -->
						</c:otherwise>
						</c:choose>
							<td style="border: none;"colspan="3"></td>
						</tr>
	
		</tbody>
		</form>
		</table>
		<br/>
		<br/>
		</div>
		</div>
		</div>
</body>
</html>