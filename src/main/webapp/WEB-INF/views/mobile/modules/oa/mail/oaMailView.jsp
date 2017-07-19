<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="decorator" content="default" />
<meta name="viewport"
	content="width=device-width,initial-scale=1,user-scalable=no" />
<link href="${ctxStatic}/mobile/css/mui.min.css" rel="stylesheet" />
<link rel="stylesheet" type="text/css"
	href="${ctxStatic}/mobile/css/Base.css" />
<link rel="stylesheet" type="text/css"
	href="${ctxStatic}/liuxin/css/mobile2.css" />
<link rel="stylesheet" href="${ctxStatic}/mobile/css/oabase.css" />
<title>站内邮件</title>
</head>
<body>
	<header class="mui-bar mui-bar-nav">
		<a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></a>
		<h1 class="mui-title">查看站内邮件</h1>
		<c:if test="${fns:getUser().id == oaMail.createBy}">
			<a class="mui-icon mui-icon-trash mui-pull-right"
				onclick="del('${mctx}/oa/mail/oaMail/delete?id=${oaMail.id}')"></a>
		</c:if>
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
				onclick="shoucang('${mctx}','${oaMail.title}','/oa/mail/oaMail/view?id=${oaMail.id}','站内邮件','${oaMail.id}')" />
			<img src="${ctxStatic}/mobile/images/shoucang_hover.png"
				id="userimg42" <c:if test="${!shoucang}">hidden="hidden"</c:if>
				onclick="QXshoucang('${mctx}','${oaMail.title}','/oa/mail/oaMail/view?id=${oaMail.id}','站内邮件','${oaMail.id}')" />
		</div>
		<form id="inputForm" action="${mctx}/oa/mail/oaMail/dealExam"
			method="post">
			<oa:show-message isMobile="true"></oa:show-message>
			<input type="hidden" value="${oaMail.id}" name="mailId" /> <input
				type="hidden" value="${token}" name="token" />
			<ul class="mui-table-view divcontent">
				<li class="mui-table-view-cell" id="content11"><span>部门：</span>
					<span>${oaMail.createBy.office.name}</span></li>
				<li class="mui-table-view-cell" id="content21"><span>发起人：</span>
					<span>${oaMail.createBy.name}</span></li>
				<li class="mui-table-view-cell" id="content31"><span>发起时间：</span>
					<span><fmt:formatDate value="${oaMail.updateDate }"
							pattern="yyyy-MM-dd HH:mm" /></span></li>
				<li class="mui-table-view-cell" id="content1"><span>状态：</span>
					<span><c:choose>
							<c:when test="${oaMail.isdraft=='0'}">
								草稿
							</c:when>
							<c:when test="${oaMail.isdraft=='2'}">
								处理中
							</c:when>
							<c:otherwise>
								已办结
							</c:otherwise>
						</c:choose></span></li>
				<li class="mui-table-view-cell" id="content2"><span>收件人：</span>
					<span>${oaMail.mainName}</span></li>
				<li class="mui-table-view-cell" id="content3"><span>抄送：</span>
					<span>${oaMail.otherName}</span></li>
				<li class="mui-table-view-cell" id="content4"><span>标题：</span>
					<span>${oaMail.title}</span></li>

				<li class="mui-table-view-cell"><span>附件：</span> <span
					id="file"><sys:split-file-name urls="${oaMail.file}"
							id="file" isMobile="true"></sys:split-file-name></span></li>

				<li class="mui-table-view-cell" id="content6"><span>内容：</span>
					<span>${oaMail.content}</span></li>
				<c:if test="${isdeal}">
					<li class="mui-table-view-cell"><span>回复留言：</span> <textarea
							class="" name="text" rows="4"></textarea></li>
				</c:if>
			</ul>
		</form>
		<c:if test="${isdeal}">
			<div class="bottom_button">
				<button type="button" data-loading-text="提交中" onclick="tijiao()"
					class="bottoms btnapp btn-submit bt2 mui-btn-primary form-button">
					<span>提交</span>
				</button>
			</div>
		</c:if>
		<div class=""></div>

		<ul class="xinfoot">
			<c:forEach var="now" items="${list}">
				<li>
					<div class="contents_title2" style="padding-bottom: 10px;">
						<div class="content_img">
							<img src="${ctxStatic}/mobile/images/wancheng.png" alt="" />
						</div>
						<div class="content_title">
							<h3>${now.createBy.name }</h3>
							<span>${now.createBy.office.name }</span>
						</div>
						<div class="content_time">
							<span><fmt:formatDate value="${now.createDate }"
									pattern="yyyy.MM.dd HH:mm" /></span>
						</div>
						<div class="xinmsg">${now.text }</div>
					</div>
				</li>
			</c:forEach>
		</ul>
	</div>
	<script src="${ctxStatic}/mobile/frame_js/mui.min.js"></script>
	<%--<script type="text/javascript"
		src="${ctxStatic}/jquery/jquery-1.9.1.min.js"></script> --%>
	<script type="text/javascript" src="${ctxStatic}/liuxin/fn.js"></script>
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

		function tijiao() {
			$("#inputForm").submit();
		}

		/*删除确定提示框*/
		function del(url) {
			mui.confirm('确定删除该邮件？', '系统提示', [ '是', '否' ], function(e) {
				if (e.index == 0) {
					location.href = url;
				}
			})
		}
	</script>
</body>
</html>