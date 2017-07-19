<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		<title>用车申请登记</title>
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
		<h1 class="mui-title">人事归档</h1>
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
	<form id="inputForm"
		action="${ctx}/m/oa/oaUsecar/dealfilling" method="post">
		<div class="divtitle">
			<span id="title">${title}</span>
		</div>
		<input type="hidden" name="token" value="${token }">
		<input type="hidden" value="${oaUsecar.id}" name="id"/>
		<input type="hidden" value="${oaUsecar.procInsId}" name="procInsId"/>
		<input type="hidden" value="${oaUsecar.fileId}" name="fileId"/>
		<input type="hidden" value="${oaUsecar.department}" name="department"/>
		<input type="hidden" value="${oaUsecar.createBy.name}" name="createBy.id"/>
		<input type="hidden" value="<fmt:formatDate value="${oaUsecar.usetime}" pattern="yyyy-MM-dd HH:mm:ss"/>" name="usetime"/>
		<input type="hidden" value="${oaUsecar.usereason}" name="usereason"/>
		<input type="hidden" value="${oaUsecar.destination}" name="destination"/>
		<input type="hidden" value="${oaUsecar.usescope}" name="usescope"/>
		<input type="hidden" value="${oaUsecar.examname}" name="examname"/>
		<input type="hidden" value="${oaUsecar.examtext}" name="examtext"/>
		<input type="hidden" value="${oaUsecar.destinationchange}" name="destinationchange"/>
		<input type="hidden" value="${oaUsecar.platenum}" name="platenum"/>
		<input type="hidden" value="${oaUsecar.driver}" name="driver"/>
		<input type="hidden" value="${oaUsecar.gokilometer}" name="gokilometer"/>
		<input type="hidden" value="${oaUsecar.safearrive}" name="safearrive"/>
		<input type="hidden" value="${oaUsecar.remarks}" name="remarks"/>
		<input type="hidden" value="<fmt:formatDate value="${oaUsecar.gotime}" pattern="yyyy-MM-dd HH:mm:ss"/>" name="gotime"/>
		<input type="hidden" value="<fmt:formatDate value="${oaUsecar.backtime}" pattern="yyyy-MM-dd HH:mm:ss"/>" name="backtime"/>
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
			<li class="mui-table-view-cell">
				<span>人事签字：</span>
				<span>${oaUsecar.examname}&nbsp;</span>
			</li>
			<li class="mui-table-view-cell">
				<span>人事留言：</span>
				<span>${oaUsecar.examtext}&nbsp;</span>
			</li>
			<li class="mui-table-view-cell">
				<span>变更目的地：</span>
				<span>${oaUsecar.destinationchange}&nbsp;</span>
			</li>
			<li class="mui-table-view-cell">
				<span>车牌号：</span>
				<span>${oaUsecar.platenum}&nbsp;</span>
			</li>
			<li class="mui-table-view-cell">
				<span>司机：</span>
				<span>${oaUsecar.driver}&nbsp;</span>
			</li>
			<li class="mui-table-view-cell">
				<span>出发时间：</span>
				<span><fmt:formatDate value="${oaUsecar.gotime}" pattern="yyyy-MM-dd HH:mm:ss"/>&nbsp;</span>
			</li>
			<li class="mui-table-view-cell">
				<span>返回时间：</span>
				<span><fmt:formatDate value="${oaUsecar.backtime}" pattern="yyyy-MM-dd HH:mm:ss"/>&nbsp;</span>
			</li>
			<li class="mui-table-view-cell">
				<span>起始公里数：</span>
				<span>${oaUsecar.gokilometer}&nbsp;</span>
			</li>
			<li class="mui-table-view-cell">
				<span>返回公里数：</span>
				<span>${oaUsecar.backkilometer}&nbsp;</span>
			</li>
			<li class="mui-table-view-cell">
				<span>安全到达：</span>
				<span>${oaUsecar.safearrive}&nbsp;</span>
			</li>
			<li class="mui-table-view-cell">
				<span>备注：</span>
				<span>${oaUsecar.remarks}&nbsp;</span>
			</li>
		
			<li class="mui-table-view-cell" id="content11">
				<span>归档人：</span>
				<span><input type="text" name="fillingName" required="required" class="inputs" value="${fillingName }"></span>
			</li>

			<li class="mui-table-view-cell" id="content11">
				<span>归档时间：</span>
				<input class="inputs" id="leftinput"  type="date" name="updateDate" required="required"
					value="<fmt:formatDate value="${oaUsecar.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>" />
			</li>
		</ul>

		<div class="bottom_button">
			<button type="submit" data-loading-text="提交中" id="tijiao"
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
				/*js控制按钮的联网请求*/
// 			mui(document.body).on('tap', '.type', function(e) {
// 				mui(this).button('loading');
// 				setTimeout(function() {
// 					mui(this).button('reset');
// 				}.bind(this), 2000);
// 			});
		</script><sys:mui-datetime></sys:mui-datetime>
	</body>

</html>