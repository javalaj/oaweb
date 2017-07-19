<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		<title>私车公用申请</title>
		<link rel="stylesheet" type="text/css" href="${ctxStatic}/mobile/css/mui.min.css" />
		<link rel="stylesheet" type="text/css" href="${ctxStatic}/mobile/css/Base.css" />
		<script type="text/javascript" src="${ctxStatic}/jquery/jquery-1.9.1.min.js"></script>
		<link rel="stylesheet" type="text/css" href="${ctxStatic}/liuxin/css/mobile2.css" />
		<link rel="stylesheet" href="${ctxStatic}/mobile/css/oabase.css" />
		<style type="text/css">
			 .divcontent{
				border-bottom:none;
			}		
			.mui-table-view:after{
				position: initial;
			} 
			 </style>
	</head>

	<body>
	<header class="mui-bar mui-bar-nav">
		<a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></a>
		<h1 class="mui-title">私车公用申请</h1>
	</header>
	<div class="mui-content">
		<form action="${ctx}/m/oa/publicprivatecar/oaPublicPrivateCars/save" method="post">
		<div class="main-tit">${title }</div>
		<input type="hidden" name="token" value="${token }">
		<input type="hidden" value="0" name="flag" id="flag"/>
		<input type="hidden" value="${oaPublicPrivateCars.id}" name="id"/>
		<input type="hidden" value="${oaPublicPrivateCars.procInsId}" name="procInsId"/>
		<input type="hidden" value="|/oa/userfiles/1/images/oa/publicprivatecar/oaPublicPrivateCars/photo/2017/01/Chrysanthemum.jpg" name="picture"/>
		<sys:message content="${message}" />
	
			<ul class="mui-table-view divcontent">
				<li class="mui-table-view-cell" id="content11">
					<span>借用人</span>
					<input type="text" value="${oaPublicPrivateCars.createBy.name}" name="createBy.id" disabled  class="inputs"/>
				</li>
				<li class="mui-table-view-cell" id="content11">
					<span>所在部门</span>
					<input type="text" value="${oaPublicPrivateCars.officename}" name="officename" disabled  class="inputs"/>
				</li>
				
				<li class="mui-table-view-cell" id="content11">
					<span>用车范围</span> 
					<span style="width: 62%;">
						<input checked="checked" name="usescope" type="radio" value="市内"  class="exam"/>市内
						<input name="usescope" type="radio" value="市外"  class="exam"/>市外
			   		 </span>	
				</li>				
	
				<li class="mui-table-view-cell" id="content11">
					<span>事由<span class="requiredstar">*</span></span>				
					<input type="text" value="${oaPublicPrivateCars.usereason}" name="usereason" id="usereason" class="inputs"/>
				</li>
	
				<li class="mui-table-view-cell" id="content11">
					<span>起始时间<span class="requiredstar">*</span></span>
					<input id="starttime" type="text" readonly="readonly" name="starttime" class="inputs mui-datetime"
						value="<fmt:formatDate value="${oaPublicPrivateCars.starttime}" pattern="yyyy-MM-dd HH:mm:ss"/>" />
				</li>
	
				<li class="mui-table-view-cell" id="content11">
					<span>结束时间<span class="requiredstar">*</span></span>
					<input  class="inputs mui-datetime" id="endtime" type="text" readonly="readonly" name="endtime" 
						value="<fmt:formatDate value="${oaPublicPrivateCars.endtime}" pattern="yyyy-MM-dd HH:mm:ss"/>" />
				</li>
				
				<li class="mui-table-view-cell" id="content11">
					<span style="position: relative;">起始公里数<span class="requiredstar" style="position: absolute;">*</span></span>				
					<input type="text"  class="inputs" value="${oaPublicPrivateCars.gokilometer}" name="gokilometer" id="gokilometer"/>
				</li>
				
				<li class="mui-table-view-cell" id="content11">
					<span style="position: relative;">返回公里数<span class="requiredstar"  style="position: absolute;">*</span></span>				
					<input type="text"  class="inputs" value="${oaPublicPrivateCars.backkilometer}" name="backkilometer" id="backkilometer"/>
				</li>
							
				<li class="mui-table-view-cell" id="content11">
					<span>目的地<span class="requiredstar" >*</span></span>				
					<input type="text"  class="inputs" value="${oaPublicPrivateCars.destination}" name="destination" id="destination"/>
				</li>
				
				<li class="mui-table-view-cell" id="content11">
					<span>备注</span>				
					<input type="text"  class="inputs" value="${oaPublicPrivateCars.remarks}" name="remarks" id="remarks"/>
				</li>
		</ul>
		
