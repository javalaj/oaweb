<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>栏目管理</title>
	<meta name="decorator" content="default"/>
	<%@include file="/WEB-INF/views/include/treetable.jsp" %>
	<script type="text/javascript">
	$(document).ready(function() {
		$("#treeTable").treeTable({expandLevel : 1,column:1}).show();
	});
    	function updateSort() {
			loading('正在提交，请稍等...');
	    	$("#listForm").attr("action", "${ctx}/cms/category/updateSort");
	    	$("#listForm").submit();
    	}
function refresh(){//刷新
			
			window.location="${ctx}/cms/category/";
		}
	</script>
</head>
<body class="gray-bg">
	<div class="wrapper wrapper-content">
	<div class="ibox">
	<div class="ibox-title">
			<h5>栏目列表 </h5>
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
		<div class="pull-left">
			<%-- <shiro:hasPermission name="cms:category:add"> --%> 
				<table:addRow url="${ctx}/cms/category/form" title="栏目"></table:addRow><!-- 增加按钮 -->
			 <%-- </shiro:hasPermission> --%>
			<shiro:hasPermission name="cms:category:edit">
			    <table:editRow url="${ctx}/cms/category/form" id="treeTable"  title="栏目"></table:editRow><!-- 编辑按钮 -->
			</shiro:hasPermission>
			<%-- <shiro:hasPermission name="cms:category:del"> --%>
				<%-- <table:delRow url="${ctx}/cms/category/deleteAll" id="treeTable"></table:delRow> --%><!-- 删除按钮 -->
			<%-- </shiro:hasPermission>  --%>
			<%-- <shiro:hasPermission name="cms:category:updateSort">  --%>
				<button id="btnSubmit" class="btn btn-white btn-sm " data-toggle="tooltip" data-placement="left" onclick="updateSort()" title="保存排序"><i class="fa fa-save"></i> 保存排序</button>
			<%-- </shiro:hasPermission>  --%>
				<button class="btn btn-white btn-sm " data-toggle="tooltip" data-placement="left" onclick="refresh()" title="刷新"><i class="glyphicon glyphicon-repeat"></i> 刷新</button>
		
		</div>
	</div>
	</div>
	<form id="listForm" method="post">
		<table id="treeTable" class="table table-striped table-bordered table-hover table-condensed dataTables-example dataTable">
			<thead><tr><th><input type="checkbox" class="i-checks"></th><th>栏目名称</th><th>归属机构</th><th>栏目模型</th><th style="text-align:center;">排序</th><th title="是否在导航中显示该栏目">导航菜单</th><th title="是否在分类页中显示该栏目的文章列表">栏目列表</th><th>展现方式</th><th>操作</th></tr></thead>
			<tbody><c:forEach items="${list}" var="tpl">
				<tr id="${tpl.id}" pId="${tpl.parent.id ne '1'?tpl.parent.id:'0'}">
				<td> <input type="checkbox" id="${tpl.id}" class="i-checks"></td>
					<td><a href="#" onclick="openDialogView('查看栏目详情', '${ctx}/cms/category/form?id=${tpl.id}','800px', '500px')">${tpl.name}</a></td>
					<td>${tpl.office.name}</td>
					<td>${fns:getDictLabel(tpl.module, 'cms_module', '公共模型')}</td>
					<td style="text-align:center;">
						<shiro:hasPermission name="cms:category:edit">
							<input type="hidden" name="ids" value="${tpl.id}"/>
							<input name="sorts" type="text" value="${tpl.sort}" style="width:50px;margin:0;padding:0;text-align:center;">
						</shiro:hasPermission><shiro:lacksPermission name="cms:category:edit">
							${tpl.sort}
						</shiro:lacksPermission>
					</td>
					<td>${fns:getDictLabel(tpl.inMenu, 'show_hide', '隐藏')}</td>
					<td>${fns:getDictLabel(tpl.inList, 'show_hide', '隐藏')}</td>
					<td>${fns:getDictLabel(tpl.showModes, 'cms_show_modes', '默认展现方式')}</td>
					<td>
						<a href="${pageContext.request.contextPath}${fns:getFrontPath()}/list-${tpl.id}${fns:getUrlSuffix()}" class="btn btn-info btn-xs" target="_blank"><i class="fa fa-search-plus"></i>访问</a>
						<shiro:hasPermission name="cms:category:edit">
							<a href="#" onclick="openDialog('修改栏目', '${ctx}/cms/category/form?id=${tpl.id}','800px', '500px')" class="btn btn-success btn-xs" ><i class="fa fa-edit"></i>修改</a>
							<a href="${ctx}/cms/category/delete?id=${tpl.id}" onclick="return confirmx('要删除该栏目及所有子栏目项吗？', this.href)"  class="btn btn-danger btn-xs"><i class="fa fa-trash"></i>删除</a>
							<a href="#" onclick="openDialog('修改栏目', '${ctx}/cms/category/form?parent.id=${tpl.id}','800px', '500px')" class="btn btn-primary btn-xs"><i class="fa fa-plus"></i>添加下级栏目</a>
						</shiro:hasPermission>
					</td>
				</tr>
			</c:forEach></tbody>
		</table>		
	</form>
	 </div>
	</div>
	</div>
</body>
</html>