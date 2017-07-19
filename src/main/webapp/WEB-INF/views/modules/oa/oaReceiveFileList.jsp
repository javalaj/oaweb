<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>公司收文登记管理</title>
<meta name="decorator" content="default" />
<script type="text/javascript">
	function shoucang() {
		//自定义收藏方法
		var index = 0;
		var str = "";
		$("input[name=ids][value!=all]:checked").each(function() {
			if (index != 0) {
				str = str + ",,,";
			}
			str = str + $(this).val();
			index++;
		});
		if (str == "") {
			top.layer.alert('请至少选择一条数据!', {
				icon : 0,
				title : '警告'
			});
		} else {
			location.href = "${ctx}/oa/oaReceiveFile/xinSave?ids="
					+ encodeURI(encodeURI(str));
		}
	}

	$(document).ready(function() {

		if ("${flag}" == 'xinSave') {
			top.layer.alert('收藏成功!', {
				icon : 1,
				title : '提示'
			});
		} else if ("${flag}" == "xinDel") {
			top.layer.alert('删除成功!', {
				icon : 1,
				title : '提示'
			});
		}

		/* 	if ("${flag}" == 'xinSave') {
				top.$.jBox.tip.mess = 2;
				top.$.jBox.tip("收藏成功！", "success", {
					persistent : true,
					opacity : 0
				});
				$("#messageBox").show();
			}
			//
			if ("${flag}" == 'xinDel') {
				top.$.jBox.tip.mess = 2;
				top.$.jBox.tip("删除成功！", "success", {
					persistent : true,
					opacity : 0
				});
				$("#messageBox").show();
			}
			//
			$("input[name=ids]").attr("checked", false);
			$("input[name=ids][value='all']").click(function() {
				if ($(this).attr("checked")) {
					$("input[name=ids]").attr("checked", true);
				} else {
					$("input[name=ids]").attr("checked", false);
				}
			});
			$("input[name=ids][value!='all']")
					.click(
							function() {
								if ($(
										"input[name=ids][value='all']")
										.attr("checked")) {
									$(
											"input[name=ids][value='all']")
											.attr("checked", false);
								}
								if ($("input[name=ids][value!='all']:checked").length == $("input[name=ids][value!='all']").length) {
									$(
											"input[name=ids][value='all']")
											.attr("checked", true);
								}
							});
			//收藏
			$("#xinSave")
					.click(
							function() {
								var ids = "";
								$("input[name=ids]")
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
								confirmx("确定要收藏所选项目？", function() {
									$("#xinFlag").val("xinSave");
									$("#xinForm").submit();
								});
								return false;
							});
			 //删除
			$("#xinDel")
					.click(
							function() {
								var ids = "";
								$("input[name=ids]")
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
									$("#xinFlag").val("xinDel");
									$("#xinForm").submit();
								});
								return false;
							});
			//   */
	});
	function xinDel(url) {
		confirmx("确定删除？", function() {
			location.href = url;
		});
		return false;
	}
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
				<h5>公司收文列表</h5>
			</div>
			<div class="ibox-content">
				<!-- 查询条件 -->
				<div class="row">
					<div class="col-sm-12">

						<form:form id="searchForm" modelAttribute="oaReceiveFile"
							action="${ctx}/oa/oaReceiveFile/" method="post"
							class="form-inline">
							<input id="pageNo" name="pageNo" type="hidden"
								value="${page.pageNo}" />
							<input id="pageSize" name="pageSize" type="hidden"
								value="${page.pageSize}" />
							<table:sortColumn id="orderBy" name="orderBy"
								value="${page.orderBy}" callback="sortOrRefresh();" />
							<!-- 支持排序 -->
							<div class="form-group">
								<span>文件标题：</span>
								<form:input path="title" htmlEscape="false" maxlength="100"
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
							<%--
							<table:delRow url="${ctx}/oa/oaReceiveFile/xinDel"
								id="contentTable"></table:delRow> --%>
							<!-- 删除按钮 -->
							<table:box_select_all id="contentTable"></table:box_select_all>
							<table:shoucang></table:shoucang>
							<button class="btn btn-white btn-sm" data-toggle="tooltip"
								style="outline-style: none;" data-placement="left"
								onclick="location.href='${ctx}/oa/oaReceiveFile/form'"
								title="收文登记">
								<i class="fa fa-plus"></i> 收文登记
							</button>
							<%--
							<button class="btn btn-white btn-sm " data-toggle="tooltip"
								data-placement="left" onclick="sortOrRefresh()" title="刷新">
								<i class="glyphicon glyphicon-repeat"></i> 刷新
							</button>
						--%>

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
							<th><input type="checkbox" name="ids" class="i-checks"
								value="all" /></th>
							<th>序号</th>
							<th>收文日期</th>
							<th>文件标题</th>
							<th>字号</th>
							<th>来文单位</th>
							<th>收文字号</th>
							<th>状态</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${page.list}" var="oaReceiveFile" varStatus="i">
							<tr>
								<td><input type="checkbox" name="ids" class="i-checks"
									id="${oaReceiveFile.id}"
									value="${oaReceiveFile.id}${oaReceiveFile.title}" /></td>
								<td>${i.index+1}</td>
								<td><fmt:formatDate value="${oaReceiveFile.date}"
										pattern="yyyy-MM-dd" /></td>
								<td>${oaReceiveFile.title}</td>
								<td>${oaReceiveFile.code}</td>
								<td>${oaReceiveFile.unitname}</td>
								<td>${oaReceiveFile.unitcode}</td>
								<td><c:choose>
										<c:when test="${oaReceiveFile.isdraft=='0'}">
											<font color="red">草稿</font>
										</c:when>
										<c:when test="${oaReceiveFile.isdraft=='1'}">
											<font color="green">审核中</font>
										</c:when>
										<c:otherwise>
											<c:choose>
												<c:when test="${empty oaReceiveFile.examname}">
													<font color="black">已作废</font>
												</c:when>
												<c:otherwise>
													<font color="blue">已办结</font>
												</c:otherwise>
											</c:choose>
										</c:otherwise>
									</c:choose></td>
								<td><a
									href="${ctx}/oa/oaReceiveFile/form?id=${oaReceiveFile.id}&flag=view"
									class="btn btn-info btn-xs"><i class="fa fa-search-plus"></i>
										查看</a> <c:if test="${oaReceiveFile.isdraft=='0'}">
										<shiro:hasPermission name="oa:oaReceiveFile:edit">
											<a
												href="${ctx}/oa/oaReceiveFile/form?id=${oaReceiveFile.id}&flag=form"
												class="btn btn-success btn-xs"><i class="fa fa-edit"></i>
												修改</a>
										</shiro:hasPermission>
									</c:if> <c:if
										test="${oaReceiveFile.isdraft == '0' || (oaReceiveFile.isdraft == '2' && empty oaReceiveFile.examname)}">
										<a href="#"
											onclick="xinDel('${ctx}/oa/oaReceiveFile/xinDel?ids=${oaReceiveFile.id}')"
											class="btn btn-danger btn-xs"><i class="fa fa-trash"></i>
											删除</a>
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