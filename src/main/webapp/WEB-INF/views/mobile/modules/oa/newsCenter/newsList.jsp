<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		<title>新闻中心</title>
		<link href="${ctxStatic}/mui-master/dist/css/mui.min.css" rel="stylesheet" />
		<link href="${ctxStatic}/mui-master/examples/hello-mui/css/mui.indexedlist.css" rel="stylesheet" />
		<style>
			html,
			body {
				height: 100%;
				overflow: hidden;
			}
			ul, li {
				list-type: none;
			}	
			
			ul {
				margin: 0;
				padding: 0;
			}
		</style>
		<style>						
		span.mui-icon {  
			font-size: 14px;
			color: #007aff;
			margin-left: -15px;
			padding-right: 10px;
		}
		.mui-indexed-list {
			background-color: #fff;
		}
		#sliderSegmentedControl {
			    height: 54px;
			    background: #f4f7f6;
			    width: 100%;
			    padding: 8px 15px 0 15px;
			    border-bottom: 1px solid #ddd;
		    }
			ul.oa-news-item {
				overflow: hidden;
				width: 100%;
			}
			.mui-segmented-control.mui-scroll-wrapper .mui-scroll {
				width: auto;
				white-space: nowrap;
			}
			.oa-news-item > li {
				display: inline-block;
				height:46px;
				line-height:46px;
			}
			.oa-news-item>li>a {
				display: block;
				height:46px;
				line-height:46px;
				padding: 0 25px;
				font-size: 16px;
				color: #333;
			}
			.oa-news-item>li>a.active {
				color: #12b7f5;
				border-bottom: 3px solid #12b7f5;
			}
			.oa-newslist-page input[type="search"] {
				border-radius: 6px;
    			border: 1px solid #ddd;
    			margin-bottom: 0;
    			background-color: #fff;
			}
			.mui-fullscreen .mui-segmented-control~.mui-slider-group {
				position: absolute;
				top: 108px;
				bottom: 0;
				width: 100%;
				height: auto;
			}
			.oa-news-itemlist li {
				overflow: hidden;
			}
			.oa-news-itemlist li div.oa-newsimg {				
				float: left;
				width: 126px;
				margin-right: 8px;
			}
			.oa-news-itemlist li div.oa-newsimg img {
				width: 100%;
			}
			.oa-news-itemlist li div.oa-newsinfo {
				float: left;
				width: -moz-calc(100% - 134px);
				width: -webkit-calc(100% - 134px);
				width: calc(100% - 134px);
			}
			.oa-news-itemlist li div.oa-newsinfo-noimg {
				width: 100%;
			}
			.oa-news-itemlist div>p {
				white-space: normal;
				overflow: hidden;
			 	text-overflow: ellipsis;
			 	display: -webkit-box;
			 	-webkit-line-clamp: 2;
			 	-webkit-box-orient: vertical;
			}
			.oa-news-itemlist div>p.oa-newstitle {
				width: 100%;
				margin-bottom: 5px;
				font-size: 16px;
				color: #333;
			}
			 
			.oa-news-author {
				color: #12b7f5;
			}
			
		.mui-search .mui-placeholder .mui-icon{
			font-size:16px;
		}
		
		.mui-placeholder span{
			font-size:13px;
		}
		.mui-table-view-cell a{
			font-size:14px;
		}			
		
		.mui-table-view-cell {
			padding: 9px 15px;
		}
		.mui-indexed-list-search {
			border-bottom: 0;
		}
		.mui-search .mui-placeholder {
			top: 10px;
		}
		.mui-search.mui-active:before
		{
		    left: 25px;
		}
		.mui-input-row .mui-input-clear~.mui-icon-clear {
			line-height: 38px;
		}
		</style>
	</head>

	<body class="oa-newslist-page">
		<header class="mui-bar mui-bar-nav">
			<a class="mui-icon mui-icon-left-nav mui-pull-left" href="${ctx}"></a>
			<h1 class="mui-title">新闻中心</h1>
			
		</header>
		<div class="mui-content">
			<div id="sliderSegmentedControl" class="mui-scroll-wrapper mui-slider-indicator mui-segmented-control mui-segmented-control-inverted">
				<div class="mui-scroll" id="divheader">
					<ul class="oa-news-item">
						${tabs}
					</ul>
				</div>
			</div>
			<div id='list' class="mui-indexed-list">
				<div class="mui-indexed-list-search mui-input-row mui-search" style="padding: 10px 15px;background-color: #f3f2f7;">
					<input type="search" class="mui-input-clear mui-indexed-list-search-input" placeholder="新闻标题搜索" style="border-radius: 6px;border:1px solid #e4e4e4;">
				</div>
				<div class="mui-indexed-list-bar" style="display:none;"></div>
				<div class="mui-indexed-list-alert"></div>
				<div class="mui-indexed-list-inner" style="height: 100%;">
					<div class="mui-indexed-list-empty-alert">没有搜索到符合条件的数据</div>
					<ul class="mui-table-view oa-news-itemlist">
						<c:forEach items="${list}" var="oaNews">
						<c:choose>
							<c:when test="${!empty oaNews.photo}"><!--有图片  -->
							<li data-value="" data-tags="${oaNews.title}" class="mui-table-view-cell mui-indexed-list-item" style="padding: 10px 15px;">
								<a href="${ctx}/m/oa/newscenter/oaNews/view?id=${oaNews.id}" style="padding:0;margin:0;">
									<div class="oa-newsimg">
										<img src="${oaNews.photo}" alt="新闻图片" width="100%;"/>
									</div>
									<div class="oa-newsinfo">
										<p class="oa-newstitle mui-ellipsis">${oaNews.title}</p>
										<p class="oa-news-time"><fmt:formatDate value="${oaNews.createDate}" pattern="yyyy-MM-dd HH:mm"/></p>
										<p>浏览<span>${oaNews.pageView}</span>次<span class="mui-pull-right oa-news-author">${fns:getUserById(oaNews.createBy.id).name}</span></p>
									</div>
        						</a>
							</li>
							</c:when>
							<c:otherwise><!--无图片  -->
							<li data-value="" data-tags="${oaNews.title}" class="mui-table-view-cell mui-indexed-list-item" style="padding: 10px 15px;">
								<a href="${ctx}/m/oa/newscenter/oaNews/view?id=${oaNews.id}" style="padding:0;margin:0;">									
									<div class="oa-newsinfo-noimg">
										<p class="oa-newstitle mui-ellipsis">${oaNews.title}</p>
										<p class="oa-news-time"><fmt:formatDate value="${oaNews.createDate}" pattern="yyyy-MM-dd HH:mm"/></p>
										<p>浏览<span>${oaNews.pageView}</span>次<span class="mui-pull-right oa-news-author">${fns:getUserById(oaNews.createBy.id).name}</span></p>
									</div>
        						</a>
							</li>
							</c:otherwise>
						</c:choose>
						</c:forEach>
					</ul>
				</div>
			</div>
		</div>
		
		<script src="${ctxStatic}/mui-master/dist/js/mui.min.js"></script>
		<script src="${ctxStatic}/mui-master/examples/hello-mui/js/mui.indexedlist.js"></script>
		<script type="text/javascript" charset="utf-8">
			mui.init();
			mui.ready(function() {
				var header = document.querySelector('header.mui-bar');
				var nav = document.getElementById('sliderSegmentedControl');
				var list = document.getElementById('list');
				//calc hieght
				list.style.height = (document.body.offsetHeight - header.offsetHeight - nav.offsetHeight) + 'px';
				//create
				window.indexedList = new mui.IndexedList(list);
			});
			mui('.mui-scroll-wrapper').scroll();
		</script>
	</body>

</html>