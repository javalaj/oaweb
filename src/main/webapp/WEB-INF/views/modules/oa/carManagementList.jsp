<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>车辆管理列表</title>
<meta name="decorator" content="default" />
<script type="text/javascript">
	$(document).ready(function() {
		check();
	});

	/*没有选择的时候，车辆报废，停用，启用都不能点击，选择之后可以点击*/
	function check() {
		//alert("xxx");
		//获取所有选中的复选框，存入checkedList中
		var checkedList = new Array();
		$("input[name='subChk']:checked").each(function() {
			checkedList.push($(this).val());
		});

		//获取所有复选框
		var checkArry = document.getElementsByName("subChk");

		//判断所选中的复选框有几个，进行不同操作
		if (checkedList.length == 1) {

			//报废车辆的按钮可用
// 			document.getElementById("").disabled = "";
			$("#del").removeAttr("disabled");

			//获取table
			var tableId = document.getElementById("contentTable");
			//根据表格的行数进行循环，如果复选框被选中，判断状态
			for (var i = 0; i <= tableId.rows.length; i++) {
				if ($(checkArry[i]).attr("checked") == "checked") {
					var a = tableId.rows[i + 1].cells[9].innerText.trim();
					if (a == "正常") {
						$("#stop").removeAttr("disabled");
// 						document.getElementById("stop").disabled = "";
					} else {
						$("#use").removeAttr("disabled");
// 						document.getElementById("use").disabled = "";
					}
				}
			}
		} else if (checkedList.length == 0) { //如果没有复选框被选中，按钮不可用			
			/* document.getElementById("del").disabled = "disabled"; */
			/* document.getElementById("stop").disabled = "disabled";
			document.getElementById("use").disabled = "disabled"; */
			$("#del").attr("disabled", true);
			$("#stop").attr("disabled", true);
			$("#use").attr("disabled", true);
		} else { //如果多选进行提示
			$("[name=subChk]:checkbox").prop("checked", false);
			/* document.getElementById("del").disabled = "disabled";
			document.getElementById("stop").disabled = "disabled";
			document.getElementById("use").disabled = "disabled"; */
			$("#del").attr("disabled", true);
			$("#stop").attr("disabled", true);
			$("#use").attr("disabled", true);
			alert("请选择一条数据进行操作");
		}
	}

	/*报废车辆点击事件*/
	function delCar() {
		var carid = [];
		$("input[name='subChk']:checked").each(function() {
			carid.push($(this).val());
		});
		window.location = "${ctx}/oa/carManagement/operation?id=" + carid;
	}

	/*启用车辆点击事件*/
	function useCar() {
		var carid = [];
		$("input[name='subChk']:checked").each(function() {
			carid.push($(this).val());
		});
		window.location = "${ctx}/oa/carManagement/use?id=" + carid;
	}

	/*停用车辆点击事件*/
	function stopCar() {
		var carid = [];
		$("input[name='subChk']:checked").each(function() {
			carid.push($(this).val());
		});
		window.location = "${ctx}/oa/carManagement/stop?id=" + carid;
	}

	/*点击车辆是不能选择*/
	function choosecar(){
		var checkedList = new Array();
		$("input[name='subChk']:checked").each(function() {
			checkedList.push($(this).val());
		});
		
		if (checkedList.length > 0) {
			alert("申请车辆由人事部根据车辆情况安排，谢谢");
			return false;
		}
		return true;
	}
</script>
</head>
<body class="gray-bg">
	<div class="wrapper wrapper-content">
		<div class="ibox">
			<div class="ibox-title">
				<h5>车辆管理列表</h5>				
			</div>

			<div class="ibox-content">
				<sys:message content="${message}" />

				<form:form id="searchForm" modelAttribute="carManagement"
					action="${ctx}/oa/carManagement/" method="post"
					class="breadcrumb form-search">
					<input id="pageNo" name="pageNo" type="hidden"
						value="${page.pageNo}" />
					<input id="pageSize" name="pageSize" type="hidden"
						value="${page.pageSize}" />

					<div class="row">
						<div class="col-sm-12">
							<div class="pull-left">
								<shiro:hasPermission name="oa:carManagement:edit">
