<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>人员异动管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			
		});		
	</script>
</head>
<body class="gray-bg">
	<div class="wrapper wrapper-content">
		<div class="ibox">
			<div class="ibox-title">
				<h5><a href="${ctx}/oa/staffturnover/staffTurnover/">人员异动管理列表</a> </h5>
			</div> 
    		<div class="ibox-content">
				<sys:message content="${message}"/>
				<!-- 查询条件 -->
				<div class="row">
					<div class="col-sm-12">
						<form:form id="searchForm" modelAttribute="staffTurnover" action="${ctx}/oa/staffturnover/staffTurnover/" method="post" class="form-inline">
							<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
							<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
							<div class="form-group">
								<label>申请人：<sys:treeselect id="createBy" name="createBy.id" value="${staffTurnover.createBy.id}" 
									labelName="createBy.name" labelValue="${staffTurnover.createBy.name}" title="申请人" url="/sys/office/treeData?type=3" cssClass="form-control " allowClear="true" notAllowSelectParent="true"/>
								</label>		
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<label>异动类型：
									<form:select path="type" class="selectpicker" data-style="btn-inverse" data-live-search="true">
										<form:option value="" label="全部"/>
										<form:options items="${fns:getDictList('turnover_type')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
									</form:select>
								</label>	
							</div>
						</form:form>
						<br/>
					</div>
				</div>
					<!-- 工具栏 -->
				<div class="row">
					<div class="col-sm-12">
						<div class="pull-left">
							<a href="${ctx}/oa/staffturnover/staffTurnover/form" class="btn btn-white btn-sm"><i class="fa fa-plus"></i> 添加</a> 
						</div>
						<div class="pull-right">
							<button  class="btn btn-primary btn-rounded btn-outline btn-sm " onclick="search()" ><i class="fa fa-search"></i> 查询</button>
							<button  class="btn btn-primary btn-rounded btn-outline btn-sm " onclick="reset()" ><i class="fa fa-refresh"></i> 重置</button>
						</div>
					</div>
				</div>
				<table id="contentTable" class="table table-striped table-bordered  table-hover table-condensed  dataTables-example dataTable no-footer">
					<thead>
						<tr>
							<th>申请人</th>
							<th>职位</th>
							<th>异动类型</th>
							<th>异动后岗位</th>
							<th>审核状态</th>
							<shiro:hasPermission name="oa:staffturnover:staffTurnover:edit"><th>操作</th></shiro:hasPermission>
						</tr>
					</thead>
					<tbody>
					<c:forEach items="${page.list}" var="staffTurnover">
						<tr>
							<td>
								${staffTurnover.createBy.name}
							</td>
							<td>
								${staffTurnover.position}
							</td>
							<td>
								${fns:getDictLabel(staffTurnover.type,'turnover_type','')}
							</td>
							<td>
								${staffTurnover.postitionAfter}
							</td>
							<td>
								${fns:getDictLabel(staffTurnover.status,'ActEntity_ACT_STATUS','')}
							</td>
							<shiro:hasPermission name="oa:staffturnover:staffTurnover:edit">
								<td>
									<c:choose>
										<c:when test="${staffTurnover.status eq '2'}">
											<a href="${ctx}/oa/staffturnover/staffTurnover/form?id=${staffTurnover.id}" class="btn btn-warning btn-xs">
											<i class="fa fa-edit"></i>编辑
										</c:when>
										<c:otherwise>
											<a href="${ctx}/oa/staffturnover/staffTurnover/form?id=${staffTurnover.id}" class="btn btn-info btn-xs">
											<i class="fa fa-search-plus"></i>详情
										</c:otherwise>
									</c:choose>					
								</td>
							</shiro:hasPermission>
						</tr>
					</c:forEach>
					</tbody>
				</table>
				<table:page page="${page}"/>
				<br/>
				<br/>
			</div>
		</div>
	</div>
</body>
</html>