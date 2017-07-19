<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>收藏管理</title>
<meta name="decorator" content="default" />
<script type="text/javascript">
	$(document).ready(function() {
		if ('${msg}' != "") {
			top.layer.alert('取消收藏成功!', {
				icon : 1,
				title : '提示'
			});
		}
		/* 	$(".deleteBox").attr("checked", false);
			$(".deleteBox[value='all']").click(function() {
				if ($(this).attr("checked")) {
					$(".deleteBox").attr("checked", true);
				} else {
					$(".deleteBox").attr("checked", false);
				}
			});
			$(".deleteBox[value!='all']")
					.click(
							function() {
								if ($(".deleteBox[value='all']")
										.attr("checked")) {
									$(".deleteBox[value='all']")
											.attr("checked", false);
								}
								if ($(".deleteBox[value!='all']:checked").length == $(".deleteBox[value!='all']").length) {
									$(".deleteBox[value='all']")
											.attr("checked", true);
								}
							});
			$("#delete")
					.click(
							function() {
								var ids = "";
								$(".deleteBox")
										.each(
												function() {
													if ($(this)
															.attr(
																	"checked")
															&& $(
																	this)
																	.val() != "all") {
														ids += $(
																this)
																.val()
																+ ",";
													}
												});
								if (ids == "") {
									top.$.jBox.tip.mess = 1;
									top.$.jBox.tip("至少选择一项",
											"error", {
												persistent : true,
												opacity : 0
											});
									$("#messageBox").show();
									return false;
								}
								confirmx("确定要删除所选项目？", function() {
									location.href = $("#delete")
											.attr("name")
											+ "?ids=" + ids;
								});
								return false;
							}); */
	});
	function page(n, s) {
		$("#pageNo").val(n);
		$("#pageSize").val(s);
		$("#searchForm").submit();
		return false;
	}
	//重置 重写
	function reset() {
		window.location.href = "${ctx}/user/userFavorite/";
		return false;
	}
</script>
</head>
<body class="gray-bg">
	<div class="wrapper wrapper-content">
		<div class="ibox">
			<div class="ibox-title">
				<h5>我的收藏</h5>
			</div>


			<div class="ibox-content">

				<!-- 查询条件 -->
				<div class="row">
					<div class="col-sm-12">
						<form:form id="searchForm" modelAttribute="userFavorite"
							action="${ctx}/user/userFavorite/" method="post"
							class="form-inline">
							<input id="pageNo" name="pageNo" type="hidden"
								value="${page.pageNo}" />
							<input id="pageSize" name="pageSize" type="hidden"
								value="${page.pageSize}" />
							<table:sortColumn id="orderBy" name="orderBy"
								value="${page.orderBy}" callback="sortOrRefresh();" />
							<!-- 支持排序 -->


							<div class="form-group">
								<span>收藏的类别：</span>
								<c:forEach var="now" items="${typeNum }">
									<input type="checkbox" name="types" class="i-checks"
										value="${now.type}"
										<c:if test="${fn:contains(type,now.type)}">checked="checked"</c:if>>
									<font>${now.type}(${now.num })</font>
									&emsp;
								</c:forEach>
								<br> <span>收藏的描述：</span>
								<form:input path="title" htmlEscape="false" maxlength="64"
									class="form-control input-sm" />
							</div>
						</form:form>
					</div>
				</div>
				<br>

				<!-- 工具栏 -->
				<div class="row">
					<div class="col-sm-12">
						<div class="pull-left">
							<shiro:hasPermission name="sys:user:userFavorite:edit">
								<table:delRow url="${ctx}/user/userFavorite/delete" label="取消收藏"
									confirm_content="确认要取消收藏吗？" id="contentTable"></table:delRow>
							</shiro:hasPermission>
							<!-- 删除按钮 -->
							<%--<button class="btn btn-white btn-sm " data-toggle="tooltip"
								data-placement="left" onclick="sortOrRefresh()" title="刷新">
								<i class="glyphicon glyphicon-repeat"></i> 刷新
							</button> --%>
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





				<table id="contentTable"
					class="table table-striped table-bordered table-hover table-condensed dataTables-example dataTable">
					<thead>
						<tr>
							<th><input type="checkbox" class="i-checks" /></th>
							<th>序号</th>
							<th>收藏品的描述</th>
							<th>类别</th>
							<th>收藏的时间</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${page.list}" var="userFavorite" varStatus="i">
							<tr>
								<td><input type="checkbox" class="i-checks"
									id="${userFavorite.id }" /></td>
								<td>${i.index+1 }</td>
								<td><font>${userFavorite.title}</font></td>
								<td>${userFavorite.type }</td>
								<td><fmt:formatDate value="${userFavorite.updateDate}"
										pattern="yyyy-MM-dd HH:mm:ss" /></td>
								<td><c:if
										test="${userFavorite.url!=null && userFavorite.url!=''}">
										<a href="#"
											onclick="openDialogView('查看收藏详情', '${ctx}${userFavorite.url }','860px', '650px')"
											class="btn btn-info btn-xs"><i class="fa fa-search-plus"></i>
											查看</a>
									</c:if></td>
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