<%-- 									<table:addRow url="${ctx}/oa/carManagement/form" title="车辆  "></table:addRow> --%>
									<a class="btn btn-white btn-sm " href="${ctx}/oa/carManagement/form">新增</a>
									<a class="btn btn-white btn-sm " href="#" id="del"
										onclick="delCar()">报废</a>
									<a class="btn btn-white btn-sm " href="#" id="use"
										onclick="useCar()">启用</a>
									<a class="btn btn-white btn-sm " href="#" id="stop"
										onclick="stopCar()">停用</a>
									<a class="btn btn-white btn-sm "
										href="${ctx}/oa/carManagement/list?state=0">可借</a>
									<%-- <li style="padding-left: 15px"><input id="" class="btn btn-primary" type="button" value="新增车辆" onclick="window.location.href='${ctx}/oa/carManagement/form'"/></li>			
 			<li style="padding-left: 15px"><input id="del" class="btn btn-primary" type="button" value="报废车辆" disabled="disabled" onclick="delCar()"/></li> 
			<li style="padding-left: 15px"><input id="use" class="btn btn-primary" type="button" value="启用" disabled="disabled" onclick="useCar()"/></li>
			<li style="padding-left: 15px"><input id="stop" class="btn btn-primary" type="button" value="停用" disabled="disabled" onclick="stopCar()"/></li>
			<li style="padding-left: 15px"><input id="lend" class="btn btn-primary" type="button" value="可借车辆" onclick="window.location.href='${ctx}/oa/carManagement/list?state=0'"/></li> --%>
								</shiro:hasPermission>
								<shiro:hasPermission name="oa:oaUsecar:view">
									<a class="btn btn-white btn-sm "
										href="${ctx}/oa/oaUsecar/form?createby" onclick="return choosecar()"><i class="fa fa-car" style="font-size:12px;display: inline-block;"></i> 申请用车</a>
									<%-- 			<li style="padding-left: 15px"><input class="btn btn-primary" type="button" value="申请用车" onclick="window.location.href='${ctx}/oa/oaUsecar/form?createby'"/></li> --%>
								</shiro:hasPermission>
							</div>
						</div>
					</div>

		</form:form>
				<table id="contentTable"
					class="table table-striped table-bordered  table-hover table-condensed  dataTables-example dataTable no-footer">
					<thead>
						<tr>
							<th></th>
							<th>车牌号</th>
							<th>品牌</th>
							<th>型号</th>
							<th>座位数</th>
							<th>公里数</th>
							<th>车架号</th>
							<th>行驶证号</th>
							<th>行驶证有效期</th>
							<th>车辆状态</th>
							<shiro:hasPermission name="oa:carManagement:edit">
								<th>操作</th>
							</shiro:hasPermission>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${page.list}" var="carManagement">
							<tr>
								<td><input type="checkbox" name="subChk"
									id="${carManagement.id}" class="i-checks-remove"
									value="${carManagement.id}" onclick="check()" /></td>
								<td><a href="#"
									onclick="openDialogView('查看车辆', '${ctx}/oa/carManagement/detail?id=${carManagement.id}','800px', '600px')"><i
										class="fa fa-search-plus"></i> ${carManagement.platenum} </a></td>
								<td>${fns:getDictLabel(carManagement.brand, 'brands', '')}
								</td>
								<td>${carManagement.model}</td>
								<td>${carManagement.seatnum}</td>
								<td>${carManagement.kilometers}</td>
								<td>${carManagement.framenum}</td>
								<td>${carManagement.driverlicense}</td>
								<td><fmt:formatDate value="${carManagement.dlicensedate}"
										pattern="yyyy-MM-dd" /></td>
								<td id="state">${fns:getDictLabel(carManagement.state, 'carSta', '')}
								</td>
								<shiro:hasPermission name="oa:carManagement:edit">
									<td><a href="#"
										onclick="openDialog('修改车辆', '${ctx}/oa/carManagement/update?id=${carManagement.id}','800px', '600px')"
										class="btn btn-success btn-xs"><i class="fa fa-edit"></i> 修改</a></td>
								</shiro:hasPermission>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<table:page page="${page}"></table:page>
				<br /> <br />
			</div>
		</div>
	</div>
</body>
</html>
