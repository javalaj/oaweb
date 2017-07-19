<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width,initial-scale=1,user-scalable=no" />
<link href="${ctxStatic}/mobile/css/mui.min.css" rel="stylesheet" />
<link rel="stylesheet" type="text/css"
	href="${ctxStatic}/mobile/css/Base.css" />
<link href="${ctxStatic}/liuxin/css/mobile2.css" rel="stylesheet" />
<link rel="stylesheet" href="${ctxStatic}/mobile/css/oabase.css" />
<c:choose>
	<c:when test="${oaProVacate.vacatetype==2}">
		<title>调休流程</title>
	</c:when>
	<c:otherwise>
		<title>请假流程</title>
	</c:otherwise>
</c:choose>
</head>
<body>
	<header class="mui-bar mui-bar-nav">
		<a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></a>
		<h1 class="mui-title">查看请假/调休申请</h1>
	</header>
	<div class="mui-content">
		<div class="div1">
			<c:choose>
				<c:when test="${not empty fns:getUser().photo}">
					<img src="${fns:getUser().photo}" id="userimg" />
				</c:when>
				<c:otherwise>
					<img src="${ctxStatic}/mobile/images/touxiang.png" id="userimg" />
				</c:otherwise>
			</c:choose>
			<span id="spanname"> ${fns:getUser().name} </span> <img
				src="${ctxStatic}/mobile/images/zhuanfa.png" id="userimg3" /> <img
				<c:if test="${shoucang}">hidden="hidden"</c:if>
				src="${ctxStatic}/mobile/images/shoucang.png" id="userimg41"
				onclick="shoucang('${mctx}','${oaProVacate.vacateTitle}','/oa/coding/oaProVacate/view?id=${oaProVacate.id}','协同','${oaProVacate.id}')" />
			<img src="${ctxStatic}/mobile/images/shoucang_hover.png"
				id="userimg42" <c:if test="${!shoucang}">hidden="hidden"</c:if>
				onclick="QXshoucang('${mctx}','${oaProVacate.vacateTitle}','/oa/coding/oaProVacate/view?id=${oaProVacate.id}','协同','${oaProVacate.id}')" />

		</div>
		<div class="divtitle">
			<span id="title">${oaProVacate.vacateTitle}</span>
		</div>
		<ul class="mui-table-view divcontent">
			<li class="mui-table-view-cell"><span> 申请日期：</span> <span><fmt:formatDate
						value="${oaProVacate.applydate}" pattern="yyyy-MM-dd" /></span></li>
			<li class="mui-table-view-cell"><span> 开始时间：</span> <span><fmt:formatDate
						value="${oaProVacate.vacatebegindate}"
						pattern="yyyy-MM-dd HH:mm:ss" /></span></li>
			<li class="mui-table-view-cell"><span> 截止时间：</span> <span><fmt:formatDate
						value="${oaProVacate.vacateenddate}" pattern="yyyy-MM-dd HH:mm:ss" /></span>
			</li>
			<li class="mui-table-view-cell"><span> 请假小时：</span> <span>${oaProVacate.vacatedays}</span>
			</li>
			<li class="mui-table-view-cell"><span> 请假类型：</span> <span>${fns:getDictLabel(oaProVacate.vacatetype,
				'pro_vacate_type', '')}</span>
			</li>
			<li class="mui-table-view-cell"><span> 请假事由：</span> <span>${oaProVacate.vacatedesc}</span>
			</li>
		</ul>
		<act:flow-back-btn isMobile="true"></act:flow-back-btn>
		<ul class="xinfoot">
			<c:forEach var="now" items="${historys}">
				<li>
					<div class="contents_title2">
						<div class="content_img">
							<c:choose>
								<c:when test="${now.histIns.endTime != null}">
									<img src="${ctxStatic}/mobile/images/wancheng.png" alt="" />
								</c:when>
								<c:otherwise>
									<img src="${ctxStatic}/mobile/images/shenpizhong.png" alt="" />
								</c:otherwise>
							</c:choose>
						</div>
						<div class="content_title">
							<h3>${now.assigneeName}</h3>
							<span>${now.histIns.activityName}</span>
						</div>
						<div class="content_time">
							<span><fmt:formatDate value="${now.histIns.startTime}"
									pattern="yyyy.MM.dd HH:mm" /></span>
						</div>
						<div class="xinmsg">${now.comment}</div>
					</div>
				</li>
			</c:forEach>
		</ul>
	</div>
	<script src="${ctxStatic}/mobile/frame_js/mui.min.js"></script>
	<script type="text/javascript">
		mui.init()
		window.onload = function() {
			//show_flow_back_msg();
		}
		/*限制*/
		var textLeng = 10;
		var text = document.getElementsByClassName('spcon');
		for (var i = 0; i < text.length; i++) {
			str = text[i].innerHTML;
			if (str.length > textLeng) {
				text[i].innerHTML = str.substring(0, textLeng) + "…";
			}
		}
		/*js控制按钮的联网请求*/
		mui(document.body).on('tap', '.mui-btn', function(e) {
			mui(this).button('loading');
			setTimeout(function() {
				mui(this).button('reset');
			}.bind(this), 2000);
		});
		(function($) {
			$('#scroll').scroll({
				indicators : true
			//是否显示滚动条
			});
		})(mui);

		function xiangqing() {
			location.href = "NewSynergy.html";

		}
	</script>
	<script type="text/javascript"
		src="${ctxStatic}/jquery/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="${ctxStatic}/liuxin/fn.js"></script>
</body>
</html>