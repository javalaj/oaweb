<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>文章管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		function viewComment(href){
			top.$.jBox.open('iframe:'+href,'查看评论',$(top.document).width()-220,$(top.document).height()-120,{
				buttons:{"关闭":true},
				loaded:function(h){
					$(".jbox-content", top.document).css("overflow-y","hidden");
					$(".nav,.form-actions,[class=btn]", h.find("iframe").contents()).hide();
					$("body", h.find("iframe").contents()).css("margin","10px");
				}
			});
			return false;
		}
		function page(n,s){
			$("#pageNo").val(n);
			$("#pageSize").val(s);
			$("#searchForm").submit();
        	return false;
        }
	</script>
</head>
<body class="gray-bg">
<%-- 	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/cms/article/?category.id=${article.category.id}">文章列表</a></li>
		<shiro:hasPermission name="cms:article:edit"><li><a href="<c:url value='${fns:getAdminPath()}/cms/article/form?id=${article.id}&category.id=${article.category.id}'><c:param name='category.name' value='${article.category.name}'/></c:url>">文章添加</a></li></shiro:hasPermission>
	</ul> --%>
<div class="wrapper wrapper-content">
<div class="ibox">
<div class="ibox-title">
		<h5>文章列表 </h5>
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
		<div class="row">
			<div class="col-sm-12">
				<form:form id="searchForm" modelAttribute="article" action="${ctx}/cms/article/" method="post" class="form-inline">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<table:sortColumn id="orderBy" name="orderBy"
						value="${page.orderBy}" callback="sortOrRefresh();" />
					<!-- 支持排序 -->
					<div class="form-group" style="width:100%">
		<label>栏目：</label><sys:treeselect id="category" name="category.id" value="${article.category.id}" labelName="category.name" labelValue="${article.category.name}"
					title="栏目" url="/cms/category/treeData" module="article" notAllowSelectRoot="false" cssClass="form-control m-b"/>
		<label  style="margin-left:3%;">标题：</label><form:input path="title" htmlEscape="false" maxlength="50" class="form-control m-b"/>&nbsp;
		<label>状态：</label><form:radiobuttons onclick="$('#searchForm').submit();" path="delFlag" items="${fns:getDictList('cms_del_flag')}" itemLabel="label" itemValue="value" htmlEscape="false" class="i-checks"/></div>
	</form:form>
				
				<br />
			</div>
		</div>
		<!-- 工具栏 -->
		<div class="row">
			<div class="col-sm-12">
				<div class="pull-left"><%-- <c:url value='${fns:getAdminPath()}/cms/article/form?id=${article.id}&category.id=${article.category.id}'><c:param name='category.name' value='${article.category.name}'/></c:url> --%>
					<shiro:hasPermission name="cms:article:add"> 
							<a href="#" onclick="openDialog('添加文章', '<c:url value='${fns:getAdminPath()}/cms/article/form?id=${article.id}&category.id=${article.category.id}'><c:param name='category.name' value='${article.category.name}'/></c:url>','800px', '700px')" class="btn btn-white btn-sm"><i class="fa fa-plus"></i>添加</a>							
						<!-- 增加按钮 -->
					</shiro:hasPermission>
					<shiro:hasPermission name="cms:article:edit">
						<table:editRow url="${ctx}/cms/article/form" id="contentTable"
							title="文章" width="800px" height="680px" ></table:editRow>
						<!-- 编辑按钮 -->
					 </shiro:hasPermission> 
					<shiro:hasPermission name="cms:article:del">
						 <table:delRow url="${ctx}/cms/article/deleteAll" id="contentTable"></table:delRow> 
						<!-- 删除按钮 -->
					</shiro:hasPermission>				
					<button class="btn btn-white btn-sm " data-toggle="tooltip"
						data-placement="left" onclick="sortOrRefresh()" title="刷新">
						<i class="glyphicon glyphicon-repeat"></i> 刷新
					</button>

				</div>
				<div class="pull-right">
					<button class="btn btn-primary btn-rounded btn-outline btn-sm "
						onclick="search()">
						<i class="fa fa-search"></i> 查询
					</button>
					<button class="btn btn-primary btn-rounded btn-outline btn-sm "
						onclick="reset()">
						<i class="fa fa-refresh"></i> 重置
					</button>
				</div>
			</div>
		</div>		
	<table id="contentTable" class="table table-striped table-bordered  table-hover table-condensed  dataTables-example dataTable no-footer">
		<thead><tr><th><input type="checkbox" class="i-checks"></th><th>栏目</th><th>标题</th><th>权重</th><th>点击数</th><th>发布者</th><th>更新时间</th><th>操作</th></tr></thead>
		<tbody>
		<c:forEach items="${page.list}" var="article">
			<tr><td><input type="checkbox" id="${article.id}" class="i-checks"></td>
				<td><a href="javascript:" onclick="$('#categoryId').val('${article.category.id}');$('#categoryName').val('${article.category.name}');$('#searchForm').submit();return false;">${article.category.name}</a></td>
				<td><a href="#" title="${article.title}" onclick="openDialogView('查看信息', '${ctx}/cms/article/form?id=${article.id}','800px', '700px')">${fns:abbr(article.title,40)}</a></td>
				<td>${article.weight}</td>
				<td>${article.hits}</td>
				<td>${article.user.name}</td>
				<td><fmt:formatDate value="${article.updateDate}" type="both"/></td>
				<td>
					<a href="${pageContext.request.contextPath}${fns:getFrontPath()}/view-${article.category.id}-${article.id}${fns:getUrlSuffix()}" target="_blank" class="btn btn-info btn-xs"><i class="fa fa-search-plus"></i>访问</a>
					
						<c:if test="${article.category.allowComment eq '1'}"><shiro:hasPermission name="cms:comment:view">
							<a href="${ctx}/cms/comment/?module=article&contentId=${article.id}&delFlag=2" onclick="return viewComment(this.href);" class="btn btn-success btn-xs"><i class="fa fa-"></i>评论</a>
						</shiro:hasPermission></c:if>
	    				<shiro:hasPermission name="cms:article:edit"><a  onclick="openDialog('修改文章', '${ctx}/cms/article/form?id=${article.id}','800px', '700px')" class="btn btn-success btn-xs"><i class="fa fa-edit"></i>修改</a>	</shiro:hasPermission>
	    				<shiro:hasPermission name="cms:article:audit">
							<a  onclick="return confirmx('确认要${article.delFlag ne 0?'发布':'删除'}该文章吗？', this.href)" 				
									class="btn btn-danger btn-xs">${article.delFlag ne 0?'<i class="fa fa-file"></i>发布':'<i class="fa fa-trash"></i>删除'}</a>
						</shiro:hasPermission>
				
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