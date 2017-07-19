<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>新闻中心管理</title>
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
				<h5>文章管理</h5>
			</div>
			<div class="ibox-content">
				<div class="row">
					<div class="col-sm-12">
						<form:form id="searchForm" modelAttribute="oaNews" action="${ctx}/oa/newscenter/oaNews/" method="post" class="form-inline">
							<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
							<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
							<sys:message content="${message}"/>
							<!--查询条件-->
							<div class="form-group">
								<span>标题：</span>
									<form:input path="title" htmlEscape="false" maxlength="30"  class=" form-control"/>
								<span>栏目名称：</span>
									<form:select path="type"  class="selectpicker" data-style="btn-inverse" data-live-search="true">
										<form:option value="" label="全部"/>
										<form:options items="${fns:getNewsColumnList()}" itemLabel="columnName" itemValue="id" htmlEscape="false"/>
									</form:select>
								<span>状态：</span>
								<form:radiobuttons path="status" class="i-checks" items="${fns:getDictList('oa_news_status')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
							</div>
						</form:form>
						<br/>
					</div>
				</div>
			<!-- 工具栏 -->
			<div class="row">
				<div class="col-sm-12">
					<div class="pull-left">
						<shiro:hasPermission name="oa:newscenter:oaNews:add">
							<!-- 增加按钮 -->
							<button class="btn btn-white btn-sm"  data-toggle="tooltip" style="outline-style: none;float:left;"  
							data-placement="left" id="add" title="添加" onclick="window.location.replace('${ctx}/oa/newscenter/oaNews/form');">
							<i class="fa fa-plus"></i> 添加</button>
						</shiro:hasPermission>
						<shiro:hasPermission name="oa:newscenter:oaNews:edit">
						     <!-- 收藏按钮-->
						     <oa:oaStore url="${ctx}/oa/newscenter/oaNews/storeNews" id="contentTable" tagName="新闻"/>
						</shiro:hasPermission>
						<shiro:hasPermission name="oa:newscenter:oaNews:del">
							<!-- 删除按钮 -->
							<table:delRow url="${ctx}/oa/newscenter/oaNews/deleteAll" id="contentTable" confirm_content="确认要删除文章吗？"/>
						</shiro:hasPermission>
						<shiro:hasPermission name="oa:newscenter:oaNews:import">
							<!-- 导入按钮 -->
							<table:importExcel url="${ctx}/oa/newscenter/oaNews/import"/>
						</shiro:hasPermission>
						<shiro:hasPermission name="oa:newscenter:oaNews:export">
							<!-- 导出按钮 -->
				       		<table:exportExcel url="${ctx}/oa/newscenter/oaNews/export"/>
				       	</shiro:hasPermission>
					</div>
					<div class="pull-right">
						<table:search/>
						<table:reset/>
					</div>
				</div>
			</div>
			
			<table id="contentTable" class="table table-striped table-bordered table-hover table-condensed dataTables-example dataTable">
				<thead>
					<tr>
						<th style="width: 10px;"><input type="checkbox" class="i-checks"></th>
						<th  class="sort-column title">标题</th>
						<th  class="sort-column type">栏目名称</th>
						<th  class="sort-column pageView">浏览量</th>
						<th  class="sort-column status">状态</th>
						<th  class="sort-column createBy.id">发部人</th>
						<th  class="sort-column createDate">发布时间</th>
						<th  class="sort-column updateDate">更新时间</th>
						<shiro:hasPermission name="oa:newscenter:oaNews:view"><th>操作</th></shiro:hasPermission>
					</tr>
				</thead>
				<tbody>
				<c:forEach items="${page.list}" var="oaNews">
					<tr>
						<td><input type="checkbox" id="${oaNews.id}" class="i-checks"></td>
						<td >
							${oaNews.title}
						</a></td>
						<td >
							${fns:getOaNewsColumn(oaNews.type).columnName}
						</td>
						<td >
							${oaNews.pageView}
						</td>
						<td >
							${fns:getDictLabel(oaNews.status, 'oa_news_status', '')}
						</td>
						<td >
							${fns:getUserById(oaNews.createBy.id).name}
						</td>
						<td >
							<fmt:formatDate value="${oaNews.createDate}" pattern="yyyy-MM-dd HH:mm"/>
						</td>
						<td >
							<fmt:formatDate value="${oaNews.updateDate}" pattern="yyyy-MM-dd HH:mm"/>
						</td>
						<td>
							<shiro:hasPermission name="oa:newscenter:oaNews:edit">
		    					<a href="#" onclick="window.location.replace('${ctx}/oa/newscenter/oaNews/form?id=${oaNews.id}')" class="btn btn-success btn-xs" ><i class="fa fa-edit"></i> 修改</a>
							</shiro:hasPermission>
						</td> 
					</tr>
				</c:forEach>
				</tbody>
			</table>	
			<table:page page="${page}"/>
			<br>
			<br>
			</div>
		</div>
	</div>
</body>
</html>