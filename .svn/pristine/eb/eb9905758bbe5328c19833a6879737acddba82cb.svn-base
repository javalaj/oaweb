<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>通知中心</title>
	<meta name="decorator" content="default"/>
	<meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=no" />
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/mobile/css/mui.min.css" />
	<script src="${ctxStatic}/mobile/js/mui.min.js"></script>
	<link rel="stylesheet" href="${ctxStatic}/mobile/css/oabase.css" />
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/mobile/oa/css/oaDoc.css" />
	<script>
		mui.init({
			swipeBack:true //启用右滑关闭功能
		});
	</script>
	<style>
		#topPopover {
			position: fixed;
			top: 16px;
			right: 6px;
			width:130px;
		}
		#topPopover .mui-popover-arrow {
			left: auto;
			right: 6px;
		}
		.mui-popover {
			height: 200px;
		}
 
		.mui-content {
			padding: 0px;
			background-color: #f7f7f7;
		}
		
		.fa-search{
			 margin-right: 4px;
   			 font-size: 14px;
		}
		
		#search_a{
			font-size: 14px;
		}
		
		.mui-table-view-cell p {
			font-size: 14px;
			overflow: hidden;
		}
		.mui-table-view-cell p>span:first-child {
			margin-right: 10px;
		}
		.mui-table-view-cell p a {
			font-size: 16px;
			color: #12b7f5;
		}

		.mui-content {
			padding: 0px;
		}

		
		.mui-table-view-cell .mui-ellipsis:nth-child(2){
			float: left;
		}
		.mui-table-view-cell .mui-ellipsis:last-child{
			float: right;
		}
		.mui-bar-nav.mui-bar .mui-icon{
			color: #12b5f7;
		}
		
		/* tab切换 */
		.team-header {
			
		    padding: 10px 15px;
		    background-color: #f9f9f9;
		}
		.mui-segmented-control {
			border-color: #12b7f5;	
		}
		.mui-segmented-control .mui-control-item.mui-active {
		    color: #fff;
		    background-color: #12b7f5;
		    height: 30px;
		}
		.mui-segmented-control .mui-control-item{
			line-height: 30px;
			color: #12b7f5;
        	border-color: #12b7f5;
    		border-left: 1px solid #12b7f5;
		}
		.mui-scroll-wrapper {
			top: 146px;
		}
		.team-header {
		    margin-top: 0;
		    padding: 8px 15px;
		    background-color: #f9f9f9;
		    position: fixed;
		    z-index: 999;
		    top:0;
		}
		.mui-scroll-wrapper{
			position: inherit;
		}
		.mui-scroll{
			position: inherit;
		}
	</style>
