<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>通告列表</title>
	<meta name="decorator" content="default"/>	
</head>
<body class="gray-bg">
	<div class="wrapper wrapper-content">
		<div class="ibox">
			<div class="ibox-title">
				<h5>${oaNotify.self?'我的通告':'我发布的通知'} </h5>
			</div> 
		    <div class="ibox-content">
			<sys:message content="${message}"/>
				<!-- 查询条件 -->
				<div class="row">
					<div class="col-sm-12">
						<form:form id="searchForm" modelAttribute="oaNotify" action="${ctx}/oa/oaNotify/selfList" method="post" class="form-inline">
							<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
							<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
							<table:sortColumn id="orderBy" name="orderBy" value="${page.orderBy}" callback="sortOrRefresh();"/><!-- 支持排序 -->
							<div class="form-group">
								<label>标题：<form:input path="title" htmlEscape="false" maxlength="200"  class=" form-control input-sm"/></label>
											
								<label>类型：
									<form:select path="type"  class="selectpicker" data-style="btn-inverse"  data-live-search="true">
										<form:option value="" label="通知类型"/>
										<form:options items="${fns:getDictList('my_notify_type')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
									</form:select>
								</label>
								<label>阅读状态：
									<form:select path="readFlag" class="selectpicker" data-style="btn-inverse"  data-live-search="true">
										<form:option value=" " label="阅读状态"/>
										<form:options items="${fns:getDictList('oa_notify_read')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
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
						<c:if test="${oaNotify.self}">
							<oa:oaStore url="${ctx}/oa/oaNotify/storeNotice" id="contentTable" tagName="通知"/><!--收藏通知  -->
						</c:if>		
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
						<th><input type="checkbox" id="allChk" class="i-checks"/>标题</th>
						<th>类型</th>
						<th>发布人</th>
						<th>查阅状态</th>
						<th>更新时间</th>			
					</tr>
				</thead>
				<tbody>
				<c:forEach items="${page.list}" var="oaNotify">
					<tr>
						<td>
							<input type="checkbox" name="subChk" value="${oaNotify.id}" id="${oaNotify.id}" class="i-checks"/>
							<c:choose>
								<c:when test="${oaNotify.files=='2'}">
								   <a href="${ctx}/oa/cyTspOaMonthlyPlan/personal?commid=${oaNotify.content}&id=${oaNotify.id}">
									 ${fns:abbr(oaNotify.title,50)}
									</a>
								</c:when>
								<c:otherwise>
									<a href="${ctx}/oa/oaNotify/${requestScope.oaNotify.self?'view':'form'}?id=${oaNotify.id}">
										${fns:abbr(oaNotify.title,50)}
									</a>
								</c:otherwise>
							</c:choose>
						</td>
						<td>
							${fns:getDictLabel(oaNotify.type, 'oa_notify_type', '')}
						</td>
						<td>${oaNotify.createBy.name}</td>
						<td>
							<c:if test="${requestScope.oaNotify.self}">
								${fns:getDictLabel(oaNotify.readFlag, 'oa_notify_read', '')}
							</c:if>
							<c:if test="${!requestScope.oaNotify.self}">
								${oaNotify.readNum} / ${oaNotify.readNum + oaNotify.unReadNum}
							</c:if>
						</td>
						<td>
							<fmt:formatDate value="${oaNotify.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
						</td>				
					</tr>
				</c:forEach>
				</tbody>
			</table>
			<!-- 分页代码 -->
			<table:page page="${page}"></table:page>
			<br/>
			<br/>
			</div>
		</div>
	</div>
</body>
</html>