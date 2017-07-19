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
<title>加班流程</title>
<script type="text/javascript"
	src="${ctxStatic}/jquery/jquery-1.9.1.min.js"></script><link rel="stylesheet" href="${ctxStatic}/mobile/css/oabase.css" />
<link rel="stylesheet" type="text/css"
	href="${ctxStatic}/liuxin/css/mobile2.css" />
</head>
<body>
	<header class="mui-bar mui-bar-nav">
		<a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></a>
		<h1 class="mui-title">归档加班申请</h1>
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
				onclick="shoucang('${mctx}','${title}','/oa/oaOvertime/form?flag=view&id=${oaOvertime.id}','协同','${oaOvertime.id}')" />
			<img src="${ctxStatic}/mobile/images/shoucang_hover.png"
				id="userimg42" <c:if test="${!shoucang}">hidden="hidden"</c:if>
				onclick="QXshoucang('${mctx}','${title}','/oa/oaOvertime/form?flag=view&id=${oaOvertime.id}','协同','${oaOvertime.id}')" />

		</div>
		<div class="divtitle">
			<span id="title">${title}</span>
		</div>
		<div class="divcontent">
			<form action="${mctx}/oa/oaOvertime/dealFilling" method="post"
				id="inputForm">
				<input type="hidden" name="id" value="${oaOvertime.id }"> <input
					type="hidden" name="token" value="${token }"> <input
					type="hidden" name="starttime"
					value="<fmt:formatDate value="${oaOvertime.starttime}" pattern="yyyy-MM-dd HH:mm:ss"/>" />
				<input type="hidden" name="endtime"
					value="<fmt:formatDate value="${oaOvertime.endtime}" pattern="yyyy-MM-dd HH:mm:ss"/>" />

				<input type="hidden" name="procInsId"
					value="${oaOvertime.procInsId }"><input type="hidden"
					name="fileid" value="${oaOvertime.fileid }"><input
					type="hidden" name="time" value="${oaOvertime.time }"><input
					type="hidden" name="reason" value="${oaOvertime.reason }"><input
					type="hidden" name="examname" value="${oaOvertime.examname }"><input
					type="hidden" name="examtext" value="${oaOvertime.examtext }"><input
					type="hidden" name="officename" value="${oaOvertime.officename }">
				<ul class="mui-table-view divcontent">
					<li class="mui-table-view-cell" id="content11"><span>文件编号：</span>
						<span>${oaOvertime.fileid }</span></li>
					<li class="mui-table-view-cell" id="content11"><span>部门名称：</span>
						<span>${oaOvertime.officename }</span></li>
					<li class="mui-table-view-cell" id="content11"><span>申请人&emsp;：</span>
						<span>${oaOvertime.createBy.name}</span></li>
					<li class="mui-table-view-cell" id="content11"><span>申请日期：</span>
						<span><fmt:formatDate value="${oaOvertime.createDate}"
								pattern="yyyy-MM-dd" /></span></li>
					<li class="mui-table-view-cell" id="content11"><span>开始时间：</span>
						<span><fmt:formatDate value="${oaOvertime.starttime}"
								pattern="yyyy-MM-dd HH:mm:ss" /></span></li>
					<li class="mui-table-view-cell" id="content11"><span>截止时间：</span>
						<span><fmt:formatDate value="${oaOvertime.endtime}"
								pattern="yyyy-MM-dd HH:mm:ss" /></span></li>
					<li class="mui-table-view-cell" id="content11"><span>加班时长：</span>
						<span>${oaOvertime.time}</span></li>
					<li class="mui-table-view-cell" id="content11"><span>加班理由：</span>
						<span>${oaOvertime.reason }</span></li>
					<li class="mui-table-view-cell" id="content11"><span>审批意见：</span>
						<span><input type="radio" class="exam" name="exam"
							value="0" />同意 <input type="radio" name="exam" class="exam"
							checked="checked" value="1" />不同意</span></li>
					<li class="mui-table-view-cell" id="content11"><span>审批留言：</span><span>
							<input type="text" name="ftext" class="inputs">
					</span></li>
				</ul>
			</form>
		</div>
		<div class="bottom_button">
			<button type="button" data-loading-text="提交中" onclick="tijiao2()"
				class="bottoms btnapp btn-submit bt2 mui-btn-primary form-button">
				<span>提交审核</span>
			</button>
		</div>
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

		function tijiao2() {
			$("#inputForm").submit();
		}
	</script>
	<script type="text/javascript"
		src="${ctxStatic}/jquery/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="${ctxStatic}/liuxin/fn.js"></script> 
</body>
</html>