<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>周计划管理</title>
<meta name="decorator" content="default" />

<link rel="stylesheet"
	href="${ctxStatic}/jquery-ztree/3.5.12/css/demo.css" type="text/css">
<link rel="stylesheet"
	href="${ctxStatic}/jquery-ztree/3.5.12/css/zTreeStyle/zTreeStyle.css"
	type="text/css">
<script type="text/javascript"
	src="${ctxStatic}/jquery-ztree/3.5.12/js/jquery.ztree.core-3.5.js"></script>


<script type="text/javascript">
	var setting = {
		view : {
			fontCss : getFont,
			nameIsHTML : true
		},
		data : {
			key : {
				title : "t"
			},
			simpleData : {
				enable : true
			}
		},
		callback : {
			onClick : onClick
		}
	};
	
	var zNodes =[
		<c:forEach var="now" items="${offices }" varStatus="i">
		<c:if test="${i.index != 0}">,</c:if>
		{
		id:"${now.id}", 
		pId:"${now.parentId}",	
		name : "${now.name}",
		value:"",
		isParent:true,
		<c:if test="${now.id == '1'}">open:true,</c:if>
		children : [ <c:forEach var="now2"
			items="${users[i.index] }" varStatus="ii"><c:if test="${ii.index != 0}">,</c:if>{
			name: "${now2.name}",
			value : "${now2.id}",
		}</c:forEach> ]
	}
	</c:forEach>
	];
	
	function getFont(treeId, node) {
		return node.font ? node.font : {};
	}

	function onClick(event, treeId, treeNode, clickFlag) {
		if(treeNode.value!="")
		{
			$("#otherUserId").val(treeNode.value);
			$("#otherUserName").val(treeNode.name);
			$("#searchForm").submit();
		}
	}


	//--//

	$(document).ready(function() {
		$.fn.zTree.init($("#treeDemo"), setting, zNodes);
		//--//
		
		//
		
		
		$("#btnSubmit").click(function() {
			$("#searchForm").attr("action", $("#formUrl").val());
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
		$("#btnSubmit2").click(function() {
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
	});
</script>
<style type="text/css">
a {
	cursor: pointor;
}

.left {
	float: left;
	width: 13%;
}

.right {
	float: left;
	width: 87%;
}

.left2 {
	float: left;
	width: 30%;
}

.right2 {
	float: left;
	width: 70%;
}

textarea {
	resize: none;
}
</style>
</head>
<body>
	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/user/userWorklog/seeOtherList"
			style="text-decoration: none;">他人日志</a></li>
	</ul>
	<div>
		<div class="left">
			<ul style="width: 100%; height: 46px; background-color: #f5f5f5;">
				<li style="text-align: center; font-size: 15px; padding-top: 12px">公司部门</li>
			</ul>
			<div id="treeDemo" class="ztree" style="padding-top: 10px"></div>
		</div>
		<div class="right">
			<form id="searchForm" action="${ctx}/user/userWeekplan/seeOtherList"
				method="post" class="breadcrumb form-search">
				<input id="pageNo" name="pageNo" type="hidden" value="1" /> <input
					id="pageSize" name="pageSize" type="hidden"
					value="${page.pageSize}" /> 用户名称：<input name="otherUserName"
					type="text" readonly="readonly" value="${otherUserName}"
					class="input-small" id="otherUserName"><input
					name="otherUserId" type="hidden" value="${otherUserId}"
					id="otherUserId" /> 选择日志日期段：<input id="querydate1"
					name="begindate" type="text" readonly="readonly" maxlength="20"
					class="input-small Wdate"
					value="<fmt:formatDate value="${begindate}" pattern="yyyy-MM-dd"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});" />&emsp;-&emsp;<input
					id="querydate2" name="enddate" type="text" readonly="readonly"
					maxlength="20" class="input-small Wdate"
					value="<fmt:formatDate value="${enddate}" pattern="yyyy-MM-dd"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});" />
				<input id="btnSubmit" class="btn btn-primary" type="submit"
					value="查看日志" /> <input id="btnSubmit2" class="btn btn-primary"
					type="submit" value="查看周计划" /><input type="hidden" id="formUrl"
					value="${ctx}/user/userWorklog/seeOtherList">&nbsp;<a
					id="btnCancel" class="btn" href="${ctx}/user/userWorklog/"
					style="text-decoration: none;">返 回</a>
			</form>
			<div>
				<div class="left2">
					<h2>${otherUserName}</h2>
					<h4>
						<fmt:formatDate value="${list1[0].plandate}" pattern="yyyy年MM月" />
					</h4>
					<hr>
					<c:if test="${userMonthsum.isdraft == '1'}">
						<font color="blue">月度总结</font>
						<br> 提交时间：<fmt:formatDate value="${userMonthsum.updateDate}"
							pattern="yyyy-MM-dd HH:mm:ss" />
						<br>
						<table>
							<thead>
								<tr>
									<td width="50px" style="border: 2px solid #DDDDDD;">序号</td>
									<td width="200px" style="border: 2px solid #DDDDDD;">完成事宜</td>
									<td width="200px" style="border: 2px solid #DDDDDD;">待处理问题</td>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${userMonthrecords}" var="now" varStatus="i">
									<tr>
										<td>${i.index+1}</td>
										<td>${now.finish }</td>
										<td>${now.unfinish }</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<hr>
					</c:if>
					<c:forEach items="${list1}" var="now1" varStatus="i">
						<c:if test="${now1.isdraft=='1' }">
							<font color="blue">第${now1.weeksign }周</font>&emsp;(开始日期：
							<fmt:formatDate value="${now1.firstdate}" pattern="yyyy-MM-dd" />)<br>
		提交时间：<fmt:formatDate value="${now1.updateDate}"
								pattern="yyyy-MM-dd HH:mm:ss" />
							<br>
							<table>
								<thead>
									<tr>
										<td width="50px" style="border: 2px solid #DDDDDD;">序号</td>
										<td width="100px" style="border: 2px solid #DDDDDD;">开始时间</td>
										<td width="100px" style="border: 2px solid #DDDDDD;">结束时间</td>
										<td width="200px" style="border: 2px solid #DDDDDD;">工作计划</td>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${list2[i.index] }" var="now2" varStatus="ii">
										<tr>
											<td>${ii.index+1 }</td>
											<td><c:choose>
													<c:when test="${now2.beginday=='1' }">周一</c:when>
													<c:when test="${now2.beginday=='2' }">周二</c:when>
													<c:when test="${now2.beginday=='3' }">周三</c:when>
													<c:when test="${now2.beginday=='4' }">周四</c:when>
													<c:when test="${now2.beginday=='5' }">周五</c:when>
													<c:when test="${now2.beginday=='6' }">周六</c:when>
													<c:otherwise>周日</c:otherwise>
												</c:choose></td>
											<td><c:choose>
													<c:when test="${now2.endday=='1' }">周一</c:when>
													<c:when test="${now2.endday=='2' }">周二</c:when>
													<c:when test="${now2.endday=='3' }">周三</c:when>
													<c:when test="${now2.endday=='4' }">周四</c:when>
													<c:when test="${now2.endday=='5' }">周五</c:when>
													<c:when test="${now2.endday=='6' }">周六</c:when>
													<c:otherwise>周日</c:otherwise>
												</c:choose></td>
											<td>${now2.content }</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							<hr>
						</c:if>
					</c:forEach>
				</div>
				<div class="right2">
					<table id="contentTable"
						class="table table-striped table-bordered table-condensed">
						<thead>
							<tr>
								<th width="75px">日期</th>
								<th><table class="table">
										<tr>
											<th width="35px" style="border-left: none;">开始</th>
											<th width="35px">结束</th>
											<th width="30px">类型</th>
											<th>工作内容</th>
											<th width="65px">解决情况</th>
											<th width="200px">问题及解决方法</th>
										</tr>
									</table></th>
								<th width="75px">提交时间</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${page.list}" var="userWorklog" varStatus="i">
								<c:if test="${userWorklog.isdraft=='1'}">
									<tr>
										<td><fmt:formatDate value="${userWorklog.workdate }"
												pattern="yyyy-MM-dd"></fmt:formatDate></td>
										<td><table style="width: 100%;" class="">
												<tbody>
													<c:forEach items="${userWorkrecords[i.index] }" var="now">


														<tr>
															<td width="35px"
																style="border-left: none; background-color: transparent;"><fmt:formatDate
																	value="${now.begintime }" pattern="HH:mm"></fmt:formatDate></td>
															<td width="35px" style="background-color: transparent;"><fmt:formatDate
																	value="${now.endtime }" pattern="HH:mm"></fmt:formatDate></td>
															<td width="30px" style="background-color: transparent;"><c:choose>
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
															<td style="background-color: transparent;"><div
																	style="width: 100%; white-space: normal;">${now.content }</div></td>
															<td width="65px" style="background-color: transparent;"><c:choose>
																	<c:when test="${now.isdone=='0'}">已解决</c:when>
																	<c:otherwise>未解决</c:otherwise>
																</c:choose></td>
															<td width="200px" style="background-color: transparent;"><div
																	style="width: 100%; white-space: normal;">${now.remarks}</div></td>
														</tr>










													</c:forEach>

												</tbody>
											</table></td>
										<td><fmt:formatDate value="${userWorklog.updateDate }"
												pattern="yyyy-MM-dd HH:mm"></fmt:formatDate></td>
									</tr>
								</c:if>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</body>
</html>