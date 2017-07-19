<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		<title>资质借用详细信息</title>
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
		<h1 class="mui-title">资质借用详情</h1>
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
				onclick="shoucang('${mctx}','${title}','/oa/qualificationb/oaQualificationb/form?id=${oaQualificationb.id}','协同','${oaQualificationb.id}')" />
			<img src="${ctxStatic}/mobile/images/shoucang_hover.png"
				id="userimg42" <c:if test="${!shoucang}">hidden="hidden"</c:if>
				onclick="QXshoucang('${mctx}','${title}','/oa/qualificationb/oaQualificationb/form?id=${oaQualificationb.id}','协同','${oaQualificationb.id}')" />
		</div>
	
	<div class="divcontent">
	<form id="inputForm"
		action="" method="post">
		<div class="divtitle">
			<span id="title">${title}</span>
		</div>
		
			<ul class="mui-table-view divcontent">
			<li class="mui-table-view-cell">
				<span>文件编号</span>
				<span>${oaQualificationb.fileId}&nbsp;</span>
			</li>
			<li class="mui-table-view-cell">
				<span>借&nbsp;&nbsp;用&nbsp;&nbsp;人</span>
				<span>${oaQualificationb.createBy.name}&nbsp;</span>
			</li>
			<li class="mui-table-view-cell">
				<span>所在部门：</span>
				<span>${oaQualificationb.createBy.office.name}&nbsp;</span>
			</li>
			<li class="mui-table-view-cell">
				<span>借用日期：</span>
				<span><fmt:formatDate value="${oaQualificationb.createDate}" pattern="yyyy-MM-dd HH:mm:ss" />&nbsp;</span>
			</li>
			<li class="mui-table-view-cell">
				<span>证照名称：</span>
				<span>${oaQualificationb.licensename}&nbsp;</span>
			</li>
			<li class="mui-table-view-cell">
				<span>证照类别：</span>
				<span>${oaQualificationb.type}&nbsp;</span>
			</li>
			<li class="mui-table-view-cell">
				<span>使用事由：</span>
				<span>${oaQualificationb.reason}&nbsp;</span>
			</li>
			<li class="mui-table-view-cell">
				<span>备&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;注：</span>
				<span>${oaQualificationb.remarks}&nbsp;</span>
			</li>
			<li class="mui-table-view-cell">
				<span>行政签字：</span>
				<span>${oaQualificationb.textname}&nbsp;</span>
			</li>
			<li class="mui-table-view-cell">
				<span>行政意见：</span>
				<span>${oaQualificationb.textexam}&nbsp;</span>
			</li>
			<li class="mui-table-view-cell">
				<span>归还签字：</span>
				<span>${oaQualificationb.textname1}&nbsp;</span>
			</li>
			<li class="mui-table-view-cell">
				<span>归还意见：</span>
				<span>${oaQualificationb.textexam1}&nbsp;</span>
			</li>						
		</ul>		
		</form>
		</div>	
		<act:flow-back-btn isMobile="true"></act:flow-back-btn>
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