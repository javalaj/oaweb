<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		<title>私车公用详细信息</title>
		<link href="${ctxStatic}/mobile/css/mui.min.css" rel="stylesheet" />
		<link rel="stylesheet" type="text/css" href="${ctxStatic}/mobile/css/Base.css" />
		
		<script type="text/javascript" src="${ctxStatic}/jquery/jquery-1.9.1.min.js"></script>
		<link rel="stylesheet" type="text/css" href="${ctxStatic}/liuxin/css/mobile2.css" />
		<script type="text/javascript" src="${ctxStatic}/liuxin/fn.js"></script>
		<script src="${ctxStatic}/mobile/js/mui.min.js"></script>
		<link rel="stylesheet" href="${ctxStatic}/mobile/css/oabase.css" />
	</head>
	
<body>	
	<header class="mui-bar mui-bar-nav">
		<a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></a>
		<h1 class="mui-title">私车公用审核</h1>
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
				onclick="shoucang('${mctx}','${title}','/oa/oaPublicPrivateCars/form?id=${oaPublicPrivateCars.id}','协同','${oaPublicPrivateCars.id}')" />
			<img src="${ctxStatic}/mobile/images/shoucang_hover.png"
				id="userimg42" <c:if test="${!shoucang}">hidden="hidden"</c:if>
				onclick="QXshoucang('${mctx}','${title}','/oa/oaPublicPrivateCars/form?id=${oaPublicPrivateCars.id}','协同','${oaPublicPrivateCars.id}')" />
		</div>
	
	<%-- <div class="divcontent">
	<form id="inputForm"
		action="${ctx}/m/oa/publicprivatecar/oaPublicPrivateCars/dealExam" method="post"> --%>
		<div class="divtitle">
			<span id="title">${title}</span>
		</div>

		<ul class="mui-table-view divcontent">
			<li class="mui-table-view-cell">
				<span>文件编号：</span>
				<span>${oaPublicPrivateCars.fileId}&nbsp;</span>
			</li>
			<li class="mui-table-view-cell">
				<span>申&nbsp;请&nbsp;人&nbsp;：</span>
				<span>${oaPublicPrivateCars.createBy.name}&nbsp;</span>
			</li>

			<li class="mui-table-view-cell">
				<span>所在部门：</span>
				<span>${oaPublicPrivateCars.officename}&nbsp;</span>
			</li>	

			<li class="mui-table-view-cell">
				<span>用车范围：</span>
				<span>${oaPublicPrivateCars.usescope}&nbsp;</span>
			</li>

			<li class="mui-table-view-cell">
				<span>事&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;由：</span>
				<span>${oaPublicPrivateCars.usereason}&nbsp;</span>
			</li>

			<li class="mui-table-view-cell">
				<span>起始时间：</span>
				<span><fmt:formatDate value="${oaPublicPrivateCars.starttime}" pattern="yyyy-MM-dd HH:mm:ss"/>&nbsp;</span>
			</li>

			<li class="mui-table-view-cell">
				<span>结束时间：</span>
				<span><fmt:formatDate value="${oaPublicPrivateCars.endtime}" pattern="yyyy-MM-dd HH:mm:ss"/>&nbsp;</span>
			</li>

			<li class="mui-table-view-cell">
				<span>起始公里数：</span>
				<span>${oaPublicPrivateCars.gokilometer}&nbsp;</span>
			</li>

			<li class="mui-table-view-cell">
				<span>返回公里数：</span>
				<span>${oaPublicPrivateCars.backkilometer}&nbsp;</span>
			</li>

			<li class="mui-table-view-cell">
				<span>目&nbsp;的&nbsp;地&nbsp;：</span>
				<span>${oaPublicPrivateCars.destination}&nbsp;</span>
			</li>
			
			<li class="mui-table-view-cell">
				<span>备&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;注：</span>
				<span>${oaPublicPrivateCars.remarks}&nbsp;</span>
			</li>
			
			<li class="mui-table-view-cell">
				<span>行政签名：</span>
				<span>${oaPublicPrivateCars.examname}&nbsp;</span>
			</li>
			
			<li class="mui-table-view-cell">
				<span>行政意见：</span>
				<span>${oaPublicPrivateCars.examtext}&nbsp;</span>
			</li>
			
			<li class="mui-table-view-cell">
				<span>财务签名：</span>
				<span>${oaPublicPrivateCars.examname1}&nbsp;</span>
			</li>
			
			<li class="mui-table-view-cell">
				<span>财务意见：</span>
				<span>${oaPublicPrivateCars.examtext1}&nbsp;</span>
			</li>
			<li>				
		</ul>
		<act:flow-back-btn isMobile="true"></act:flow-back-btn>
		<!-- </form>
		</div> -->
		
		<ul class="xinfoot">
			<c:forEach var="now" items="${listact}">
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
					
			function liucheng_gz() {
				location.href = "LiuCheng_XieTong.html";
			}
		</script><%-- <jsp:include page="/WEB-INF/views/mobile/modules/sys/foot.jsp"></jsp:include> --%>
		<sys:mui-datetime></sys:mui-datetime>
	</body>

</html>