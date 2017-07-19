<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>公文管理管理</title>
<meta name="decorator" content="default" />
<script type="text/javascript">
	//时间大小判断
	function beforeSearch() {
		if ($("#querydate1").val() != "" && $("#querydate2").val() != "") {
			var date1 = new Date($("#querydate1").val());
			var date2 = new Date($("#querydate2").val());
			if (date2 < date1) {
				top.layer.alert('开始时间不能大于结束时间!', {
					icon : 0,
					title : '警告'
				});
				return false;
			}
		}
		search();
	}
	//
	$(document).ready(function() {
		/*//
		$("#btnClean").click(function() {
			$("input[type='text']").val("");
			return false;
		}); */
	});
	function page(n, s) {
		$("#pageNo").val(n);
		$("#pageSize").val(s);
		$("#searchForm").submit();
		return false;
	}
</script>
</head>
<body class="gray-bg">
	<div class="wrapper wrapper-content">
		<div class="ibox">
			<div class="ibox-title">
				<h5>公文列表</h5>
			</div>
			<div class="ibox-content">
				<!-- 查询条件 -->
				<div class="row">
					<div class="col-sm-12">
						<form:form id="searchForm" modelAttribute="oaFileQuery"
							action="${ctx}/oa/oaFileQuery/list" method="post"
							class="form-inline">
							<input id="pageNo" name="pageNo" type="hidden"
								value="${page.pageNo}" />
							<input id="pageSize" name="pageSize" type="hidden"
								value="${page.pageSize}" />
							<table:sortColumn id="orderBy" name="orderBy"
								value="${page.orderBy}" callback="sortOrRefresh();" />
							<!-- 支持排序 -->


							<div class="form-group">
								<label>
								<span>类型：</span>
								<form:select path="type" data-style="btn-inverse" data-live-search="true" 
									class="selectpicker" items="${typeMap }"></form:select></label>
								
								<label><span>状态：</span>
								<form:select path="state" data-style="btn-inverse" data-live-search="true" 
									class="selectpicker" items="${stateMap }"></form:select></label>

								<label><span>字号：</span>
								<form:input path="code" htmlEscape="false" maxlength="64"
									class="form-control input-sm" /></label>
								<label><span>标题：</span>
								<form:input path="title" htmlEscape="false" maxlength="255"
									class="form-control input-sm" /></label>
								<label><span>发起人：</span>
								<form:input cssStyle="width:100px;" path="createName"
									htmlEscape="false" maxlength="64" class="form-control input-sm" /></label>
								<label><span>发起部门：</span>
								<form:input cssStyle="width:100px;" path="officeName"
									htmlEscape="false" maxlength="255"
									class="form-control input-sm" /></label>
								<label><span>起止日期段:</span>
								<input id="querydate1"
									name="beginDate" type="text" maxlength="20" readonly="readonly"
									class="laydate-icon form-control"
									style="background-color: #FFFFFF;"
									value="<fmt:formatDate value="${oaFileQuery.beginDate}" pattern="yyyy-MM-dd"/>"
									onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});" />
								&nbsp;&nbsp;--&nbsp;&nbsp;&nbsp;<input id="querydate2"
									name="endDate" type="text" maxlength="20" readonly="readonly"
									class="laydate-icon form-control"
									style="background-color: #FFFFFF;"
									value="<fmt:formatDate value="${oaFileQuery.endDate}" pattern="yyyy-MM-dd"/>"
									onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});" /></label>
							</div>
						</form:form>
					</div>
				</div>







				<!-- 工具栏 -->
				<div class="row">
					<div class="col-sm-12">
						<div class="pull-left">
							<%--
							<button class="btn btn-white btn-sm " data-toggle="tooltip"
								data-placement="left" onclick="sortOrRefresh()" title="刷新">
								<i class="glyphicon glyphicon-repeat"></i> 刷新
							</button>
						--%>
						</div>
						<div class="pull-right">
							<button class="btn btn-primary btn-rounded btn-outline btn-sm "
								onclick="beforeSearch()">
								<i class="fa fa-search"></i> 查询
							</button>
							<button class="btn btn-primary btn-rounded btn-outline btn-sm "
								onclick="reset()">
								<i class="fa fa-refresh"></i> 重置
							</button>
						</div>
					</div>
				</div>




				<table id="contentTable"
					class="table table-striped table-bordered table-hover table-condensed dataTables-example dataTable">
					<thead>
						<tr>
							<th>序号</th>
							<th>类型</th>
							<th>标题</th>
							<th>字号</th>
							<th>流程状态</th>
							<th>发起人</th>
							<th>发起部门</th>
							<th>发起时间</th>
							<th>当前节点</th>
							<th>当前处理人</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${page.list}" var="now" varStatus="i">
							<tr>
								<td>${i.index+1 }</td>
								<td><c:choose>
										<c:when test="${now.type=='0'}">发文</c:when>
										<c:when test="${now.type=='1'}">收文</c:when>
										<c:otherwise>签报</c:otherwise>
									</c:choose></td>
								<td>${now.title}</td>
								<td>${now.code}</td>
								<td><c:choose>
										<c:when test="${now.state=='1'}">
											<font color="green">审核中</font>
										</c:when>
										<c:otherwise>
											<font color="blue">已办结</font>
										</c:otherwise>
									</c:choose></td>
								<td>${now.createName}</td>
								<td>${now.officeName}</td>
								<td><fmt:formatDate value="${now.createDate}"
										pattern="yyyy-MM-dd" /></td>
								<td>${now.nowNode }</td>
								<td>${now.nowName}</td>
								<td><c:choose>
										<c:when test="${now.type=='0'}">



											<a href="${ctx}/oa/oaArchives/detail?id=${now.id}"
												class="btn btn-info btn-xs"><i class="fa fa-search-plus"></i>
												查看</a>


										</c:when>
										<c:when test="${now.type=='1'}">


											<a href="${ctx}/oa/oaReceiveFile/form?flag=view&id=${now.id}"
												class="btn btn-info btn-xs"><i class="fa fa-search-plus"></i>
												查看</a>

										</c:when>
										<c:otherwise>

											<a href="${ctx}/oa/sign/oaSign/completelist?id=${now.id}"
												class="btn btn-info btn-xs"><i class="fa fa-search-plus"></i>
												查看</a>


										</c:otherwise>
									</c:choose></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<!-- 分页代码 -->
				<table:page page="${page}"></table:page>
				<br /> <br />
			</div>
		</div>
	</div>
</body>
</html>