</head>
<body class="mui-ios mui-ios-9 mui-ios-9-1" style="background-color: #f7f7f7;">
	<div class="team-header">
		<div id="segmentedControl"class="mui-segmented-control mui-segmented-control-primary" style="border-color: #12b7f5;">
			<a class="mui-control-item" id="myself">我发布的通知</a>
			<a class="mui-control-item  mui-active" id="others">我收到的通知</a>
		</div>
	</div>
 	<header class="mui-bar mui-bar-nav" style="position: fixed; top: 48px; left: 0; z-index: 997;">
 		<a class="mui-icon mui-icon-search" style="color:#666;" onclick="searchSlideToggle();"></a>
		<h1 class="mui-title">我的通告列表</h1>
	</header>
	<div class="mui-content" style="background-color: #f7f7f7;padding-top:94px;"></div>
		<sys:message content="${message}"/>
		<div class="mui-scroll-wrapper" style="top:94px;padding-bottom:50px;">
			<div class="condition_div" style="display:none;">
				<div style="height:5px;"></div>
				<div class="search_div" style="overflow-y:auto;border: 1px solid #007aff; border-radius: 5px; padding:5px; margin: 0px 5px 5px 5px;background-color:white;z-index:999;">
					<form:form id="searchForm" modelAttribute="oaNotify" action="${ctx}/m/oa/oaNotify/myNoticeList" method="post" class="mui-input-group " >
						<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
						<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
						<div class="mui-input-row">
							<label class="oaDocFormLabel">标题</label>
							<form:input id="title" path="title" htmlEscape="false" maxlength="64" placeholder="输入标题"/>
						</div>
					
						<div class="mui-input-row">
							<label class="oaDocFormLabel">类型</label>
							<form:select path="type" id="type" >
								<form:option value="" label="全部"/>
								<form:options items="${fns:getDictList('my_notify_type')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
							</form:select>
						</div>					
						<div class="mui-button-row">
							<button type="button" class="mui-btn mui-btn-primary" onclick="search()"><i class="fa fa-search"></i> 查询</button>&nbsp;&nbsp;
							<button type="button" class="mui-btn mui-btn-primary" onclick="resetCondition()"><i class="fa fa-refresh"></i> 重置</button>&nbsp;&nbsp;
							<script type="text/javascript">function resetCondition(){
								$("#title").val("");
								$("#type,#status").val("")
								/* window.href.location="${ctx}/m/oa/oaNotify/allList"; */
							}
							function closeTab()
							{
								$(".condition_div").hide();
							}
							</script>
							<button type="button" class="mui-btn mui-btn-danger" id="cancelSearchButton" onclick="closeTab();">取消搜索</button>
						</div>
					</form:form>
				</div>
			</div>
			<div class="mui-scroll">
				<ul class="mui-table-view">
					<c:choose>
						<c:when test="${page.list.size()>0}">
							<c:forEach items="${page.list}" var="oaNotify" varStatus="status">
								<li class="mui-table-view-cell" >
				                    <p>
										<c:choose>
				                        	<c:when test="${oaNotify.files=='2'}">
					                            <a href="${ctx}/m/oa/cyTspOaMonthlyPlan/personal?commid=${oaNotify.content}&id=${oaNotify.id}">
					                                ${fns:abbr(oaNotify.title,35)}
					                            </a>
					                        </c:when>
					                        <c:otherwise>
				                                <a href="${ctx}/m/oa/oaNotify/view?id=${oaNotify.id}">
				                                ${fns:abbr(oaNotify.title,35)}
				                            	</a>
					                        </c:otherwise>
					                    </c:choose>							
									</p>
									<p>
										<span>
											<fmt:formatDate value="${oaNotify.updateDate}" pattern="yyyy-MM-dd"/>
										</span>
										<span>${oaNotify.createBy.name}</span>
										<span class="mui-pull-right">${fns:getDictLabel(oaNotify.type, 'oa_notify_type', '')}</span>
									</p>				               
								</li>
							</c:forEach>				
						</c:when>
						<c:otherwise>
							<li class="mui-table-view-cell">
								<p class="mui-ellipsis">暂无数据</p>
							</li>
						</c:otherwise>
					</c:choose>
				</ul>
				<table:pageMobile page="${page}" showPageOne="false"/>
			</div>
		</div>
	<jsp:include page="/WEB-INF/views/mobile/modules/sys/foot.jsp"></jsp:include>
	<script src="${ctxStatic}/mobile/js/mui.min.js"></script>
	<script src="${ctxStatic}/mobile/js/mobile.js"></script>
	<script type="text/javascript">
	mui.init()(function($) {
		$('.mui-scroll-wrapper').scroll({
			indicators : true
		//是否显示滚动条
		});
	})(mui);
	$(document).ready(function() {
	   mui.init();
	   $(".mui-icon-search").click(function(){
		   $(".condition_div").toggle();
	   });
	   document.getElementById('myself').addEventListener('tap', function(){
		   myself();
		    return true;
	    }); 
	   
	   document.getElementById('others').addEventListener('tap', function(){  
		   others();
	       return true;
	   });      
	   $('#title').focus(function(){
			$('#oaBarTab').hide();
			$(".mui-scroll-wrapper").css("margin-bottom","0");
		});
		$('#title').blur(function(){
			$('#oaBarTab').show();
		});
	    function myself() {
	    	 window.location.href='${ctx}/m/oa/oaNotify/allList'
	    }
	    function others() {
	    	window.location.href='${ctx}/m/oa/oaNotify/myNoticeList'
	    }
	  
	});
</script>	
</body>
</html>