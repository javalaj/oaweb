<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!doctype html>
<html lang="zh-cn">
<head>
<meta charset="utf-8">
<title>已办事项</title>
  <meta name="decorator" content="default"/>
<meta name="viewport"
	content="width=device-width,initial-scale=1,user-scalable=no" />
<link rel="stylesheet" href="${ctxStatic}/mobile/css/mui.css" />
<link rel="stylesheet" href="${ctxStatic}/mobile/css/oabase.css" />
<link rel="stylesheet" type="text/css" href="${ctxStatic}/mobile/css/overwrite-mui.css" />
<style type="text/css">
.xin-main {
	margin-bottom: 50px;
}
.search-form{	
	margin-bottom: 0;
	margin-top: 0;
	padding-top: 0;
}
label{
	width:25%;
}

.search-edit select{
	width:67%;
	border-radius:6px;
}

.search-time span {
	width:27%;
}

.search-time span[name='content-span'] {
	width:17%;
	text-align: left;
    padding-left: 8%;
}

.search-time label{
	margin-left:9%;
	width:67%;
}

.search-time label input{
	width:100%;
}

.search-time input {
	height:32px;
	line-height:32px;
	width:67%;
	border-radius:6px;
}

input[name='endDate']{
	height:32px;
	line-height:32px;
	width:67%;
}
.mui-segmented-control .mui-control-item.mui-active {
    color: #fff;
    background-color: #12b7f5;
}
.mui-segmented-control .mui-control-item{
	border-color: #12b7f5;
    border-left: 1px solid #12b7f5;
}

.btn-submit, .btn-draft{
	background-color: #12b7f5;
    border: 1px solid #12b7f5;
    color: #fff;
}

.btn-clear{
	border-color:#12b7f5;
	color:#12b7f5;
}

.mui-segmented-control .mui-control-item{
	color: #12b7f5;
}

.team-header{
	padding:0;
	padding-top:8px;
	position: fixed;
    z-index: 999;
    top: 0;
}
.teamtask-tit{
	margin-top:8px;
}
.userinfo-edit {
	margin-bottom: 0;
}
.search-time, .bottom-button {
	padding-top: 0;
}
.bottom-button {
	padding-bottom: 10px;
}

</style>

<script type="text/javascript">



function clearForm(){
	$("#beginDate").val("");
	$("#endDate").val("");
	$("#procDefKey").val("");
}

</script>
</head>
<body class="teamwork">
	<div class="xin-main">
		<div class="team-header">
		<div style="padding:0 15px;">
			<div id="segmentedControl"
				class="mui-segmented-control mui-segmented-control-primary" style="border-color: #12b7f5 !important;color:#12b7f5;">
				<a class="mui-control-item"
					id="todo">待办事项</a>  <a
					class="mui-control-item   "
					id="tosend">已发事项</a>
					<a class="mui-control-item mui-active "
					id="historic">已办事项</a>
			</div>
			</div>
			<div class="main-tit teamtask-tit">
					<span>已办事项</span> <a class="mui-pull-left" 
						id="searchsy"><span class="mui-icon mui-icon-search"></span></a>
				</div>
				<div id="query" class="mui-content" style="display: none;">
			<form:form id="searchForm" modelAttribute="act" class="search-form"
				action="${mctx}/act/task/historic/">
