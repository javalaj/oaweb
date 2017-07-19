<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="decorator" content="default" />
<meta name="" content="no-cache" http-equiv="Pragma" />
<meta name="" content="no-cache" http-equiv="Cache-Control" />
<meta name="" content="0" http-equiv="expires" />
<meta name="viewport"
	content="width=device-width,initial-scale=1,user-scalable=no" />
<title>站内邮件</title>
<!-- css-->
<link rel="stylesheet" type="text/css"
	href="${ctxStatic}/mobile/css/mui.min.css">
<link rel="stylesheet" type="text/css"
	href="${ctxStatic}/mobile/css/oabase.css" />
<link rel="stylesheet" type="text/css"
	href="${ctxStatic}/mobile/css/oa.css" />
<!-- java-script -->
<script type="text/javascript"
	src="${ctxStatic}/jquery/jquery-1.9.1.min.js"></script>
<script src="${ctxStatic}/mobile/js/mui.min.js"></script>
<style type="text/css">
.query-form {
	margin-top: 40px;
}

.xin_btn_div {
	padding-top: 0px;
	padding-bottom: 0px;
}

.mui-scroll-wrapper {
	position: absolute;
	top: 144px;
	padding-bottom: 50px;
}

.mui-scroll ul li {
	position: relative;
	padding-left: 5px;
}

.mui-table-view-cell {
	padding-left: 15px !important;
}

.mui-scroll ul li:after {
	position: absolute;
	right: 0;
	left: 15px;
	bottom: 0;
	height: 1px;
	content: "";
	transform: scaleY(.5);
	background-color: #c8c7cc;
}

.main, .divcon {
	height: 30px;
}

.divcon>span {
	display: inline-block;
	width: 92%;
	word-break: keep-all;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
	font-size: 16px;
	color: #333;
}
</style>
<script type="text/javascript">
	mui.init()(function($) {
		$('.mui-scroll-wrapper').scroll({
			indicators : true
		//是否显示滚动条
		});
	})(mui);

	//翻页
	function page(n, s) {
		$("#pageNo").val(n);
		$("#pageSize").val(s);
		$("#searchForm").submit();
		return false;
	}

	function clear_input() {
		$("#searchForm input").val("");
	}
</script>
</head>
<body class="teamwork">
	<div class="mui-content">


		<header class="mui-bar mui-bar-nav">
			<a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></a>
			<h1 class="mui-title">站内邮件</h1>
			<a class="mui-pull-right" href="${mctx}/oa/mail/oaMail/form"><span
				class="mui-icon mui-icon-plus mui-pull-right"></span></a>
		</header>

		<div class="query-form">
			<form:form id="searchForm" modelAttribute="oaMail"
				class="search-form" action="${mctx}/oa/mail/oaMail/">
				<oa:show-message isMobile="true"></oa:show-message>
				<input id="pageNo" name="pageNo" type="hidden"
					value="${page.pageNo}" />
				<input id="pageSize" name="pageSize" type="hidden"
					value="${page.pageSize}" />
				<ul class="userinfo-edit search-edit">
					<li><label class="form-left"
						style="display: inline-block; width: 15%;">标题:</label> <input
						name="title" type="text" maxlength="255" value="${oaMail.title}"
						style="width: 80%;" /></li>
					<li><div class="bottom-button xin_btn_div">
							<button type="submit" class="btnapp btn-next"
								onclick="clear_input()" data-loading-text="取消中">重置</button>
							<button type="submit" class="btnapp btn-submit"
								data-loading-text="提交中">查询</button>
						</div></li>
				</ul>
			</form:form>
		</div>
		<div class="mui-scroll-wrapper">
			<div class="mui-scroll">
				<div>
					<ul>
						<c:forEach items="${page.list}" var="now" varStatus="status1">
							<li
								<c:choose>
						<c:when test="${now.isdraft=='0'}">onclick="location.href='${mctx}/oa/mail/oaMail/form?id=${now.id}'"</c:when>
						<c:otherwise>onclick="location.href='${mctx}/oa/mail/oaMail/view?id=${now.id}'"</c:otherwise>
					</c:choose>><input
								type="hidden" name="id" value="${now.id}">
								<div class="log-item">
									<div class="log-date">
										<span id="" class="date-span">
											<fmt:formatDate value="${now.updateDate}" pattern="yyyy-MM-dd HH:mm" />
										</span>
										<span class="state" style="padding-right: 15px;">
											<c:choose>
											<c:when test="${now.isdraft=='0'}">
												<span class="state-draft">草稿</span>
											</c:when>
											<c:when test="${now.isdraft=='2'}">
												<span class="state-auditing">处理中</span>
											</c:when>
											<c:otherwise>
												<span class="state-done">已办结</span>
											</c:otherwise>
											</c:choose>
										</span>
									</div>
									<div class="main">
										<div class="divcon" style="margin-left: 0;">
											<span class="content"> ${now.title }</span>
										</div>
									</div>
								</div></li>
						</c:forEach>
						<li class="mui-table-view-cell">
							<p>
								<table:pageMobile id="myPage" page="${page}" showPageOne="false"></table:pageMobile>
							</p>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</body>

</html>












