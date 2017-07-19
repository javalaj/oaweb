<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>

	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		<link rel="stylesheet" type="text/css" href="${ctxStatic}/mobile/css/mui.min.css" />
		<link rel="stylesheet" type="text/css" href="${ctxStatic}/mobile/css/oaBase.css" />
		
		<title>公司新闻</title>
		<style type="text/css">
			.oa-newsview-page,
			.oa-newsview-page .mui-content {
				background-color: #fff;
			}
			.oa-newsview-page .oa-newstitle-area {
				margin: 10px 15px;
				border-bottom: 1px solid #ddd;
			}
			.oa-newsview-page .oa-newstitle-area h4 {
				line-height: 30px;
				margin-bottom: 15px;
			}
			.oa-newstitle-area p span:first-child {
				margin-right: 25px;	
			}
			.oa-newstitle-area > p {
				margin-bottom: 5px;
			}
			.oa-news-author {
				color: #12b7f5;
			}
			.oa-newscontent > p {
				padding: 10px 15px 0 15px;
				font-size: 16px;
			}
			.oa-newscontent > p > img {
				width: 100%;
			}
		</style>
		
	</head>

<script type="text/javascript">
function goBack(){
	
	var strUrl=document.referrer;
	
	var arrObj=strUrl.split("//");
	var start=arrObj[1].indexOf("/");
	var end=arrObj[1].indexOf(";");
	var newurl=arrObj[1].substring(start);
	if(end>0){
		var newurl=arrObj[1].substring(start,end);
		}
	
	window.location.replace(newurl);
}
</script>
<body class="oa-newsview-page">
	<header class="mui-bar mui-bar-nav">
		<a class="mui-icon mui-icon-left-nav mui-pull-left" href="javascript:void(0);" onclick="goBack();"></a>
		<h1 class="mui-title">查看新闻详情</h1>
	</header>
	<div class="mui-content">
		<div class="oa-newstitle-area">
			<h4>${oaNews.title}</h4>
			<p><span><fmt:formatDate value="${oaNews.createDate}" pattern="yyyy-MM-dd"/></span><span>浏览${oaNews.pageView}次</span><span class="mui-pull-right oa-news-author">${fns:getUserById(oaNews.createBy.id).name}</span></p>
		</div>
		<c:choose>
			<c:when test="${!empty oaNews.photo}"><!--有图片  -->	
				<div class="oa-newscontent">
					<div style="padding: 5px 15px;">
						<img src="${oaNews.photo}" alt="新闻图片" width="100%;"/>
					</div>
					<p>${fns:unescapeHtml(oaNews.content)}</p>
				</div>
			</c:when>
			<c:otherwise><!--无图片  -->				
				<div class="oa-newscontent">					
					<p>${fns:unescapeHtml(oaNews.content)}</p>
				</div>
			</c:otherwise>
		</c:choose>
	</div>						
	<script src="${ctxStatic}/mobile/js/mui.min.js"></script>
   	<script src="${ctxStatic}/mobile/js/mobile.js"></script>
</body>
</html>

