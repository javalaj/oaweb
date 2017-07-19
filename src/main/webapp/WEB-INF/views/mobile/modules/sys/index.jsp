<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!doctype html>
<html lang="zh-cn">
<head>
<meta charset="utf-8">
<meta name="decorator" content="default"/>
<meta name="viewport"
	content="width=device-width,initial-scale=1,user-scalable=no" />
<title>工作台</title>
<link rel="stylesheet" href="${ctxStatic}/mobile/css/mui.css" />
<link rel="stylesheet" href="${ctxStatic}/mobile/css/oabase.css" />
<script src="${ctxStatic}/mobile/js/mui.min.js"></script>
<script src="${ctxStatic}/mobile/js/mobile.js"></script>
<style type="text/css">
.main-cont {
	margin-bottom: 50px;
}
.worktop .mui-grid-view.mui-grid-9 .mui-media{
	position: relative;
    top: 1px;
    vertical-align: bottom;
}
.worktop .mui-table-view.mui-grid-view .mui-table-view-cell .mui-media-body{
	font-size:13px;
}
.mui-bar-tab .mui-tab-item.mui-active {
    color: #12b7f5;
}
.mui-bar-tab{
	background: #f3f2f7;
}

.mui-bar{
	box-shadow: 0 0 1px rgba(0, 0, 0, .5);
	-webkit-box-shadow: 0 0 1px rgba(0, 0, 0, .5);
}

