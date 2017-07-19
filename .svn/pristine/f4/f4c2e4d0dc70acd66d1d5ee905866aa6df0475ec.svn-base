<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>流程管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function(){
			top.$.jBox.tip.mess = null;
		});
		function updateCategory(id, category){
			$.jBox($("#categoryBox").html(), {title:"设置分类", buttons:{"关闭":true}, submit: function(){}});
			$("#categoryBoxId").val(id);
			$("#categoryBoxCategory").val(category);
		}
	</script>
	<script type="text/template" id="categoryBox">
		<form id="categoryForm" action="${ctx}/act/process/updateCategory" method="post" enctype="multipart/form-data"
			style="text-align:center;" class="form-search" onsubmit="loading('正在设置，请稍等...');"><br/>
			<input id="categoryBoxId" type="hidden" name="procDefId" value="" />
			<select id="categoryBoxCategory" name="category">
				<option value="">无分类</option>
				<c:forEach items="${fns:getDictList('act_category')}" var="dict">
					<option value="${dict.value}">${dict.label}</option>
				</c:forEach>
			</select>
			<br/><br/>　　
			<input id="categorySubmit" class="btn btn-primary" type="submit" value="   保    存   "/>　　
		</form>
	</script>
	<script type="text/javascript">		
		$(document).ready(function() {
			uiResize();
		});
		$(window).resize(function(){
			uiResize();
		});
		function uiResize() {
			//边框的高度,系数可调
			$("#mainContent").height($(window).height()-145);
			//内容的高度,系数不可调
			$("#tableContent").height($("#mainContent").height()-100);
		}
	</script>
</head>
<body class="gray-bg">
	<%-- <ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/act/process/">流程管理</a></li>
		<li><a href="${ctx}/act/process/deploy/">部署流程</a></li>
		<li><a href="${ctx}/act/process/running/">运行中的流程</a></li>
	</ul> --%>
		<!-- 查询条件 -->
<div class="wrapper wrapper-content">
<div class="ibox">
    <div class="ibox-title">
		<h5>流程管理列表 </h5>
		<!-- <div class="ibox-tools">
			<a class="collapse-link">
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
			</a>
		</div> -->
	</div>
    
    <div class="ibox-content" id="mainContent">
	<sys:message content="${message}"/> 
		<div class="row">
			<div class="col-sm-12">
				<form id="searchForm" action="${ctx}/act/process/" method="post" class="form-inline">
					<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}" />
					<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}" />
					<table:sortColumn id="orderBy" name="orderBy" value="${page.orderBy}" callback="sortOrRefresh();" />
					<!-- 支持排序 -->
					<div class="form-group">			
						<select id="category" name="category" class="selectpicker m-b" data-style="btn-inverse" data-live-search="true">
							 <option value="">流程分类</option> 
							 <c:forEach items="${fns:getDictList('act_category')}" var="dict">
								<option value="${dict.value}" ${dict.value==category?'selected':''}>${dict.label}</option>
							 </c:forEach>
						</select>
					</div>
				</form>
				<br/>
			</div>			
		</div>

<!-- 工具栏 -->
		<div class="row">
			<div class="col-sm-12">
				<div class="pull-left">
					<button class="btn btn-white btn-sm " data-toggle="tooltip"
						data-placement="left" onclick="openDialog('部署流程', '${ctx}/act/process/deploy/','800px', '250px')" title="部署流程">
						<i class="fa fa-dashboard"></i> 部署流程
					</button>	
					<button class="btn btn-white btn-sm " data-toggle="tooltip"
						data-placement="left" onclick="location.href='${ctx}/act/process/running/'" title="运行中的流程">
						<i class="fa fa-fighter-jet"></i> 运行中的流程
					</button>			
					<button class="btn btn-white btn-sm " data-toggle="tooltip"
						data-placement="left" onclick="sortOrRefresh()" title="刷新">
						<i class="glyphicon glyphicon-repeat"></i> 刷新
					</button>

				</div>
				<div class="pull-right">
					<button class="btn btn-primary btn-rounded btn-outline btn-sm "
						onclick="$('#searchForm').submit();">
						<i class="fa fa-search"></i> 查询
					</button>
					<button class="btn btn-primary btn-rounded btn-outline btn-sm "
						onclick="window.location.href='${ctx}/act/process/list'">
						<i class="fa fa-refresh"></i> 重置
					</button>
				</div>
			</div>
		</div>
		<div style="width: 100%;overflow: auto;" id="tableContent">
			<table class="table table-striped table-bordered table-hover dataTables-example dataTable no-footer myoa-table-width280">
				<thead>
					<tr>
						<th>流程分类</th>
						<th>流程ID</th>
						<th>流程标识</th>
						<th>流程名称</th>
						<th>流程版本</th>
						<th>部署时间</th>
						<th>流程XML</th>
						<th>流程图片</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${page.list}" var="object">
						<c:set var="process" value="${object[0]}" />
						<c:set var="deployment" value="${object[1]}" />
						<tr>
							<td><a href="javascript:updateCategory('${process.id}', '${process.category}')" title="设置分类">${fns:getDictLabel(process.category,'act_category','无分类')}</a></td>
							<td title="${process.id}">${process.id}</td>
							<td title="${process.key}">${process.key}</td>
							<td title="${process.name}">${process.name}</td>
							<td><b title='流程版本号'>V: ${process.version}</b></td>
							<td><fmt:formatDate value="${deployment.deploymentTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
							<td><a target="_blank" href="${ctx}/act/process/resource/read?procDefId=${process.id}&resType=xml" title="${process.resourceName}">${process.resourceName}</a></td>
							<td><a target="_blank" href="${ctx}/act/process/resource/read?procDefId=${process.id}&resType=image" title="${process.diagramResourceName}">${process.diagramResourceName}</a></td>
							<td>
								<c:if test="${process.suspended}">
									<a href="${ctx}/act/process/update/active?procDefId=${process.id}" onclick="return confirmx('确认要激活吗？', this.href)" class="btn btn-success btn-xs"><i class="fa fa-hand-grab-o"> 激活</i></a>
								</c:if>
								<c:if test="${!process.suspended}">
									<a href="${ctx}/act/process/update/suspend?procDefId=${process.id}" onclick="return confirmx('确认挂起除吗？', this.href)" class="btn btn-info btn-xs"><i class="fa fa-hand-stop-o"> 挂起</i></a>
								</c:if>
								<a href='${ctx}/act/process/delete?deploymentId=${process.deploymentId}' onclick="return confirmx('确认要删除该流程吗？', this.href)" class="btn btn-danger btn-xs"><i class="fa fa-trash"> 删除</i></a>
								<a href='${ctx}/act/process/convert/toModel?procDefId=${process.id}' onclick="return confirmx('确认要转换为模型吗？', this.href)" class="btn btn-primary btn-xs" ><i class="fa fa-hand-o-right"> 模型</i></a>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
<%-- 	<div class="pagination">${page}</div>  --%>
		
	</div>
</div>
</div>
</body>
</html>
