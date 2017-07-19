<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />

<link rel="stylesheet" type="text/css"
	href="${ctxStatic}/mobile/css/Base.css" />
<link rel="stylesheet" type="text/css"
	href="${ctxStatic}/mobile/css/oa.css" />
<link rel="stylesheet" href="${ctxStatic}/mobile/css/mui.css" />
<link rel="stylesheet" href="${ctxStatic}/mobile/css/oabase.css" />
<link rel="stylesheet" href="${ctxStatic}/liuxin/css/mobile.css" />
<link rel="stylesheet" type="text/css"
	href="${ctxStatic}/liuxin/css/mobile2.css" />
<script src="${ctxStatic}/mobile/js/mui.min.js"></script>
		<title>周计划打分</title>
		<style type="text/css">
.divMargin {
	margin-top: 44px;
	margin-bottom: 0;
}
</style>
	</head>
	<body>
	<header class="mui-bar mui-bar-nav">
		<a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></a>
		<h1 class="mui-title">周计划流程</h1>
	</header>
	<div class="divtable divMargin">
		<span>${officeName }： ${name }
			<br>（<fmt:formatDate value="${userWeekplan.firstdate}" pattern="yyyy-MM" />）月，第（${userWeekplan.weeksign }）周，周计划</span>
			<table class="logDeTable" border="" cellspacing="0" cellpadding="0">
					<c:forEach items="${userWeekrecord }" var="now2" varStatus="ii" >
					<tr>
						
					<td class="header"><span id="date" class="hespan">开始时间</span></td>
					<td><span id="" class="contentlog"><c:choose>
									<c:when test="${now2.beginday=='1' }">周一</c:when>
									<c:when test="${now2.beginday=='2' }">周二</c:when>
									<c:when test="${now2.beginday=='3' }">周三</c:when>
									<c:when test="${now2.beginday=='4' }">周四</c:when>
									<c:when test="${now2.beginday=='5' }">周五</c:when>
									<c:when test="${now2.beginday=='6' }">周六</c:when>
									<c:otherwise>周日</c:otherwise>
								</c:choose></span></td>
					</tr>
					<tr>
					<td class="header"><span id="date" class="hespan"> 结束时间</span></td>
					<td><span id="" class="contentlog"><c:choose>
									<c:when test="${now2.endday=='1' }">周一</c:when>
									<c:when test="${now2.endday=='2' }">周二</c:when>
									<c:when test="${now2.endday=='3' }">周三</c:when>
									<c:when test="${now2.endday=='4' }">周四</c:when>
									<c:when test="${now2.endday=='5' }">周五</c:when>
									<c:when test="${now2.endday=='6' }">周六</c:when>
									<c:otherwise>周日</c:otherwise></c:choose></span></td>
						</tr>
					<tr>
					<td class="header">
					<span id="problem" class="hespan">工作计划 </span></td>
					<td class="">
					<div class="contentlog">
					<div>${now2.content }</div>
						</div>
							</td>
						</tr>
					<tr>
					<td class="header">
					<span id="problem" class="hespan">交付物 </span></td>
					<td class="">
					<div class="contentlog">
					<div>${now2.deliverables }</div>
						</div>
							</td>
						</tr>
				<tr>
					<td class="header"><span id="date" class="hespan"> 个人权重<span style="color: red;">(1)</span></span></td>
					<td><span id="" class="contentlog">${now2.important }
					</span></td>
					</tr>
				<tr>
					<td class="header"><span id="date" class="hespan"> 进度分<span style="color: red;">(60%)</span></span></td>
					<td><span id="" class="contentlog">${now2.schedule }</span></td>
				</tr>
					<input name="wekid" value="${now2.id}" style="display: none;">			
				<tr>
				<td>
			</td>
				</tr>
</c:forEach>				
			</table>	
		</div>
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
							<c:if test="${now.histIns.activityName=='Start'}">
							开始
							</c:if>
							<c:if test="${now.histIns.activityName=='End'}">
							结束
							</c:if>
						</div>
						<div class="content_time">
							<span><fmt:formatDate value="${now.histIns.startTime}"
									pattern="yyyy.MM.dd HH:mm" /></span>
						</div>
						<div class="xinmsg" style="font-size: 1.4rem;padding-left: 10%;">${now.comment}</div>
					</div>
				</li>
			</c:forEach>
		</ul>
	</body>
	
	
	
</html>
