<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
	<meta http-equiv="Content-Type" content="text/html;charset=utf-8"/>
	<meta name="decorator" content="default"/>
	<title>index</title>
	<link rel="stylesheet" href="${ctxStatic}/resources/css/amazeui.min.css">
	
	<style>
</style>
  </head>

  <body>
      <div class="am-cf admin-main">
  	<div class="admin-content">
  		<div class="admin-content-body">
			<table class="am-table">
			<c:forEach items="${actPage.list}" var="act" begin="0" end="3">
			<c:set var="task" value="${act.histTask}" />
				<c:set var="vars" value="${act.vars}" />
				<c:set var="procDef" value="${act.procDef}" />
				<c:set var="status" value="${act.status}" />
				<tr>
					<td><c:choose>
						<c:when test="${procDef.name=='月绩效考核' }">
							<a target="_parent"
								href="${ctx}/oa/cyTspOaMonthlyPlan/personal?commid=${task.description}">${fns:abbr(not
								empty act.vars.map.title ? act.vars.map.title : task.id, 60)} </a>
						</c:when>
						<c:otherwise>

							<a target="_parent"
								href="${ctx}/act/task/form?taskId=${task.id}&taskName=${fns:urlEncode(task.name)}&taskDefKey=${task.taskDefinitionKey}&commid=${task.description}&procInsId=${task.processInstanceId}&procDefId=${task.processDefinitionId}&status=${status}">${fns:abbr(not
								empty vars.map.title ? vars.map.title : task.id, 60)}</a>
						</c:otherwise>
						</c:choose>
					</td>
				</tr>
			</c:forEach>
			
			<tr>
				<td>
					<c:choose>
						<c:when test="${!empty actPage.list}">
							<a target="_parent" href="${ctx}/act/task/tosend/">更多...</a>
						</c:when>
						<c:otherwise>暂无</c:otherwise>
					</c:choose>
				</td>
			</tr>
			
			</table>
  		</div>
  	</div>
  </div>
  </body>
</html>
