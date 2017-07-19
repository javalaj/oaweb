<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>新闻中心</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
		
		});
	</script>
	<style>
		ul.myoa-newslist {
			margin-top: 10px;
			margin-bottom: 10px;
		}
		ul.myoa-newslist li {
			width: 100%;
			padding: 10px 0;
			box-sizing: border-box;
			border-bottom: 1px dashed #ddd;
			overflow: hidden;
		}
		.myoa-newslist-img {
			float: left;
			width: 220px;
			margin-right: 20px;
		}
		.myoa-newslist-img a {
			display: block;
			width: 100%;
		}
		.myoa-newslist-img img {
			width: 100%;
		}
		.myoa-newslist-details {
			float: left;
			width:-moz-calc(100% - 240px);
			width:-webkit-calc(100% - 240px);
			width: calc(100% - 240px);
		}
		.myoa-newslist-details-noimg {
			width: 100%;
		}
		.myoa-newslist-details > p {
			margin-bottom: 10px;
			overflow: hidden;
		}
		.mayoa-newstitle {
			font-size: 16px;
			margin-bottom: 10px;
		}
		.mayoa-newstitle a:hover {
			text-doceration: underline;
		}
		.myoa-newslist-publishinfo > span {
			margin-right: 16px;
		}
		.myoa-news-columnname {
			display: inline-block;
			padding: 2px 10px;
			border: 1px solid #FF938C;
			color: #FF938C;
			border-radius: 4px;
			margin-right: 10px;
		}
	</style>
</head>
<body class="gray-bg">
<div class="wrapper wrapper-content">
	<div class="ibox">
		<div class="ibox-title">
			<h5>新闻中心</h5>
		</div>
		<ul class="nav nav-tabs myoa-tabs">
			${tabs}
		</ul>
		
		<div class="ibox-content">
			<div class="row">
				<div class="col-sm-12">
					<form:form id="searchForm" modelAttribute="oaNews" action="${ctx}/oa/newscenter/oaNews/newsList" method="post" class="form-inline pull-left">
						<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
						<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
						<input id="type" name="type" type="hidden" value="${oaNews.type}"/>
						
						<!--查询条件-->
						<div class="form-group">
							<span>标题：</span>
							<form:input path="title" htmlEscape="false" maxlength="255"  class=" form-control input-sm"/>
						</div>
					</form:form>
					<div class="pull-left" style="margin-left: 10px;">
						<table:search/>
						<table:reset/>
					</div>
					<br/>
				</div>
			</div>
		
			<ul class="myoa-newslist">
				<c:forEach items="${page.list}" var="oaNews">
				<c:choose>
					<c:when test="${!empty oaNews.photo}"><!--有图片  -->		
						<li>
							<h6 class="mayoa-newstitle">
								<a href="${ctx}/oa/newscenter/oaNews/view?id=${oaNews.id}">${oaNews.title}</a>
							</h6>
							<div>
								<div class="myoa-newslist-img">
									<a href="${ctx}/oa/newscenter/oaNews/view?id=${oaNews.id}">
									<img alt="新闻图片" src="${oaNews.photo}"></a>
								</div>
								<div class="myoa-newslist-details">							
									<p class="myoa-newslist-publishinfo">
										<span>${fns:getUserById(oaNews.createBy.id).name}</span>
										<span><fmt:formatDate value="${oaNews.createDate}" pattern="yyyy-MM-dd HH:mm"/></span>
									</p>
									<p>
										${fns:abbr(fns:unescapeHtml(oaNews.content),300)}
									</p>
									<p>
										<span class="myoa-news-columnname">${fns:getOaNewsColumn(oaNews.type).columnName}</span>
										浏览 <span>${oaNews.pageView}</span>次
									</p>
								</div>
							</div>
						</li>
					</c:when>
					<c:otherwise><!--无图片  -->
						<li>
							<h6 class="mayoa-newstitle">
								<a href="${ctx}/oa/newscenter/oaNews/view?id=${oaNews.id}">${oaNews.title}</a>
							</h6>						
							<div class="myoa-newslist-details myoa-newslist-details-noimg">							
								<p class="myoa-newslist-publishinfo">
									<span>${fns:getUserById(oaNews.createBy.id).name}</span>
									<span><fmt:formatDate value="${oaNews.createDate}" pattern="yyyy-MM-dd HH:mm"/></span>
								</p>
								<p>
									${fns:abbr(fns:unescapeHtml(oaNews.content),300)}
								</p>
								<p>
									<span class="myoa-news-columnname">${fns:getOaNewsColumn(oaNews.type).columnName}</span>
									浏览 <span>${oaNews.pageView}</span>次
								</p>
							</div>
						</li>
					</c:otherwise>
				</c:choose>
				</c:forEach>
			</ul>
			<table:page page="${page}"/>
		</div>
	</div>
</div>
</body>
</html>