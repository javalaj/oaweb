<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>日志管理</title>
<meta name="decorator" content="default" />
<script type="text/javascript">
	//
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
		if ($("#msgflag").val() == '0') {
			//该日期日志已存在
			if ('${msg}' == "exists") {
				$("#msgflag").val('-1');
				top.layer.alert('该日期日志已经存在!', {
					icon : 2,
					title : '错误'
				});
			}
			//未来日期
			if ('${msg}' == "future") {
				$("#msgflag").val('-1');
				top.layer.alert('请勿填写未来日期的日志!', {
					icon : 2,
					title : '错误'
				});
			}
			//删除成功提示
			if ('${msg}' == "del") {
				$("#msgflag").val('-1');
				top.layer.alert('删除成功!', {
					icon : 1,
					title : '提示'
				});
			}
			//日志保存成功提示
			if ('${msg}' == "save") {
				$("#msgflag").val('-1');
				top.layer.alert('日志保存成功!', {
					icon : 1,
					title : '提示'
				});
			}
		}

		/*//
		$("#btnSubmit").click(function() {
			if ($("#querydate1").val() != "" && $("#querydate2").val() != "") {
				var date1 = new Date($("#querydate1").val());
				var date2 = new Date($("#querydate2").val());
				if (date2 < date1) {
					top.$.jBox.tip.mess = 1;
					top.$.jBox.tip("开始时间不能大于结束时间!", "error", {
						persistent : true,
						opacity : 0
					});
					$("#messageBox").show();
					return false;
				}
			}
		});
		//
		 $(".deleteBox").attr("checked", false);
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
	function deleteIds(url) {
		confirmx("确定删除？", function() {
			location.href = url;
		});
		return false;
	}
</script>
<style type="text/css">
.innerTableH {
	width: 100%;
}

.innerTableH th {
	text-align: center;
	padding: 8px;
	border-top: 0px !important;
	border-right: 0px !important;
	border-bottom: 0px !important;
	border-left: 1px;
	border-color: #E7E7E7;
	border-style: solid;
}

.innerTableB {
	width: 100%;
}

.innerTableB td {
	padding: 8px;
	border-top: 0px !important;
	border-right: 0px !important;
	border-bottom: 0px !important;
	border-left: 1px;
	border-color: #E7E7E7;
	border-style: solid;
}

.Log-content {
	padding: 0 8px;
}

.table>tbody>tr>td {
	border-top: 1px dashed #ddd;
}

.table>tbody>tr>td:last-child {
	border-bottom: 1px dashed #ddd;
}

.Log-content h5 {
	color: #35a5e7;
	font-size: 16px;
	height: 34px;
	line-height: 30px;
}

.Log-content .subtime {
	font-size: 16px;
	color: #333;
}

.Log-content .subtime span {
	font-size: 16px;
	margin-left: 10px;
}

.Log-content span {
	font-size: 14px;
	height: 30px;
	line-height: 30px;
	display: inline-block;
}

.Log-content  .font-con {
	display:block;
	font-size:14px;
	word-wrap:break-word; 
	word-break:break-all; 
	overflow: hidden;
}

.Log-content .subtime .pull-right a {
	border: none;
	background: none;
	font-size: 20px;
	color: #999;
}

.Log-content .subtime .pull-right a:hover {
	color: #35a5e7;
}
</style>
</head>
<body class="gray-bg">
	<div class="wrapper wrapper-content">
		<div class="ibox">
			<input id="msgflag" value="0" type="hidden" />
			<div class="ibox-title">
				<h5>我的日志</h5>
			</div>
			<%--
					 <shiro:hasPermission name="sys:user:userWorklog:edit">
						<a href="${ctx}/user/userWeekplan/form">计划总结</a>
					</shiro:hasPermission>
					 --%>

			<div class="ibox-content">


				<!-- 查询条件 -->
				<div class="row">
					<div class="col-sm-12">

						<form id="searchForm" action="${ctx}/user/userWorklog/listByDate"
							method="post" class="form-inline">
							<input id="pageNo" name="pageNo" type="hidden" value="1" /> <input
								id="pageSize" name="pageSize" type="hidden"
								value="${page.pageSize}" />
							<table:sortColumn id="orderBy" name="orderBy"
								value="${page.orderBy}" callback="sortOrRefresh();" />
							<!-- 支持排序 -->


							<div class="form-group">
								<span>选择日志时段：&nbsp;</span><input id="querydate1"
									name="begindate" type="text" maxlength="20" readonly="readonly"
									class="laydate-icon form-control"
									style="background-color: #FFFFFF;"
									value="<fmt:formatDate value="${begindate}" pattern="yyyy-MM-dd"/>"
									onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});" /><label>&nbsp;&nbsp;--&nbsp;&nbsp;</label><input
									id="querydate2" name="enddate" type="text" maxlength="20"
									readonly="readonly" class="laydate-icon form-control"
									style="background-color: #FFFFFF;"
									value="<fmt:formatDate value="${enddate}" pattern="yyyy-MM-dd"/>"
									onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});" />
							</div>
						</form>
						<br>
					</div>
				</div>


				<!-- 工具栏 -->
				<div class="row" style="margin-bottom: 20px;">
					<div class="col-sm-12">
						<div class="pull-left">
							<%--<shiro:hasPermission name="sys:user:userWorklog:edit">
								<table:delRow url="${ctx}/user/userWorklog/delete"
									id="contentTable"></table:delRow>
							</shiro:hasPermission> --%>
							<!-- 删除按钮 -->
							<%-- </shiro:hasPermission> --%>
							<shiro:hasPermission name="sys:user:userWorklog:edit">
								<button class="btn btn-white btn-sm" data-toggle="tooltip"
									style="outline-style: none;" data-placement="left"
									onclick="location.href='${ctx}/user/userWorklog/form'"
									title="写日志">
									<i class="fa fa-plus"></i> 写日志
								</button>
							</shiro:hasPermission>
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
					class="table table-condensed dataTables-example dataTable">
					<!-- <thead>
						<tr>
							<th><input type="checkbox" class="i-checks" /></th>
							<th style="width: 75px; text-align: center;">日期</th>
							<th><table class="innerTableH">
									<tr>
										<th style="border-left: none; width: 40px">开始</th>
										<th style="width: 40px;">结束</th>
										<th style="width: 30px;">类型</th>
										<th>工作内容</th>
										<th style="width: 60px;">解决情况</th>
										<th style="width: 200px;">问题及解决方法</th>
									</tr>
								</table></th>
							<th style="width: 60px; text-align: center;">提交状态</th>
							<th style="width: 75px; text-align: center;">提交时间</th>
							<th style="text-align: center;">操作</th>
						</tr>
					</thead> -->



					<tbody>
						<c:forEach items="${page.list}" var="userWorklog" varStatus="i">
							<tr>
								<td>
									<div class="Log-content">
									<div class="row">
										<div class="subtime">
											<fmt:formatDate value="${userWorklog.workdate }"
												pattern="yyyy-MM-dd" />
											<span> <c:choose>
													<c:when test="${userWorklog.isdraft==0}">
														<font color="red">草稿</font>
													</c:when>
													<c:otherwise>
														<font color="blue">已提交</font>
													</c:otherwise>
												</c:choose>
											</span> ${now.content }

											<div class="pull-right">
													<c:if test="${userWorklog.isdraft==0}">
														<a class="transh"<%--  href="${ctx}/user/userWorklog/form?id=${userWorklog.id}" --%>
															onclick="location.href='${ctx}/user/userWorklog/form?id=${userWorklog.id}'"
															class="<!-- btn btn-success btn-xs -->"><i
															class="fa fa-edit (alias)"></i></a>
													 </c:if> 
														<%-- <a href="${ctx}/user/userWorklog/form?id=${userWorklog.id}"
															onclick="openDialogView('查看日志详情', '${ctx}/user/userWorklog/form?id=${userWorklog.id}','80%', '80%')"
															class="btn btn-info btn-xs"><i
															class="fa fa-search-plus"></i> 查看</a> --%>
														<a href="#"
															onclick="deleteIds('${ctx}/user/userWorklog/delete?ids=${userWorklog.id}')"><i
															class="fa fa-trash"></i></a>
											</div>
										</div>
										</div>
										<div class="row">
											<div class="col-xs-6 col-sm-6">
												<h5>工作内容</h5>
												<c:forEach items="${userWorkrecords[i.index] }" var="now">
													<div>
														<span><fmt:formatDate value="${now.begintime }"
																pattern="HH:mm"></fmt:formatDate>—<fmt:formatDate
																value="${now.endtime }" pattern="HH:mm"></fmt:formatDate></span>
														<span> <c:choose>
																<c:when test="${now.type=='1'}">
																	<font color="green">请假</font>
																</c:when>
																<c:when test="${now.type=='2'}">
																	<font color="green">调休</font>
																</c:when>
																<c:when test="${now.type=='3'}">
																	<font color="green">出差</font>
																</c:when>
																<c:otherwise>上班</c:otherwise>
															</c:choose>
														</span>
														<div class="font-con">${now.content }</div>
													</div>
												</c:forEach>
											</div>
											<div class="col-xs-6 col-sm-6">
												<h5>问题及解决方案</h5>
												<c:forEach items="${userWorkrecords[i.index] }" var="now">
													<div class="font-con">${now.remarks}</div>
												</c:forEach>
											</div>
										</div>
									</div>
								</td>
							</tr>
							<%-- <tr>
								<td><input type="checkbox" class="i-checks"
									id="${userWorklog.id}" /></td>
								<td><fmt:formatDate value="${userWorklog.workdate }"
										pattern="yyyy-MM-dd" /></td>
								<td><table class="innerTableB">
										<tbody>
											<c:forEach items="${userWorkrecords[i.index] }" var="now">


												<tr>
													<td style="border-left: none; width: 40px"><fmt:formatDate
															value="${now.begintime }" pattern="HH:mm"></fmt:formatDate></td>
													<td style="width: 40px;"><fmt:formatDate
															value="${now.endtime }" pattern="HH:mm"></fmt:formatDate></td>
													<td style="width: 30px;"><c:choose>
															<c:when test="${now.type=='1'}">
																<font color="green">请假</font>
															</c:when>
															<c:when test="${now.type=='2'}">
																<font color="green">调休</font>
															</c:when>
															<c:when test="${now.type=='3'}">
																<font color="green">出差</font>
															</c:when>
															<c:otherwise>上班</c:otherwise>
														</c:choose></td>
													<td><div>${now.content }</div></td>
													<td style="width: 60px;"><c:choose>
															<c:when test="${now.isdone=='0'}">已解决</c:when>
															<c:otherwise>未解决</c:otherwise>
														</c:choose></td>
													<td style="width: 200px;"><div>${now.remarks}</div></td>
												</tr>










											</c:forEach>

										</tbody>
									</table></td>
								<td><c:choose>
										<c:when test="${userWorklog.isdraft==0}">
											<font color="red">草稿</font>
										</c:when>
										<c:otherwise>
											<font color="blue">已提交</font>
										</c:otherwise>
									</c:choose></td>
								<td><fmt:formatDate value="${userWorklog.updateDate }"
										pattern="yyyy-MM-dd HH:mm" /></td>
								<td><c:choose>
										<c:when test="${userWorklog.isdraft==0}">
											<a href="#"
												onclick="openDialog2('修改日志', '${ctx}/user/userWorklog/form?id=${userWorklog.id}','80%', '80%','存草稿,提交,关闭')"
												class="btn btn-success btn-xs"><i class="fa fa-edit"></i>
												修改</a>
										</c:when>
										<c:otherwise>
											<a href="#"
												onclick="openDialogView('查看日志详情', '${ctx}/user/userWorklog/form?id=${userWorklog.id}','80%', '80%')"
												class="btn btn-info btn-xs"><i class="fa fa-search-plus"></i>
												查看</a>
										</c:otherwise>
									</c:choose></td>
							</tr> --%>
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