<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta charset="utf-8">
<meta name="decorator" content="default" />
<meta name="viewport"
	content="width=device-width,initial-scale=1,user-scalable=no" />
<title>设置</title>
<link rel="stylesheet" href="${ctxStatic}/mobile/css/mui.css" />
<link rel="stylesheet" href="${ctxStatic}/mobile/css/oabase.css" />

</head>
<body class="setting">
	<header class="mui-bar mui-bar-nav">
		<a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></a>
		<h1 class="mui-title">设置</h1>
	</header>
	<div class="mui-content">
		<!--	<ul class="mui-table-view">
	    		<li class="mui-table-view-cell">
					新消息提醒	<div class="mui-switch mui-switch-blue mui-switch-mini mui-active">
							<div class="mui-switch-handle"></div>
						</div>			
	    		</li>
	    		<li class="mui-table-view-cell">
					勿扰模式	<div class="mui-switch mui-switch-blue mui-switch-mini mui-active">
							<div class="mui-switch-handle"></div>
						</div>			
	    		</li>
	    	</ul>
	    	<div class="div"></div>-->
		<ul class="mui-table-view">
			<li class="mui-table-view-cell"><a href="${ctx}/m/sys/user/help"
				class="mui-navigate-right"> 帮助与反馈 </a></li>
			<li class="mui-table-view-cell"><a href="#"> 关于OA <span
					class="mui-pull-right about-oa">V1.2 更新时间2017-6-15</span>
			</a></li>
		</ul>
		<div class="bottom-button">
			<button type="button" id="confirmBtn" class="btnapp btn-next"
				onclick="exit()">退出登录</button>
		</div>
	</div>

	<script src="${ctxStatic}/mobile/js/mui.min.js"></script>
	<script type="text/javascript">
		mui.init();
		function exit() {
			// 	   		 document.getElementById("confirmBtn").addEventListener('tap', function() {
			var btnArray = [ '是', '否' ];
			mui.confirm('确定退出登录？', '提示', btnArray, function(e) {
				if (e.index == 0) {
					window.location.href = '${ctx}/logout';
				}
			})
			// 			});
		}
	</script>
	<%--  <jsp:include page="/WEB-INF/views/mobile/modules/sys/foot.jsp"></jsp:include> --%>
</body>
</html>