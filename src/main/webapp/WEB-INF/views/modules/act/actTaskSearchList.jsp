<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>综合查询</title>
<meta name="decorator" content="default" />
<script type="text/javascript">
	$(document).ready(function() {
		$("#btnClean").click(function() {
			$("input[type='text']").val("");
			return false;
		});
	});

	/**
	 * 签收任务
	 */
	function claim(taskId) {
		$.get('${ctx}/act/task/claim', {
			taskId : taskId
		}, function(data) {
			if (data == 'true') {
				top.$.jBox.tip('签收完成');
				location = '${ctx}/act/task/todo/';
			} else {
				top.$.jBox.tip('签收失败');
			}
		});
	}
</script>
</head>
<body class="gray-bg">
<%-- 	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/act/task/tosearch">综合查询</a></li>
	</ul> --%>
<div class="wrapper wrapper-content">
<div class="ibox">
<div class="ibox-title">
		<h5>综合查询列表 </h5>
		<div class="ibox-tools">
			<!-- <a class="collapse-link">
				<i class="fa fa-chevron-up"></i>
			</a>
			<a class="dropdown-toggle" data-toggle="dropdown" href="form_basic.html#">
				<i class="fa fa-wrench"></i>
			</a>
			<ul class="dropdown-menu dropdown-user">
				<li><a href="#">选项1</a>
				</li>
				<li><a href="#">选项2</a>
				</li>
			</ul>
			<a class="close-link">
				<i class="fa fa-times"></i>
			</a> -->
		</div>
	</div>
    
    <div class="ibox-content">
	<sys:message content="${message}"/>
		<!-- 查询条件 -->
	<div class="row">
	<div class="col-sm-12">
	<form:form id="searchForm" modelAttribute="act"
		action="${ctx}/act/task/tosearch" method="post"
		class="form-inline">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}" />
		<input id="pageSize" name="pageSize" type="hidden"
			value="${page.pageSize}" />
		<div class="form-group">
			<span>流程状态：&nbsp;</span>
			<form:select path="flag" class="form-control">
				<form:option value="" label="全部流程" />
				<form:options items="${fns:getDictList('act_pro_type')}"
					itemLabel="label" itemValue="value" htmlEscape="false" />
			</form:select>
			<span>起始时间：&nbsp;</span> <input id="beginDate" name="beginDate"
				type="text" readonly="readonly" maxlength="20"
				class="laydate-icon form-control layer-date input-sm" 
				value="<fmt:formatDate value="${act.beginDate}" pattern="yyyy-MM-dd"/>"
				onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});" /> <span>发起部门：&nbsp;</span>
			<form:input path="assigneeName" htmlEscape="false" maxlength="64"
				class="form-control" type="text" />
			<span>发&nbsp;&nbsp;起&nbsp;&nbsp;人：&nbsp;</span>
			<form:input path="assignee" htmlEscape="false" maxlength="64"
				class="form-control" type="text" />
			<br /> <br /> <span>流程名称：&nbsp;</span>
			<form:select path="procDefKey" class="form-control">
				<form:option value="" label="全部流程" />
				<form:options items="${fns:getDictList('act_type')}"
					itemLabel="label" itemValue="value" htmlEscape="false" />
			</form:select>
			<span>截止时间：&nbsp;</span> <input id="endDate" name="endDate"
				type="text" readonly="readonly" maxlength="20"
				class="laydate-icon form-control layer-date input-sm" 
				value="<fmt:formatDate value="${act.endDate}" pattern="yyyy-MM-dd"/>"
				onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});" /> <span>流程标题：&nbsp;</span>
			<form:input path="taskName" htmlEscape="false" maxlength="64"
				class="form-control " type="text" />
		</div>
	</form:form>
		<br/>
	</div>
	</div>
	<!-- 工具栏 -->
	<div class="row">
	<div class="col-sm-12">
		<div class="pull-right">
			<button  class="btn btn-primary btn-rounded btn-outline btn-sm " onclick="$('#searchForm').submit();" ><i class="fa fa-search"></i> 查询</button>
			<button id="btnClean" class="btn btn-primary btn-rounded btn-outline btn-sm "  ><i class="fa fa-refresh"></i> 重置</button>
		</div>
	</div>
	</div>
	<table id="contentTable"
		class="table table-striped table-bordered table-condensed dataTables-example dataTable">
		<thead>
			<tr>
				<th>标题</th>
				<%--<th>流程编号</th>
				--%>
				<th>流程名称</th>
				<th>当前环节</th>
				<th>当前处理人</th>
				<%--
				<th>任务内容</th> --%>
				<th>申请人</th>
				<th>申请部门</th>

				<!-- <th>流程版本</th> -->
				<th>创建时间</th>
				<!-- <th>操作</th> -->
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${page.list}" var="act">
				<c:set var="task" value="${act.task}" />
				<c:set var="vars" value="${act.vars}" />
				<c:set var="procDef" value="${act.procDef}" />
				<%--
				<c:set var="procExecUrl" value="${act.procExecUrl}" /> --%>
				<c:set var="status" value="${act.status}" />
				<tr>
					<td>${fns:abbr(not empty vars.map.title ? vars.map.title :
						task.id, 60)}</td>
					<%--<td>${act.procInsId }</td>
					--%>
					<td>${procDef.name}</td>
					<td>${task.name} <%--<a target="_blank" href="${pageContext.request.contextPath}/act/diagram-viewer?processDefinitionId=${task.processDefinitionId}&processInstanceId=${task.processInstanceId}">${task.name}</a> --%>
					</td>
					<%--
					<td>${task.description}</td> --%>

					<td><c:if test="${empty task.assignee&&not empty task.name}">
					待签收
					</c:if> <c:if test="${empty task.assignee&&empty task.name}">
					已完成
					</c:if> <c:if test="${not empty task.assignee}">
					${task.assignee }
					</c:if></td>
					<td>${act.assignee}</td>
					<td>${act.assigneeName}</td>

					<%-- <td><b title='流程版本号'>V: ${procDef.version}</b> --%>
					</td>
					<td><c:if test="${not empty task.createTime}">
							<fmt:formatDate value="${task.createTime}" type="both" />
						</c:if>
					</td>
					<%--
					<td><c:if test="${empty task.assignee}">
							<a href="javascript:claim('${task.id}');">签收任务</a>
						</c:if> <c:if test="${not empty task.assignee}">
							<%--
							<a href="${ctx}${procExecUrl}/exec/${task.taskDefinitionKey}?procInsId=${task.processInstanceId}&act.taskId=${task.id}">办理</a> 
							<a
								href="${ctx}/act/task/form?taskId=${task.id}&taskName=${fns:urlEncode(task.name)}&taskDefKey=${task.taskDefinitionKey}&procInsId=${task.processInstanceId}&procDefId=${task.processDefinitionId}&status=${status}">任务办理</a>
						</c:if> <shiro:hasPermission name="act:process:edit">
							<c:if test="${empty task.executionId}">
								<a href="${ctx}/act/task/deleteTask?taskId=${task.id}&reason="
									onclick="return promptx('删除任务','删除原因',this.href);">删除任务</a>
							</c:if>
						</shiro:hasPermission> <%--<a target="_blank" href="${pageContext.request.contextPath}/act/diagram-viewer?processDefinitionId=${task.processDefinitionId}&processInstanceId=${task.processInstanceId}">跟踪</a>
						<a target="_blank"
						href="${ctx}/act/task/trace/photo/${task.processDefinitionId}/${task.executionId}">跟踪</a>
						<%--<a target="_blank" href="${ctx}/act/task/trace/info/${task.processInstanceId}">跟踪信息</a>
					</td>
					 --%>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<br/>
	<br/>
	</div>
	</div>
</div>
</body>
</html>