<!-- 		流程流转信息 -->
		<ul class="xinfoot">
			<c:forEach var="now" items="${listact}">
				<li>
					<div class="contents_title2">
						<div class="content_img">
							<c:choose>
								<c:when test="${now.histIns.endTime != null}">
									<img src="${ctxStatic}/mobile/images/wancheng.png" alt="" />
								</c:when>
								<c:otherwise>
									<img src="${ctxStatic}/mobile/images/shenpizhong.png" alt="" />
								</c:otherwise>
							</c:choose>
						</div>
						<div class="content_title">
							<h3>${now.assigneeName}</h3>
							<span>${now.histIns.activityName}</span>
						</div>
						<div class="content_time">
							<span><fmt:formatDate value="${now.histIns.startTime}"
									pattern="yyyy.MM.dd HH:mm" /></span>
						</div>
						<div class="xinmsg">${now.comment}</div>
					</div>
				</li>
			</c:forEach>
		</ul>
		<!-- <div class="separation">
		 -->
		 <div class="bottom-button">
			<button type="submit" id="tijiao" data-loading-text="提交中" class="btnapp btn-submit">提交</button>
			<c:if test="${not empty oaPublicPrivateCars.id }">
			<button type="submit" id="btnCancle2" data-loading-text="取消中" class="btnapp btn-next">取消申请</button></c:if>			
		</div>
		</form>
		</div>

		<script src="${ctxStatic}/mobile/frame_js/mui.min.js"></script>
		<script type="text/javascript">
 			mui.init();

			$("#btnCancle2").click(function(){
					$("#flag").val("1");
				})
	
			
			$("#tijiao").click(function(){
				var usereason = $("#usereason").val();//事由
				var destination = $("#destination").val(); //目的地
				var gotime = $("#starttime").val(); //获取出发时间 
				var backtime = $("#endtime").val();//获取返回时间
				var gokilometer = $("#gokilometer").val();//起始公里数
				var backkilometer = $("#backkilometer").val();//返回公里数
				var go = new Date(gotime.replace(/-/g,"/"));
 				var back = new Date(backtime.replace(/-/g,"/"));
 				
 				if(usereason==""){
					mui.alert('事由不能为空！');
					return false;
				}
 				if(destination==""){
					mui.alert('目的地不能为空！');
					return false;
				}if(gotime==""){
					mui.alert('起始时间不能为空！');
					return false;
				}if(backtime==""){
					mui.alert('结束时间不能为空！');
					return false;
				}if(gokilometer==""){
					mui.alert('起始公里数不能为空！');
					return false;
				}if(backkilometer==""){
					mui.alert('返回公里数不能为空！');
					return false;
				}
				if(Date.parse(back)<Date.parse(go)){
					mui.alert("起始时间必须早于结束时间！", "系统提示");
					return false;
				}
				if(isNaN(gokilometer) || (isNaN(backkilometer))){
					mui.alert("公里数请输入数字！", "系统提示");
					return false;
				}
				
				if(gokilometer<0 || backkilometer<0){
					mui.alert("公里数请输入正数！", "系统提示");
					return false;
				}
				
				if(parseInt(gokilometer)>parseInt(backkilometer)){
					mui.alert("返回公里数不能小于起始公里数！", "系统提示");
					return false;
				}
				return true;
			})
		</script>
		<%-- <jsp:include page="/WEB-INF/views/mobile/modules/sys/foot.jsp"></jsp:include> --%><sys:mui-datetime></sys:mui-datetime>
	</body>

</html>