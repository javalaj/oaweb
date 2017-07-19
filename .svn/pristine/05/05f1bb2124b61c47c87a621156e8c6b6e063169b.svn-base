<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>工资条发送管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
	        /* laydate({
	            elem: '#beginCreateDate', //目标元素。由于laydate.js封装了一个轻量级的选择器引擎，因此elem还允许你传入class、tag但必须按照这种方式 '#id .class'
	            event: 'focus' //响应事件。如果没有传入event，则按照默认的click
	        });
	        laydate({
	            elem: '#endCreateDate', //目标元素。由于laydate.js封装了一个轻量级的选择器引擎，因此elem还允许你传入class、tag但必须按照这种方式 '#id .class'
	            event: 'focus' //响应事件。如果没有传入event，则按照默认的click
	        }); */
					
		
		
		});
	</script>
</head>
<body class="gray-bg">
	<div class="wrapper wrapper-content">
	<div class="ibox">
	<div class="ibox-title">
		<h5>工资条发送列表</h5>
		<ibox:tools/>
	</div>
	
	
	<div class="ibox-content">
	<div class="row">
		<div class="col-sm-12">
	<form:form id="searchForm" modelAttribute="oaSalaryBill" action="${ctx}/oa/salarybillsend/oaSalaryBill/" method="post" class="form-inline">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<sys:message content="${message}"/>
		
		<!--查询条件-->
		<div class="form-group">
			<span>选择上传时间段：</span>
				<input id="beginCreateDate" name="beginCreateDate" type="text" maxlength="20" class="form-control Wdate laydate-icon layer-date input-sm"
					value="<fmt:formatDate value="${oaSalaryBill.beginCreateDate}" pattern="yyyy-MM-dd"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:true});"/> - 
				<input id="endCreateDate" name="endCreateDate" type="text" maxlength="20" class="form-control Wdate laydate-icon layer-date input-sm"
					value="<fmt:formatDate value="${oaSalaryBill.endCreateDate}" pattern="yyyy-MM-dd"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:true});"/>
			
		</div>
	</form:form>
			<br/>
		</div>
	</div>
	
	<!-- 工具栏 -->
	<div class="row">
	<div class="col-sm-12">
		<div class="pull-left">
			<shiro:hasPermission name="oa:salarybillsend:oaSalaryBill:add">
				<!-- 增加按钮 -->
				<table:addRow url="${ctx}/oa/salarybillsend/oaSalaryBill/form" title="工资条发送"/>
			</shiro:hasPermission>
			<shiro:hasPermission name="oa:salarybillsend:oaSalaryBill:edit">
				<!-- 编辑按钮 -->
			    <table:editRow url="${ctx}/oa/salarybillsend/oaSalaryBill/form" title="工资条发送" id="contentTable"/>
			</shiro:hasPermission>
			<shiro:hasPermission name="oa:salarybillsend:oaSalaryBill:del">
				<!-- 删除按钮 -->
				<table:delRow url="${ctx}/oa/salarybillsend/oaSalaryBill/deleteAll" id="contentTable"/>
			</shiro:hasPermission>
			<shiro:hasPermission name="oa:salarybillsend:oaSalaryBill:import">
				<!-- 导入按钮 -->
				<%-- <table:importExcel url="${ctx}/oa/salarybillsend/oaSalaryBill/import"/> --%>
			<oa:fileImportForm actionUrl="${ctx}/oa/salarybillsend/oaSalaryBill/import" 
			buttonText=" 上传工资条" 
			templateUrl="${ctxStatic}/template/oa/salaryBill/SalaryBillTemplate.xls" 
			title="上传工资条" 
			id="oaSalaryBill"
			filePathName="file"/>
			</shiro:hasPermission>
			<shiro:hasPermission name="oa:salarybillsend:oaSalaryBill:export">
				<!-- 导出按钮 -->
	       		<table:exportExcel url="${ctx}/oa/salarybillsend/oaSalaryBill/export"/>
	       	</shiro:hasPermission>
	       <%-- 	<table:refresh/> --%>
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
				<!-- <th><input type="checkbox" class="i-checks"></th> -->
				<th  class="sort-column salaryMonth">工资月度</th>
				<th  class="sort-column successCount">总数据</th>
				<th  class="sort-column successCount">发送成功</th>
				<th  class="sort-column failCount">发送失败</th>
				<th  class="sort-column createBy.id">上传人员</th>
				<th  class="sort-column createBy.id">上传时间</th>
				<shiro:hasPermission name="oa:salarybillsend:oaSalaryBill:view"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="oaSalaryBill">
			<tr>
				<%-- <td><input type="checkbox" id="${oaSalaryBill.id}" class="i-checks"></td> --%>
				<td >
					${oaSalaryBill.salaryMonth}
				</td>
				<td >
					${oaSalaryBill.successCount + oaSalaryBill.failCount}
				</td>
				<td >
					${oaSalaryBill.successCount}
				</td>
				<td >
					${oaSalaryBill.failCount}
				</td>
				<td >
					${fns:getUserById(oaSalaryBill.createBy.id).name}
				</td>
				<td >
					<fmt:formatDate value="${oaSalaryBill.createDate}" pattern="yyyy-MM-dd"/>
				</td>
				<td>
					<shiro:hasPermission name="oa:salarybillsend:oaSalaryBill:view">
						<a href="#" onclick="openDialogView('${oaSalaryBill.salaryMonth}工资条', '${ctx}/oa/salarybillsend/oaSalaryBill/form?id=${oaSalaryBill.id}','800px', '600px')" class="btn btn-info btn-xs" ><i class="fa fa-search-plus"></i> 查看</a>
					</shiro:hasPermission>
					<shiro:hasPermission name="oa:salarybillsend:oaSalaryBill:edit">
    					<a href="#" onclick="openDialog('修改工资条发送', '${ctx}/oa/salarybillsend/oaSalaryBill/form?id=${oaSalaryBill.id}','800px', '600px')" class="btn btn-success btn-xs" ><i class="fa fa-edit"></i> 修改</a>
					</shiro:hasPermission>
					<shiro:hasPermission name="oa:salarybillsend:oaSalaryBill:del">
						<a href="${ctx}/oa/salarybillsend/oaSalaryBill/delete?id=${oaSalaryBill.id}" onclick="return confirmx('确认要删除该工资条发送吗？', this.href)"   class="btn btn-danger btn-xs"><i class="fa fa-trash"></i> 删除</a>
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