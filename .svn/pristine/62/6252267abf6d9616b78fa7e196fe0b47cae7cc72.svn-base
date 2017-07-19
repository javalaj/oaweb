<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>新闻浏览</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
	</script>
	<style>
		.myoa-newsview {
			width: 800px;
			margin: 0 auto;
		}
		.myoa-newsview .mayoa-newstitle {
			margin: 20px 0;
			font-size: 20px;
			text-align: center;			
		}
		p.myoa-newsview-publishinfo {
			margin-bottom: 30px;
			text-align: center;
		}
		.myoa-newsview-content P {
			margin: 5px auto;
		}
		.myoa-newsview-img, p.detailPic {
			width: 450px;
		}
		.myoa-newsview-img, p.detailPic + p {
			text-align: center;
		}
		.myoa-newsview-img img {
			width: 100%;
		}
		.myoa-newsview-content {
			margin-top: 20px;
		}
		
		p.detailPic img {
			width: 100%;
		}
	</style>
	<script>
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
	
	function isContains(str, substr) {
	    return new RegExp(substr).test(str);
	}
	
	//收藏展示去掉返回按钮
	function delBack()
	{
		var strUrl=document.referrer;
		
		var arrObj=strUrl.split("//");
		var start=arrObj[1].indexOf("/");
		var end=arrObj[1].indexOf(";");
		var newurl=arrObj[1].substring(start);
		if(end>0){
			var newurl=arrObj[1].substring(start,end);
			}
		
		if (!isContains(newurl, 'newsList'))
			$(backbut).hide();
	}
	
	
	$(document).ready(function() {
		delBack();
	});
	
	</script>
</head>
<body class="gray-bg">
	<div class="wrapper wrapper-content">
		<div class="ibox myoa-newsview">
			<div class="ibox-title">
				<h5>正文</h5>
			</div>
			<c:choose>
				<c:when test="${!empty oaNews.photo}"><!--有图片  -->	
					<div class="ibox-content">
						<input id="backbut" class="btn btn-myoa" type="button" value="返 回" onclick="goBack();"/>
						<h3 class="mayoa-newstitle">${oaNews.title}</h3>
						<p class="myoa-newsview-publishinfo">
							<span>${fns:getUserById(oaNews.createBy.id).name}</span>&nbsp;&nbsp;&nbsp;&nbsp;
							<span><fmt:formatDate value="${oaNews.createDate}" pattern="yyyy-MM-dd HH:mm"/></span>
							&nbsp;&nbsp;&nbsp;&nbsp;
							<span>浏览${oaNews.pageView}次</span>				
						</p>
						<div class="myoa-newsview-img">
							<img alt="新闻图片" src="${oaNews.photo}"/>
						</div>
						<div class="myoa-newsview-content">${fns:unescapeHtml(oaNews.content)}</div>
					</div>
				</c:when>
				<c:otherwise><!--无图片  -->
					<div class="ibox-content">
						<input id="backbut" class="btn btn-myoa" type="button" value="返 回" onclick="goBack();"/>
						<h3 class="mayoa-newstitle">${oaNews.title}</h3>
						<p class="myoa-newsview-publishinfo">
							<span>${fns:getUserById(oaNews.createBy.id).name}</span>&nbsp;&nbsp;&nbsp;&nbsp;
							<span><fmt:formatDate value="${oaNews.createDate}" pattern="yyyy-MM-dd HH:mm"/></span>
							&nbsp;&nbsp;&nbsp;&nbsp;
							<span>浏览${oaNews.pageView}次</span>				
						</p>
						<div class="myoa-newsview-content">${fns:unescapeHtml(oaNews.content)}</div>
					</div>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
</body>
</html>