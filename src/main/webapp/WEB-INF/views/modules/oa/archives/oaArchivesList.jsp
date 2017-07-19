<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>公文管理管理</title>
<meta name="decorator" content="default" />
<script type="text/javascript">
//收藏
function shoucang() {
	//自定义收藏方法
	var index = 0;
	var str = "";
	$("input[name=ids]:checked").each(
			function() {
				if (index != 0) {
					str = str + ",";
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
		location.href = "${ctx}/oa/oaArchives/store?ids="
				+ encodeURI(encodeURI(str));
	}
}

	$(document)
			.ready(
					function() {
						/* // 全选 
						$("#allChk").click(
								function() {
									$("input[name='subChk']").prop("checked",
											this.checked);
								});
						// 单选 
						var subChk = $("input[name='subChk']")
						subChk
								.click(function() {
									$("#allChk")
											.prop(
													"checked",
													subChk.length == subChk
															.filter(":checked").length ? true
															: false); 
								});
						 /* 批量删除 */
					/*	$("#del_model")
								.click(
										function() {
											// 判断是否至少选择一项 
											var checkedNum = $("input[name='subChk']:checked").length;
											if (checkedNum == 0) {
												alert("请选择至少一项！");
												return;
											} */
										
// 批量选择 
/* 
						confirmx(
								"确定要删除所选项目？",
								function() {
									var checkedList = new Array();
									$(
											"input[name='subChk']:checked")
											.each(
													function() {
														checkedList
																.push($(
																		this)
																		.val());
													});
									$
											.ajax({
												type : "POST",
												url : "${ctx}/oa/oaArchives/deletemore",
												data : {
													'delitems' : checkedList
															.toString()
												},
												success : function(
														result) {
													$(
															"[name ='subChk']:checkbox")
															.attr(
																	"checked",
																	false);
													window.location
															.reload();
												}
											});
								});

						 */
						/*编辑*/
						/* $("#edit_model")
								.click(
										function() {
											var checkLength = $("input[name='ids']:checked").length;
											var isdraft = $("#isdraft").val();
											if (checkLength > 1
													|| checkLength == 0) {
												alert('请选择一条数据进行编辑!!!');
												return;
											}
											if (isdraft != '0') {
												alert('已经提交的数据不能进行修改！！！');
												return false;
											}
											var che = [];
											$("input[name='ids']:checked")
													.each(
															function() {
																che
																		.push($(
																				this)
																				.val());
															});
											window.location = "${ctx}/oa/oaArchives/update?id="
													+ che;
										}); */
					});

	/* $(document)
			.ready(
					function() {
						// 全选 
						$("#allChk").click(
								function() {
									$("input[name='subChk']").prop("checked",
											this.checked);
								});
						// 单选 
						var subChk = $("input[name='subChk']")
						subChk
								.click(function() {
									$("#allChk")
											.prop(
													"checked",
													subChk.length == subChk
															.filter(":checked").length ? true
															: false);
								});
						/* 批量收藏 */
	/* 	$("#store")
				.click(
						function() {
							// 判断是否至少选择一项 
							var checkedNum = $("input[name='subChk']:checked").length;
							if (checkedNum == 0) {
								alert("请选择至少一项！");
								return;
							}
							// 批量选择 
							confirmx(
									"确定要收藏所选项目？",
									function() {
										var checkedList1 = new Array();
										$(
												"input[name='subChk']:checked")
												.each(
														function() {
															checkedList1
																	.push($(
																			this)
																			.val());
														});
										$
												.ajax({
													type : "POST",
													url : "${ctx}/oa/oaArchives/store",
													data : {
														'delitem' : checkedList1
																.toString()
													},
													success : function(
															result) {
														$(
																"[name ='subChk']:checkbox")
																.attr(
																		"checked",
																		false);
														window.location
																.reload();
													}
												});
									});
						});
	}); */
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
 				<h5>公司发文列表</h5>
			</div>

			<div class="ibox-content">
				<sys:message content="${message}" />


				<!-- 查询条件 -->
				<div class="row">
					<div class="col-sm-12">

						<form:form id="searchForm" modelAttribute="oaArchives"
							action="${ctx}/oa/oaArchives/list" method="post"
							class="form-inline">

							<input id="pageNo" name="pageNo" type="hidden"
								value="${page.pageNo}" />
							<input id="pageSize" name="pageSize" type="hidden"
								value="${page.pageSize}" />

							<div class="form-group">
								<span>标题：</span>
								<form:input path="title" htmlEscape="false" maxlength="255"
									class="form-control m-b" />
							</div>
						</form:form>
						<br />
					</div>
				</div>

				<div class="row">
					<div class="col-sm-12">
						<div class="pull-left">
							<a class="btn btn-white btn-sm " href="${ctx}/oa/oaArchives/form"><i
								class="glyphicon glyphicon-plus"></i> 发文起草</a>
							<%-- 			<shiro:hasPermission name="oa:oaArchives:edit"><a class="btn btn-white btn-sm " href="#" id="edit_model">修改</a></shiro:hasPermission> --%>
								<%--<table:delRow url="${ctx}/oa/oaArchives/deleteAll" id="contentTable"></table:delRow> --%>
							<table:shoucang></table:shoucang>
							<table:box_select_all id="contentTable"></table:box_select_all>
							<!-- 			<button class="btn btn-white btn-sm " data-toggle="tooltip" data-placement="left" onclick="sortOrRefresh()" title="刷新"><i class="glyphicon glyphicon-repeat"></i> 刷新</button> -->
						</div>
						<div class="pull-right">
							<button class="btn btn-primary btn-rounded btn-outline btn-sm "
								onclick="search()">
								<i class="fa fa-search"></i> 查询
							</button>
							<button class="btn btn-primary btn-rounded btn-outline btn-sm "
								onclick="window.location.href='${ctx}/oa/oaArchives/list'">
								<i class="fa fa-trash"></i> 清空
							</button>
						</div>
					</div>
				</div>

				<%-- 	<form:form id="searchForm" modelAttribute="oaArchives" action="${ctx}/oa/oaArchives/list" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		
		<ul class="ul-form">
			<li class="btns"><input id="btnedit" class="btn btn-primary" onclick="window.location.href='${ctx}/oa/oaArchives/form'"type="button" value="发文起草"/></li>
			<shiro:hasPermission name="oa:oaArchives:edit"><li class="btns"><input id="edit_model" class="btn btn-primary" type="button" value="编辑"/></li></shiro:hasPermission>
			<shiro:hasPermission name="oa:oaArchives:edit">
			<li class="btns"><input id="del_model" class="btn btn-primary"
				type="button" value="删除" /></li>
				</shiro:hasPermission>
				<shiro:hasPermission name="oa:oaArchives:edit"><li class="btns"><input id="store" class="btn btn-primary"
				type="button" value="收藏" /></li></shiro:hasPermission>	
				<li><form:input path="title" htmlEscape="false" maxlength="255" class="input-medium" placeholder="输入标题查找"/>
				<li class="btns"><input id="btnsubmit" class="btn btn-primary" type="submit" value="查询"/></li>		
		</ul>
	</form:form> --%>

				<table id="contentTable"
					class="table table-striped table-bordered table-hover table-condensed dataTables-example dataTable">
					<thead>
						<tr>
							<th><input type="checkbox" class="i-checks"></th>
							<th style="width:20%;">标题</th>
							<th>发文字号</th>
							<th>主题词</th>
							<th>状态</th>
							<th>更新时间</th>
							<td>操作</td>
							<%-- <shiro:hasPermission name="oa:oaArchives:edit"><th>操作</th></shiro:hasPermission> --%>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${page.list}" var="oaArchives">
							<tr>
								<td><c:if
										test="${oaArchives.isdraft eq 0 || oaArchives.isdraft eq 2}">
										<input type="checkbox" class="i-checks"
											value="${oaArchives.id}" id="${oaArchives.id}" name="ids">
									</c:if> <input type="hidden" value="${oaArchives.isdraft}"
									id="isdraft" /></td>
								<td><a href="#"
									onclick="javascript:location.href='${ctx}/oa/oaArchives/detail?id=${oaArchives.id}'">
										<%-- <input type="checkbox" name="subChk" value="${oaArchives.id}"/><a href="${ctx}/oa/oaArchives/form?id=${oaArchives.id}"> --%>${oaArchives.title}</a></td>
								<td>${oaArchives.code}</td>
								<td>${oaArchives.keyword}</td>
								<td><c:if test="${oaArchives.isdraft eq 0}">草稿</c:if> <c:if
										test="${oaArchives.isdraft eq 1}">审核中</c:if> <c:if
										test="${oaArchives.isdraft eq 2}">
										<c:choose>
											<c:when test="${empty oaArchives.leadText}">已作废</c:when>
											<c:otherwise>已完结</c:otherwise>
										</c:choose>
									</c:if></td>
								<td><fmt:formatDate value="${oaArchives.updateDate}"
										pattern="yyyy-MM-dd HH:mm:ss" /></td>
								<td><a href="#"
									onclick="javascript:location.href='${ctx}/oa/oaArchives/detail?id=${oaArchives.id}'"
									class="btn btn-info btn-xs"><i class="fa fa-search-plus"></i> 查看</a>
									<shiro:hasPermission name="oa:oaArchives:edit">
										<c:if test="${oaArchives.isdraft eq 0}">
											<a href="#"
												onclick="javascript:location.href='${ctx}/oa/oaArchives/update?isdraft=0&&id=${oaArchives.id}'"
												class="btn btn-success btn-xs"><i class="fa fa-edit"></i> 修改</a>
										</c:if>
									</shiro:hasPermission> <c:if
										test="${oaArchives.isdraft == '0' || (oaArchives.isdraft == '2' && empty oaArchives.leadText)}">
										<a href="#"
											onclick="xinDel('${ctx}/oa/oaArchives/delete?id=${oaArchives.id}')"
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