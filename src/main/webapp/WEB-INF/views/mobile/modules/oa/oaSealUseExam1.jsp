<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
<title>用印申请经理审核</title>
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
		<h1 class="mui-title">用印审核</h1>
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
				onclick="shoucang('${mctx}','${title}','/oa/oaSealUse/form?id=${oaSealUse.id}','协同','${oaSealUse.id}')" />
			<img src="${ctxStatic}/mobile/images/shoucang_hover.png"
				id="userimg42" <c:if test="${!shoucang}">hidden="hidden"</c:if>
				onclick="QXshoucang('${mctx}','${title}','/oa/oaSealUse/form?id=${oaSealUse.id}','协同','${oaSealUse.id}')" />
		</div>
		
		<div class="divcontent">
	<form id="inputForm" action="${ctx}/m/oa/oaSealUse/dealExam" method="post">
		<div class="divtitle">
			<span id="title">${title}</span>
		</div>	
		<input type="hidden" name="sign" value="1" /> 
		<input type="hidden" name="token" value="${token }"> 
		<input type="hidden" value="${oaSealUse.id}" name="id" /> 
		<input type="hidden" value="${oaSealUse.procInsId}" name="procInsId" />
		<input type="hidden" value="${oaSealUse.sealType}" name="sealType" />
		<input type="hidden" value="${oaSealUse.isout}" name="isout" />
		<input type="hidden" value="${oaSealUse.matter}" name="matter" />
<%-- 		<input type="hidden" value="${oaSealUse.createBy.name}" name="createBy.id" /> --%>
		<input type="hidden" value="<fmt:formatDate value="${oaSealUse.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/>" name="createDate" />
		<sys:message content="${message}" />

		<ul class="mui-table-view divcontent">
			<li class="mui-table-view-cell">
				<span>文件编号：</span>
				<span>${oaSealUse.fileId}&nbsp;</span>
			</li>
			<li class="mui-table-view-cell">
				<span>申&nbsp;&nbsp;请&nbsp;&nbsp;人：</span>
				<span>${oaSealUse.createBy.name}&nbsp;</span>
			</li>
			<li class="mui-table-view-cell">
				<span>所在部门：</span>
				<span>${oaSealUse.createBy.office.name}&nbsp;</span>
			</li>
			<li class="mui-table-view-cell">
				<span>申请日期：</span>
				<span><fmt:formatDate value="${oaSealUse.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/>&nbsp;</span>
			</li>
			<li class="mui-table-view-cell">
				<span>印章类型：</span>
				<span>${oaSealUse.sealType}&nbsp;</span>
			</li>
			<li class="mui-table-view-cell">
				<span>携带外出：</span>
				<span>${oaSealUse.isout}&nbsp;</span>
			</li>
		
			<li class="mui-table-view-cell">
				<span>摘要事项：</span>
				<span>${oaSealUse.matter}&nbsp;</span>				
			</li>
			<li class="mui-table-view-cell" id="content11"><span>经理意见：</span>
				<span style="width:60%;">
					<input type="radio" class="exam" name="exam" value="0" />同意 
					 <input type="radio" name="exam" class="exam" checked="checked" value="1" />不同意
			    </span>
			</li>
			<li class="mui-table-view-cell" id="content11"><span>经理留言：</span>
				<input type="text" name="examtext" class="inputs" maxlength="800">
			</li>
		</ul>
		
		<div class="bottom_button">
			<button type="submit" data-loading-text="提交中"
				class="bottoms btnapp btn-submit bt2 mui-btn-primary form-button">
				<span>提交审核</span>
			</button>
		</div>
		</form>
		</div>
		
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
// 			mui.init()

		</script><%-- <jsp:include page="/WEB-INF/views/mobile/modules/sys/foot.jsp"></jsp:include> --%>
		<sys:mui-datetime></sys:mui-datetime>
	</body>

</html>
