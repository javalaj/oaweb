<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!doctype html>
<html lang="zh-cn">
<head>
<meta name="decorator" content="default" />
<meta charset="utf-8">
<meta name="decorator" content="default" />
<meta name="viewport"
	content="width=device-width,initial-scale=1,user-scalable=no" />
<title>签报管理</title>
<script src="${ctxStatic}/mui-master/js/mui.min.js"></script>
<link rel="stylesheet" href="${ctxStatic}/mobile/css/mui.css" />
<link rel="stylesheet" href="${ctxStatic}/mobile/css/oabase.css" />
<link rel="stylesheet" type="text/css"
	href="${ctxStatic}/mobile/css/overwrite-mui.css" />
<style type="text/css">
.mui-scroll-wrapper {
	position: absolute;
	z-index: 2;
	top: 89px;
	bottom: 50px;
	left: 0;
	width: 100%;
}

#searchForm {
	background-color: #fff;
	margin: 0;
	padding: 0;
}

.form-left {
	width: 25%;
}

.date-li {
	width: 67% !important;
}

.mui-date[name=beginDate] {
	width: 45% !important;
}

.mui-date[name=endDate] {
	width: 45% !important;
	float: right;
}

.bottom-button {
	padding: 0 0 10px 0;
}

.mid-font {
	text-align: center;
	width: auto;
}

.mui-media-body .msg-type {
	font-size: 16px;
}

.mui-media-body .mui-pull-right {
	font-size: 14px;
}

.mui-ellipsis span {
	display: block;
}

.mui-ellipsis>span:nth-child(1) {
	display: block;
	float: left;
	width: 80%;
	overflow: hidden;
	text-overflow: ellipsis;
} 

.mui-segmented-control {
	border: 1px solid #12b7f5;
}

.mui-segmented-control .mui-control-item.mui-active {
	background-color: #12b7f5;
}

.btn-submit {
	background-color: #12b7f5;
	border: 1px solid #12b7f5;
}

.mui-segmented-control .mui-control-item {
	color: #12b7f5;
	border-color: #12b7f5;
	border-left: 1px solid #12b7f5;
}


</style>
<script type="text/javascript">
	window.onload = function() {
		mui.init();
		(function($) {
			$('.mui-scroll-wrapper').scroll({
				indicators : true
			//是否显示滚动条
			});
		})(mui);
	}
</script>

</head>

<body class="teamwork">
	<div class="mui-content">
		<div class="team-header">
			<div id="segmentedControl"
				class="mui-segmented-control mui-segmented-control-primary">
				<a class="mui-control-item mui-active" id="signlist">签报</a> <a
					class="mui-control-item" id="archiveslist">发文</a> <a
					class="mui-control-item" id="receivefilelist">收文</a>

			</div>
		</div>
		<div class="main-tit teamtask-tit">
			<span>签报管理</span> <a class="mui-pull-left" id="searchsylist"><span
				class="mui-icon mui-icon-search"></span></a>
		</div>
		<div id="query" class="mui-content" style="display: none;">
			<form:form id="searchForm" modelAttribute="act" class="search-form"
				action="${mctx}/oa/sign/oaSign/">
				<input id="pageNo" name="pageNo" type="hidden"
					value="${page.pageNo}" />
				<input id="pageSize" name="pageSize" type="hidden"
					value="${page.pageSize}" />
				<ul class="userinfo-edit search-edit">
					<li><label class="form-left">关键字:</label><input
						name="signTitile" type="text" maxlength="255" /></li>
					<li><div class="bottom-button">
							<button type="reset" class="btnapp btn-next"
								data-loading-text="取消中">重置</button>
							<button type="submit" class="btnapp btn-submit"
								data-loading-text="提交中">查询</button>
						</div></li>
				</ul>
			</form:form>
		</div>
		<div class="mui-scroll-wrapper">
			<div class=" mui-scroll">
				<ul class="mui-table-view">
					<c:forEach items="${page.list}" var="oaSign">
						<li class="mui-table-view-cell mui-media"><a href="${mctx }/oa/sign/oaSign/completelist?id=${oaSign.id}"> <!-- <div class="teamtask-icon"><img class="mui-media-object mui-pull-left" src="#" alt="协同消息" /></div> -->
								<div class="mui-media-body">
									<p style="overflow:hidden;"><span class="msg-type">${oaSign.createBy.name}</span> <span
										class="mui-pull-right"><fmt:formatDate
											value="${oaSign.createDate}" pattern="yyyy-MM-dd " /> </span></p>
									<p class="mui-ellipsis msg-title ">
										<span class="msg-pull-left">${oaSign.signTitile}</span> 
										<span class="mui-pull-right"><c:choose>
							<c:when test="${oaSign.signState == 0}">
								草稿
							</c:when>
							<c:when test="${oaSign.signState == 1 }">
							审核中
							</c:when>
							<c:when test="${oaSign.signState == 2 }">
							已办结
							</c:when>
							<c:when test="${oaSign.signState == 4 }">
							已作废
							</c:when>
							<c:otherwise>
							  审核中
							</c:otherwise>
						</c:choose></span>

									</p>
								</div>
						</a></li>
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
	<script src="${ctxStatic}/mobile/js/mui.min.js"></script>
	<script src="${ctxStatic}/mobile/js/mobile.js"></script>
	<jsp:include page="/WEB-INF/views/mobile/modules/sys/foot.jsp"></jsp:include>
	<script type="text/javascript">
		$(document)
				.ready(
						function() {

							mui.init();
							document.getElementById('searchsylist')
									.addEventListener('tap', function() {
										//点击响应逻辑  
										console.log("1");
										searchsy();
									});

							document.getElementById('signlist')
									.addEventListener('tap', function() {
										sign();
									});

							document.getElementById('archiveslist')
									.addEventListener('tap', function() {
										archives();
									});

							document.getElementById('receivefilelist')
									.addEventListener('tap', function() {
										receivefile();
									});

							function searchsy() {//97+160
								if ($("#query").css("display") == 'none') {
									//89+100
									//修改查询框宽度是160的值要改变
									$(".mui-scroll-wrapper")
											.css("top", "189px");
								} else {
									$(".mui-scroll-wrapper").css("top", "89px");
								}
								document.getElementById('query').style.display = document
										.getElementById('query').style.display == 'none' ? 'block'
										: 'none';
							}

							function sign() {
								location.href = "${mctx}/oa/sign/oaSign/";
							}
							function archives() {
								location.href = "${mctx }/oa/oaArchives/";
							}
							function receivefile() {
								location.href = "${mctx }/oa/oaReceiveFile";
							}

						});
	</script>
	<sys:mui-datetime></sys:mui-datetime>
</body>
</html>