<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
				<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
				<ul class="userinfo-edit search-edit">
					<li><label>流程名称</label> <form:select path="procDefKey"
							class="form-control">
							<form:option value="" label="全部流程" />
							<form:options items="${fns:getDictList('act_type')}"
								itemLabel="label" itemValue="value" htmlEscape="false" />
						</form:select></li>
				</ul>
				<div class="search-time">
					<span class="start-time">开始日期:</span><input type="text" id="beginDate" name="beginDate" value="<fmt:formatDate value="${act.beginDate}" pattern="yyyy-MM-dd"/>"  class='mui-date'  />
					<span style="text-align: right;" name="content-span" >至</span>
					<label><input type="text" id="endDate" name="endDate" value="<fmt:formatDate value="${act.endDate}" pattern="yyyy-MM-dd"/>" class='mui-date'   /></label>
				</div>
				<div class="bottom-button">
						<button type="button" class="btnapp mui-btn-next btn-clear"
						data-loading-text="取消中" onclick="clearForm();">重置</button>
					<button type="submit" class="btnapp btn-submit " id="subt"
						data-loading-text="提交中">查询</button>
				</div>
			</form:form>
		</div>
		</div>
		
		<div style="margin-top: 90px;">
		<!-- <div class="mask"></div> -->
			<div id="yifa" class=" mui-control-content  oa-contents mui-active">
				
				<ul class="mui-table-view ">
					<c:forEach items="${page.list}" var="act">
						<c:set var="task" value="${act.histTask}" />
						<c:set var="vars" value="${act.vars}" />
						<c:set var="procDef" value="${act.procDef}" />
						<li class="mui-table-view-cell mui-media">
						<c:choose>
						<c:when test="${procDef.name == '周计划评价'}">
							  <a href="${mctx}/user/userWeekplan/supView?sameid=${task.description}">
						</c:when>
						<c:when test="${procDef.name=='日常借支流程' ||procDef.name=='请假流程' || procDef.name=='加班申请流程' || procDef.name=='出差申请流程' || procDef.name=='公司收文'|| procDef.name=='申请用车流程' || procDef.name=='私车公用流程' || procDef.name=='资质借用流程' || procDef.name=='印章使用流程'|| procDef.name=='外出申请流程' || procDef.name=='忘记打卡申请流程' || procDef.name=='专项借支申请流程'}">
									<a
							href="${mctx}/act/task/form?taskId=${task.id}&taskName=${fns:urlEncode(task.name)}&taskDefKey=${task.taskDefinitionKey}&commid=${fns:urlEncode(task.description)}&procInsId=${task.processInstanceId}&procDefId=${task.processDefinitionId}&status=finish"
							class="mui-navigate-right">  
						</c:when>
						<c:otherwise>
				<a href="${mctx}/act/task/error" class="mui-navigate-right">
								</c:otherwise>
								</c:choose>
								<div class="teamtask-icon">
									<img class="mui-media-object mui-pull-left"
										src="${ctxStatic}/mobile/images/touxiang.png" alt="协同消息" />
								</div>
								<div class="mui-media-body">
									<span class="msg-type">${procDef.name}</span>
									<p class="mui-ellipsis msg-title">
										<span>${fns:abbr(not  empty vars.map.title ? vars.map.title : task.id, 60)}</span>
									</p>
								</div>
						</a></li>
					</c:forEach>
					<li class="mui-table-view-cell">
					<p><table:pageMobile id="myPage" page="${page }" showPageOne="false"></table:pageMobile></p>
			</li>
				</ul>
			</div>
		</div>
	</div>
	<script src="${ctxStatic}/mobile/js/mui.min.js"></script>
	<script src="${ctxStatic}/mobile/js/mobile.js"></script>
	<jsp:include page="/WEB-INF/views/mobile/modules/sys/foot.jsp"></jsp:include>
<script type="text/javascript">
$(document).ready(function() {

   mui.init();
   document.getElementById('searchsy').addEventListener('tap',function(){  
    //点击响应逻辑  
     console.log("1");
	   searchsy();
   });  

   document.getElementById('todo').addEventListener('tap', function(){
	    console.log("todo");
	    todo();
    }); 
   
   document.getElementById('tosend').addEventListener('tap', function(){  
	   console.log("tosend");
       tosend();
   }); 
   
   document.getElementById('historic').addEventListener('tap', function(){  
       console.log("historic");
       historic();
   }); 
   
    function searchsy() {
        document.getElementById('query').style.display = document
                .getElementById('query').style.display == 'none' ? 'block'
                : 'none';
    }
   $("#subt").click(function() {
		var judeg2 = checkdate();	
		return judeg2;
		
	});
    function checkdate(){
   	 var judge = true;
   	   	var sDate = new Date($("input[name='beginDate']").val().replace("-", "/").replace("-", "/"));
   	    var eDate = new Date($("input[name='endDate']").val().replace("-", "/").replace("-", "/"));
   	    if(sDate > eDate)
   	    {
   	    	top.layer.msg('结束日期必须大于结束日期！')
   	    judge = false;
   	   }
   	    return judge;
   	    }
    function todo() {
        location.href = "${mctx}/act/task/";
    }
    function tosend() {
        location.href = "${mctx}/act/task/tosend";
    }
    function historic() {
        location.href = "${mctx}/act/task/historic";
    }
    /* function worktop() {
     location.href = "${mctx}/mobile/sys/index/";
     }
     function goContact(){
     location.href="${mctx}/oa/contact/oaContact";
     } */
});
</script>
<sys:mui-datetime></sys:mui-datetime>
</body>
</html>