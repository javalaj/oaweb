<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
<title>用车申请经理审核</title>
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
		<h1 class="mui-title">用车审核</h1>
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
				onclick="shoucang('${mctx}','${title}','/oa/oaUsecar/form?id=${oaUsecar.id}','协同','${oaUsecar.id}')" />
			<img src="${ctxStatic}/mobile/images/shoucang_hover.png"
				id="userimg42" <c:if test="${!shoucang}">hidden="hidden"</c:if>
				onclick="QXshoucang('${mctx}','${title}','/oa/oaUsecar/form?id=${oaUsecar.id}','协同','${oaUsecar.id}')" />
		</div>

	<div class="divcontent">
	<form id="inputForm" action="${ctx}/m/oa/oaUsecar/dealExam" method="post">
		<div class="divtitle">
			<span id="title">${title}</span>
		</div>	
		<input type="hidden" name="token" value="${token }">
		<input type="hidden" value="${oaUsecar.id}" name="id"/>
		<input type="hidden" value="${oaUsecar.procInsId}" name="procInsId"/>
		<input type="hidden" value="${oaUsecar.fileId}" name="fileId"/>
		<input type="hidden" value="${oaUsecar.department}" name="department"/>
		<input type="hidden" value="${oaUsecar.createBy.id}" name="createBy.id"/>
		<input type="hidden" value="<fmt:formatDate value="${oaUsecar.usetime}" pattern="yyyy-MM-dd HH:mm:ss"/>" name="usetime"/>
		<input type="hidden" value="${oaUsecar.usereason}" name="usereason"/>
		<input type="hidden" value="${oaUsecar.destination}" name="destination"/>
		<input type="hidden" value="${oaUsecar.usescope}" name="usescope"/>
		<input type="hidden" value="${oaUsecar.examtext}" id="etext"/>

		<sys:message content="${message}" />
	
		<ul class="mui-table-view divcontent">
			<li class="mui-table-view-cell">
				<span>用车部门：</span>
				<span>${oaUsecar.department}&nbsp;</span>
			</li>
			<li class="mui-table-view-cell">
				<span>申&nbsp;&nbsp;请&nbsp;&nbsp;人：</span>
				<span>${oaUsecar.createBy.name}&nbsp;</span>
			</li>
			<li class="mui-table-view-cell">
				<span>用车时间：</span>
				<span><fmt:formatDate value="${oaUsecar.usetime}" pattern="yyyy-MM-dd HH:mm:ss"/>&nbsp;</span>
			</li>
			<li class="mui-table-view-cell">
				<span>用车原因：</span>
				<span>${oaUsecar.usereason}&nbsp;</span>
			</li>
			<li class="mui-table-view-cell">
				<span>目&nbsp;&nbsp;的&nbsp;&nbsp;地：</span>
				<span>${oaUsecar.destination}&nbsp;</span>
			</li>
			<li class="mui-table-view-cell">
				<span>用车范围：</span>
				<span>${oaUsecar.usescope}&nbsp;</span>
			</li>
			
			<li class="mui-table-view-cell" id="content11"><span>人事意见：</span>
				<span style="width:60%;">
					<input type="radio" class="exam" name="exam" value="0" />同意 
					<input type="radio" name="exam" class="exam" checked="checked" value="1" />不同意
			    </span>
			</li>
			<li class="mui-table-view-cell" id="content11">
				<span>人事留言：</span>
				<input type="text" name="examtext" id="examtext" maxlength="800" class="inputs" value="${oaUsecar.examtext}" <c:if test="${not empty oaUsecar.examtext}">disabled</c:if>>
			</li>
			
			<li class="mui-table-view-cell">
				<span>变更目的地人事留言：</span>
				<input  class="inputs" name="examtext2" id="examtext2" maxlength="800" value="${oaUsecar.examtext2}" 
				<c:if test="${empty oaUsecar.examtext}">disabled</c:if>/>
			</li>
		</ul>
		
		<div class="bottom_button">
			<button type="submit" id="tijiao" data-loading-text="提交中"
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
 			mui.init()
			
 			$("#tijiao").click(function(){
				var examtext = $("#examtext").val();//人事留言
				var examtext2 = $("#examtext2").val(); //变更目的地人事留言
				var etext = $("#etext").val(); //获取从数据库的人事留言
 				if(examtext==""){
					mui.alert('人事留言不能为空！');
					return false;
				}
				if(etext !=""){
					if(examtext2==""){
						mui.alert('变更目的地人事留言不能为空！');
						return false;
					}
				}
 				return true;
			});
		</script>
		<%-- <jsp:include page="/WEB-INF/views/mobile/modules/sys/foot.jsp"></jsp:include> --%>
	</body>

</html>