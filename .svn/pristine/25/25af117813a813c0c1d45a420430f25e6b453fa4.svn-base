<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>待办任务</title>
<meta name="decorator" content="default" />
<script type="text/javascript">
	$(document).ready(function() {

	});
	/**
	 * 签收任务
	 */
	function claim(taskId) {
		$.get('${ctx}/act/task/claim', {
			taskId : taskId
		}, function(data) {
			if (data == 'true') {
				top.layer.msg("签收完成");
				//top.$.jBox.tip('签收完成');
				location = '${ctx}/act/task/todo/';
			} else {
				top.layer.msg("签收完成");
				//top.$.jBox.tip('签收失败');
			}
		});
	}
</script>
</head>
<body class="gray-bg">
	<%-- <ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/act/task/todo/">待办任务</a>
		</li>
		<li><a href="${ctx}/act/task/historic/">已办任务</a>
		</li>
		<li><a href="${ctx}/act/task/tosend/">已发任务</a>
		</li>
		<li><a href="${ctx}/act/task/process/">新建任务</a>
		</li>
	</ul>  --%>
	<div class="wrapper wrapper-content">
<div class="ibox">
<div class="ibox-title">
		<h5><a href="${ctx}/act/task/Alltodo">流程管理列表</a> </h5>
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
		action="${ctx}/act/task/Alltodo" method="post"
		class="form-inline">
				<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<div class="form-group">
			<span>当前节点办理人：&nbsp;</span>
			<form:input  name="assigneeName" path="assigneeName" htmlEscape="false"
						maxlength="255" class="form-control"  />
							<span>流程类型：&nbsp;</span>
		<form:select path="procDefKey" class="selectpicker " data-style="btn-inverse" data-live-search="true" id="procDefKey">
				<form:option value="" label="全部流程" />
				<form:options items="${fns:getDictList('act_type')}"
					itemLabel="label" itemValue="value" htmlEscape="false" />
			</form:select>
			<span>创建时间：</span> <input id="beginDate" name="beginDate"
				type="text" readonly="readonly" maxlength="20"
				class="laydate-icon form-control layer-date input-sm" value="<fmt:formatDate value="${act.beginDate}" pattern="yyyy-MM-dd"/>"
				onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});" /> -- <input
				id="endDate" name="endDate" type="text" readonly="readonly"
				maxlength="20" class="laydate-icon form-control layer-date input-sm" value="<fmt:formatDate value="${act.endDate}" pattern="yyyy-MM-dd"/>"
				onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});" /> 
		</div>
	</form:form>
	<br/>
	</div>
	</div>
		<!-- 工具栏 -->
	<div class="row">
	<div class="col-sm-12">
	<div class="pull-left">
	<%--	<button class="btn btn-white btn-sm " data-toggle="tooltip"
 						data-placement="left" onclick="location.href='${ctx}/act/task/historic/'" title="已办任务">
						<i class="fa fa-history"></i>&nbsp;已办任务
					</button>
					<a  class="btn btn-white btn-sm " 
						href="${ctx}/act/task/tosend/" title="已发任务">
						<i class="fa fa-location-arrow"></i>&nbsp;已发任务
					</a>		
<button class="btn btn-white btn-sm " data-toggle="tooltip"
						data-placement="left" onclick="location.href='${ctx}/act/task/process/'" title="新建任务">
						<i class="fa fa-tag"></i>&nbsp;新建任务
					</button>								
					<button class="btn btn-white btn-sm " data-toggle="tooltip"
						data-placement="left" onclick="sortOrRefresh()" title="刷新">
						<i class="glyphicon glyphicon-repeat"></i>&nbsp;刷新
					</button> --%>
			</div>
		<div class="pull-right">
			<button  class="btn btn-primary btn-rounded btn-outline btn-sm " onclick="search()" ><i class="fa fa-search"></i> 查询</button>
			<button  class="btn btn-primary btn-rounded btn-outline btn-sm " onclick="reset()" ><i class="fa fa-refresh"></i> 重置</button>
		</div>
	</div>
	</div>
	<table id="contentTable"
		class="table table-striped table-bordered table-hover table-condensed dataTables-example dataTable">
		<thead>
			<tr>
				<th>标题</th>
				<th>所属环节</th>
				<%--
				<th>任务内容</th> --%>
				<th>申请人</th>
				<th>申请部门</th>
				<th>当前办理人</th>
				<th>流程名称</th>
				<!-- <th>流程版本</th> -->
				<th>创建时间</th>
				<th>操作</th>
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
					<td>
							${fns:abbr(not
								empty vars.map.title ? vars.map.title : task.id, 60)}
						</td>
					<td><a target="_blank"
						href="${ctx}/act/task/trace/photo/${task.processDefinitionId}/${task.executionId}">${task.name}</a>
					</td>
					<td>${act.assignee}</td>
					<td>${act.assigneeName}</td>
					<td >${act.transactor}</td>
					<td>${procDef.name}</td>
					<td><fmt:formatDate value="${task.createTime}" type="both" /></td>
					<td>
						<c:if test="${empty task.assignee}">
							<a href="javascript:claim('${task.id}');" title="签收任务" class="btn btn-white btn-sm"><i class="fa  fa-institution "></i> 签收任务
								</a>
						</c:if> 
					<c:if test="${ not empty  task.assignee }">
						<a href="#" onclick="openDialog('变更任务处理人', '${ctx}/act/task/delegateTaskform?taskId=${task.id}','500px', '280px')"
										class="btn btn-white btn-sm"><i class="fa  fa-institution "></i> 变更任务处理人</a>
						<%-- <a href="${ctx}/act/task/delegateTask?taskId=${task.id}" class="btn btn-success btn-xs"></a> --%>
						<a href="${ctx}/act/task/deleteDeployment?deploymentId=${task.processInstanceId}" onclick="return confirmx('确认要结束该流程吗？流程结束后不可恢复。', this.href)" class="btn btn-danger btn-xs"><i class="fa fa-trash"></i> 结束流程</a>
						</c:if>
						<button 
						onclick='btnPNGshow("${task.processDefinitionId}/${task.executionId}");' class="btn btn-primary btn-xs"><i class="fa fa-leaf"></i> 跟踪</button>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
		<table:page page="${page}"></table:page>
	<br/>
	<br/>
	</div>
	</div>
</div>
</body>
</html>
