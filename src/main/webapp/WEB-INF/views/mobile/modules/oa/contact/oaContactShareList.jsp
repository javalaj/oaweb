<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		<title>共享通讯录</title>
		<link href="${ctxStatic}/mui-master/dist/css/mui.min.css" rel="stylesheet" />
		<link href="${ctxStatic}/mui-master/examples/hello-mui/css/mui.indexedlist.css" rel="stylesheet" />
		<script src="${ctxStatic}/mui-master/dist/js/mui.min.js"></script>
		<script src="${ctxStatic}/mui-master/examples/hello-mui/js/mui.indexedlist.js"></script>
		<style>
			html,
			body {
				height: 100%;
				overflow: hidden;
			}
			/* .mui-bar {
				-webkit-box-shadow: none;
				box-shadow: none;
			} */
		</style>
		<style>
			
			p {
				text-indent: 22px;
			}
			span.mui-icon {
				margin-left: -15px;
				padding-right: 10px;
			}
			tr td{
				font-size:16px;
				padding: 3px 0;
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
			.mui-indexed-list-item {
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
			.mui-input-row.mui-search .mui-icon-clear{
			top:16px;
			right:10px;
			
		}
		</style>
		<script type="text/javascript" charset="utf-8">
			mui.ready(function() {
				var header = document.querySelector('header.mui-bar');
				var list = document.getElementById('list');
				//calc hieght
				list.style.height = (document.body.offsetHeight - header.offsetHeight) + 'px';
				//create
				window.indexedList = new mui.IndexedList(list);
			});
		</script>
	</head>

	<body>
		<header class="mui-bar mui-bar-nav">
			<a class="mui-icon mui-icon-left-nav mui-pull-left" href="${ctx}"></a>
			<h1 class="mui-title">共享通讯录</h1>
			<a id="menu" class="mui-action-menu mui-icon mui-icon-bars mui-pull-right" href="#topPopover"></a>
		</header>
		<div class="mui-content">
			<div id='list' class="mui-indexed-list">
				<div class="mui-indexed-list-search mui-input-row mui-search" style="padding: 10px 15px;background-color: #fff;">
					<input type="search" class="mui-input-clear mui-indexed-list-search-input" placeholder="按人员名称搜索" style="border-radius: 6px;border:1px solid #e4e4e4;">
				</div>
				<div class="mui-indexed-list-bar" style="display:none;">
				</div>
				<div class="mui-indexed-list-alert"></div>
				<div class="mui-indexed-list-inner">
					<div class="mui-indexed-list-empty-alert">没有搜索到符合条件的数据</div>
					<ul class="mui-table-view">
						<c:forEach items="${cyTspOaAddresses}" var="cyTspOaAddress">
							<li data-value="" data-tags="${cyTspOaAddress.name}" class="mui-table-view-cell mui-indexed-list-item">
								<a href="${empty cyTspOaAddress.iphone?'javascript:void(0);':fns:concat('tel:',cyTspOaAddress.iphone)}" onclick="${empty cyTspOaAddress.iphone?'mui.toast(\'该用户未设置手机号\');':''}" style="position: relative;">
        							<table>
        								<tbody>
	        								<tr>
	        									<td>${cyTspOaAddress.name}</td>
	        								</tr>
	        								<tr>
	        									<td>${cyTspOaAddress.iphone}</td>
	        								</tr>
        								</tbody>
        							</table>
        							<span style="position: absolute;right: 15px;top: 28px;display: block; width: 16px; height: 16px;"><img src="${ctxStatic}/mobile/images/dianhua-64.png" style="width: 100%;" alt="电话"/></span>
        						</a>
							</li>							
						</c:forEach>
					</ul>
				</div>
			</div>
		</div>
		
		<oam:menu1 id="topPopover" height="100px">
			<oam:menu1Cell title="公司通讯录" url="${mctx}/oa/contact/oaContact/company/list"></oam:menu1Cell>
			<oam:menu1Cell title="个人通讯录" url="${mctx}/oa/contact/oaContact/user/list"></oam:menu1Cell>
		</oam:menu1>		
	</body>

</html>