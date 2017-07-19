<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>签到情况查看</title>
	<meta name="decorator" content="default"/>
	<meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=no" />
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/mui-master/dist/css/mui.min.css" />
	<script src="${ctxStatic}/mui-master/dist/js/mui.min.js"></script>
	<script>
		mui.init({
			swipeBack:true //启用右滑关闭功能
		});
	</script>
    <script type="text/javascript">
    	$(document).ready(function() {
    		$("html").removeAttr("style");
    	});
	</script>	
	<style>
		#dataTable .mui-table-view-cell p{
			font-size:16px;
		}
		#dataTable .mui-table-view-cell font{
			font-size:14px;
			padding-left: 16px;
		}
		#dataTable .mui-table-view-cell .mui-ellipsis{
			font-size:12px;
			padding-left: 16px;
		}
	</style>
</head>
<body class="mui-ios mui-ios-9 mui-ios-9-1" style="background-color: #f7f7f7;">
 	<oam:header>
 		<a class="mui-icon mui-icon-left-nav mui-pull-left" onclick="location.href='${ctx}'"></a>
		<h1 class="mui-title">签到情况查看</h1>
	</oam:header>
	<oam:message content="${message}"/>
	<oam:content>
		<oam:listView id="dataTable">
			<oam:listViewCell cellStyle="padding:15px 15px 0px 15px;background-color:#e7eaec;">
				<form:form id="searchForm" modelAttribute="oaCollectCoding" action="${mctx}/oa/coding/oaCollectCoding/" method="post">
					<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
					<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
					<oam:datePicker options='{"type":"month"}' id="searchDate" name="searchDate" value="${fns:formatDate(oaCollectCoding.searchDate,'yyyy-MM')}" onSelect="search()"/>
				</form:form>
			</oam:listViewCell>
			<c:choose>
				<c:when test="${list.size()>0}">
					<c:forEach items="${list}" var="oaCollectCoding" varStatus="status">
						<oam:listViewCell cellStyle="background-color:${oaCollectCoding.elseType=='weekend'?'#f7f7f7':(oaCollectCoding.elseType=='today'?'#dddddd':'')}">
							<p>
								<span style="color:black;padding-left:5px">
									<fmt:formatDate value="${oaCollectCoding.codingBegindate}" pattern="yyyy-MM-dd E"/>
								</span>
								<span class="mui-pull-right" style="color:${oaCollectCoding.workingType=='√'?'#8f8f94':'rgb(234, 82, 0)'}">
									${oaCollectCoding.workingType=='√'?'正常':(oaCollectCoding.workingType=='○'?'迟到':(oaCollectCoding.workingType=='●'?'早退':(oaCollectCoding.workingType=='E'?'时长不足':'-')))}
								</span>
							</p>
							<c:if test="${oaCollectCoding.workingType ne '-'}">
							<p style="font-size:14px;">
								<span class="mui-pull-left" style="padding-left:5px">
									签到：<fmt:formatDate value="${oaCollectCoding.codingBegindate}" pattern="HH:mm"/>
								</span>
								<span class="mui-pull-right" >
									签退：<fmt:formatDate value="${oaCollectCoding.codingEnddate}" pattern="HH:mm"/>
								</span>
							</p></c:if>
						</oam:listViewCell>
					</c:forEach>				
				</c:when>
				<c:otherwise>
					<oam:listViewCell>
						<p class="mui-ellipsis">暂无数据</p>
					</oam:listViewCell>
				</c:otherwise>
			</c:choose>
		</oam:listView>
	</oam:content>
</body>
</html>