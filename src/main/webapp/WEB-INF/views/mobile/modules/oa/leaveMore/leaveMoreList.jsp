<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
<link rel="stylesheet" type="text/css"
	href="${ctxStatic}/mobile/css/mui.min.css" />
<link rel="stylesheet" type="text/css"
	href="${ctxStatic}/mobile/css/oabase.css" />
<title>考勤管理</title>
<script src="${ctxStatic}/mobile/frame_js/jquery-1.7.2.js"
	type="text/javascript" charset="utf-8"></script>

<script src="${ctxStatic}/mobile/frame_js/mui.min.js"></script>
<script type="text/javascript"
	src="${ctxStatic}/jquery/jquery-1.9.1.min.js"></script>
<style type="text/css">
.kaoqin {
	background-color: #F0F0F2 !important;
}

.kaoqin .mui-scroll-wrapper {
	position: absolute;
	padding-bottom: 40px;
	top: 196px;
}

#input-form {
	padding: 11px 15px;
	background-color: #ddd;
}

#input-form input, #input-form select {
	height: 36px;
}

#input-form select {
	width: 72%;
	margin-bottom: 0;
}

.kaoqin .time {
	text-align: center;
	color: #1a81d1;
}

.title {
	margin-left: 15px;
	margin-top: 10px;
	margin-bottom: 5px;
}

.content {
	border: 1px solid #ddd;
	border-radius: 3px;
	background-color: #fff;
	margin-left: 15px;
	margin-right: 15px;
	padding: 18px 6px;
}

.content li {
	font-size: 14px;
	padding: 3px 0px;
}

.btn-submit {
	background-color: #12b7f5;
	border: 1px solid #12b7f5;
	float: right;
}

.btnapp {
	padding: 7px 18px;
}

.mui-pull-left {
	color: #12b7f5;
}

.btnapp {
	width: 23%;
}
</style>
<script type="text/javascript">
	$(function() {

		$('#scroll').scroll({
			indicators : true
		//是否显示滚动条  
		});

		mui('.mui-scroll-wrapper').scroll({
			deceleration : 0.0006
		//flick 减速系数，系数越大，滚动速度越慢，滚动距离越小，默认值0.0006  
		});

		//
		$("#btn-submit").click(function() {
			$("#queryForm").submit();
		});
	})
</script>
</head>
<body class="kaoqin">
	<header class="mui-bar mui-bar-nav header-title">
		<a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></a>
		<h1 class="mui-title">考勤管理</h1>
	</header>

	<div class="mui-content">
		<div id="input-form">
			<form action="${mctx}/oa/leaveMore/" method="post" id="queryForm">
				<div>
					<input type="text" readonly="readonly" name="querydate"
						class="mui-date"
						value="<fmt:formatDate value="${querydate }" pattern="yyyy-MM-dd" />" />
				</div>
				<div>
					<select name="officeid">
						<c:forEach items="${offices}" var="now">
							<option value="${now.id }"
								<c:if test="${now.id == officeid}">selected="selected"</c:if>>${now.name }</option>
						</c:forEach>
					</select>
					<button type="button" class="btnapp btn-submit" id="btn-submit">查询</button>
				</div>
			</form>
		</div>
		<div class="main-tit time">
			<fmt:formatDate value="${querydate }" pattern="yyyy-MM-dd" />
		</div>
		<div class="mui-scroll-wrapper">
			<div class="mui-scroll">
				<c:forEach items="${types}" var="now1" varStatus="i">
					<div>
						<div class="title">${now1}:</div>
						<div class="content">
							<ul>
								<c:forEach items="${list0[i.index]}" var="now2">
									<li>${now2.name}<c:if test="${now1=='请假'}">(${now2.type})</c:if><br>
										<fmt:formatDate value="${now2.starttime}"
											pattern="yyyy/MM/dd HH:mm" /> - <fmt:formatDate
											value="${now2.endtime}" pattern="yyyy/MM/dd HH:mm" /></li>
								</c:forEach>
							</ul>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
	<sys:mui-datetime></sys:mui-datetime>
</body>

</html>