.main-tit{
	padding: 8px 15px;
}
.mui-icon .mui-badge {
	font-size: 12px;
    padding: 3px 6px;
    line-height: 1;
}
</style>
<script type="text/template" id="tpl1">
	<li class="mui-table-view-cell mui-media mui-col-xs-4" style="background-color:#ffffff">
		<a  href="{{menuUrl}}" onclick="{{onclick}}">
			<span class="mui-icon main-icon">
				<img src="{{iconUrl}}" alt="{{title}}"/>
				{{#showBadge}}<span class="mui-badge">{{badge}}</span>{{/showBadge}}
			</span>
			<div class="mui-media-body">{{title}}</div>
		</a>	
	</li>
</script>
<script>
	function goContact() {
		location.href = "${mctx}/oa/contact/oaContact";
	}
	function mycertelist() {
		location.href = "${mctx}/sys/user/list";
	}
	$(document).ready(function() {
		$("html").removeAttr("style");
	var taskcount=${mapCount.sum };
	var actcount=${todoCount };
	var notifycount=${notifyCount};
	var doccount=${docCount};
		if(actcount>0){
		addCell("#grid1",{menuUrl:"${mctx}/act/task/",iconUrl:"${ctxStatic}/mobile/images/xietong.png",title:"协同办公",showBadge:true,badge:actcount});
		}else{
		addCell("#grid1",{menuUrl:"${mctx}/act/task/",iconUrl:"${ctxStatic}/mobile/images/xietong.png",title:"协同办公",showBadge:false,badge:0});
		}
		if(taskcount>0){
			addCell("#grid1",{menuUrl:"${mctx }/oa/mytask/myTask/",iconUrl:"${ctxStatic}/mobile/images/renwu.png",title:"我的任务",showBadge:true,badge:taskcount});  
		}else{
			addCell("#grid1",{menuUrl:"${mctx }/oa/mytask/myTask/",iconUrl:"${ctxStatic}/mobile/images/renwu.png",title:"我的任务",showBadge:false,badge:0});  
		}
		addCell("#grid1",{menuUrl:"${mctx}/user/userWorklog/",iconUrl:"${ctxStatic}/mobile/images/rizhi.png",title:"工作日志",showBadge:false,badge:0});
	 	addCell("#grid1",{menuUrl:"${mctx}/user/userWeekplan/form",iconUrl:"${ctxStatic}/mobile/images/jihua.png",title:"周计划",showBadge:false,badge:0}); 
		/* addCell("#grid1",{menuUrl:"${mctx}/oa/plan/oaPlan",iconUrl:"${ctxStatic}/mobile/images/richeng.png",title:"我的日程",showBadge:false,badge:0}); */
		addCell("#grid1",{menuUrl:"${mctx}/oa/mail/oaMail/",iconUrl:"${ctxStatic}/mobile/images/youjian.png",title:"站内邮件",showBadge:false,badge:0});
		addCell("#grid1",{menuUrl:"${mctx}/act/task/process/",iconUrl:"${ctxStatic}/mobile/images/xinjian.png",title:"新建流程",showBadge:false,badge:0});
		addCell("#grid2",{menuUrl:"${mctx}/oa/sign/oaSign/",iconUrl:"${ctxStatic}/mobile/images/gongwen.png",title:"公文管理",showBadge:false,badge:0});
		addCell("#grid2",{menuUrl:"${mctx}/oa/leaveMore/",iconUrl:"${ctxStatic}/mobile/images/kaoqin.png",title:"考勤管理",showBadge:false,badge:0});
		/*addCell("#grid2",{menuUrl:"#",iconUrl:"${ctxStatic}/mobile/images/tongshi1.png",title:"同事圈",showBadge:false,badge:0});*/
		addCell("#grid2",{menuUrl:"${mctx}/oa/coding/oaCollectCoding;",iconUrl:"${ctxStatic}/mobile/images/dakajilu.png",title:"打卡记录",showBadge:false,badge:0,});
		addCell("#grid2",{menuUrl:"${mctx}/oa/contract/oaContractSales/",iconUrl:"${ctxStatic}/mobile/images/hetong.png",title:"合同管理",showBadge:false,badge:0});
		addCell("#grid2",{menuUrl:"${mctx}/oa/loan/oaLoanRepayment",iconUrl:"${ctxStatic}/mobile/images/jiezhi.png",title:"借支管理",showBadge:false,badge:0});
		 addCell("#grid2",{menuUrl:"#",iconUrl:"${ctxStatic}/mobile/images/jixiao1.png",title:"绩效考核",showBadge:false,badge:0,onclick:"top.layer.msg('功能开发中，敬请期待！')"});
		 
		 	if(notifycount>0){
		 		addCell("#grid3",{menuUrl:"${mctx }/oa/oaNotify/allList",iconUrl:"${ctxStatic}/mobile/images/tongzhi.png",title:"通知公告",showBadge:true,badge:notifycount});
		 	}else{
		 		addCell("#grid3",{menuUrl:"${mctx }/oa/oaNotify/allList",iconUrl:"${ctxStatic}/mobile/images/tongzhi.png",title:"通知公告",showBadge:false,badge:0});
		 	}
	 		if(doccount>0){
	 			addCell("#grid3",{menuUrl:"${mctx}/oa/doc/oaDoc",iconUrl:"${ctxStatic}/mobile/images/wendang.png",title:"文档中心",showBadge:true,badge:doccount});
	 		}else{
	 		addCell("#grid3",{menuUrl:"${mctx}/oa/doc/oaDoc",iconUrl:"${ctxStatic}/mobile/images/wendang.png",title:"文档中心",showBadge:false,badge:5});
	 		}
	 	addCell("#grid3",{menuUrl:"${mctx}/oa/newscenter/oaNews/newsList",iconUrl:"${ctxStatic}/mobile/images/xinwen.png",title:"新闻中心",showBadge:false,badge:0}); 
	});
	function addCell(selector,data){
  		var tpl = $("#tpl1").html().replace(/(\/\/\<!\-\-)|(\/\/\-\->)/g,"");
  		$(selector).append(Mustache.render(tpl, data));
  	}
</script>
<script type="text/javascript">
function myfunction(){
	$("#page_worktop").addClass("mui-active");
}
window.onload=myfunction;
</script>
</head>
<body >
<jsp:include page="/WEB-INF/views/mobile/modules/sys/foot.jsp"></jsp:include>
	<oam:content>
		<div class="main-tit">移动办公</div>
		<ul class="mui-table-view mui-grid-view mui-grid-9" id="grid1">
		</ul>
		<div class="main-tit">企业管理</div>
		<ul class="mui-table-view mui-grid-view mui-grid-9" id="grid2">
		</ul>
		<div class="main-tit">信息管理</div>
		<ul class="mui-table-view mui-grid-view mui-grid-9" id="grid3">
		</ul>
	</oam:content>
	
</body>
</html>